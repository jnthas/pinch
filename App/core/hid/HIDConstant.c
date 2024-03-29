#include "HIDConstant.h"


//Device descriptor
__code uint8_t HIDDevDesc[] = {
    0x12,0x01,
    0x10,0x01,  //USB spec release number in BCD format, USB1.1 (0x10, 0x01).
    0x00,0x00,0x00, //bDeviceClass, bDeviceSubClass, bDeviceProtocol 
    DEFAULT_ENDP0_SIZE, //bNumConfigurations
    0x09,0x12,0x5D,0xC5, // VID PID 
    0x00,0x01,  //version
    0x01,0x02,0x03, //bString
    0x01    //bNumConfigurations
};

__code uint16_t HIDDevDescLen = sizeof(HIDDevDesc);

__code uint8_t HIDCfgDesc[] ={
    0x09,0x02,sizeof(HIDCfgDesc) & 0xff,sizeof(HIDCfgDesc) >> 8,
    0x01,0x01,0x00,0x80,0x64,             //Configuration descriptor (1 interface)
    // Interface 1 (HID) descriptor
    0x09,0x04,0x00,0x00,0x02,0x03,0x01,0x01,0x00,    // HID Keyboard, 2 endpoints
    0x09,0x21,0x10,0x01,0x21,0x01,0x22,sizeof(ReportDesc) & 0xff,sizeof(ReportDesc) >> 8,    //HID Descriptor
    0x07,0x05,0x01,0x03,0x08,0x00,0x0A,                       //endpoint descriptor
    0x07,0x05,0x81,0x03,0x08,0x00,0x0A,                       //endpoint descriptor
};

__code uint16_t HIDCfgDescLen = sizeof(HIDCfgDesc);

__code uint16_t ReportDescLen = sizeof(ReportDesc);

__code uint8_t ReportDesc[] ={
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x06,                    // USAGE (Keyboard)
    0xa1, 0x01,                    // COLLECTION (Application)
    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0xe0,                    //   USAGE_MINIMUM (Keyboard LeftControl)
    0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
    0x95, 0x08,                    //   REPORT_COUNT (8)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x81, 0x02,                    //   INPUT (Data,Var,Abs)
    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x81, 0x03,                    //   INPUT (Cnst,Var,Abs)
    0x95, 0x06,                    //   REPORT_COUNT (6)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0xff,                    //   LOGICAL_MAXIMUM (255)
    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated))
    0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI)
    0x81, 0x00,                    //   INPUT (Data,Ary,Abs)
    0x05, 0x08,                    //   USAGE_PAGE (LEDs)
    0x19, 0x01,                    //   USAGE_MINIMUM (Num Lock)
    0x29, 0x05,                    //   USAGE_MAXIMUM (Kana)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
    0x95, 0x05,                    //   REPORT_COUNT (5)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x91, 0x02,                    //   OUTPUT (Data,Var,Abs)
    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x03,                    //   REPORT_SIZE (3)
    0x91, 0x03,                    //   OUTPUT (Cnst,Var,Abs)
    0xc0                           // END_COLLECTION
};
