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
#include "components/w25qxx.h"
#include "components/sevenSegmentDisplay.h"
#include "components/inputButton.h"



void USBInterrupt(void); //USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
{
    USBInterrupt();
}

__xdata uint8_t displayPos = 0;
__xdata unsigned long currentMillis = 0;


void blink(uint8_t times) {
    Display_setLed(true);
    mDelaymS(500);
    Display_setLed(false);
}


void testReadDeviceId() {

    // ***********  Device Id
    printText("Device Id:");
    uint16_t devId = readDeviceId();
    printNumbers(devId, HEX);
    printText("\nEnd\n");

    mDelaymS(1000);
    blink(2);

}

void testReadUniqueId() {
    // ***********  Unique Id
    // DE.64.50.A3.5F.76.26.2B.
    printText("Unique Id:\n");
    uint8_t *mac = readUniqueId();
    
    for (uint8_t j=0; j<8; j++) {
        printNumbers(mac[j], HEX); 
        printText("."); 
    }
    printText("\nEnd\n");

    mDelaymS(1000);
    blink(2);
    
}

void testReadByte() {
    // *********** Read byte

    printText("Reading byte...");
            
            
    for (uint8_t p=0; p<8; p++) {
        printText("\nPage: ");
        printNumbers(p, DEC);
        printText("\n");
        
        for (uint32_t i=0; i<32; i++) {  
            printNumbers(readByte((p*256)+i), HEX);
            printText(".");
        }
    }

    printText("\nEnd\n");

    mDelaymS(1000);
    blink(2);

}

void testReadBytes() {

    // *********** Read bytes

    printText("Reading to array of bytes...");

    for (uint8_t j=0; j<8; j++) {

        printText("\nPage: ");    
        printNumbers(j, DEC);
        printText("\n");

        readBytes((j*256), _sbuffer, 31);
            
        for (uint8_t z=0; z<32; z++) {
            printNumbers(_sbuffer[z], HEX);
            printText(".");    
        }
    }
    printText("\n");

    mDelaymS(1000);
    blink(2);
}

void testReadStatus() {
    printText("Status: ");
    printNumbers(readStatus(), DEC);
    printText("\n");
    
    mDelaymS(1000);
    blink(2);
}


void testChipErase() {
    printText("Erasing chip... ");
    chipErase();
    printText("Done! \n");

    mDelaymS(1000);
    blink(2);

}


void setup()
{
  CfgFsys();
  mDelaymS(10);

  USBInit();
  SPISetup();

  Display_setup();
  Button_setup();
  Pinch_setup();
}

void pinchButtonEvent(ButtonState event) {

    if (event == BUTTON_A_RELEASED)
      testReadDeviceId();
    else if (event == BUTTON_B_RELEASED)
      testReadUniqueId();
    else if (event == BUTTON_C_RELEASED)
      testReadBytes();
}

void loop()
{

  if (currentMillis >= 100) {
    Display_setDigit('1', 2);
    currentMillis = 0;
  }



  Pinch_loop();
  Display_update();
  Button_loop(&pinchButtonEvent);
}

void main()
{

  setup();

  while (1)
  {
    loop();
  
    currentMillis+=4;
  }
 
}