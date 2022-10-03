#ifndef Print_h
#define Print_h


#include <stdint.h>
#include "USBCDC.h"

#define DEC 10
#define HEX 16
#define OCT 8
#define BIN 2


void USBSerial_flush(void);
uint8_t USBSerial_write(char c);
uint8_t printText(char * __xdata str);
uint8_t printTextArray(uint8_t * __xdata buffer, __xdata uint8_t size);
uint8_t printNumbers(__xdata unsigned long n, __xdata uint8_t base);
uint8_t printLineBreak();


#endif
