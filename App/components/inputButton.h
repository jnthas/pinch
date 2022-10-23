#ifndef INPUT_BUTTON_H
#define INPUT_BUTTON_H

#include <stdbool.h>
#include "../core/GPIO.h"


typedef enum ButtonStateEnum
{
  BUTTON_A_PRESSED,
  BUTTON_B_PRESSED,
  BUTTON_C_PRESSED,
  BUTTON_A_RELEASED,
  BUTTON_B_RELEASED,
  BUTTON_C_RELEASED
} ButtonState;


typedef void (*ButtonEvent)(ButtonState);


void Button_setup();
void Button_loop(ButtonEvent buttonEvent);

#endif
