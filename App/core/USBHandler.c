
#include "USBHandler.h"


__xdata USBInterruptStrategy USBHandler_usbInterrupt;
__xdata USBDeviceCfgStrategy USBHandler_usbDeviceCfg;
__xdata USBDeviceIntCfgStrategy USBHandler_usbDeviceIntCfg;
__xdata USBDeviceEndPointCfgStrategy USBHandler_usbDeviceEndpointCfg;



uint16_t SetupLen;
uint8_t SetupReq,UsbConfig;

__code uint8_t *pDescr;


__xdata uint8_t EpABuffer[8];    // Ep0 - Used by CDC and HID with same size (8 bytes)
__xdata uint8_t EpBBuffer[8];    // Ep1 - In CDC it uses 8 bytes, in HID it uses 128 bytes
__xdata uint8_t EpCBuffer[128];  // Ep2 - Only used by CDC (128 bytes)


volatile uint8_t usbMsgFlags=0;    // uint8_t usbMsgFlags copied from VUSB



//String Descriptors
__code uint8_t LangDes[]={0x04,0x03,0x09,0x04};           //Language Descriptor
__code uint16_t LangDesLen = sizeof(LangDes);
__code uint8_t SerDes[]={                                 //Serial String Descriptor
    0x0C,0x03,
    'C',0x00,'H',0x00,'5',0x00,'5',0x00,'x',0x00
};
__code uint16_t SerDesLen = sizeof(SerDes);
__code uint8_t Prod_Des[]={                                //Produce String Descriptor
    0x16,0x03,
    'C',0x00,'H',0x00,'5',0x00,'5',0x00,'x',0x00,'d',0x00,
    'u',0x00,'i',0x00,'n',0x00,'o',0x00
};
__code uint16_t Prod_DesLen = sizeof(Prod_Des);

__code uint8_t Manuf_Des[]={
    0x0E,0x03,
    'D',0x00,'e',0x00,'q',0x00,'i',0x00,'n',0x00,'g',0x00,
};
__code uint16_t Manuf_DesLen = sizeof(Manuf_Des);




void USBHandler_asHID() {
    USBHandler_usbInterrupt = &HIDUSBInterrupt;
    USBHandler_usbDeviceCfg = &HIDUSBDeviceCfg;
    USBHandler_usbDeviceIntCfg = &HIDUSBDeviceIntCfg;
    USBHandler_usbDeviceEndpointCfg = &HIDUSBDeviceEndPointCfg;
}


void USBHandler_asCDC() {
    USBHandler_usbInterrupt = &CDCUSBInterrupt;
    USBHandler_usbDeviceCfg = &CDCUSBDeviceCfg;
    USBHandler_usbDeviceIntCfg = &CDCUSBDeviceIntCfg;
    USBHandler_usbDeviceEndpointCfg = &CDCUSBDeviceEndPointCfg;
}


