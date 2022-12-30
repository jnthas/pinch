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
#include "app/serialcom.h"
#include "app/locker.h"


/*
Pinch has 96 slots of 4kb divided in 6 banks from A to F. Each bank is composed of 16 sectors from 0 to 15


Premisses:
  - You can't recover a password in CDC mode
  - You must confirm manually when replacing a slot 
  - All operations should have a manually operation
  - There will be a flag indicating if the device must be destroyed in case user removes device before it happens
  - At first, device is empty and it will accept a special command to set parameters like pin code, after that only if you destroy all data and restart the device  
  - To set pin code it must be confirmed manually before


TODO List:

- Implement self-destroy after 3 attempts of pin code
- List all labels in CDC mode, too check what is available
- Create a webpage to list all slots (webserial)
- Create a CLI tool to handle operations in CDC mode
- Create a parameter section in flash and save : pin code, analog button threashold, self-destroy enabled, # attempts self-destroy
- Turn on led when a slot is used 
- Implement LED function: 
  - Locked: always on
  - CDC MOde: Blink every 3 secs + turned on when navigate in a used slot
  - KBD MOde: Off by default + turned on when navigate in a used slot
- Create a 1-sec startup screen - KBD or CDC 
- Encrypt passwords 
- Always reduce the size of firmware!

- Write README
- Record a 1min explaining video
- Write a post
*/



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
  HIDMode
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
    SerialCom_setup();

    pinch_state = CDCMode;
  } else {
    // KBD Mode (Default)
    Keyboard_setup();
    pinch_state = HIDMode;
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
      Pinch_loopCDC(currentMillis);
      break;
    
    case HIDMode:
      Pinch_loopHID(currentMillis);
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
