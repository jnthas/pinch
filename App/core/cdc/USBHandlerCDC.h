#ifndef __USB_HANDLER_CDC_H__
#define __USB_HANDLER_CDC_H__

#include <stdint.h>
#include "ch552.h"
#include "CDCConstant.h"
#include "../USBHandler.h"


extern volatile __xdata uint8_t UpPoint2_Busy;   //Flag of whether upload pointer is busy

extern volatile __xdata uint8_t USBByteCountEP2;      //Bytes of received data on USB endpoint
extern volatile __xdata uint8_t USBBufOutPointEP2;    //Data pointer for fetching

void CDCUSBInterrupt(void);
void CDCUSBDeviceCfg(void);
void CDCUSBDeviceIntCfg(void);
void CDCUSBDeviceEndPointCfg(void);


#endif

