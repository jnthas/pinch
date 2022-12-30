#include "device.h"

__xdata uint8_t _currentBlock = 0;
__xdata uint8_t _currentSector = 0;


uint32_t Device_getMemAddress(__xdata uint8_t block, __xdata uint8_t sector, __xdata uint8_t param)
{
  return (((uint32_t)block << 16) | ((uint32_t)((sector*16)+param) << 8) | 0);
}


void Device_nextBlock() 
{
  _currentBlock++;

  if (_currentBlock > 5) //A - F
    _currentBlock = 0;
}

void Device_nextSector()
{
  _currentSector++;

  if (_currentSector > 15) //0 - 15
    _currentSector = 0;
}

uint8_t Device_currentBlock()
{
  return _currentBlock;
}

uint8_t Device_currentSector()
{
  return _currentSector;
}