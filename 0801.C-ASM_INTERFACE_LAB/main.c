#include "device_driver.h"

void print_int(int v)
{
	Uart_Printf("Value = %d\n", v);
}

#if 1

extern void Asm_Arg1(char a, short b, int c);
extern void Asm_Arg2(int * d, int *e);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 1\n");

	{
		char a = 50;
		short b = 100;
		int c = 500;
		int * d = &c;
		int e[4] = {10,20,30,40};

		Asm_Arg1(a, b, c);
		Asm_Arg2(d, e);
	}

	Uart1_Printf("\nReturned!\n");
}

#endif

#if 0

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 2-1\n");

	{
		unsigned char c = 0xff;

		if(c == 0xff)
			Uart1_Printf("%x\n", c+1);
		else
			Uart1_Printf("%x\n", c-1);

	}

	Uart1_Printf("\nReturned!\n");
}

#endif

#if 0

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 2-2\n");

	{
		signed char c = 0xff;

		if(c == 0xff)
			Uart1_Printf("%x\n", c+1);
		else
			Uart1_Printf("%x\n", c-1);

	}

	Uart1_Printf("\nReturned!\n");
}

#endif

#if 0

extern unsigned char Asm_Ret_Unsigned_Char(unsigned char a);
extern signed char Asm_Ret_Signed_Char(signed char a);
extern unsigned short Asm_Ret_Unsigned_Short(unsigned short a);
extern signed short Asm_Ret_Signed_Short(signed short a);
extern unsigned int Asm_Ret_Unsigned_Int(unsigned int a);
extern signed int Asm_Ret_Signed_Int(signed int a);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 3\n");

	Uart_Printf("\nASM Version Functions\n");
	Uart_Printf("UC 0xFF => 0x%.8X\n", Asm_Ret_Unsigned_Char(0xFF));
	Uart_Printf("SC 0x80 => 0x%.8X\n", Asm_Ret_Signed_Char(0x80));
	Uart_Printf("US 0xFFFF => 0x%.8X\n", Asm_Ret_Unsigned_Short(0xFFFF));
	Uart_Printf("SS 0x8000 => 0x%.8X\n", Asm_Ret_Signed_Short(0x8000));
	Uart_Printf("UI 0xFFFFFFFF => 0x%.8X\n", Asm_Ret_Unsigned_Int(0xFFFFFFFF));
	Uart_Printf("SI 0x80000000 => 0x%.8X\n", Asm_Ret_Signed_Int(0x80000000));

	Uart1_Printf("\nReturned!\n");
}

#endif

unsigned char uc = 0x80;
signed char sc = 0x80;
unsigned short us = 0x8000;
signed short ss = 0x8000;

#if 0

void C_Var_Unsigned_Char(void) 	{ uc+=1; }
void C_Var_Signed_Char(void) 	{ sc+=1; }
void C_Var_Unsigned_Short(void) { us+=1; }
void C_Var_Signed_Short(void) 	{ ss+=1; }

extern void Asm_Var_Unsigned_Char(void);
extern void Asm_Var_Signed_Char(void);
extern void Asm_Var_Unsigned_Short(void);
extern void Asm_Var_Signed_Short(void);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 4\n");

	// C 버전 함수

	Uart_Printf("C Version Functions\n");
	C_Var_Unsigned_Char();
	Uart_Printf("UC 0x80 => %#.8X\n", uc);
	C_Var_Signed_Char();
	Uart_Printf("SC 0x80 => %#.8X\n", sc);
	C_Var_Unsigned_Short();
	Uart_Printf("US 0x8000 => %#.8X\n", us);
	C_Var_Signed_Short();
	Uart_Printf("SS 0x8000 => %#.8X\n\n", ss);

	uc = 0x80;
	sc = 0x80;
	us = 0x8000;
	ss = 0x8000;

	// ASM 버전 함수

	Uart_Printf("ASM Version Functions\n");
	Asm_Var_Unsigned_Char();
	Uart_Printf("UC 0x80 => %#.8X\n", uc);
	Asm_Var_Signed_Char();
	Uart_Printf("SC 0x80 => %#.8X\n", sc);
	Asm_Var_Unsigned_Short();
	Uart_Printf("US 0x8000 => %#.8X\n", us);
	Asm_Var_Signed_Short();
	Uart_Printf("SS 0x8000 => %#.8X\n", ss);

	Uart_Printf("\nReturned!\n");
}

#endif

int a = 100;
int *p = &a;
int x[4] = {10,20,30,40};

#if 0

extern void Asm_Var_Access(void);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 5\n");

	// 변수, 포인터, 배열 억세스 : 변수의 값을 각각 1씩 증가 (포인터는 가리키는 데이터를 1씩 증가)
	Asm_Var_Access();
	Uart1_Printf("\na (102) => %d\n", a);
	Uart1_Printf("*p (102) => %d\n", *p);
	Uart1_Printf("x[0]~x[3] (11,21,31,41) => %d,%d,%d,%d\n", x[0], x[1], x[2], x[3]);

	Uart1_Printf("\nReturned!\n");
}

#endif

int Sqr(int a)
{
	Uart1_Printf("%d * %d = %d\n", a, a, a*a);
	return (a*a);
}

#if 0

extern void Asm_Tail_Call(int a);
extern void Asm_Sqr_Print(int a);

void Main(void)
{
	LED_Init();
	Uart1_Init(115200);
	Uart1_Printf("C-ASM Interface 6\n");

	Asm_Tail_Call(100);
	Uart1_Printf("\nReturned!\n");

	Asm_Sqr_Print(3);
	Uart1_Printf("\nReturned!\n");
}

#endif
