#include "inputButton.h"

// Both analog pins, may use it in the future
#define BUTTON_A 11
#define BUTTON_B 32

#define HIGH_THRESHOLD 80
#define LOW_THRESHOLD 10

__xdata bool buttonAPressed = false;
__xdata bool buttonBPressed = false;
__xdata bool buttonCReleased = false;

void Button_setup() {

    p3Mode(2, INPUT);
    p1Mode(1, INPUT);
}

uint8_t Button_startupCheck() {
    bool buttonAstate = analogRead(BUTTON_A) > HIGH_THRESHOLD;
    bool buttonBstate = analogRead(BUTTON_B) > HIGH_THRESHOLD;

    if (buttonAstate && buttonBstate)
        return BUTTON_C_PRESSED;
    else if (buttonAstate) 
        return BUTTON_A_PRESSED;
    else if (buttonBstate)
        return BUTTON_B_PRESSED;
    
    return NO_BUTTON;
}

void Button_loop(ButtonEvent buttonEvent) {


    uint8_t buttonARead = analogRead(BUTTON_A);
    uint8_t buttonBRead = analogRead(BUTTON_B);


    if (buttonAPressed && buttonBPressed && ((buttonARead < LOW_THRESHOLD) || (buttonBRead < LOW_THRESHOLD))) {
        buttonEvent(BUTTON_C_RELEASED);
        buttonCReleased = true;
    } else {

        if (buttonAPressed && (buttonARead < LOW_THRESHOLD) && !buttonCReleased)
            buttonEvent(BUTTON_A_RELEASED);
        
        if (buttonBPressed && (buttonBRead < LOW_THRESHOLD) && !buttonCReleased)
            buttonEvent(BUTTON_B_RELEASED);
    }
    

    buttonAPressed = (buttonARead > HIGH_THRESHOLD);
    buttonBPressed = (buttonBRead > HIGH_THRESHOLD);
    
    
    if (buttonAPressed && buttonBPressed) {
        buttonEvent(BUTTON_C_PRESSED);
        buttonCReleased = false;
    } else {
        if (buttonAPressed)
            buttonEvent(BUTTON_A_PRESSED);
        
        if (buttonBPressed)
            buttonEvent(BUTTON_B_PRESSED);
    }


    if (!buttonAPressed && !buttonBPressed)
        buttonCReleased = false;
    
}



