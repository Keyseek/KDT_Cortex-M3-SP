	.syntax unified
	.thumb

	.text

	.equ 	GPIOB_ODR,	0x40010C0C

	.global	Asm_Led_On
  	.type 	Asm_Led_On, %function
Asm_Led_On:
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x0
    STR   r1, [r0]
    BX    LR

	.global	Asm_Led_Off
  	.type 	Asm_Led_Off, %function
Asm_Led_Off:
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x3<<8
    STR   r1, [r0]
    BX    LR
        
	.extern c_func

	.global	Asm_Print_Err
  	.type 	Asm_Print_Err, %function
Asm_Print_Err:
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x0
    STR   r1, [r0]
    BL    c_func
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x3<<8
    STR   r1, [r0]
    BX    LR

	.global	Asm_Print_Good
  	.type 	Asm_Print_Good, %function
Asm_Print_Good:
    PUSH  {r0, lr}
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x0
    STR   r1, [r0]
    BL    c_func
    LDR   r0, =GPIOB_ODR
    LDR   r1, =0x3<<8
    STR   r1, [r0]
    POP   {r0, pc}

	.global Asm_Add1
  	.type 	Asm_Add1, %function
Asm_Add1:
	add		r0, r0, r1
	bx		lr

	.global Asm_Add2
  	.type 	Asm_Add2, %function
Asm_Add2:
	push	{r4-r5}
	mov		r4, r0
	mov		r5, r1
	add		r0, r4, r5
	pop		{r4-r5}
	bx		lr

	.global Asm_Add3
  	.type 	Asm_Add3, %function
Asm_Add3:
	push	{r4-r5, lr}
	mov		r4, r0
	mov		r5, r1
	add		r0, r4, r5
	pop		{r4-r5, pc}

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ int Asm_Add_Sqr(int a, int b);
@ Sqr을 호출하면 r0-r3,r12는 변형 가능성이 있음
@ 파괴 우려가 있는 변수는 대피시킴
@ leaf function이 아니므로 lr을 저장한다
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern  Sqr
	
	.global	Asm_Add_Sqr
  	.type 	Asm_Add_Sqr, %function
Asm_Add_Sqr:
	@ int Asm_Add_Sqr(int a, int b);
	@ {
	@	return (Sqr(a)+Sqr(b));
	@ }
	@ C의 함수인 Sqr()을 이용






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ int Asm_Add_7(int a, int b);
@ Add_7 호출시 변수가 7개임 (스택이용)
@ stack정리책임 : Caller(__cdecl)
@ Add_7를 호출하면 r0-r3,r12는 변형 가능성이 있음
@ 파괴 우려가 있는 변수는 대피시킴
@ leaf function이 아니므로 lr을 저장한다
@ stack alignment 규정 준수!
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern Add_7
	
	.global	Asm_Add_7
  	.type 	Asm_Add_7, %function
Asm_Add_7:
	@ int Asm_Add_7(int a, int b);
	@ {
	@	return (Add_7(a,a,a,a,a,a,a)+b)
	@ }
	@ C의 함수인 Add_7()을 이용









@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ int Asm_Add_7_Sqr(int a, int b);
@ Add_7 호출시 변수가 7개임 (스택이용)
@ stack정리책임 : Caller(__cdecl)
@ Add_7를 호출하면 r0-r3,r12는 변형 가능성이 있음
@ 파괴 우려가 있는 변수는 대피시킴
@ leaf function이 아니므로 lr을 저장한다
@ stack alignment 규정 준수!
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern Sqr
	.extern Add_7

	.global	Asm_Add_7_Sqr
  	.type 	Asm_Add_7_Sqr, %function
Asm_Add_7_Sqr:
	@ int Asm_Add_7_Sqr(int a, int b);
	@ {
	@	return (Add_7(a,a,a,a,a,a,a)+Sqr(b));
	@ }
	@ C의 함수인 Add_7(), Sqr()을 이용








	.end
