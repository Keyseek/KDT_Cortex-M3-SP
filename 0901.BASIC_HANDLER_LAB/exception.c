#include "device_driver.h"

void Invalid_ISR(void)
{
	/* 코드 설계 */

	Uart1_Printf("Invalid_Exception: %d!\n",      );
	Uart1_Printf("Invalid_ISR: %d!\n",            );

	for(;;);
}

void MemManage_Handler(void)
{
	Uart1_Printf("Memory Management Fault\n");

	/* 코드 설계 */


	for(;;);
}

void BusFault_Handler(void)
{
	Uart1_Printf("Bus Fault\n");

	/* 코드 설계 */


	for(;;);
}

void UsageFault_Handler(void)
{
	Uart1_Printf("Usage Fault\n");

	/* 코드 설계 */


	for(;;);
}

void HardFault_Handler(void)
{
	Uart1_Printf("Hard Fault\n");

	/* 코드 설계 */


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
