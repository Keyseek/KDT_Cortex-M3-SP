#include "device_driver.h"

#if 1

void Main(void)
{
	volatile int i;

	Uart1_Printf("Nested IRQ Test\n");

	/* Set Priority: 0: Highest, 15: Lowest */
	NVIC_SetPriorityGrouping(3);	        // Binary Point = 4 (Group = 16)
	NVIC_SetPriority((IRQn_Type)30, 1); 	// TIM4
	NVIC_SetPriority((IRQn_Type)23, 2); 	// EXTI9_5
	NVIC_SetPriority((IRQn_Type)37, 3); 	// USART1

	Key_ISR_Enable(1);
	Uart1_RX_Interrupt_Enable(1);
	TIM4_Repeat_Interrupt_Enable(1, 100);

	for(;;)
	{
		Uart1_Printf(".");
		for(i=0; i<0x100000; i++);
	}
}

#endif

#if 0

void Main(void)
{
	volatile int i;

	Uart1_Printf("Binary Point Test\n");

	NVIC_SetPriorityGrouping(5);	               	// Group = 2bit, Sub = 2bit
	Uart1_Printf("AIRCR=0x%.8X\n", SCB->AIRCR);
	NVIC_SetPriority((IRQn_Type)30, (1<<2)|(3<<0)); // TIM4 = 1.3
	Uart1_Printf("PRI[30]=0x%.8X\n", NVIC->IP[30]);
	NVIC_SetPriority((IRQn_Type)23, (2<<2)|(0<<0)); // EXTI9_5 = 2.0
	Uart1_Printf("PRI[23]=0x%.8X\n", NVIC->IP[23]);
	NVIC_SetPriority((IRQn_Type)37, (2<<2)|(1<<0)); // USART1 = 2.1
	Uart1_Printf("PRI[37]=0x%.8X\n", NVIC->IP[37]);

	Key_ISR_Enable(1);
	Uart1_RX_Interrupt_Enable(1);
	TIM4_Repeat_Interrupt_Enable(1, 100);

	for(;;)
	{
		Uart1_Printf(".");
		for(i=0; i<0x100000; i++);
	}
}

#endif
