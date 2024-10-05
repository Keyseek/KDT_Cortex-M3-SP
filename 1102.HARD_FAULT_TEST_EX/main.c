#include "device_driver.h"

void Main(void)
{
	Uart1_Printf("Hard Fault Test\n");

	/* crt0.s���� SHP �������� ������ �����ϵ��� �ϱ� ���Ͽ� Thread�� Ư�� ���� �����Ͽ��� */

	/* [1] Preemption Test */
	/* Usage Fault �ڵ鷯���� Bus Fault �߻� */

#if 1
	extern void usage_fualt(void);
	SCB->SHP[5-4] = 1u<<4; 	// Bus
	SCB->SHP[6-4] = 2u<<4; 	// Usage
#endif

	/* [2] Escalation Test */
	/* Usage Fault �ڵ鷯���� Bus Fault �߻� */

#if 0
	extern void usage_fualt(void);
	SCB->SHP[5-4] = 1u<<4; 	// Bus
	SCB->SHP[6-4] = 1u<<4; 	// Usage
#endif

	((void (*)(void))0x20000000)();

	Uart1_Printf("Returned!\n");
}
