#ifndef GPIOs_h
#define GPIOs_h

#include <stdint.h>
#include "ch552.h"
#include "debug.h"


#define HIGH 0x1
#define LOW  0x0


#define INPUT 0x0
#define OUTPUT 0x1
#define INPUT_PULLUP 0x2
#define	OUTPUT_OD 0x03

// CH552 PWMs
// 1.5 = PIN_PWM1
// 3.0 = PIN_PWM1_
// 3.1 = PIN_PWM2_
// 3.4 = PIN_PWM2
enum {
    NOT_ON_PWM = 0,
    PIN_PWM1,
    PIN_PWM2,
    PIN_PWM1_,
    PIN_PWM2_,
    NUM_PWM_PINS
};


void p1Mode(uint8_t portBit, __xdata uint8_t mode);
void p3Mode(uint8_t portBit, __xdata uint8_t mode);
static void turnOffPWM(uint8_t pwm);
uint8_t isPinPWM(uint8_t port, uint8_t bit);
uint8_t digitalRead(uint8_t pin);
void digitalWrite(uint8_t pin, __xdata uint8_t val);
void analogWrite(uint8_t pin, __xdata uint16_t val);
uint8_t analogRead(uint8_t pin);

#endif