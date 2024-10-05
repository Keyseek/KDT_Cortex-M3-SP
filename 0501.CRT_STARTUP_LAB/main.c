#define RCC_APB2ENR   (*(volatile unsigned long*)0x40021018)

/* 필요시 GPIO 레지스터는 여기에 정의하여 사용 */




void Main(void)
{
	/* 이 코드는 수정 금지 */
	RCC_APB2ENR |= (1<<3);

	/* 여기부터 작성, LED[1:0]을 [ON,OFF] 되도록 설계 */



}
