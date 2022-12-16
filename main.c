#include <stdint.h>

#define RCC_BASE 0x40021000
#define GPIOA_BASE 0x40010800
#define RCC_APB2ENR *(volatile uint32_t *)(RCC_BASE + 0x18)
#define GPIOA_CRH *(volatile uint32_t *)(GPIOA_BASE + 0x04)
#define GPIOA_ODR *(volatile uint32_t *)(GPIOA_BASE + 0x0C)

typedef union{
    volatile uint32_t all_fields;
    struct{
        volatile uint32_t reserved:13;
        volatile uint32_t p13:1;
    }Pin;
}R_ODR_t;

volatile R_ODR_t* R_ODR = (volatile R_ODR_t*)(GPIOA_BASE + 0x0C);

int main(void){
    int i=0;
    RCC_APB2ENR |= 1<<2;
    GPIOA_CRH &= 0xFF0FFFFF;
    GPIOA_CRH |= 0x00200000;
    while(1){
        R_ODR->Pin.p13=1;
        for(i=0;i<20000;i++);
        R_ODR->Pin.p13=0;
        for(i=0;i<20000;i++);
    }
}