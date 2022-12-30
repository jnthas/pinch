
#ifndef APP_DEVICE_H
#define APP_DEVICE_H

#include <stdint.h>
#include "ch552.h"

extern __xdata uint8_t _currentBlock;
extern __xdata uint8_t _currentSector;

uint32_t Device_getMemAddress(__xdata uint8_t block, __xdata uint8_t sector, __xdata uint8_t page);
void Device_nextBlock();
void Device_nextSector();
uint8_t Device_currentBlock();
uint8_t Device_currentSector();


#endif