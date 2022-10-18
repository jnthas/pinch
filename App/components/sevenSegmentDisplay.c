#include "sevenSegmentDisplay.h"

#define CHAR_ARR_SIZE 25

#define DIGIT_1_PIN 31
#define DIGIT_2_PIN 30
#define DIGIT_3_PIN 34
#define DISPLAY_CS  33

__xdata char display_buffer[3] = {0,0,0};

__xdata const uint8_t DisplayChars[CHAR_ARR_SIZE][2] = {
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

bool ledState = false;

void Display_setup() 
{
    p3Mode(0, OUTPUT);
    p3Mode(1, OUTPUT);
    p3Mode(3, OUTPUT);
    p3Mode(4, OUTPUT);
}


void Display_setDigit(__xdata char digit, __xdata uint8_t pos) {

    display_buffer[pos] = DisplayChars[0][0];
        
    for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
    {
        if (DisplayChars[b][1] == digit)
            display_buffer[pos] = DisplayChars[b][0];
    }
}

void Display_toggleOff() {
    digitalWrite(DIGIT_1_PIN, HIGH);
    digitalWrite(DIGIT_2_PIN, HIGH);
    digitalWrite(DIGIT_3_PIN, HIGH);
}

void Display_toggleOn(__xdata uint8_t pin) {
    
    if (pin == DIGIT_2_PIN) {
        digitalWrite(DIGIT_1_PIN, HIGH);
        digitalWrite(DIGIT_2_PIN, LOW);
        digitalWrite(DIGIT_3_PIN, HIGH);

    } else if (pin == DIGIT_1_PIN) {
        digitalWrite(DIGIT_1_PIN, LOW);
        digitalWrite(DIGIT_2_PIN, HIGH);
        digitalWrite(DIGIT_3_PIN, HIGH);

    } if (pin == DIGIT_3_PIN) {
        digitalWrite(DIGIT_1_PIN, HIGH);
        digitalWrite(DIGIT_2_PIN, HIGH);
        digitalWrite(DIGIT_3_PIN, LOW);
    }

    mDelaymS(1);
}

void Display_select()
{
    digitalWrite(DISPLAY_CS, LOW);
}

void Display_unselect()
{
    digitalWrite(DISPLAY_CS, HIGH);
}

void Display_update() {

    Display_toggleOff();    
    Display_select();
    CH554SPIMasterWrite(display_buffer[0]);
    Display_unselect();    
    Display_toggleOn(DIGIT_1_PIN);

    Display_toggleOff();    
    Display_select();
    CH554SPIMasterWrite(display_buffer[1]);
    Display_unselect();
    Display_toggleOn(DIGIT_2_PIN);
    
    Display_toggleOff();
    // Led state
    display_buffer[2] |= ledState << 7;
    Display_select();
    CH554SPIMasterWrite(display_buffer[2]);
    Display_unselect();
    

    Display_toggleOn(DIGIT_3_PIN);

    
    
}

void Display_clear() {
    display_buffer[0] = 0;
    display_buffer[1] = 0;
    display_buffer[2] = 0;
}

void Display_printNumber(int number) {

    char numchar[3];
    sprintf(numchar, "%d", number);

    if (number < 10) {
        Display_setDigit(number, 2);
    } else if (number < 100) {
        Display_setDigit(numchar[1], 2);
        Display_setDigit(numchar[0], 1);
    } else if (number < 1000) {
        Display_setDigit(numchar[2], 2);
        Display_setDigit(numchar[1], 1);
        Display_setDigit(numchar[0], 0);
    } else {
        Display_clear();
    }
}


void Display_marquee(const char* text, __xdata uint8_t size, uint8_t* currentPos)
{
    if ((*currentPos) >= size)
        (*currentPos) = 0;

    Display_setDigit(text[(*currentPos)], 0);
    Display_setDigit(((*currentPos)+1) < size ? text[(*currentPos)+1] : ' ', 1);
    Display_setDigit(((*currentPos)+2) < size ? text[(*currentPos)+2] : ' ', 2);

    (*currentPos)++;
    
}

void Display_loading(uint8_t* currentPos) {
     
    Display_clear();

    switch ((*currentPos))
    {
        case 0:
        case 1:
        case 2:
            display_buffer[(*currentPos)] = 0b00000001;
            break;
        case 3:
        case 4:
            display_buffer[2] = (0 | 1 << 1 + ((*currentPos)-3));
            break;            
        case 5:
        case 6:
        case 7:
            display_buffer[(((*currentPos)-5)*-1)+2] = 0b00001000;
            //5 - 5 = (0*-1) + 2 = 2
            //6 - 5 = (1*-1) + 2 = 1
            //7 - 5 = (2*-1) + 2 = 0
            break;
        case 8:
        case 9:
            display_buffer[0] = (0 | 1 << 4 + ((*currentPos)-8));
            break;
        default:
            (*currentPos) = 0;
            display_buffer[(*currentPos)] = 0b00000001;
            break;
    }

    
    (*currentPos)++;
}


void Display_toggleLed(bool state)
{
    ledState = state;
}
