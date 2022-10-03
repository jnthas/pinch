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

void USBInterrupt(void); //USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
{
    USBInterrupt();
}

void blink(uint8_t times) {

    for (uint8_t i = 0; i<times; i++) {
        LED = 1;
        mDelaymS(250);
        LED = 0;
        mDelaymS(250);
    }

    mDelaymS(1000);
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


void main()
{
    CfgFsys(); 
    mDelaymS(10);

    USBInit();
    USBSerial();
    SPISetup();


    //blink(3);

    mDelaymS(1000);
    
    while(1) {


        blink(3);
        
        testReadDeviceId();
        //testReadUniqueId();
        //testReadByte();
        //testReadBytes();
        //testReadStatus();


        //testReadBytes();
        //testChipErase();
        //testReadBytes();



        mDelaymS(2000);

    }

    


}