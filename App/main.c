#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include "ch552.h"
#include "debug.h"
#include "components/sevenSegmentDisplay.h"
#include "components/inputButton.h"
#include "app/pinch.h"

void USBInterrupt(void);                              // USBInterrupt does not need to saves the context
void DeviceUSBInterrupt(void) __interrupt(INT_NO_USB) // USB interrupt service
{
  USBInterrupt();
}

__xdata uint8_t displayPos = 0;
__xdata unsigned long currentMillis = 0;


void setup()
{
  CfgFsys();
  mDelaymS(10);

  USBInit();
  SPISetup();

  Display_setup();
  Button_setup();
  Pinch_setup();
}

void pinchButtonEvent(ButtonState event) {

    if (event == BUTTON_A_RELEASED)
      Pinch_nextBlock();
    else if (event == BUTTON_B_RELEASED)
      Pinch_nextSector();
    else if (event == BUTTON_C_RELEASED) {
      //Pinch_load(0); 
      //Pinch_load(1); 
      Pinch_load(2); 
    }
}



void loop()
{

  if (currentMillis >= 100) {

    Display_setDigit(Pinch_currentBlock()+65, 0);
    Display_setDigit(Pinch_currentSector() < 10 ? '0' : '1', 1);
    Display_setDigit((Pinch_currentSector() % 10) + 48, 2);

    currentMillis = 0;
  }

  Pinch_loop();
  Display_update();
  Button_loop(&pinchButtonEvent);

}

void main()
{

  setup();

  while (1)
  {
    loop();
  
    currentMillis+=4;
  }
 
}
