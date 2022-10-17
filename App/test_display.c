#include <stdlib.h>
#include <stdbool.h>
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

unsigned long lastMillis = 0;


void USBInterrupt(void); //USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
{
    USBInterrupt();
}

uint16_t millis()
{
    return 0;
}

void countTo1000(uint8_t* curpos) {
     if (lastMillis - millis() >= 50) {
        Display_printNumber((*curpos)++);
        lastMillis=0;
    }
}


void testReadDeviceId() {

    // ***********  Device Id
    printText("Device Id:");
    uint16_t devId = readDeviceId();
    printNumbers(devId, HEX);
    printText("\nEnd\n");
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
}



// analog read
// resistor 220k =  ~58 - 61
// resistor 10k  = ~168 - 176

void main()
{
    CfgFsys(); 
    mDelaymS(10);

    USBInit();
    USBSerial();
    SPISetup();

    Display_setup();
    Button_setup();

    ///blink(3);
    mDelaymS(100);

    int m = 0;
        
    while(1) {
        
        // Loading
        // if (lastMillis - millis() >= 75) {
        //     Display_loading(m);
        //     lastMillis = 0;
        // }

        // Marquee
        // if (lastMillis - millis() >= 500) {
        //     Display_marquee("Pinch", 5, m);
        //     lastMillis = 0;
        // }


        if (lastMillis - millis() >= 100) {
            Display_clear();

            if (Button_C_press())
                Display_setDigit('3', 2);
            else if (Button_A_press()) {
                Display_setDigit('1', 2);
                testReadDeviceId();
            } else if (Button_B_press()) {
                Display_setDigit('2', 2);
                testReadBytes();
            } else 
                Display_setDigit('0', 2);
            
            lastMillis=0;
        }


        Display_update();

        lastMillis+=4;
    }
    
}