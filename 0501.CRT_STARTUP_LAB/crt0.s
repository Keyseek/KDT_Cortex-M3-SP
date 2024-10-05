	.syntax unified
	.thumb

	.text

	.word	0x20005000
	.word	__start

	.global	__start
  	.type 	__start, %function
__start:

	.extern __RO_LIMIT__
	.extern __RW_BASE__
	.extern __ZI_BASE__
	.extern __ZI_LIMIT__

	ldr		r0, =__RO_LIMIT__
	ldr		r1, =__RW_BASE__
	ldr		r3, =__ZI_BASE__

	cmp		r0, r1
	beq		2f

1:

	@ RW 복사 코드 작성



2:
	ldr		r1, =__ZI_LIMIT__
	mov		r2, #0x0
3:

	@ BSS 초기화 코드 작성




	.extern Main

	bl		Main

	b		.

	.end
