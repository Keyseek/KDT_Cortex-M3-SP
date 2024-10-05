#include "device_driver.h"

void Invalid_ISR(void)
{
	/* �ڵ� ���� */

	Uart1_Printf("Invalid_Exception: %d!\n",      );
	Uart1_Printf("Invalid_ISR: %d!\n",            );

	for(;;);
}

void MemManage_Handler(void)
{
	Uart1_Printf("Memory Management Fault\n");

	/* �ڵ� ���� */


	for(;;);
}

void BusFault_Handler(void)
{
	Uart1_Printf("Bus Fault\n");

	/* �ڵ� ���� */


	for(;;);
}

void UsageFault_Handler(void)
{
	Uart1_Printf("Usage Fault\n");

	/* �ڵ� ���� */


	for(;;);
}

void HardFault_Handler(void)
{
	Uart1_Printf("Hard Fault\n");

	/* �ڵ� ���� */


	for(;;);
}

void NMI_Handler(void)
{
	Invalid_ISR();
}

void PendSV_Handler(void)
{
	Invalid_ISR();
}

void SysTick_Handler(void)
{
	Invalid_ISR();
}

void SVC_Handler(void)
{
	Invalid_ISR();
}
