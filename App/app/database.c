#include "database.h"


void Database_store(__xdata uint8_t payload, __xdata uint16_t byteCount, __xdata uint8_t page, __xdata uint8_t payload_size)
{
  __xdata uint32_t memAddress;

  ///memset(_sbuffer, 0, FLASH_BUFFER_SIZE * sizeof(*_sbuffer));

  memAddress = Device_getMemAddress(_currentBlock, _currentSector, page);

  // Header, two bytes. Param code and param size
  if (byteCount <= 1)
  {
    writeByte(memAddress, page);
    writeByte(memAddress+1, payload_size);
  }

  writeByte(memAddress + byteCount + 1, payload);

  mDelaymS(1);

  // printText("Saving in address: ");
  // printNumbers(memAddress, HEX);
  // printLineBreak();
  // printNumbers(payload, HEX);
  // printText(",");
  // printLineBreak();
}

void Database_load(__xdata uint8_t payload, BufferSink sink)
{

  //TODO: payload must be < 16
  __xdata uint32_t memAddress = Device_getMemAddress(_currentBlock, _currentSector, payload);
  __xdata uint8_t regCount = 0;

  //printText("Addr: ");
  //printNumbers(memAddress, HEX);
  // printText("-");
  // printNumbers(memAddress+255, HEX);
  // printText(":");
  //printLineBreak();

  for (uint8_t j = 0; j < (256 / FLASH_BUFFER_SIZE); j++)
  {

    readBytes(memAddress + (j * FLASH_BUFFER_SIZE), _sbuffer, FLASH_BUFFER_SIZE);

    //printText("_sbuffer:\n");
    for (regCount = 0; regCount < FLASH_BUFFER_SIZE; regCount++)
    {
      //printNumbers(_sbuffer[regCount], HEX);

      if (_sbuffer[regCount] == 0xff || _sbuffer[regCount] == PINCH_DLE)
        break;
    }
    
    //printLineBreak(); 
    //printText("Break RegCount: ");
    //printNumbers(regCount, DEC);
    //printLineBreak();

    if (regCount < 1)
      break;

    sink(regCount);

    if (regCount < FLASH_BUFFER_SIZE)
      break;
  }

  ///printLineBreak();
}