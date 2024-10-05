#include "device_driver.h"

#if 1

/* Hard Fault �߻� */

void Main(void)
{
	Uart1_Printf("Fault Handler 1\n");

	asm("BKPT #0");

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* MMF Fault �߻� */

void Main(void)
{
	Uart1_Printf("Fault Handler 2\n");

	((void (*)(void))0xE0000001)();

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* BUS Fault �߻� */

void Main(void)
{
	Uart1_Printf("Fault Handler 3\n");

	volatile int a;
	a = *(volatile int *)0x20005004;

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* Usage Fault �߻� */

void Main(void)
{
	Uart1_Printf("Fault Handler 4\n");

	((void (*)(void))0x20000000)();

	Uart1_Printf("Returned!\n");
}

#endif
