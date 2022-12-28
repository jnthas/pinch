#ifndef __USB_CONST_DATA_H__
#define __USB_CONST_DATA_H__

#include <stdint.h>
#include "ch552.h"

#define  EP0_ADDR 0
#define  EP1_ADDR 10

extern __code uint8_t DevDesc[];
extern __code uint8_t CfgDesc[];
extern __code uint16_t DevDescLen;
extern __code uint16_t CfgDescLen;


extern __code uint8_t ReportDesc[];
extern __code uint16_t ReportDescLen;

#endif
