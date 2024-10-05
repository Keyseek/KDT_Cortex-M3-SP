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
@ Sqr�� ȣ���ϸ� r0-r3,r12�� ���� ���ɼ��� ����
@ �ı� ����� �ִ� ������ ���ǽ�Ŵ
@ leaf function�� �ƴϹǷ� lr�� �����Ѵ�
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern  Sqr
	
	.global	Asm_Add_Sqr
  	.type 	Asm_Add_Sqr, %function
Asm_Add_Sqr:
	@ int Asm_Add_Sqr(int a, int b);
	@ {
	@	return (Sqr(a)+Sqr(b));
	@ }
	@ C�� �Լ��� Sqr()�� �̿�






@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ int Asm_Add_7(int a, int b);
@ Add_7 ȣ��� ������ 7���� (�����̿�)
@ stack����å�� : Caller(__cdecl)
@ Add_7�� ȣ���ϸ� r0-r3,r12�� ���� ���ɼ��� ����
@ �ı� ����� �ִ� ������ ���ǽ�Ŵ
@ leaf function�� �ƴϹǷ� lr�� �����Ѵ�
@ stack alignment ���� �ؼ�!
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	.extern Add_7
	
	.global	Asm_Add_7
  	.type 	Asm_Add_7, %function
Asm_Add_7:
	@ int Asm_Add_7(int a, int b);
	@ {
	@	return (Add_7(a,a,a,a,a,a,a)+b)
	@ }
	@ C�� �Լ��� Add_7()�� �̿�









@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ int Asm_Add_7_Sqr(int a, int b);
@ Add_7 ȣ��� ������ 7���� (�����̿�)
@ stack����å�� : Caller(__cdecl)
@ Add_7�� ȣ���ϸ� r0-r3,r12�� ���� ���ɼ��� ����
@ �ı� ����� �ִ� ������ ���ǽ�Ŵ
@ leaf function�� �ƴϹǷ� lr�� �����Ѵ�
@ stack alignment ���� �ؼ�!
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
	@ C�� �Լ��� Add_7(), Sqr()�� �̿�








	.end
