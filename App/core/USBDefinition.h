#ifndef __USB_DEFINITION_H__
#define __USB_DEFINITION_H__

#include <stdint.h>

extern __code uint8_t *DeviceDesc;
extern __code uint8_t *ConfigDesc;
extern __code uint8_t *PinchMode;


void USB_setCDCMode();


#endif
