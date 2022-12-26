
#include "USBDefinition.h"
#include "cdc/USBDefinition.c"
#include "hid/USBDefinition.c"


__code uint8_t *DeviceDesc = HID_DeviceDesc;
__code uint8_t *ConfigDesc = HID_ConfigDesc;
__code uint8_t *PinchMode = HID_PinchMode;

void USB_setCDCMode() {
    DeviceDesc = CDC_DeviceDesc;
    ConfigDesc = CDC_ConfigDesc;
    PinchMode = CDC_PinchMode;
}
