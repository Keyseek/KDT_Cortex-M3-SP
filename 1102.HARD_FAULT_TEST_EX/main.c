#include "device_driver.h"

void Main(void)
{
	Uart1_Printf("Hard Fault Test\n");

	/* crt0.s에서 SHP 레지스터 설정을 가능하도록 하기 위하여 Thread를 특권 모드로 설정하였음 */

	/* [1] Preemption Test */
	/* Usage Fault 핸들러에서 Bus Fault 발생 */

#if 1
	extern void usage_fualt(void);
	SCB->SHP[5-4] = 1u<<4; 	// Bus
	SCB->SHP[6-4] = 2u<<4; 	// Usage
#endif

	/* [2] Escalation Test */
	/* Usage Fault 핸들러에서 Bus Fault 발생 */

#if 0
	extern void usage_fualt(void);
	SCB->SHP[5-4] = 1u<<4; 	// Bus
	SCB->SHP[6-4] = 1u<<4; 	// Usage
#endif

	((void (*)(void))0x20000000)();

	Uart1_Printf("Returned!\n");
}
