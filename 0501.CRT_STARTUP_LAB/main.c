#define RCC_APB2ENR   (*(volatile unsigned long*)0x40021018)

/* �ʿ�� GPIO �������ʹ� ���⿡ �����Ͽ� ��� */




void Main(void)
{
	/* �� �ڵ�� ���� ���� */
	RCC_APB2ENR |= (1<<3);

	/* ������� �ۼ�, LED[1:0]�� [ON,OFF] �ǵ��� ���� */



}
