#ifndef __USB_HANDLER_HID_H__
#define __USB_HANDLER_HID_H__

#include <stdint.h>
#include "ch552.h"
#include "HIDConstant.h"
#include "../USBHandler.h"

extern volatile __xdata uint8_t UpPoint1_Busy;


void HIDUSBInterrupt(void);
void HIDUSBDeviceCfg(void);
void HIDUSBDeviceIntCfg(void);
void HIDUSBDeviceEndPointCfg(void);


#endif

