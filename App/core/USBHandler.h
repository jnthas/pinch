#ifndef __USB_HANDLER_H__
#define __USB_HANDLER_H__

#include <stdint.h>
#include "ch552.h"
#include "USBHandlerStrategy.h"
#include "hid/USBHandlerHID.h"


extern __xdata USBInterruptStrategy USBHandler_usbInterrupt;
extern __xdata USBDeviceCfgStrategy USBHandler_usbDeviceCfg;
extern __xdata USBDeviceIntCfgStrategy USBHandler_usbDeviceIntCfg;
extern __xdata USBDeviceEndPointCfgStrategy USBHandler_usbDeviceEndpointCfg;


//Common String Descriptors
extern __code uint8_t LangDes[];
extern __code uint8_t SerDes[];
extern __code uint8_t Prod_Des[];
extern __code uint8_t Manuf_Des[];
extern __code uint16_t LangDesLen;
extern __code uint16_t SerDesLen;
extern __code uint16_t Prod_DesLen;
extern __code uint16_t Manuf_DesLen;



void USBHandler_asHID();
void USBHandler_asCDC();

#endif
