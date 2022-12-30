#include "pinch.h"


void Pinch_setup()
{
  //if (pinch_state == CDCMode) {
  //  SerialCom_setup();
  //}

}


void cdcBufferSink(uint8_t buffer_size) {
  printTextArray(_sbuffer, buffer_size);
  printLineBreak();
   ///printTextArray(2 + _sbuffer, regCount - 2);

}

void hidBufferSink(uint8_t buffer_size) {
  for (uint8_t kbd = 0; kbd < buffer_size; kbd++) {
    Keyboard_write(_sbuffer[kbd]);
    mDelayuS(50);
  }
}

void Pinch_handleInputButtonCDC(ButtonState event) {

    if (event == BUTTON_A_RELEASED)
      Device_nextBlock();
    else if (event == BUTTON_B_RELEASED)
      Device_nextSector();
    else if (event == BUTTON_C_RELEASED) {
      Database_load(0, &cdcBufferSink); 
      Database_load(1, &cdcBufferSink); 
      Database_load(2, &cdcBufferSink); 
    }
}


void Pinch_handleInputButtonHID(ButtonState event) {

    if (event == BUTTON_A_RELEASED)
      Device_nextBlock();
    else if (event == BUTTON_B_RELEASED)
      Device_nextSector();
    else if (event == BUTTON_C_RELEASED) {
      Database_load(3, &hidBufferSink); 
    }
}


void Pinch_loop(__xdata unsigned long currentMillis) {
  if (currentMillis % 96 == 0)
  {
    Display_setDigit(Device_currentBlock()+65, 0);
    Display_setDigit(Device_currentSector() < 10 ? '0' : '1', 1);
    Display_setDigit((Device_currentSector() % 10) + 48, 2);

  }
}


void Pinch_loopCDC(__xdata unsigned long currentMillis) {
  Pinch_loop(currentMillis);
  Button_loop(&Pinch_handleInputButtonCDC);
  SerialCom_loop();  
}


void Pinch_loopHID(__xdata unsigned long currentMillis) {
  Pinch_loop(currentMillis);
  Button_loop(&Pinch_handleInputButtonHID);
}