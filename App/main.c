#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include "ch552.h"
#include "debug.h"
#include "core/Print.h"
#include "core/GPIO.h"
#include "core/USBHandler.h"
#include "core/hid/USBHIDKeyboard.h"
#include "core/cdc/USBCDC.h"
#include "components/sevenSegmentDisplay.h"
#include "components/inputButton.h"
#include "app/pinch.h"
#include "app/locker.h"


void DeviceUSBInterrupt(void) __interrupt(INT_NO_USB) // USB interrupt service
{
  USBHandler_usbInterrupt();
}

__xdata uint8_t displayPos = 0;
__xdata unsigned long currentMillis = 0;


enum PinchState
{
  Locked,
  CDCMode,
  KBDMode

} pinch_state;


void setup()
{
  CfgFsys();
  mDelaymS(10);

  Button_setup();

  uint8_t currentButtonState = Button_startupCheck();
  if (currentButtonState == BUTTON_A_PRESSED) {
    // CDC Mode
    USBSerial_setup();
    USBSerial();
    pinch_state = CDCMode;
  } else {
    // KBD Mode (Default)
    Keyboard_setup();
    pinch_state = KBDMode;
  }   

  
  SPISetup();

  Display_setup();
  
  Pinch_setup();
  Locker_setup();
}


void loop()
{
 
  switch (pinch_state) 
  {
    case Locked:
      if (Locker_loop(currentMillis))
        pinch_state = CDCMode;
      
      break;

    case CDCMode:
      Pinch_loop(currentMillis);
      break;

  }
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
