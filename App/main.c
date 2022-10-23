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
  USBSerial();
  SPISetup();

  Display_setup();
  Button_setup();
  Pinch_setup();
}

void loop()
{

  // if (currentMillis >= 75) 
  // {
  //  Display_loading(displayPos);
  //  currentMillis = 0;
  // }


    // if (currentMillis >= 1000) {
    //   Display_printNumber(displayPos++);
    //   currentMillis = 0;

    // }


  if (currentMillis >= 150) {
    

    if (Button_C_press()) {
      printText("\nCurrent Block: ");
      printNumbers(Pinch_currentBlock(), DEC);
      printText("\nCurrent Sector: ");
      printNumbers(Pinch_currentSector(), DEC);
    } else if (Button_A_press()) {
      Pinch_nextBlock();
    } else if (Button_B_press()) {
      Pinch_nextSector();
    }



    Display_setDigit(Pinch_currentBlock()+65, 0);
    Display_setDigit(Pinch_currentSector() < 10 ? '0' : '1', 1);
    Display_setDigit((Pinch_currentSector() % 10) + 48, 2);

    currentMillis = 0;
  }
  

  Pinch_loop();
  Display_update();

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
