#define GPIO_BASE           0xFE200000

#define GPFSEL2_OFFSET      0x08
#define GPSET0_OFFSET       0x1c
#define GPCLR0_OFFSET       0x28

#define GPFSEL2             GPIO_BASE + GPFSEL2_OFFSET
#define GPSET0              GPIO_BASE + GPSET0_OFFSET
#define GPCLR0              GPIO_BASE + GPCLR0_OFFSET

#define FSEL21_OFFSET       3U
#define SET0_OFFSET         21U
#define CLR0_OFFSET         21U

typedef unsigned int uint32_t;

/*
void delay()
{
    uint32_t i;
	i = 0;
	while (i < 0x800000)
	{
		i++;
	}
}*/



void main(void)
{

    //CONFIGURE GPIO21 AS AN OUTPUT
    *(uint32_t *)(GPFSEL2) = (1 << FSEL21_OFFSET);
        
    *(uint32_t *)(GPSET0) = (1 << SET0_OFFSET);
/*
    while(1)
    {
        //SET GPIO21
        *(uint32_t *)(GPSET0) = (1 << SET0_OFFSET);

	    //delay
        delay();

        //CLEAR GPIO21
        *(uint32_t *)(GPCLR0) = (1 << CLR0_OFFSET);
    
	    //delay
        delay();

    }
*/
}