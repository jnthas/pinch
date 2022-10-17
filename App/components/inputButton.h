#ifndef INPUT_BUTTON_H
#define INPUT_BUTTON_H

#include <stdbool.h>
#include <stdint.h>
#include "ch552.h"
#include "debug.h"
#include "spi.h"
#include "../core/GPIO.h"


void Button_setup();

bool Button_A_press();
bool Button_A_release();

bool Button_B_press();
bool Button_B_release();

bool Button_C_press();
bool Button_C_release();


#endif
