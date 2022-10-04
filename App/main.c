#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include "ch552.h"
#include "debug.h"
#include "core/USBCDC.h"
#include "core/Print.h"
#include "flash/w25qxx.h"


#define LED_PIN 0
SBIT(LED, 0xB0, LED_PIN);

#define PINCH_DEVCONTROL   0x11        // Device Control 1

#define PINCH_STORE        0x0c        // Form Feed
#define PINCH_LOAD         0x05        // Enquiry
#define PINCH_ERASE        0x7f        // Delete

#define PINCH_DLE          0x10        // Data Link Escape
#define PINCH_RS           0x1E        // Record Separator
#define PINCH_EOT          0x04        // End Of Transmission

void USBInterrupt(void); // USBInterrupt does not need to saves the context
void DeviceUSBInterrupt(void) __interrupt(INT_NO_USB) // USB interrupt service
{
  USBInterrupt();
}

struct ProtocolStructure
{
  uint8_t control_flag;
  uint8_t operation;
  uint8_t param;
  uint8_t payload_size;
};


enum ProtocolState {
  
  begin_of_transmission,
  operation,
  parameter,
  payload,
  end_of_transmission,
  payload_error
    
} current_state;


struct ProtocolStructure protocol;

uint8_t _currentBlock = 0;
uint8_t cmdByte;
uint8_t lastCmdByte;

long byteCount = 0;


void blink(uint8_t times)
{

  for (uint8_t i = 0; i < times; i++)
  {
    LED = 1;
    mDelaymS(250);
    LED = 0;
    mDelaymS(250);
  }

}

uint32_t getMemAddress(uint8_t slot, uint8_t sector_num, uint8_t page_num) {

  uint32_t block = (uint32_t)(slot/16)<<16;
  uint32_t sector = (uint32_t)(((slot%16)*16)+sector_num)<<8;
  
//  USBSerial_print("Address: ");
//  USBSerial_println(slot, DEC);
//  USBSerial_println(block, HEX);
//  USBSerial_println(sector, HEX);
//  USBSerial_println("---");

    
  return block | sector | page_num;
}


void storePayload(uint8_t payload) 
{
  uint32_t memAddress;

  memset(_sbuffer, 0, 32*sizeof(*_sbuffer));

  if (byteCount <= 1) {
    memAddress = getMemAddress(_currentBlock, protocol.param-1, 0);      
    writeByte(memAddress, protocol.param);

    
    memAddress = getMemAddress(_currentBlock, protocol.param-1, 1);    
    writeByte(memAddress, protocol.payload_size);    

    ///USBSerial_println("Payload: ");
  }  
  
  memAddress = getMemAddress(_currentBlock, protocol.param-1, byteCount+1);
  writeByte(memAddress, payload);
  
  mDelaymS(1);  
  printText("Saving in address: ");
  printNumbers(memAddress, HEX);
  printLineBreak();
  printNumbers(payload, HEX);
  printText(",");
  printLineBreak();

}


void loadData(uint8_t payload) 
{ 
  printText("Load data from addr: ");
  uint32_t memAddress = getMemAddress(_currentBlock, payload, 0);
  uint8_t regCount = 0;
    
  printNumbers(memAddress, HEX);
  printText("-");
  printNumbers(memAddress+255, HEX);
  printText(":");
  printLineBreak();

  for (uint8_t j=0; j<(256/32); j++) {
  
    readBytes(memAddress+(j*32), _sbuffer, 31);
      
    for (regCount=(j==0 ? 2 : 0); regCount<32; regCount++) {
  
      if (_sbuffer[regCount] == 0xff || _sbuffer[regCount] == 0x10) break;

      printNumbers(_sbuffer[regCount], HEX);
      printText(".");    
    }

    if (regCount < 31) break;
  }

  printLineBreak();
}


void operationHandler(uint8_t payload) 
{
  switch (protocol.operation) {
      
    case PINCH_STORE:
      storePayload(payload);     
      break;
    case PINCH_LOAD:
      loadData(payload);
      break;
    case PINCH_ERASE:
      printText("Erase\n");
      mDelaymS(1000);
      break;
    default:
      break;
  }
  
}

void setup()
{
  CfgFsys();
  LED = 0;
  mDelaymS(10);

  USBInit();
  USBSerial();
  SPISetup();

  blink(3);

  current_state = begin_of_transmission;
}

void loop()
{
  while(1)
  {

    if (USBSerial_available() > 0)
    {
      uint8_t cmdByte = USBSerial_read();
      
      // _sbuffer[byteCount++] = cmdByte;

      // if (byteCount >= 31 || (lastCmdByte == PINCH_RS && cmdByte == PINCH_EOT)) {

      //   for (int a=0; a<32; a++){
      //     printNumbers(_sbuffer[a], HEX);
      //     printText(".");
      //     _sbuffer[a] = 0xff;
      //   }
      //   byteCount = 0;
        
      // }
      
      switch (current_state)
      {
        case begin_of_transmission:
          if (cmdByte == PINCH_DEVCONTROL)
          {
            protocol.control_flag = cmdByte;
            current_state = operation;

            printText("Device Control: ");
            printNumbers(cmdByte, HEX);
            printLineBreak();
          }
          break;

        case operation:
          // TODO verify if operation exists
          protocol.operation = cmdByte;
          current_state = parameter;

          printText("Operation: ");
          printNumbers(cmdByte, HEX);
          printLineBreak();
          break;

        case parameter:

          if (lastCmdByte == PINCH_RS && cmdByte == PINCH_EOT)
          {
            current_state = end_of_transmission;
          }
          else if (protocol.param == lastCmdByte)
          {
            protocol.payload_size = cmdByte;
            current_state = payload;

            printText("Param Size: ");
            printNumbers(cmdByte, DEC);
            printLineBreak();
          }
          else
          {
            protocol.param = cmdByte;
            printText("Param #: ");
            printNumbers(cmdByte, HEX);
            printLineBreak();
          }

          break;
        case payload:
          if (lastCmdByte == PINCH_DLE && cmdByte == PINCH_RS)
          {
            byteCount = 0;
            current_state = parameter;
          }
          else if (protocol.payload_size > 0 && protocol.payload_size == byteCount)
          {
            if (cmdByte == PINCH_RS)
            {
              current_state = parameter;
            }
            else
            {
              current_state = payload_error;
            }
            printLineBreak();
            byteCount = 0;
          }
          else
          {
            byteCount++;
            if (protocol.payload_size == 0 || byteCount <= protocol.payload_size)
            {
              operationHandler(cmdByte);
            }
          }
          break;

        case end_of_transmission:
          protocol.control_flag = 0;
          protocol.operation = 0;
          protocol.param = 0;
          protocol.payload_size = 0;
          byteCount = 0;
          current_state = begin_of_transmission;
          printLineBreak();
          USBSerial_flush();
          break;

        case payload_error:
          printLineBreak();
          USBSerial_flush();
          printText("ERROR!");
          // TODO format block
          current_state = end_of_transmission;
          break;

        default:
          // ignore any unrecognized bytes.
          break;
      }

      lastCmdByte = cmdByte;
    }
    
    USBSerial_flush();
  }
  
}

void main()
{
  
  setup();
  loop();
  
}
