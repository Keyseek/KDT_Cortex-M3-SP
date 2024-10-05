#include "device_driver.h"

extern volatile int Key_Value;
extern volatile int Uart1_Rx_In;
extern volatile int Uart1_Rx_Data;

void Main(void)
{
	Uart1_Printf("KEY & UART1-RX IRQ Test\n");

	Key_ISR_Enable(1);
	Uart1_RX_Interrupt_Enable(1);

	for(;;)
	{
		if(Uart1_Rx_In)
		{
			Uart1_Printf("RX Data=%c\n", Uart1_Rx_Data);
			Uart1_Rx_In = 0;
		}

		if(Key_Value)
		{
			Uart1_Printf("KEY=%d\n", Key_Value);
			Key_Value = 0;
		}

		LED_Display(1);
		TIM2_Delay(100);
		LED_Display(2);
		TIM2_Delay(100);
	}
}
