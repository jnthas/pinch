
#include "w25qxx.h"

void SPISetup()
{
  SPIMasterModeSet(3); // SPI master mode setting, mode 3
  SPI_CK_SET(2);       // divide by 2, fastest
  SCS = 1;
  wakeup();
}

void select()
{
  SCS = 0;
}

void unselect()
{
  SCS = 1;
}

void sendCommand(uint8_t cmd)
{
  if (cmd != SPIFLASH_WAKE) while(busy());

  select();
  CH554SPIMasterWrite(cmd);
}

uint16_t readDeviceId()
{

  uint16_t id = 0;

  sendCommand(SPIFLASH_IDREAD);
  mDelayuS(2);
  id = CH554SPIMasterRead() << 8;
  id |= CH554SPIMasterRead();
  unselect();

  return id;
}

uint8_t *readUniqueId()
{
  sendCommand(SPIFLASH_MACREAD);
  mDelayuS(2);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  CH554SPIMasterWrite(0);
  mDelayuS(2);
  for (uint8_t a = 0; a < 8; a++)
  {
    UNIQUEID[a] = CH554SPIMasterRead();
  }
  unselect();

  return UNIQUEID;
}

uint8_t readByte(uint32_t addr)
{
  sendCommand(SPIFLASH_ARRAYREADLOWFREQ);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  mDelayuS(2);
  uint8_t result = CH554SPIMasterRead();
  unselect();

  // printf("%02X.", result);

  return result;
}

/// read unlimited # of bytes
void readBytes(uint32_t addr, void *buf, uint16_t len)
{
  sendCommand(SPIFLASH_ARRAYREAD);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  CH554SPIMasterWrite(0); //"dont care"
  for (uint16_t i = 0; i < len; ++i)
    ((uint8_t *)buf)[i] = CH554SPIMasterRead();
  unselect();
}

/// return the STATUS register
uint8_t readStatus()
{
  select();  
  CH554SPIMasterWrite(SPIFLASH_STATUSREAD);
  uint8_t status = CH554SPIMasterRead();
  unselect();
  return status;
}

/// check if the chip is busy erasing/writing
bool busy()
{
  return readStatus() & 1;
}

void enableWrite()
{
  sendCommand(SPIFLASH_WRITEENABLE);
  unselect();
}

void writeByte(uint32_t addr, uint8_t byt)
{
  enableWrite();
  sendCommand(SPIFLASH_BYTEPAGEPROGRAM);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  CH554SPIMasterWrite(byt);
  unselect();
}


/// write multiple bytes to flash memory (up to 64K)
/// WARNING: you can only write to previously erased memory locations (see datasheet)
///          use the block erase commands to first clear memory (write 0xFFs)
/// This version handles both page alignment and data blocks larger than 256 bytes.
///
void writeBytes(uint32_t addr, const void* buf, uint16_t len) {
  uint16_t n;
  uint16_t maxBytes = 256-(addr%256);  // force the first set of bytes to stay within the first page
  uint16_t offset = 0;
  while (len>0)
  {
    n = (len<=maxBytes) ? len : maxBytes;
    enableWrite();
    sendCommand(SPIFLASH_BYTEPAGEPROGRAM);
    CH554SPIMasterWrite(addr >> 16);
    CH554SPIMasterWrite(addr >> 8);
    CH554SPIMasterWrite(addr);
    
    for (uint16_t i = 0; i < n; i++)
      CH554SPIMasterWrite(((uint8_t*) buf)[offset + i]);
    unselect();
    
    addr+=n;  // adjust the addresses and remaining bytes by what we've just transferred.
    offset +=n;
    len -= n;
    maxBytes = 256;   // now we can do up to 256 bytes per loop
  }
}

/// erase entire flash memory array
/// may take several seconds depending on size, but is non blocking
/// so you may wait for this to complete using busy() or continue doing
/// other things and later check if the chip is done with busy()
/// note that any command will first wait for chip to become available using busy()
/// so no need to do that twice
void chipErase() {
  enableWrite();
  sendCommand(SPIFLASH_CHIPERASE);
  unselect();
}

/// erase a 4Kbyte block
void blockErase4K(uint32_t addr) {
  enableWrite();
  sendCommand(SPIFLASH_BLOCKERASE_4K);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  unselect();
}

/// erase a 32Kbyte block
void blockErase32K(uint32_t addr) {
  enableWrite();
  sendCommand(SPIFLASH_BLOCKERASE_32K);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  unselect();
}

/// erase a 64Kbyte block
void blockErase64K(uint32_t addr) {
  enableWrite();
  sendCommand(SPIFLASH_BLOCKERASE_64K);
  CH554SPIMasterWrite(addr >> 16);
  CH554SPIMasterWrite(addr >> 8);
  CH554SPIMasterWrite(addr);
  unselect();
}

/// Put flash memory chip into power down mode
/// WARNING: after this command, only the WAKEUP and DEVICE_ID commands are recognized
/// hence a wakeup() command should be invoked first before further operations
/// If a MCU soft restart is possible with flash chip left in sleep(), then a wakeup() command
///   should always be invoked before any other commands to ensure the flash chip was not left in sleep
void sleep() {
  sendCommand(SPIFLASH_SLEEP);
  unselect();
}

/// Wake flash memory from power down mode
/// NOTE: this command is required after a sleep() command is used, or no other commands will be recognized
/// If a MCU soft restart is possible with flash chip left in sleep(), then a wakeup() command
///   should always be invoked before any other commands to ensure the flash chip was not left in sleep
void wakeup() {
  sendCommand(SPIFLASH_WAKE);
  unselect();
}
