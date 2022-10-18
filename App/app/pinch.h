#ifndef APP_PINCH_H
#define APP_PINCH_H

#include "../components/inputButton.h"
#include "../components/sevenSegmentDisplay.h"



struct ProtocolStructure
{
  uint8_t control_flag;
  uint8_t operation;
  uint8_t param;
  uint8_t payload_size;
};


enum ProtocolState {
  
  begin_of_transmission,
  operation,
  parameter,
  payload,
  end_of_transmission,
  payload_error
    
} current_state;


void Pinch_setup();
void Pinch_loop();

uint32_t Pinch_getMemAddress(uint8_t slot, uint8_t sector_num, uint8_t page_num);
void Pinch_store(uint8_t payload);
void Pinch_load(uint8_t payload);
void Pinch_handler(uint8_t payload);


#endif