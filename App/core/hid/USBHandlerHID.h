#ifndef __USB_HANDLER_HID_H__
#define __USB_HANDLER_HID_H__

#include <stdint.h>
#include "ch552.h"
#include "USBconstant.h"
#include "../USBHandler.h"

extern __xdata __at (EP0_ADDR) uint8_t  Ep0Buffer[];
extern __xdata __at (EP1_ADDR) uint8_t  Ep1Buffer[];

extern uint16_t SetupLen;
extern uint8_t SetupReq,UsbConfig;
extern const __code uint8_t *pDescr;


#define UsbSetupBuf     ((PUSB_SETUP_REQ)Ep0Buffer)


void HIDUSBInterrupt(void);
void HIDUSBDeviceCfg(void);
void HIDUSBDeviceIntCfg(void);
void HIDUSBDeviceEndPointCfg(void);


#endif

