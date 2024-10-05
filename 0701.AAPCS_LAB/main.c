#include "device_driver.h"

#if 1

extern void Asm_Led_On(void);
extern void Asm_Led_Off(void);

void Main(void)
{
	volatile  int i;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 1\n");

	for(;;)
	{
		Asm_Led_On();
		for(i=0; i<0x100000; i++);
		Asm_Led_Off();
		for(i=0; i<0x100000; i++);
	}
}

#endif

void c_func(void)
{
	Uart1_Printf("C_Function!\n");
}

#if 0

extern void Asm_Print_Err(void);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 2\n");

	Asm_Print_Err();
	Uart1_Printf("Returned\n");
}

#endif

#if 0

extern void Asm_Print_Good(void);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 3\n");

	Asm_Print_Good();
	Uart1_Printf("Returned\n");
}

#endif

#if 0

extern int Asm_Add1(int a, int b);
extern int Asm_Add2(int a, int b);
extern int Asm_Add3(int a, int b);

void Main(void)
{
	int a=3;
	int b=5;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 4\n");

	Uart1_Printf("3+5=%d [Result  = 8]\n", Asm_Add1(a,b));
	Uart1_Printf("3+5=%d [Result  = 8]\n", Asm_Add2(a,b));
	Uart1_Printf("3+5=%d [Result  = 8]\n", Asm_Add3(a,b));

	Uart1_Printf("\nReturned!\n");
}

#endif

int Sqr(int a)
{
	Uart1_Printf("%d * %d = %d\n", a, a, a*a);
	return (a*a);
}

#if 0

extern int Asm_Add_Sqr(int a, int b);

void Main(void)
{
	int r;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 5\n");

	r = Asm_Add_Sqr(3, 5);
	Uart1_Printf("3*3+5*5=%d [Result = 34]\n", r);
	r = Asm_Add_Sqr(4, -2);
	Uart1_Printf("4*4+(-2)*(-2)=%d [Result = 20]\n", r);

	Uart1_Printf("\nReturned!\n");
}

#endif

#if 0

int new_add(int a, int b, int c, int d, int e, int f)
{
	return a+b+c+d+e+f;
}

void Main(void)
{
	int a;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 6\n");

	a = new_add(1,2,3,4,5,6);
	Uart1_Printf("%d\n", a);

	Uart1_Printf("Returned\n");
}

#endif

int Add_7(int a, int b, int c, int d, int e, int f, int g)
{
	return (a+b+c+d+e+f+g);
}

#if 0

extern int Asm_Add_7(int a, int b);

void Main(void)
{
	int a=3;
	int b=5;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 7\n");

	Uart1_Printf("3*7+5=%d [Result = 26]\n", Asm_Add_7(a,b));

	Uart1_Printf("\nReturned!\n");
}

#endif

#if 0

extern int Asm_Add_7_Sqr(int a, int b);

void Main(void)
{
	int a=3;
	int b=5;

	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("ASM Function Test 8\n");

	Uart1_Printf("3*7+5*5=%d [Result = 46]\n", Asm_Add_7_Sqr(a,b));

	Uart1_Printf("\nReturned!\n");
}

#endif
