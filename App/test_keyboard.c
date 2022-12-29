#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include "ch552.h"
#include "debug.h"
#include "components/w25qxx.h"
#include "components/sevenSegmentDisplay.h"
#include "components/inputButton.h"
#include "core/USBHandler.h"
#include "core/hid/USBHIDKeyboard.h"
#include "core/cdc/USBCDC.h"
#include "core/Print.h"
#include "core/GPIO.h"



__xdata uint8_t displayPos = 0;
__xdata unsigned long currentMillis = 0;


//void USBInterrupt(void); // USBInterrupt does not need to saves the context

void DeviceUSBInterrupt(void) __interrupt(INT_NO_USB) // USB interrupt service
{
  USBHandler_usbInterrupt();
}


void setup()
{
  CfgFsys();
  mDelaymS(10);

  //Keyboard_setup();
  USBSerial_setup();
  USBSerial();
  
  SPISetup();
  Display_setup();
  Button_setup();
}

void pinchButtonEvent(ButtonState event)
{
  uint8_t buttonARead = analogRead(11);
  uint8_t buttonBRead = analogRead(32);
  if (event == BUTTON_A_RELEASED)
  {
    
    
  
    printNumbers(buttonARead, DEC);
    printLineBreak();
    printNumbers(buttonBRead, DEC);
    printText("---\n");

  }
  else if (event == BUTTON_B_RELEASED)
  {
  
    printNumbers(buttonARead, DEC);
    printLineBreak();
    printNumbers(buttonBRead, DEC);
    printText("---\n");
    

    Display_setDigit('C', 0);
    Display_setDigit('D', 1);
    Display_setDigit('C', 2);
  }
  else if (event == BUTTON_C_RELEASED)
  {
    Display_setDigit(' ', 0);
    Display_setDigit(' ', 1);
    Display_setDigit('3', 2);
  }
}

bool statsled = false;

void loop()
{
  // Loading
  // if (lastMillis - millis() >= 75) {
  //     Display_loading(m);
  //     lastMillis = 0;
  // }

  // Marquee
  // if (lastMillis - millis() >= 500) {
  //     Display_marquee("Pinch", 5, m);
  //     lastMillis = 0;
  // }

  if (currentMillis % 400 == 0) {
    Display_marquee("Pinch", 5, displayPos);        
  }

  if (currentMillis % 800 == 0) {
    statsled = !statsled;
    Display_setLed(!statsled);
  }


  Button_loop(&pinchButtonEvent);
  Display_update();
  
}

void main()
{

  setup();

  while (1)
  {
    loop();

    currentMillis += 4;
  }
}

// analog read
// resistor 220k =  ~58 - 61
// resistor 10k  = ~168 - 176
