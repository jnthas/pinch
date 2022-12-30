#ifndef PINCH_DATABASE_H
#define PINCH_DATABASE_H

#include <stdint.h>
#include <string.h>
#include "ch552.h"
#include "../components/w25qxx.h"
#include "../core/hid/USBHIDKeyboard.h"
#include "device.h"
#include "protocol.h"


typedef void (*BufferSink)(uint8_t);

// Memory
void Database_store(__xdata uint8_t payload, __xdata uint16_t byteCount, __xdata uint8_t page, __xdata uint8_t payload_size);
void Database_load(__xdata uint8_t payload, BufferSink sink);
// void Database_loadLabels();
// void Database_destroy();
// void Database_getParam();



#endif