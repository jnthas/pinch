
#include "USBHandler.h"


__xdata USBInterruptStrategy USBHandler_usbInterrupt;
__xdata USBDeviceCfgStrategy USBHandler_usbDeviceCfg;
__xdata USBDeviceIntCfgStrategy USBHandler_usbDeviceIntCfg;
__xdata USBDeviceEndPointCfgStrategy USBHandler_usbDeviceEndpointCfg;


//String Descriptors
__code uint8_t LangDes[]={0x04,0x03,0x09,0x04};           //Language Descriptor
__code uint16_t LangDesLen = sizeof(LangDes);

__code uint8_t SerDes[]={                                 //Serial String Descriptor
    0x14,0x03,
    'C',0x00,'H',0x00,'5',0x00,'5',0x00,'x',0x00,' ',0x00,'k',0x00,'b',0x00,'d',0x00
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
    USBHandler_usbInterrupt = &HIDUSBInterrupt;
    USBHandler_usbDeviceCfg = &HIDUSBDeviceCfg;
    USBHandler_usbDeviceIntCfg = &HIDUSBDeviceIntCfg;
    USBHandler_usbDeviceEndpointCfg = &HIDUSBDeviceEndPointCfg;
}


