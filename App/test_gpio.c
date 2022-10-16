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
#include "core/GPIO.h"
#include "flash/w25qxx.h"


//P1 = 0x90
//P2 = 0xA0
//P3 = 0xB0

#define LED_PIN 0  ///Led connected on P3.0
SBIT(BUILTIN_LED, 0xB0, LED_PIN);

void USBInterrupt(void); //USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
{
    USBInterrupt();
}

void blink(uint8_t times) {

    for (uint8_t i = 0; i<times; i++) {
        BUILTIN_LED = 1;
        mDelaymS(250);
        BUILTIN_LED = 0;
        mDelaymS(250);
    }

    mDelaymS(1000);
}


void main()
{
    CfgFsys(); 
    mDelaymS(10);

    USBInit();
    USBSerial();

    p3Mode(1, OUTPUT);
    p3Mode(2, INPUT);

    bool led_test = false;
    
    blink(3);

    mDelaymS(1000);
    
    while(1) {

        //blink(2);
        
        digitalWrite(31, HIGH);

        //led_test = !led_test;

        mDelaymS(100);
        
    }

    


}