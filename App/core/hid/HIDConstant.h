#ifndef __USB_CONST_HID_H__
#define __USB_CONST_HID_H__

#include <stdint.h>
#include "ch552.h"

extern __code uint8_t HIDDevDesc[];
extern __code uint8_t HIDCfgDesc[];
extern __code uint16_t HIDDevDescLen;
extern __code uint16_t HIDCfgDescLen;


extern __code uint8_t ReportDesc[];
extern __code uint16_t ReportDescLen;

#endif
