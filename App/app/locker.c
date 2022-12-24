#include "locker.h"

__xdata bool locked = true;
__xdata uint8_t lock_pin[3] = {0}; // TODO: it just needs 4 bits for each position 
__xdata uint8_t lock_pos = 0;


void Locker_setup() {   
    Display_setLed(locked);
}

bool Locker_loop(__xdata unsigned long currentMillis) {

    if (currentMillis % 100 == 0) {
        Display_fill('-');
        Button_loop(&Locker_handleInputButton);
    }

    return !locked;
}

void Locker_handleInputButton(ButtonState event) {


    if (event == BUTTON_A_RELEASED) {
        lock_pin[lock_pos]++;
        if (lock_pin[lock_pos] > 9) lock_pin[lock_pos] = 0;
    
    } else if (event == BUTTON_B_RELEASED) {
        if (lock_pin[lock_pos] == 0) lock_pin[lock_pos] = 10;
        lock_pin[lock_pos]--;
    
    } else if (event == BUTTON_C_RELEASED) {
        lock_pos++;

        if (lock_pos > 2) {
            if ((lock_pin[0] == 5 && lock_pin[1] == 5 && lock_pin[2] == 2)) {
                locked = false;
                Display_setLed(locked);
            } else {
                lock_pos = 0;
                lock_pin[0] = lock_pos;
                lock_pin[1] = lock_pos;
                lock_pin[2] = lock_pos;
                Locker_setup();
            }
        }

    }

    Display_setDigit(lock_pin[lock_pos]+48, lock_pos);

}