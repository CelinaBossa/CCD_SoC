#include <firmware_apis.h>

// Copyright Matt Venn 2023

// Wishbone addresses for LEDs and buttons
#define reg_wb_enable      (*(volatile uint32_t*)0x30000000)
#define reg_wb_frequency   (*(volatile uint32_t*)0x30000004)
#define reg_wb_phiP        (*(volatile uint32_t*)0x30000008)
#define reg_wb_phiL1       (*(volatile uint32_t*)0x30000012)
#define reg_wb_phiL2       (*(volatile uint32_t*)0x30000016)
#define reg_wb_phiR        (*(volatile uint32_t*)0x30000020)

void main()
{
    int pin;
    // Buttons on pins 15:08
    for(pin = 8; pin < 13; pin++) {
       GPIOs_configure(pin, GPIO_MODE_USER_STD_INPUT_PULLDOWN);
    }

    // LEDs on pins 23:16
    for(pin = 13; pin < 17; pin++) {
       GPIOs_configure(pin, GPIO_MODE_USER_STD_OUT_MONITORED);
    }

    // Load the configuration 
    GPIOs_loadConfigs(); 

    // Turn on Wishbone interface
    User_enableIF();


    while(1)
    {
        uint32_t enable = reg_wb_enable; 
        uint32_t frequency = reg_wb_frequency;  // Corregido el nombre de la variable

        if (enable) {  // Corrección: se requieren paréntesis en la condición
            reg_wb_phiP = (frequency >> 3) & 1;  // Corrección: falta el punto y coma
            reg_wb_phiL1 = (frequency >> 2) & 1;  // Corrección: falta el punto y coma
            reg_wb_phiL2 = (frequency >> 1) & 1;  // Corrección: falta el punto y coma
            reg_wb_phiR = (frequency) & 1;  // Corrección: falta el punto y coma
        }
    }

    return;
}
