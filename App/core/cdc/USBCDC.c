#include "USBCDC.h"

#define LINE_CODEING_SIZE 7
__xdata uint8_t LineCoding[LINE_CODEING_SIZE]={0x00,0xe1,0x00,0x00,0x00,0x00,0x08};   //Initialize for baudrate 57600, 1 stopbit, No parity, eight data bits

volatile __xdata uint8_t controlLineState = 0;

__xdata uint8_t usbWritePointer = 0;

typedef void( *pTaskFn)( void );

void mDelayuS(uint16_t us);

void USBSerial_setup(){
    USBHandler_asCDC();
    USBDeviceCfg();                                                       //Device mode configuration
    USBHandler_usbDeviceEndpointCfg();                                               //Endpoint configuration   
    USBDeviceIntCfg();                                                    //Interrupt configuration    
    UEP0_T_LEN = 0;
    UEP1_T_LEN = 0;                                                       //Pre-use send length must be cleared	  
    UEP2_T_LEN = 0;                                                          
}

void resetCDCParameters(){

    USBByteCountEP2 = 0;       //Bytes of received data on USB endpoint
    UpPoint2_Busy = 0;
}

void setLineCodingHandler(){
    for (uint8_t i=0;i<((LINE_CODEING_SIZE<=USB_RX_LEN)?LINE_CODEING_SIZE:USB_RX_LEN);i++){
        LineCoding[i] = EpABuffer[i];
    }
    
    //!!!!!Config_Uart0(LineCoding);
}

uint16_t getLineCodingHandler(){
    uint16_t returnLen;

    returnLen = LINE_CODEING_SIZE;
    for (uint8_t i=0;i<returnLen;i++){
        EpABuffer[i] = LineCoding[i];
    }

    return returnLen;
}

void setControlLineStateHandler(){
    controlLineState = EpABuffer[2];

    // We check DTR state to determine if host port is open (bit 0 of lineState).
    if ( ((controlLineState & 0x01) == 0) && (*((__xdata uint32_t *)LineCoding) == 1200) ){ //both linecoding and sdcc are little-endian
        pTaskFn tasksArr[1];
        USB_CTRL = 0;
        EA = 0;                                                                    //Disabling all interrupts is required.
        TMOD = 0;
        tasksArr[0] = (pTaskFn)0x3800;
        mDelayuS(50000);
        mDelayuS(50000);
        (tasksArr[0])( );                                                          //Jump to bootloader code
        //while(1);
    }
    
}

bool USBSerial(){
    bool result = false;
	if (controlLineState > 0) 
		result = true;
	//delay(10); not doing it for now
	return result;
}


void USBSerial_flush(void){
    if (!UpPoint2_Busy && usbWritePointer>0){
        UEP2_T_LEN = usbWritePointer;                                                   
        UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_ACK;            //Respond ACK
        UpPoint2_Busy = 1;
        usbWritePointer = 0;
    }
}

uint8_t USBSerial_write(char c){  //3 bytes generic pointer
    uint16_t waitWriteCount;
    if (controlLineState > 0) {
        while (true){
            waitWriteCount = 0;
            while (UpPoint2_Busy){//wait for 250ms or give up, on my mac it takes about 256us
                waitWriteCount++;
                mDelayuS(5);
                if (waitWriteCount>=50000) return 0;
            }
            if (usbWritePointer<MAX_PACKET_SIZE){
                EpCBuffer[MAX_PACKET_SIZE+usbWritePointer] = c;
                usbWritePointer++;
                return 1;
            }else{
                USBSerial_flush();  //go back to first while
            }
        }
    }
    return 0;
}

uint8_t USBSerial_print_n(uint8_t * __xdata buf, __xdata int len){  //3 bytes generic pointer, not using USBSerial_write for a bit efficiency
    uint16_t waitWriteCount;
    if (controlLineState > 0) {
        while (len>0){
            waitWriteCount = 0;
            while (UpPoint2_Busy){//wait for 250ms or give up, on my mac it takes about 256us
                waitWriteCount++;
                mDelayuS(5);   
                if (waitWriteCount>=50000) return 0;
            }
            while (len>0){
                if (usbWritePointer<MAX_PACKET_SIZE){
                    EpCBuffer[MAX_PACKET_SIZE+usbWritePointer] = *buf++;
                    usbWritePointer++;
                    len--;
                }else{
                    USBSerial_flush();  //go back to first while
                    break;
                }
            }
        }
    }
    return 0;
}

uint8_t USBSerial_available(){
    return USBByteCountEP2;
}

char USBSerial_read(){
    if(USBByteCountEP2==0) return 0;
    char data = EpCBuffer[USBBufOutPointEP2];
    USBBufOutPointEP2++;
    USBByteCountEP2--;
    if(USBByteCountEP2==0) {
        UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_ACK;
    }
    return data;
}


