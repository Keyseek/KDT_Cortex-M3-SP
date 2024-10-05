	.syntax unified
	.thumb

	.text

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Arg1(char a, short b, int c);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	 print_int

	.global	Asm_Arg1
  	.type 	Asm_Arg1, %function
Asm_Arg1:
	@ void Asm_Arg1(char a, short b, int c);
	@ {
	@	print_int(a); print_int(b); print_int(c);
	@ }

	push  {r4-r6, lr}
	mov   r4, r1
	mov   r5, r2
	bl    print_int
	mov   r0, r4
	bl    print_int
	mov   r0, r5
	bl    print_int
	pop   {r4-r6, pc}

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Arg2(int * d, int *e);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	 print_int
	
	.global	Asm_Arg2
  	.type 	Asm_Arg2, %function
Asm_Arg2:
	@ void Asm_Arg2(int * d, int *e);
	@ {
	@	print_int(*d); print_int(e[0]); print_int(e[1]); print_int(e[2]); print_int(e[3]);
	@ }

	push  	{r4-r6, lr}
	mov   	r4, r1
	ldr   	r0, [r0]
	bl   	print_int
	
	mov		r5, #4
1:
	ldr		r0, [r4], #4
	bl		print_int
	subs	r5, r5, #1
	bgt		1b
	
	pop   {r4-r6, pc}

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ unsigned int Asm_Ret_Unsigned_Int(unsigned int a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ signed int Asm_Ret_Signed_Int(signed int a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.global	Asm_Ret_Unsigned_Int
  	.type 	Asm_Ret_Unsigned_Int, %function
	.global	Asm_Ret_Signed_Int
  	.type 	Asm_Ret_Signed_Int, %function
Asm_Ret_Unsigned_Int:
Asm_Ret_Signed_Int:

	add		r0, r0, #1
	bx		lr
        
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ unsigned char Asm_Ret_Unsigned_Char(unsigned char a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.global	Asm_Ret_Unsigned_Char
  	.type 	Asm_Ret_Unsigned_Char, %function
Asm_Ret_Unsigned_Char:





@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ signed char Asm_Ret_Signed_Char(signed char a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.global	Asm_Ret_Signed_Char
  	.type 	Asm_Ret_Signed_Char, %function
Asm_Ret_Signed_Char:





@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ unsigned short Asm_Ret_Unsigned_Short(unsigned short a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.global	Asm_Ret_Unsigned_Short
  	.type 	Asm_Ret_Unsigned_Short, %function
Asm_Ret_Unsigned_Short:






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ signed short Asm_Ret_Signed_Short(signed short a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.global	Asm_Ret_Signed_Short
  	.type 	Asm_Ret_Signed_Short, %function
Asm_Ret_Signed_Short:





@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Var_Unsigned_Char(void);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern uc
	
	.global	Asm_Var_Unsigned_Char
 	.type 	Asm_Var_Unsigned_Char, %function
Asm_Var_Unsigned_Char:

	ldr		r1, =uc
	ldrb	r0, [r1]
	add		r0, r0, #1
	strb	r0, [r1]
	bx		lr

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Var_Signed_Char(void);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	sc

	.global	Asm_Var_Signed_Char
  	.type 	Asm_Var_Signed_Char, %function
Asm_Var_Signed_Char:






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Var_Unsigned_Short(void);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	us

	.global Asm_Var_Unsigned_Short
  	.type 	Asm_Var_Unsigned_Short, %function
Asm_Var_Unsigned_Short:






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Var_Signed_Short(void);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	ss

	.global	Asm_Var_Signed_Short
  	.type 	Asm_Var_Signed_Short, %function
Asm_Var_Signed_Short:






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Var_Access(void);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern	a
	.extern	p
	.extern  x

	.global	Asm_Var_Access
  	.type 	Asm_Var_Access, %function
Asm_Var_Access:












@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Tail_Call(int a);
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern 	print_int

	.global	Asm_Tail_Call
  	.type 	Asm_Tail_Call, %function
Asm_Tail_Call:
				
	add		r0, r0, #1
	b		print_int

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ void Asm_Sqr_Print(int a);
@ => Uart_Printf("%d\n", sqr(a));
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern 	Sqr
	.extern 	Uart1_Printf

	.global	Asm_Sqr_Print
  	.type 	Asm_Sqr_Print, %function
Asm_Sqr_Print:

	push	{r3, lr}
	bl		Sqr
	mov		r1, r0
	ldr		r0, =fmt
	ldr		r2, =str
	pop		{r3, lr}
	b		Uart1_Printf

fmt:	.string	 "Sqr=%d%s"
	.align	4
str:	.string	 "!\n"
	.align	4

	.end
