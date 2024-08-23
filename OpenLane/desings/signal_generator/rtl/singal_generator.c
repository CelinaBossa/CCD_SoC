#include <firmware_apis.h>

//wishbone adresses for signals, enable and selector
#define reg_wb_enable (*(volatile uint32_t*)0x30000000)
#define reg_wb_selector (*(volatile uint32_t*)0x30000004)
#define reg_wb_phiP (*(volatile uint32_t*)0x30000008)
#define reg_wb_phiL1 (*(volatile uint32_t*)0x30000012)
#define reg_wb_phiL2 (*(volatile uint32_t*)0x30000016)
#define reg_wb_phiR (*(volatile uint32_t*)0x30000020)

void delay(const int d)
{
    /* Configure timer for a single-shot countdown */
    reg_timer0_config = 0;
    reg_timer0_data = d;
    reg_timer0_config = 1;

    // Loop, waiting for value to reach zero
    reg_timer0_update = 1;
    while (reg_timer0_value > 0) 
    {
        reg_timer0_update = 1;
    }
}

void main()
{
    // disable housekeeping spi
    enableHkSpi(0);

    //enable on a, f_select on b:c and clk on d
    GPIOs_configure(25,GPIO_MODE_USER_STD_INPUT_PULLDOWN) //signal_selector
    GPIOs_configure(33,GPIO_MODE_USER_STD_INPUT_PULLDOWN) //enable
    for(pin=34; pin<38; pin++); //f_select
        GPIOs_configure(pin,GPIO_MODE_USER_STD_INPUT_PULLDOWN)
    
    for(pin=26; pin<33; pin++);
        GPIOs_configure(pin,GPIO_MODE_USER_STD_OUT_MONITORED);

    // load the configuration 
    GPIOs_loadConfigs(); 

    // turn on wishbone interface
    User_enableIF();
}

while(1)
{
    uint32_t enable = reg_wb_enable;
    if enable;{
        uint32_t f_select = reg_wb_selector;
        value = 0b1011;
        GPIOs_writeLow(value << e);
            delay()
            value = value ^ (0b1000);
        for(i=0,i<2052,i++);{
            value = value ^ (0b0111);
            GPIOs_writeLow(value << e);
            delay();
            value = value ^ (0b0111);
            GPIOs_writeLow(value << e);
            delay();
            value = value ^ (0b0001);
            GPIOs_writeLow(value << e);
            delay();
        }


    }
    return;
}
