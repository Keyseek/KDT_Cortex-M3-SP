	.syntax unified
	.thumb

	.text

	.word	0x20005000
	.word	__start

	.global	__start
  	.type 	__start, %function
__start:

	.equ GPIOB_CRH,	0x40010C04
	.equ GPIOB_ODR,	0x40010C0C
	.equ APB2ENR,  	0x40021018

	@ 이부분은 수정하지 말 것 @

	LDR   r0, =APB2ENR
	LDR   r1, =0x8
	STR   r1, [r0]

    @ 초기 LED 모두 OFF @

	LDR   r0, =GPIOB_CRH
	LDR   r1, [r0]
	BIC   r1, r1, #0xFF<<0
	ORR   r1, r1, #0x66<<0
	STR   r1, [r0]

	LDR   r0, =GPIOB_ODR
	LDR   r1, [r0]
	ORR   r1, r1, #0x3<<8
	STR   r1, [r0]

	@ 여기부터 코드 작성 @








	b		.
			
	.end
