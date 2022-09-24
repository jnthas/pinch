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

uint16_t devId = 0;

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


void main()
{
    CfgFsys(); 
    LED = 0;
    mDelaymS(10);

    USBInit();
    USBSerial();
    SPISetup();

    blink(3);
    

    for (;;) {
        
        if (USBSerial_available()) {

            uint8_t serialChar = USBSerial_read();
            
            
            if (serialChar == 'a') {
                printText("Hello world\n");
            
            } else if (serialChar == 'b') {

                printText("Device Id:");

                devId = readDeviceId();
                
                printNumbers(devId, HEX);
                
                
            } else if (serialChar == 'c') {
                
                printText("Reading page...\n");

                for (uint32_t i=0; i<16; i++) {  
                    printNumbers(readByte(i), HEX);
                    printText(".");
                    mDelaymS(2);
                }

                printText("\nEnd\n");
                
            } else if (serialChar == 'd') {
                
                //DE.64.50.A3.5F.76.26.2B.
                //DE.64.50.A3.5F.76.26.2B.
                
                printText("Unique Id:\n");

                uint8_t *mac = readUniqueId();
                
                for (uint8_t j=0; j<8; j++) {
                    printNumbers(mac[j], HEX); 
                    printText("."); 
                }
                printText("\nEnd\n");
            }
        }
        LED = 0;
        USBSerial_flush();
        mDelaymS(10);
    }
}


