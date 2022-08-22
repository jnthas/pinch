#include "SPIFlash.h"

#define BUSY_LED 30


#define PINCH_DEVCONTROL   0x11        // Device Control 1

#define PINCH_STORE        0x0c        // Form Feed
#define PINCH_LOAD         0x05        // Enquiry
#define PINCH_ERASE        0x7f        // Delete

#define PINCH_DLE          0x10        // Data Link Escape
#define PINCH_RS           0x1E        // Record Separator
#define PINCH_EOT          0x04        // End Of Transmission



/*
PROTOCOL

0x11 - start device control

operation (save, load, erase)
  0x0C (form feed) - save
  0x05 (enquiry)   - load
  0x7f (Delete)    - erase block

erase
  erases a block between 1 and 255

  0x11 control_flag
  0x7f operation (erase)
  
  0x01 param 1
  0x01 size (1 bytes)
  0x01 (load date time)
  0x1E Record separator
  

load
  load a block 
  params:
    0x01 - load date/time of the block
    0x02 - load descritpion of the block
    0x03 - load data 
  
  e.g. 0x05 0x1A 0x03 - load the data content


  0x11 control_flag
  0x05 operation (load)
  
  0x01 param 1
  0x01 size (1 bytes)
  0x01 (load date time)
  0x1E Record separator

  

save
  save content in a block
  params:

  e.g. 0x0C 4bytes (timestamp) 0x1E 256bytes (domain) 0x1E 3Kbytes (data) 0x1E 

  0x11 control_flag
  0x0C operation
  
  0x01 param 1
  0x04 size (4 bytes)
  A1A2A3A4
  0x1E Record separator

  0x02 param 2
  0x0F size (16 bytes)
  A1A2A3A4....
  0x1E Record separator

  0x03 param 3
  0x00 size (unlimited
  A1A2A3A4....
  0x10 Data Link Escape
  0x1E Record separator
  
  0x04 End of Transmission
 


  Tests

  echo -e "\x11\x0c\x01\x041234\x1e\x04" > /dev/ttyACM0
  1 param

  echo -e "\x11\x0c\x01\x041234\x1e\x02\x0ewww.google.com\x1e\x04" > /dev/ttyACM0
  2 params

  echo -e "\x11\x0c\x01\x041234\x1e\x02\x0ewww.google.com\x1e\x03\x00my super strong password\x10\x1e\x04" > /dev/ttyACM0
  3 params  
  
*/


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


//__xdata uint8_t _sbuffer[32];
uint8_t _currentBlock = 16;

uint8_t cmdByte;
uint8_t lastCmdByte;

long byteCount = 0;


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

  if (byteCount <= 1) {
    memAddress = getMemAddress(_currentBlock, protocol.param-1, 0);      
    writeByte(memAddress, protocol.param);

    
    memAddress = getMemAddress(_currentBlock, protocol.param-1, 1);    
    writeByte(memAddress, protocol.payload_size);    

    USBSerial_println("Payload: ");
  }

  
  
  
  memAddress = getMemAddress(_currentBlock, protocol.param-1, byteCount+1);
  writeByte(memAddress, payload);
  

  while(busy()) {
    USBSerial_println("Busy...");
    delay(10);
  }
  
  USBSerial_print("Saving ");
  USBSerial_print(payload, HEX);
  USBSerial_print(" in address ");
  USBSerial_println(memAddress, HEX);

  USBSerial_print(payload, HEX);
  USBSerial_print(",");
}


void loadData(uint8_t payload) 
{ 

  USBSerial_println("Payload: ");
  USBSerial_println(payload);

  USBSerial_print("Load data from addr: ");

  uint32_t memAddress = getMemAddress(_currentBlock, payload, 0);      
  
  USBSerial_println(memAddress, HEX);

//  
//
//  USBSerial_println("Byte 1 2 3: ");
//  USBSerial_print(memAddress >> 16, HEX);
//  USBSerial_print(",");
//  USBSerial_print(memAddress >> 8, HEX);
//  USBSerial_print(",");
//  USBSerial_print(memAddress, HEX);
//  USBSerial_println("");




  USBSerial_print(memAddress, HEX);
  USBSerial_print("-");
  USBSerial_print(memAddress+255, HEX);
  USBSerial_print(":");
  
  for (uint32_t memaddr=memAddress; memaddr<memAddress+255; memaddr++) {
    USBSerial_print(readByte(memaddr), HEX);
    USBSerial_print(".");    
  }

  USBSerial_println("");

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
      blockErase4K(_currentBlock);
      delay(1000);
      break;
    default:
      break;
  }
  
}



void setup() {
  pinMode(BUSY_LED, OUTPUT);
  digitalWrite(BUSY_LED, LOW);

  initialize();

  current_state = begin_of_transmission;
}


void loop() {

  if (USBSerial_available() > 0) {
    cmdByte = USBSerial_read();
    
    
    switch (current_state) {
      
      case begin_of_transmission:
        if (cmdByte == PINCH_DEVCONTROL) { 
          protocol.control_flag = cmdByte;
          current_state = operation;
          
          USBSerial_print("Device Control: ");
          USBSerial_println(cmdByte, HEX);
        }
        break;

      case operation:
        //TODO verify if operation exists
        protocol.operation = cmdByte;
        current_state = parameter;

        USBSerial_print("Operation: ");
        USBSerial_println(cmdByte, HEX);
        break;
      
      case parameter:
        
        if (lastCmdByte == PINCH_RS && cmdByte == PINCH_EOT) {
          current_state = end_of_transmission;
        } else if (protocol.param == lastCmdByte) {
          protocol.payload_size = cmdByte;
          current_state = payload;
          
          USBSerial_print("Param Size: ");
          USBSerial_println(cmdByte, DEC);          
          
        } else {
          protocol.param = cmdByte;
          USBSerial_print("Param #: ");
          USBSerial_println(cmdByte, HEX);
        }
        
        break;
      case payload:
        if (lastCmdByte == PINCH_DLE && cmdByte == PINCH_RS) {
          byteCount = 0;
          current_state = parameter;
          
        } else if (protocol.payload_size > 0 && protocol.payload_size == byteCount) {          
          if (cmdByte == PINCH_RS) {            
            current_state = parameter;
          } else {
            current_state = payload_error;
          }
          USBSerial_println("");
          byteCount = 0;
          

        } else {          
          byteCount++; 
          if (protocol.payload_size == 0 || byteCount <= protocol.payload_size) {
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
        USBSerial_write('\n');
        USBSerial_flush();
        break;

      case payload_error:
        USBSerial_write('\n');
        USBSerial_flush();
        USBSerial_print("ERROR!");
        //TODO format block
        current_state = end_of_transmission;
        break;        
  
      default:
        // ignore any unrecognized bytes.
        break;
    }
   
    lastCmdByte = cmdByte;
  }

  //digitalWrite(BUSY_LED, busy() ? HIGH : LOW);
}
