#include "GPIO.h"

void p1Mode(__xdata uint8_t portBit, __xdata uint8_t mode)
{

  if (mode == INPUT)
  {
    P1_MOD_OC &= ~(1 << portBit);
    P1_DIR_PU &= ~(1 << portBit);
  }
  else if (mode == INPUT_PULLUP)
  {
    P1_MOD_OC |= (1 << portBit);
    P1_DIR_PU |= (1 << portBit);
  }
  else if (mode == OUTPUT)
  {
    P1_MOD_OC &= ~(1 << portBit);
    P1_DIR_PU |= (1 << portBit);
  }
  else if (mode == OUTPUT_OD)
  {
    P1_MOD_OC |= (1 << portBit);
    P1_DIR_PU &= ~(1 << portBit);
  }
}

void p3Mode(__xdata uint8_t portBit, __xdata uint8_t mode)
{
  if (mode == INPUT)
  {

    P3_MOD_OC &= ~(1 << portBit);
    P3_DIR_PU &= ~(1 << portBit);
  }
  else if (mode == INPUT_PULLUP)
  {

    P3_MOD_OC |= (1 << portBit);
    P3_DIR_PU |= (1 << portBit);
  }
  else if (mode == OUTPUT)
  {

    P3_MOD_OC &= ~(1 << portBit);
    P3_DIR_PU |= (1 << portBit);
  }
  else if (mode == OUTPUT_OD)
  {

    P3_MOD_OC |= (1 << portBit);
    P3_DIR_PU &= ~(1 << portBit);
  }
}

static void turnOffPWM(__xdata uint8_t pwm)
{
  switch (pwm)
  {
  case PIN_PWM1:
    if ((PIN_FUNC & bPWM1_PIN_X) == 0)
    {
      PWM_CTRL &= ~bPWM1_OUT_EN;
    }
    break;
  case PIN_PWM2:
    if ((PIN_FUNC & bPWM2_PIN_X) == 0)
    {
      PWM_CTRL &= ~bPWM2_OUT_EN;
    }
    break;
  case PIN_PWM1_:
    if ((PIN_FUNC & bPWM1_PIN_X) != 0)
    {
      PWM_CTRL &= ~bPWM1_OUT_EN;
    }
    break;
  case PIN_PWM2_:
    if ((PIN_FUNC & bPWM2_PIN_X) != 0)
    {
      PWM_CTRL &= ~bPWM2_OUT_EN;
    }
    break;
  }
}

uint8_t isPinPWM(__xdata uint8_t port, __xdata uint8_t portBit)
{

  if (port == 1 && portBit == 5)
  {
    return PIN_PWM1;
  }
  else if (port == 3)
  {
    if (portBit == 0)
      return PIN_PWM1_;
    else if (portBit == 1)
      return PIN_PWM2_;
    else if (portBit == 4)
      return PIN_PWM2;
  }

  return NOT_ON_PWM;
}

uint8_t digitalRead(__xdata uint8_t pin)
{
  uint8_t portNumber = (pin - (pin % 10)) / 10;
  uint8_t portBit = (pin % 10);
  uint8_t pwm = isPinPWM(portNumber, portBit);

  // If the pin that support PWM output, we need to turn it off
  // before getting a digital reading.
  if (pwm != NOT_ON_PWM)
    turnOffPWM(pwm);

  uint8_t portBuf = 0;

  switch (portNumber)
  {
  case 1:
    portBuf = P1;
    break;
  case 2:
    portBuf = P2;
    break;
  case 3:
    portBuf = P3;
    break;
  default:
    break;
  }

  if (portBuf & portBit)
    return HIGH;
  return LOW;
}

void digitalWrite(__xdata uint8_t pin, __xdata uint8_t val)
{
  uint8_t portNumber = (pin - (pin % 10)) / 10;
  uint8_t portBit = (pin % 10);
  uint8_t pwm = isPinPWM(portNumber, portBit);

  // If the pin that support PWM output, we need to turn it off
  // before doing a digital write.
  if (pwm != NOT_ON_PWM)
    turnOffPWM(pwm);

  // C pointers cannot be used to access the 8051's SFRs (special function registers).

  uint8_t interruptOn = EA;
  EA = 0;

  switch (portNumber)
  {
  case 1:
    if (val == LOW)
    {
      P1 &= ~(1 << portBit);
    }
    else
    {
      P1 |= (1 << portBit);
    }
    break;
  case 2:
    if (val == LOW)
    {
      P2 &= ~(1 << portBit);
    }
    else
    {
      P2 |= (1 << portBit);
    }
    break;
  case 3:
    if (val == LOW)
    {
      P3 &= ~(1 << portBit);
    }
    else
    {
      P3 |= (1 << portBit);
    }
    break;

  default:
    break;
  }

  if (interruptOn)
    EA = 1;
}

uint8_t analogRead(__xdata uint8_t pin)
{
  // ADC pins
  // AIN0 (P1.1)
  // AIN1 (P1.4)
  // AIN2 (P1.5)
  // AIN3 (P3.2)

  uint8_t pinNum;

  if (pin == 11)
    pinNum = 0;
  else if (pin == 14)
    pinNum = 1;
  else if (pin == 15)
    pinNum = 2;
  else if (pin == 32)
    pinNum = 3;
  else
    return 0;

  ADC_CFG = bADC_EN | bADC_CLK;

  ADC_CTRL = (ADC_CTRL & ~(0x03)) | (0x03 & pinNum);

  ADC_START = 1;

  while (ADC_START)
    ;

  return ADC_DATA;
}

// Right now, PWM output only works on the pins with
// hardware support.  These are defined in the appropriate
// pins_*.c file.  For the rest of the pins, we default
// to digital output.
void analogWrite(__xdata uint8_t pin, __xdata uint16_t val)
{
  // We need to make sure the PWM output is enabled for those pins
  // that support it, as we turn it off when digitally reading or
  // writing with them.  Also, make sure the pin is in output mode
  // for consistenty with Wiring, which doesn't require a pinMode
  // call for the analog output pins.

  uint8_t portNumber = (pin - (pin % 10)) / 10;
  uint8_t portBit = (pin % 10);

  // p3Mode(1, OUTPUT);
  if (val == 0)
  {
    digitalWrite(pin, LOW);
  }
  else if (val >= 256)
  {
    digitalWrite(pin, HIGH);
  }
  else
  {
    switch (isPinPWM(portNumber, portBit))
    {
    case PIN_PWM1:
      PIN_FUNC &= ~(bPWM1_PIN_X);
      PWM_CTRL |= bPWM1_OUT_EN;
      PWM_DATA1 = val;
      break;
    case PIN_PWM2:
      PIN_FUNC &= ~(bPWM2_PIN_X);
      PWM_CTRL |= bPWM2_OUT_EN;
      PWM_DATA2 = val;
      break;
    case PIN_PWM1_:
      PIN_FUNC |= (bPWM1_PIN_X);
      PWM_CTRL |= bPWM1_OUT_EN;
      PWM_DATA1 = val;
      break;
    case PIN_PWM2_:
      PIN_FUNC |= (bPWM2_PIN_X);
      PWM_CTRL |= bPWM2_OUT_EN;
      PWM_DATA2 = val;
      break;
    case NOT_ON_PWM:
    default:
      if (val < 128)
      {
        digitalWrite(pin, LOW);
      }
      else
      {
        digitalWrite(pin, HIGH);
      }
    }
  }
}
