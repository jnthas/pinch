#ifndef APP_PINCH_H
#define APP_PINCH_H

#include <stdint.h>
#include <string.h>

#include "../core/Print.h"
#include "../core/USBCDC.h"
#include "../components/w25qxx.h"



#define PINCH_DEVCONTROL   0x11        // Device Control 1

#define PINCH_STORE        0x0c        // Form Feed
#define PINCH_LOAD         0x05        // Enquiry
#define PINCH_ERASE        0x7f        // Delete

#define PINCH_DLE          0x10        // Data Link Escape
#define PINCH_RS           0x1E        // Record Separator
#define PINCH_EOT          0x04        // End Of Transmission


void Pinch_setup();
void Pinch_loop();

uint32_t Pinch_getMemAddress(__xdata uint8_t slot, __xdata uint8_t sector_num, __xdata uint8_t page_num);
void Pinch_store(__xdata uint8_t payload);
void Pinch_load(__xdata uint8_t payload);
void Pinch_handler(__xdata uint8_t payload);

void Pinch_nextBlock();
void Pinch_nextSector();

uint8_t Pinch_currentBlock();
uint8_t Pinch_currentSector();


#endif