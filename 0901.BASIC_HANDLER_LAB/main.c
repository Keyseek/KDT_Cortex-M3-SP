#include "device_driver.h"

#if 1

/* SVCall 惯积 */

void Main(void)
{
	Uart1_Printf("Exception Handler 1\n");

	asm("SVC #0");

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* Hard Fault 惯积 */

void Main(void)
{
	Uart1_Printf("Exception Handler 2\n");

	asm("BKPT #0");

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* MMF Fault 惯积 */

void Main(void)
{
	Uart1_Printf("Exception Handler 3\n");

	((void (*)(void))0xE0000001)();

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* BUS Fault 惯积 */

void Main(void)
{
	Uart1_Printf("Exception Handler 4\n");

	volatile int a;
	a = *(volatile int *)0x20005004;

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* Usage Fault 惯积 */

void Main(void)
{
	Uart1_Printf("Exception Handler 5\n");

	((void (*)(void))0x20000000)();

	Uart1_Printf("Returned!\n");
}

#endif
