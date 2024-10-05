	.syntax unified
	.thumb

	.text

    .extern  HardFault_Handler
    .extern  MemManage_Handler
    .extern  BusFault_Handler
    .extern  UsageFault_Handler

    .global _HardFault_Handler
  	.type 	_HardFault_Handler, %function
_HardFault_Handler:

	@ 内靛 累己


	bl		HardFault_Handler

    .global _MemManage_Handler
  	.type 	_MemManage_Handler, %function
_MemManage_Handler:

	@ 内靛 累己


	bl		MemManage_Handler

    .global _BusFault_Handler
  	.type 	_BusFault_Handler, %function
_BusFault_Handler:

	@ 内靛 累己


	bl		BusFault_Handler


    .global _UsageFault_Handler
  	.type 	_UsageFault_Handler, %function
_UsageFault_Handler:

	@ 内靛 累己


	bl		UsageFault_Handler


	.end
