#ifndef __USB_CDC_H__
#define __USB_CDC_H__

#include <stdint.h>
#include <stdbool.h>
#include "ch552.h"

#include "../USBHandler.h"

void USBSerial_setup(void);
char USBSerial_read(void);
uint8_t USBSerial_available(void);
uint8_t USBSerial_write(char c);
void USBSerial_flush(void);


#endif

