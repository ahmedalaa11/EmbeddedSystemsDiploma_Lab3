/*1-Define Interrupt vectors */
/*2-Copy data from ROM->RAM */
/*3-Initialize data area */
/*4-Initialize stack */
/*5-Create a reset section and call main()*/

.section .vectors

.word 0x20001000        /*stack top address*/
.word _reset            /*1 reset*/
.word Vector_handler    /*2 NMI*/
.word Vector_handler    /*3 Hard Fault*/
.word Vector_handler    /*4 MM Fault*/
.word Vector_handler    /*5 Bus Fault*/
.word Vector_handler    /*6 Usage Fault*/
.word Vector_handler    /*7 Reserved*/
.word Vector_handler    /*8 Reserved*/
.word Vector_handler    /*9 Reserved*/
.word Vector_handler    /*10 Reserved*/
.word Vector_handler    /*11 SV Call*/
.word Vector_handler    /*12 Debug Reserved*/
.word Vector_handler    /*13 Reserved*/
.word Vector_handler    /*14 PendSV*/
.word Vector_handler    /*15 SysTick*/
.word Vector_handler    /*16 IRQ0*/
.word Vector_handler    /*17 IRQ1*/
/* on to IRQ67 */

.section .text

_reset:
    bl main
    b .
.thumb_func /*Directive specifies  the following symbol is the name of a Thumb encoded function*/
Vector_handler:
    b _reset