#include "pinch.h"

struct ProtocolStructure
{
  uint8_t control_flag;
  uint8_t operation;
  uint8_t param;
  uint8_t payload_size;
};

enum ProtocolState
{
  begin_of_transmission,
  operation,
  parameter,
  payload,
  end_of_transmission,
  payload_error

} current_state;

struct ProtocolStructure protocol;

__xdata uint8_t _currentBlock = 0;
__xdata uint8_t _currentSector = 0;

__xdata uint8_t cmdByte;
__xdata uint8_t lastCmdByte;
__xdata uint16_t byteCount = 0;

void Pinch_setup()
{
  current_state = begin_of_transmission;
}

void Pinch_loop()
{
  if (USBSerial_available() > 0)
  {
    uint8_t cmdByte = USBSerial_read();

    switch (current_state)
    {
    case begin_of_transmission:
      if (cmdByte == PINCH_DEVCONTROL)
      {
        protocol.control_flag = cmdByte;
        current_state = operation;

        // printText("Device Control: ");
        // printNumbers(cmdByte, HEX);
        // printLineBreak();
      }
      break;

    case operation:
      // TODO verify if operation exists
      protocol.operation = cmdByte;
      current_state = parameter;

      // printText("Operation: ");
      // printNumbers(cmdByte, HEX);
      // printLineBreak();
      break;

    case parameter:

      if (lastCmdByte == PINCH_RS && cmdByte == PINCH_EOT)
      {
        current_state = end_of_transmission;
      }
      else if (protocol.param == lastCmdByte)
      {
        protocol.payload_size = cmdByte;
        current_state = payload;

        // printText("Param Size: ");
        // printNumbers(cmdByte, DEC);
        // printLineBreak();
      }
      else
      {
        protocol.param = cmdByte;
        // printText("Param #: ");
        // printNumbers(cmdByte, HEX);
        // printLineBreak();
      }

      break;
    case payload:
      if (lastCmdByte == PINCH_DLE && cmdByte == PINCH_RS)
      {
        byteCount = 0;
        current_state = parameter;
      }
      else if (protocol.payload_size > 0 && protocol.payload_size == byteCount)
      {
        if (cmdByte == PINCH_RS)
        {
          current_state = parameter;
        }
        else
        {
          current_state = payload_error;
        }
        // printLineBreak();
        byteCount = 0;
      }
      else
      {
        byteCount++;
        if (protocol.payload_size == 0 || byteCount <= protocol.payload_size)
        {
          Pinch_handler(cmdByte);
        }
      }
      break;

    case end_of_transmission:
      protocol.control_flag = 0;
      protocol.operation = 0;
      protocol.param = 0;
      protocol.payload_size = 0;
      byteCount = 0;
      current_state = begin_of_transmission;
      // printLineBreak();
      USBSerial_flush();
      break;

    case payload_error:
      // printLineBreak();
      USBSerial_flush();
      printText("ERROR!");
      // TODO format block
      current_state = end_of_transmission;
      break;

    default:
      // ignore any unrecognized bytes.
      break;
    }

    lastCmdByte = cmdByte;
  }

  USBSerial_flush();
}

uint32_t Pinch_getMemAddress(__xdata uint8_t block, __xdata uint8_t sector, __xdata uint8_t param)
{
  return (((uint32_t)block << 16) | ((uint32_t)((sector*16)+param) << 8) | 0);
}

void Pinch_store(__xdata uint8_t payload)
{
  __xdata uint32_t memAddress;

  ///memset(_sbuffer, 0, FLASH_BUFFER_SIZE * sizeof(*_sbuffer));

  memAddress = Pinch_getMemAddress(_currentBlock, _currentSector, protocol.param);

  // Header, two bytes. Param code and param size
  if (byteCount <= 1)
  {
    writeByte(memAddress, protocol.param);
    writeByte(memAddress+1, protocol.payload_size);
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

void Pinch_load(__xdata uint8_t payload)
{

  //TODO: payload must be < 16
  __xdata uint32_t memAddress = Pinch_getMemAddress(_currentBlock, _currentSector, payload);
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
  

    if (j == 0)
    {
      // skips the first two bytes, param number and param size
      //printText("J=0:\n");
      printTextArray(2 + _sbuffer, regCount - 2);
    }
    else
    {
      //printText("J>0:\n");
      printTextArray(_sbuffer, regCount);
    }

    if (regCount < FLASH_BUFFER_SIZE)
      break;
  }

  printLineBreak();
}

void Pinch_handler(__xdata uint8_t payload)
{

  switch (protocol.operation)
  {
    case PINCH_STORE:
      Pinch_store(payload);
      break;
    case PINCH_LOAD:
      //TODO: check limits of payload
      Pinch_load(payload);
      break;
    case PINCH_ERASE:
      //printText("Erase\n");
      //memAddress = Pinch_getMemAddress(0xc8, 0xff, 0xc9);
      //printNumbers(memAddress, HEX);
      printLineBreak();
      mDelaymS(1000);
      break;
    default:
      break;
  }
}

void Pinch_nextBlock() 
{
  _currentBlock++;

  if (_currentBlock > 5)
    _currentBlock = 0;
}

void Pinch_nextSector()
{
  _currentSector++;

  if (_currentSector > 15)
    _currentSector = 0;
}

uint8_t Pinch_currentBlock()
{
  return _currentBlock;
}

uint8_t Pinch_currentSector()
{
  return _currentSector;
}