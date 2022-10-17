#include "inputButton.h"

#define BUTTON_A 11
#define BUTTON_B 32

bool buttonAPressed = false;
bool buttonBPressed = false;

void Button_setup() {

    p3Mode(2, INPUT);
    p1Mode(1, INPUT);
}

bool Button_A_press() 
{   
    buttonAPressed = true;
    return (analogRead(BUTTON_A) > 80);
}

bool Button_A_release()
{
    if (buttonAPressed && (analogRead(BUTTON_A) < 10)) 
    {
        buttonAPressed = false;
        return true;
    }
    return false;
}

bool Button_B_press()
{
    buttonBPressed = true;
    return (analogRead(BUTTON_B) > 80);
}
bool Button_B_release()
{
    if (buttonBPressed && (analogRead(BUTTON_B) < 10)) 
    {
        buttonBPressed = false;
        return true;
    }
    return false;
}

bool Button_C_press()
{
    return Button_A_press() && Button_B_press();
}

bool Button_C_release()
{
    return Button_A_release() && Button_B_release();
}

