#include "USBHandlerHID.h"

volatile __xdata uint8_t UpPoint1_Busy  = 0;   //Flag of whether upload pointer is busy

//Keyboard functions:

void HID_USB_EP0_SETUP(){
    uint8_t len = USB_RX_LEN;
    if(len == (sizeof(USB_SETUP_REQ)))
    {
        SetupLen = ((uint16_t)UsbSetupBuf->wLengthH<<8) | (UsbSetupBuf->wLengthL);
        len = 0;                                                      // Default is success and upload 0 length
        SetupReq = UsbSetupBuf->bRequest;
        usbMsgFlags = 0;
        if ( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ) != USB_REQ_TYP_STANDARD )//Not standard request
        {
            
            //here is the commnunication starts, refer to usbFunctionSetup of USBtiny
            //or usb_setup in usbtiny
            
            switch( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ))
            {
                case USB_REQ_TYP_VENDOR:    
                {
                    switch( SetupReq )
                    {
                        default:
                            len = 0xFF;                                                                        //command not supported
                            break;
                    }
                    break;
                }
                case USB_REQ_TYP_CLASS:
                {
                    switch( SetupReq )
                    {       
                        default:
                            len = 0xFF;                                                                        //command not supported
                            break;
                    }
                    break;
                }
                default:
                    len = 0xFF;                                                                        //command not supported
                    break;
            }

        }
        else                                                             //Standard request
        {
            switch(SetupReq)                                             //Request ccfType
            {
                case USB_GET_DESCRIPTOR:
                    switch(UsbSetupBuf->wValueH)
                {
                    case 1:                                                       //Device Descriptor
                        pDescr = HIDDevDesc;                                         //Put Device Descriptor into outgoing buffer
                        len = HIDDevDescLen;
                        break;
                    case 2:                                                        //Configure Descriptor
                        pDescr = HIDCfgDesc;                                       
                        len = HIDCfgDescLen;
                        break;
                    case 3:
                        if(UsbSetupBuf->wValueL == 0)
                        {
                            pDescr = LangDes;
                            len = LangDesLen;
                        }
                        else if(UsbSetupBuf->wValueL == 1)
                        {
                            pDescr = Manuf_Des;
                            len = Manuf_DesLen;
                        }
                        else if(UsbSetupBuf->wValueL == 2)
                        {
                            pDescr = Prod_Des;
                            len = Prod_DesLen;
                        }
                        else if(UsbSetupBuf->wValueL == 3)
                        {
                            pDescr = SerDes;
                            len = SerDesLen;
                        }
                        else
                        {
                            len = 0xff;  
                        }
                        break;
                     case 0x22:
                        if(UsbSetupBuf->wValueL == 0){
                            pDescr = ReportDesc;
                            len = ReportDescLen;
                        }
                        else
                        {
                            len = 0xff;  
                        }
                        break;
                    default:
                        len = 0xff;                                                // Unsupported descriptors or error
                        break;
                }
                    if (len != 0xff){
                        if ( SetupLen > len )
                        {
                            SetupLen = len;    // Limit length
                        }
                        len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;                            //transmit length for this packet
                        for (uint8_t i=0;i<len;i++){
                            EpABuffer[i] = pDescr[i];
                        }
                        SetupLen -= len;
                        pDescr += len;
                    }
                    break;
                case USB_SET_ADDRESS:
                    SetupLen = UsbSetupBuf->wValueL;                              // Save the assigned address
                    break;
                case USB_GET_CONFIGURATION:
                    EpABuffer[0] = UsbConfig;
                    if ( SetupLen >= 1 )
                    {
                        len = 1;
                    }
                    break;
                case USB_SET_CONFIGURATION:
                    UsbConfig = UsbSetupBuf->wValueL;
                    break;
                case USB_GET_INTERFACE:
                    break;
                case USB_SET_INTERFACE:
                    break;
                case USB_CLEAR_FEATURE:                                            //Clear Feature
                    if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )                  // Clear the device featuee.
                    {
                        if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
                        {
                            if( HIDCfgDesc[ 7 ] & 0x20 )
                            {
                                // wake up
                            }
                            else
                            {
                                len = 0xFF;                                        //Failed
                            }
                        }
                        else
                        {
                            len = 0xFF;                                            //Failed
                        }
                    }
                    else if ( ( UsbSetupBuf->bRequestType & USB_REQ_RECIP_MASK ) == USB_REQ_RECIP_ENDP )// endpoint
                    {
                        switch( UsbSetupBuf->wIndexL )
                        {
                            case 0x84:
                                UEP4_CTRL = UEP4_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x04:
                                UEP4_CTRL = UEP4_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            case 0x83:
                                UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x03:
                                UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            case 0x82:
                                UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x02:
                                UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            case 0x81:
                                UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
                                break;
                            case 0x01:
                                UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
                                break;
                            default:
                                len = 0xFF;                                         // Unsupported endpoint
                                break;
                        }
                    }
                    else
                    {
                        len = 0xFF;                                                // Unsupported for non-endpoint
                    }
                    break;
                case USB_SET_FEATURE:                                          // Set Feature
                    if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )                  // Set  the device featuee.
                    {
                        if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
                        {
                            if( HIDCfgDesc[ 7 ] & 0x20 )
                            {
                                // suspend

                                //while ( XBUS_AUX & bUART0_TX );    //Wait till uart0 sending complete
                                //SAFE_MOD = 0x55;
                                //SAFE_MOD = 0xAA;
                                //WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO | bWAK_RXD1_LO;                      //wake up by USB or RXD0/1 signal
                                //PCON |= PD;                                                                 //sleep
                                //SAFE_MOD = 0x55;
                                //SAFE_MOD = 0xAA;
                                //WAKE_CTRL = 0x00;
                            }
                            else
                            {
                                len = 0xFF;                                        // Failed
                            }
                        }
                        else
                        {
                            len = 0xFF;                                            // Failed
                        }
                    }
                    else if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_ENDP )             //endpoint
                    {
                        if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x00 )
                        {
                            switch( ( ( uint16_t )UsbSetupBuf->wIndexH << 8 ) | UsbSetupBuf->wIndexL )
                            {
                                case 0x84:
                                    UEP4_CTRL = UEP4_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint4 IN STALL 
                                    break;
                                case 0x04:
                                    UEP4_CTRL = UEP4_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint4 OUT Stall 
                                    break;
                                case 0x83:
                                    UEP3_CTRL = UEP3_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint3 IN STALL 
                                    break;
                                case 0x03:
                                    UEP3_CTRL = UEP3_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint3 OUT Stall 
                                    break;
                                case 0x82:
                                    UEP2_CTRL = UEP2_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint2 IN STALL 
                                    break;
                                case 0x02:
                                    UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint2 OUT Stall 
                                    break;
                                case 0x81:
                                    UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint1 IN STALL 
                                    break;
                                case 0x01:
                                    UEP1_CTRL = UEP1_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint1 OUT Stall 
                                default:
                                    len = 0xFF;                                    // Failed
                                    break;
                            }
                        }
                        else
                        {
                            len = 0xFF;                                      // Failed
                        }
                    }
                    else
                    {
                        len = 0xFF;                                          // Failed
                    }
                    break;
                case USB_GET_STATUS:
                    EpABuffer[0] = 0x00;
                    EpABuffer[1] = 0x00;
                    if ( SetupLen >= 2 )
                    {
                        len = 2;
                    }
                    else
                    {
                        len = SetupLen;
                    }
                    break;
                default:
                    len = 0xff;                                                    // Failed
                    break;
            }
        }
    }
    else
    {
        len = 0xff;                                                         //Wrong packet length
    }
    if(len == 0xff)
    {
        SetupReq = 0xFF;
        UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;//STALL
    }
    else if(len <= DEFAULT_ENDP0_SIZE)                                                       // Tx data to host or send 0-length packet
    {
        UEP0_T_LEN = len;
        UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;//Expect DATA1, Answer ACK
    }
    else
    {
        UEP0_T_LEN = 0;  // Tx data to host or send 0-length packet
        UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;//Expect DATA1, Answer ACK
    }
}


