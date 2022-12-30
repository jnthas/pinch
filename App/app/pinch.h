#ifndef APP_PINCH_H
#define APP_PINCH_H

#include <stdint.h>
#include <string.h>
#include "../components/sevenSegmentDisplay.h"
#include "../components/inputButton.h"
#include "../components/w25qxx.h"
#include "../core/hid/USBHIDKeyboard.h"
#include "device.h"
#include "database.h"
#include "serialcom.h"


void Pinch_setup();
void Pinch_loopCDC(__xdata unsigned long currentMillis);
void Pinch_loopHID(__xdata unsigned long currentMillis);

void Pinch_handleInputButton(ButtonState event);

void cdcBufferSink(uint8_t buffer_size);
void hidBufferSink(uint8_t buffer_size);
#endif