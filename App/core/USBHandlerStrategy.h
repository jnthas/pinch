#ifndef __USB_HANDLER_STRATEGY_H__
#define __USB_HANDLER_STRATEGY_H__

#include <stdint.h>

typedef void (*USBInterruptStrategy)(void);
typedef void (*USBDeviceCfgStrategy)(void);
typedef void (*USBDeviceIntCfgStrategy)(void);
typedef void (*USBDeviceEndPointCfgStrategy)(void);


#endif