void HID_USB_EP1_OUT(){
    if ( U_TOG_OK )                                                     // Discard unsynchronized packets
    {

    }
}


void HID_USB_EP1_IN(){
    UEP1_T_LEN = 0;
    UEP1_CTRL = UEP1_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;           // Default NAK
    UpPoint1_Busy = 0;                                                  //Clear busy flag
}


#pragma save
#pragma nooverlay
void HIDUSBInterrupt(void) {   //inline not really working in multiple files in SDCC
    if(UIF_TRANSFER) {
        // Dispatch to service functions
        uint8_t callIndex=USB_INT_ST & MASK_UIS_ENDP;
        switch (USB_INT_ST & MASK_UIS_TOKEN) {
            case UIS_TOKEN_OUT:
            {//SDCC will take IRAM if array of function pointer is used.
                switch (callIndex) {
                    case 0: USB_EP0_OUT(); break;
                    case 1: HID_USB_EP1_OUT(); break;
                    default: break;
                }
            }
                break;
            case UIS_TOKEN_IN:
            {//SDCC will take IRAM if array of function pointer is used.
                switch (callIndex) {
                    case 0: USB_EP0_IN(); break;
                    case 1: HID_USB_EP1_IN(); break;
                    default: break;
                }
            }
                break;
            case UIS_TOKEN_SETUP:
            {//SDCC will take IRAM if array of function pointer is used.
                switch (callIndex) {
                    case 0: HID_USB_EP0_SETUP(); break;
                    default: break;
                }
            }
                break;
        }
        
        UIF_TRANSFER = 0;                                                     // Clear interrupt flag
    }
    
    // Device mode USB bus reset
    if(UIF_BUS_RST) {
        UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
        UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;
        
        USB_DEV_AD = 0x00;
        UIF_SUSPEND = 0;
        UIF_TRANSFER = 0;
        UIF_BUS_RST = 0;                                                        // Clear interrupt flag
    }
    
    // USB bus suspend / wake up
    if (UIF_SUSPEND) {
        UIF_SUSPEND = 0;
        if ( USB_MIS_ST & bUMS_SUSPEND ) {                    // Suspend
            
            //while ( XBUS_AUX & bUART0_TX );                    // Wait for Tx
            //SAFE_MOD = 0x55;
            //SAFE_MOD = 0xAA;
            //WAKE_CTRL = bWAK_BY_USB | bWAK_RXD0_LO;    // Wake up by USB or RxD0
            //PCON |= PD;                                                            // Chip sleep
            //SAFE_MOD = 0x55;
            //SAFE_MOD = 0xAA;
            //WAKE_CTRL = 0x00;
            
        } else {    // Unexpected interrupt, not supposed to happen !
            USB_INT_FG = 0xFF;        // Clear interrupt flag
        }
    }
}
#pragma restore


void HIDUSBDeviceEndPointCfg(void)
{
    UEP1_DMA = (uint16_t) EpCBuffer;                                                      //Endpoint 1 data transfer address
    UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;        //Endpoint 2 automatically flips the sync flag, IN transaction returns NAK, OUT returns ACK
    UEP0_DMA = (uint16_t) EpABuffer;                                                      //Endpoint 0 data transfer address
    UEP4_1_MOD = 0XC0;                                                         //endpoint1 TX RX enable
    UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;                //Manual flip, OUT transaction returns ACK, IN transaction returns NAK
}
