#include "device_driver.h"

void Main(void)
{
	volatile int i;

	Uart_Init(115200);
	Uart_Printf("CMSIS Based Register Define\n");

	RCC->APB2ENR |= (1<<3);

	GPIOB->CRH = 0x66 << 0;

	for(;;)
	{
		GPIOB->ODR = 0x0 << 8;
		for(i=0; i<0x40000; i++);
		GPIOB->ODR = 0x3 << 8;
		for(i=0; i<0x40000; i++);
	}
}
