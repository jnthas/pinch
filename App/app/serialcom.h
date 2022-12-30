#ifndef PINCH_SERIALCOM_H
#define PINCH_SERIALCOM_H

#include <stdint.h>
#include <string.h>
#include "ch552.h"
#include "../core/Print.h"
#include "../core/cdc/USBCDC.h"
#include "database.h"
#include "protocol.h"


void SerialCom_setup();
void SerialCom_loop();
void SerialCom_handler(__xdata uint8_t payload);

void SerialCom_cdcBufferSink(uint8_t buffer_size);



#endif