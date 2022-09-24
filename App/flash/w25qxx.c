
#include "w25qxx.h"

void select() {
  SCS = 0;
}

void unselect() {
  SCS = 1;
}

void sendCommand(uint8_t cmd) {
  select();
  CH554SPIMasterWrite(cmd);
}


uint8_t readByte(uint32_t addr) { 

    sendCommand(SPIFLASH_ARRAYREADLOWFREQ);
    CH554SPIMasterWrite(addr >> 16);
    CH554SPIMasterWrite(addr >> 8);
    CH554SPIMasterWrite(addr);
    mDelayuS(2);
    uint8_t result = CH554SPIMasterRead();
    unselect();

    //printf("%02X.", result);

    return result;
}

uint16_t readDeviceId() {

    uint16_t id = 0;
        
    sendCommand(SPIFLASH_IDREAD);
    mDelayuS(2);
    id = CH554SPIMasterRead() << 8;
    id |= CH554SPIMasterRead();
    unselect();
    
    return id;
}


uint8_t* readUniqueId()
{
  sendCommand(SPIFLASH_MACREAD);  
  mDelayuS(2);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  mDelayuS(2);
  for (uint8_t a=0;a<8;a++) {
    UNIQUEID[a] = CH554SPIMasterRead();
  }
  unselect();
    
  return UNIQUEID;
}


void  SPISetup()
{
    SPIMasterModeSet(3);  // SPI master mode setting, mode 3
    SPI_CK_SET(2);        // divide by 2, fastest
    SCS = 1;
}