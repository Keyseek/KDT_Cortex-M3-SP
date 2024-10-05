#include "device_driver.h"

#if 1

/* MMF Fault 발생 */

void Main(void)
{
	Uart1_Printf("Fault Handler 2\n");

	((void (*)(void))0xE0000001)();

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* BUS Fault 발생 */

void Main(void)
{
	Uart1_Printf("Fault Handler 3\n");

	volatile int a;
	a = *(volatile int *)0x20005004;

	Uart1_Printf("Returned!\n");
}

#endif

#if 0

/* Usage Fault 발생 */

void Main(void)
{
	Uart1_Printf("Fault Handler 4\n");

	((void (*)(void))0x20000000)();

	Uart1_Printf("Returned!\n");
}

#endif
