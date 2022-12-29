#ifndef __USB_HANDLER_H__
#define __USB_HANDLER_H__

#include <stdint.h>
#include "ch552.h"
#include "USBHandlerStrategy.h"
#include "cdc/USBHandlerCDC.h"
#include "hid/USBHandlerHID.h"



#define UsbSetupBuf     ((PUSB_SETUP_REQ)EpABuffer)

#define  EP0_ADDR 0
#define  EP1_ADDR 10
#define  EP2_ADDR 20


extern __xdata USBInterruptStrategy USBHandler_usbInterrupt;
extern __xdata USBDeviceEndPointCfgStrategy USBHandler_usbDeviceEndpointCfg;



// Commons

extern volatile uint8_t usbMsgFlags;    // uint8_t usbMsgFlags copied from VUSB

extern __xdata uint8_t  EpABuffer[];  // Ep0 - Used by CDC and HID with same size (8 bytes)
extern __xdata uint8_t  EpBBuffer[];  // Ep1 - In CDC it uses 8 bytes, in HID it uses 128 bytes
extern __xdata uint8_t  EpCBuffer[];  // Ep2 - Only used by CDC (128 bytes)

extern uint16_t SetupLen;
extern uint8_t SetupReq,UsbConfig;
extern const __code uint8_t *pDescr;



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


void USBDeviceCfg(void);
void USBDeviceIntCfg(void);
#endif
