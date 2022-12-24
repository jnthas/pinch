#ifndef SEVEN_SEG_DISPLAY_H
#define SEVEN_SEG_DISPLAY_H

#include <stdbool.h>
#include <stdio.h>
#include "spi.h"
#include "../core/GPIO.h"



void Display_setup();

void Display_setDigit(char digit, uint8_t pos);
char Display_getDigit(uint8_t pos);
void Display_fill(char digit);


void Display_toggleOff();
void Display_toggleOn(uint8_t pin);

void Display_select();
void Display_unselect();
void Display_update();
void Display_clear();
void Display_printNumber(__xdata int number);
void Display_marquee(const char* text, uint8_t size, uint8_t* currentPos);
void Display_loading(uint8_t* currentPos);
void Display_setLed(bool state);
void Display_toggleLed();

#endif
