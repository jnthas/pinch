#include "Print.h"


uint8_t printText(char * __xdata str)
{
    uint8_t n = 0;
    char c;
    
    if (!str) return 0;
    
    while ( c=*str++ ) {    // assignment intented
        if (USBSerial_write(c)) n++;
        else break;
    }

    USBSerial_flush();
    return n;
}

uint8_t printTextArray(uint8_t * __xdata buffer, __xdata uint8_t size)
{
    uint8_t n = 0;
    while (size--) {
        if (USBSerial_write(*buffer++)) n++;
        else break;
    }
    return n;
}


uint8_t printNumbers(__xdata unsigned long n, __xdata uint8_t base)
{
    __xdata char buf[8 * sizeof(long) + 1]; // Assumes 8-bit chars plus zero byte.
    __xdata char *str = &buf[sizeof(buf) - 1];
    
    *str = '\0';
    
    // prevent crash if called with base == 1
    if (base < 2) base = 10;
    
    do {
        char c = n % base;
        n /= base;
        
        *--str = c < 10 ? c + '0' : c + 'A' - 10;
    } while(n);
    
    return printText(str);
}
