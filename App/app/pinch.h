#ifndef APP_PINCH_H
#define APP_PINCH_H

#include <stdint.h>
#include <string.h>

#include "../core/Print.h"
#include "../core/cdc/USBCDC.h"
#include "../components/sevenSegmentDisplay.h"
#include "../components/inputButton.h"
#include "../components/w25qxx.h"


/*
ERASE: echo -e "\x11\x7f\x01\x01\x01\x1e\x04" > /dev/ttyACM0
STORE: echo -e "\x11\x0c\x01\x041234\x1e\x02\x0ewww.google.com\x1e\x03\x00my super strong passssword\x10\x1e\x04" > /dev/ttyACM0 
LOAD : echo -e "\x11\x05\x01\x01\x01\x1e\x04" > /dev/ttyACM0

echo -e "\x11\x0c\x00\x0A1666575017\x1e\x01\x0dwww.yahoo.com\x1e\x02\x00d8e8fca2dc0f896fd7cb4cb0031ba249\x10\x1e\x04" > /dev/ttyACM0 

\x11\x0c
\x01\x04 1234 \x1e
\x02\x0e www.google.com \x1e
\x03\x00 my super strong passssword\x10 \x1e


\x04


*/


#define PINCH_DEVCONTROL   0x11        // Device Control 1

#define PINCH_STORE        0x0c        // Form Feed
#define PINCH_LOAD         0x05        // Enquiry
#define PINCH_ERASE        0x7f        // Delete

#define PINCH_DLE          0x10        // Data Link Escape
#define PINCH_RS           0x1E        // Record Separator
#define PINCH_EOT          0x04        // End Of Transmission


void Pinch_setup();
void Pinch_loop(__xdata unsigned long currentMillis);

uint32_t Pinch_getMemAddress(__xdata uint8_t block, __xdata uint8_t sector, __xdata uint8_t page);
void Pinch_store(__xdata uint8_t payload);
void Pinch_load(__xdata uint8_t payload);
void Pinch_handler(__xdata uint8_t payload);

void Pinch_nextBlock();
void Pinch_nextSector();

uint8_t Pinch_currentBlock();
uint8_t Pinch_currentSector();

void Pinch_handleInputButton(ButtonState event);
void Pinch_ProtocolLoop();


#endif