#ifndef SEVEN_SEG_DISPLAY_H
#define SEVEN_SEG_DISPLAY_H

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "ch552.h"
#include "debug.h"
#include "spi.h"
#include "../core/GPIO.h"



void Display_setup();

void Display_setDigit(__xdata char digit, __xdata uint8_t pos);
void Display_toggleOff();
void Display_toggleOn(__xdata uint8_t pin);

void Display_select();
void Display_unselect();
void Display_update();
void Display_clear();
void Display_printNumber(int number);
void Display_marquee(const char* text, __xdata uint8_t size, uint8_t* currentPos);
void Display_loading(uint8_t* currentPos);

#endif
