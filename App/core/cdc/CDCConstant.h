#ifndef __USB_CONST_CDC_H__
#define __USB_CONST_CDC_H__


#include <stdint.h>
#include "ch552.h"


#define  SET_LINE_CODING                0X20            // Configures DTE rate, stop-bits, parity, and number-of-uint8_tacter
#define  GET_LINE_CODING                0X21            // This request allows the host to find out the currently configured line coding.
#define  SET_CONTROL_LINE_STATE         0X22            // This request generates RS-232/V.24 style control signals.


extern __code uint8_t CDCDevDesc[];
extern __code uint8_t CDCCfgDesc[];
extern __code uint16_t CDCDevDescLen;
extern __code uint16_t CDCCfgDescLen;


extern __code uint8_t CDC_Des[];
extern __code uint16_t CDC_DesLen;


#endif
