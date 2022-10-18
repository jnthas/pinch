#include "pinch.h"


struct ProtocolStructure protocol;

uint8_t _currentBlock = 0;
uint8_t cmdByte;
uint8_t lastCmdByte;

long byteCount = 0;




void Pinch_setup()
{    
    current_state = begin_of_transmission;
}

void Pinch_loop()
{

}

uint32_t Pinch_getMemAddress(uint8_t slot, uint8_t sector_num, uint8_t page_num);
void Pinch_store(uint8_t payload);
void Pinch_load(uint8_t payload);

void Pinch_handler(uint8_t payload)
{
    switch (protocol.operation) {
      
    case PINCH_STORE:
      storePayload(payload);     
      break;
    case PINCH_LOAD:
      loadData(payload);
      break;
    case PINCH_ERASE:
      printText("Erase\n");
      mDelaymS(1000);
      break;
    default:
      break;
  }
}
