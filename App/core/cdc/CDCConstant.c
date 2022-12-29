#include "CDCConstant.h"


//Device descriptor
__code uint8_t CDCDevDesc[] = {
    0x12,0x01,
    0x10,0x01,  //USB spec release number in BCD format, USB1.1 (0x10, 0x01).
    0xEF,0x02,0x01, //bDeviceClass, bDeviceSubClass, bDeviceProtocol 
    DEFAULT_ENDP0_SIZE, //bNumConfigurations
    0x09,0x12,0x50,0xC5, // VID PID 
    0x01,0x01,  //version
    0x01,0x02,0x03, //bString
    0x01    //bNumConfigurations
};

__code uint16_t CDCDevDescLen = sizeof(CDCDevDesc);

__code uint8_t CDCCfgDesc[] ={
    0x09,0x02,sizeof(CDCCfgDesc) & 0xff,sizeof(CDCCfgDesc) >> 8,
    0x02,0x01,0x00,0x80,0x64,             //Configuration descriptor (2 interfaces)
    // Interface Association Descriptor, IAD, this packes following 2 interfaces into 1
    0x08,0x0B,0x00,0x02,0x02,0x02,0x01,0x04,
    // Interface 1 (CDC) descriptor
    0x09,0x04,0x00,0x00,0x01,0x02,0x02,0x01,0x04,    // CDC control description, 1 endpoint
    // Functional Descriptor refer to usbcdc11.pdf
    0x05,0x24,0x00,0x10,0x01,                                 //Header Functional Descriptor
    0x05,0x24,0x01,0x00,0x00,                                 //Call Management Functional Descriptor
    0x04,0x24,0x02,0x02,                                      //Direct Line Management Functional Descriptor, Support: Set_Line_Coding, Set_Control_Line_State, Get_Line_Coding, Serial_State 
    0x05,0x24,0x06,0x00,0x01,                                 //Union Functional Descriptor, Communication class interface 0, Data Class Interface 1
    0x07,0x05,0x81,0x03,0x08,0x00,0x40,                       //EndPoint descriptor (CDC Upload, Interrupt)
    // Interface 2 (Data Interface) descriptor
    0x09,0x04,0x01,0x00,0x02,0x0a,0x00,0x00,0x04,             //Data Class Interface descriptor
    0x07,0x05,0x02,0x02,0x40,0x00,0x00,                       //endpoint descriptor
    0x07,0x05,0x82,0x02,0x40,0x00,0x00,                       //endpoint descriptor

};

__code uint16_t CDCCfgDescLen = sizeof(CDCCfgDesc);


__code uint8_t CDC_Des[]={                            
    0x16,0x03,
    'C',0x00,'D',0x00,'C',0x00,' ',0x00,'S',0x00,'e',0x00,
    'r',0x00,'i',0x00,'a',0x00,'l',0x00
};
__code uint16_t CDC_DesLen = sizeof(CDC_Des);
