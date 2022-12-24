#ifndef APP_LOCKER_H
#define APP_LOCKER_H

#include <stdint.h>
#include <string.h>

#include "../components/sevenSegmentDisplay.h"
#include "../components/w25qxx.h"
#include "../components/inputButton.h"


void Locker_setup();
bool Locker_loop(__xdata unsigned long currentMillis);

void Locker_handleInputButton(ButtonState event);

#endif