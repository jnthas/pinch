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


#define LED_PIN 0
SBIT(LED, 0xB0, LED_PIN);

SBIT(DCS,	0x90, 4);


#define CHAR_ARR_SIZE 24

__xdata char display_buffer[3] = {0,0,0};

__xdata unsigned long lastMillis = 0;


__xdata const uint8_t Char[CHAR_ARR_SIZE][2] = { 
    {0b00000000,' '},
    {0b00111111,'0'},
    {0b00000110,'1'},
    {0b01011011,'2'},
    {0b01001111,'3'},
    {0b01100110,'4'},
    {0b01101101,'5'},
    {0b01111101,'6'},
    {0b00000111,'7'},
    {0b01111111,'8'},
    {0b01101111,'9'},
    
    {0b01110111,'A'},
    {0b01111100,'B'},
    {0b00111001,'C'},
    {0b01011110,'D'},
    {0b01111001,'E'},
    {0b01110001,'F'},


    {0b01110011,'P'},
    {0b00010000,'i'},
    {0b01010100,'n'},
    {0b01011000,'c'},
    {0b01110100,'h'},
    
    {0b01000000,'-'},
    {0b00000001,'^'},
    {0b00001000,'_'}
};


uint32_t millis()
{

    return 0;

}


void printDigit(__xdata char digit, __xdata uint8_t pos) {

    display_buffer[pos] = Char[0][0];
        
    for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
    {
        if (Char[b][1] == digit)
            display_buffer[pos] = Char[b][0];
    }
}



void USBInterrupt(void); //USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
{
    USBInterrupt();
}



void switchOff() {
    digitalWrite(31, HIGH);
    digitalWrite(30, HIGH);
    digitalWrite(34, HIGH);
}

void switchOn(__xdata uint8_t pin) {
    
    if (pin == 30) {
        digitalWrite(31, HIGH);
        digitalWrite(30, LOW);
        digitalWrite(34, HIGH);
    } else if (pin == 31) {
        digitalWrite(31, LOW);
        digitalWrite(30, HIGH);
        digitalWrite(34, HIGH);

    } if (pin == 34) {
        digitalWrite(31, HIGH);
        digitalWrite(30, HIGH);
        digitalWrite(34, LOW);
    }

    mDelaymS(1);
}

void chipSelect()
{
    digitalWrite(33, LOW);
}

void chipUnselect()
{
    digitalWrite(33, HIGH);
}

void updateDisplay() {

    switchOff();    
    chipSelect();
    CH554SPIMasterWrite(display_buffer[0]);
    chipUnselect();    
    switchOn(31);

    switchOff();    
    chipSelect();
    CH554SPIMasterWrite(display_buffer[1]);
    chipUnselect();
    switchOn(30);
    
    switchOff();    
    chipSelect();
    CH554SPIMasterWrite(display_buffer[2]);
    chipUnselect();
    switchOn(34);   
    
}

void clearDisplay() {
    display_buffer[0] = 0;
    display_buffer[1] = 0;
    display_buffer[2] = 0;
}


void printNum(int number) {

      
    char numchar[3];
    sprintf(numchar, "%d", number);

    if (number < 10) {
        printDigit(number, 2);
    } else if (number < 100) {
        printDigit(numchar[1], 2);
        printDigit(numchar[0], 1);
    } else if (number < 1000) {
        printDigit(numchar[2], 2);
        printDigit(numchar[1], 1);
        printDigit(numchar[0], 0);
    } else {
        clearDisplay();        
    }
}


void marquee(const char* text, __xdata uint8_t size, uint8_t* curpos, __xdata int delay) 
{
    if (lastMillis - millis() >= delay)
    {    
        if ((*curpos) >= size) 
            (*curpos) = 0;

        printDigit(text[(*curpos)], 0);
        printDigit(((*curpos)+1) < size ? text[(*curpos)+1] : ' ', 1);
        printDigit(((*curpos)+2) < size ? text[(*curpos)+2] : ' ', 2);

        lastMillis = 0;
        (*curpos)++;
    }    
}

void loading(uint8_t* curpos) {
  
    if (lastMillis - millis() >= 75)
    {   
        clearDisplay();

        switch ((*curpos))
        {
            case 0:
            case 1:
            case 2:
                display_buffer[(*curpos)] = 0b00000001;
                break;
            case 3:
            case 4:
                display_buffer[2] = (0 | 1 << 1 + ((*curpos)-3));
                break;            
            case 5:
            case 6:
            case 7:
                display_buffer[(((*curpos)-5)*-1)+2] = 0b00001000;
                //5 - 5 = (0*-1) + 2 = 2
                //6 - 5 = (1*-1) + 2 = 1
                //7 - 5 = (2*-1) + 2 = 0
                break;
            case 8:
            case 9:
                display_buffer[0] = (0 | 1 << 4 + ((*curpos)-8));
                break;
            default:
                (*curpos) = 0;
                display_buffer[(*curpos)] = 0b00000001;
                break;
        }
    

        lastMillis = 0;
        (*curpos)++;
    }    

}


void countTo1000(uint8_t* curpos) {
     if (lastMillis - millis() >= 50) {
        printNum((*curpos)++);
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


    ///blink(3);

    p3Mode(1, OUTPUT);
    p3Mode(0, OUTPUT);
    p3Mode(4, OUTPUT);
    p3Mode(3, OUTPUT);
    p3Mode(2, INPUT);


    p1Mode(1, INPUT);


    mDelaymS(100);

    int m = 0;


    bool btn1 = false;
    bool btn2 = false;
        
    while(1) {

        //loading(m);
        
        // marquee("Pinch", 5, &m, 300);

        if (lastMillis - millis() >= 100) {
            clearDisplay();
            
            btn1 = (analogRead(32) > 80);
            btn2 = (analogRead(11) > 80);
            
            
            if (btn1 && btn2)
                printDigit('3', 2);
            else if (!btn1 && btn2)
                testReadBytes();
            else if (btn1 && !btn2)
                testReadDeviceId();
            else    
                printDigit('0', 2);
            
           
            lastMillis=0;
        }



        updateDisplay();

        lastMillis+=4;

    }
    

}