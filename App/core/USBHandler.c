
#include "USBHandler.h"


__xdata USBInterruptStrategy USBHandler_usbInterrupt;
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
    USBHandler_usbDeviceEndpointCfg = &HIDUSBDeviceEndPointCfg;
}

void USBHandler_asCDC() {
    USBHandler_usbInterrupt = &CDCUSBInterrupt;
    USBHandler_usbDeviceEndpointCfg = &CDCUSBDeviceEndPointCfg;
}



// Common code between CDC and HID

void USBDeviceCfg(void)
{
    USB_CTRL = 0x00;                                                           //Clear USB control register
    USB_CTRL &= ~bUC_HOST_MODE;                                                //This bit is the device selection mode
    USB_CTRL |=  bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;                    //USB device and internal pull-up enable, automatically return to NAK before interrupt flag is cleared during interrupt
    USB_DEV_AD = 0x00;                                                         //Device address initialization
    //     USB_CTRL |= bUC_LOW_SPEED;
    //     UDEV_CTRL |= bUD_LOW_SPEED;                                                //Run for 1.5M
    USB_CTRL &= ~bUC_LOW_SPEED;
    UDEV_CTRL &= ~bUD_LOW_SPEED;                                             //Select full speed 12M mode, default mode
#if defined(CH551) || defined(CH552) || defined(CH549)
    UDEV_CTRL = bUD_PD_DIS;                                                     // Disable DP/DM pull-down resistor
#endif
#if defined(CH559)
    UDEV_CTRL = bUD_DP_PD_DIS;                                                     // Disable DP/DM pull-down resistor
#endif
    UDEV_CTRL |= bUD_PORT_EN;                                                  //Enable physical port
}

void USBDeviceIntCfg(void)
{
    USB_INT_EN |= bUIE_SUSPEND;                                               //Enable device hang interrupt
    USB_INT_EN |= bUIE_TRANSFER;                                              //Enable USB transfer completion interrupt
    USB_INT_EN |= bUIE_BUS_RST;                                               //Enable device mode USB bus reset interrupt
    USB_INT_FG |= 0x1F;                                                       //Clear interrupt flag
    IE_USB = 1;                                                               //Enable USB interrupt
    EA = 1;                                                                   //Enable global interrupts
}


void USB_EP0_IN() {
    switch(SetupReq)
    {
        case USB_GET_DESCRIPTOR:
        {
            uint8_t len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;                                 //send length
            for (uint8_t i=0;i<len;i++){
                EpABuffer[i] = pDescr[i];
            }
            //memcpy( EpABuffer, pDescr, len );                                  
            SetupLen -= len;
            pDescr += len;
            UEP0_T_LEN = len;
            UEP0_CTRL ^= bUEP_T_TOG;                    //Switch between DATA0 and DATA1
        }
            break;
        case USB_SET_ADDRESS:
            USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
            UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
            break;
        default:
            UEP0_T_LEN = 0;                                                      // End of transaction
            UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
            break;
    }
}

void USB_EP0_OUT(){
    if(SetupReq == SET_LINE_CODING)  //Set line coding
    {
        if( U_TOG_OK )
        {
            setLineCodingHandler();
            UEP0_T_LEN = 0;
            UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_ACK;  // send 0-length packet
        }
    }
    else
    {
        UEP0_T_LEN = 0;
        UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;  //Respond Nak
    }
}
