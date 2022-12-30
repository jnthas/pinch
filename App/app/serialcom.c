#include "serialcom.h"

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

//TODO xdata
struct ProtocolStructure protocol;

__xdata uint8_t cmdByte;
__xdata uint8_t lastCmdByte;
__xdata uint16_t byteCount = 0;


void SerialCom_setup()
{
  current_state = begin_of_transmission;
}

void SerialCom_loop()
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

      printText("Operation: ");
      printNumbers(cmdByte, HEX);
      printLineBreak();
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

        printText("Param Size: ");
        printNumbers(cmdByte, DEC);
        printLineBreak();
      }
      else
      {
        protocol.param = cmdByte;
        printText("Param #: ");
        printNumbers(cmdByte, HEX);
        printLineBreak();
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
          SerialCom_handler(cmdByte);
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

void SerialCom_cdcBufferSink(uint8_t buffer_size) {

  printTextArray(_sbuffer, buffer_size);
   ///printTextArray(2 + _sbuffer, regCount - 2);

}



void SerialCom_handler(__xdata uint8_t payload)
{
  switch (protocol.operation)
  {
    case PINCH_STORE:
      Database_store(payload, byteCount, protocol.param, protocol.payload_size);
      break;
    case PINCH_LOAD:
      //TODO: check limits of payload
      Database_load(payload, &SerialCom_cdcBufferSink);
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