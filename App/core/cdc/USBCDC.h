#ifndef __USB_CDC_H__
#define __USB_CDC_H__

#include <stdint.h>
#include "ch552.h"

#ifdef __cplusplus
extern "C" {
#endif

void USBInit(void);
char USBSerial_read(void);
uint8_t USBSerial_available(void);
uint8_t USBSerial_write(char c);
void USBSerial_flush(void);

#ifdef __cplusplus
} // extern "C"
#endif

#endif

