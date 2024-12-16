/* BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 * Adapted for SDCC
 */

#include <stdint.h>

/* Interrupt Vector Table for SDCC */
//extern void _stext(void); /* SDCC startup routine */

typedef void (*interrupt_handler_t)(void);

struct interrupt_vector {
    unsigned char interrupt_instruction;
    interrupt_handler_t interrupt_handler;
};

 void NonHandledInterrupt(){

}

/*******************
 * DECLARATION OF USER ISRs
 *******************/
void TIM2_UPD_ISR(void) __interrupt(13); // ISR for Timer2 Update
void TIM2_CAP_ISR(void) __interrupt(14); // ISR for Timer2 Capture/Compare

/* Interrupt Vector Table */
struct interrupt_vector const _vectab[] = {
    {0x82, NonHandledInterrupt},              /* reset */
    {0x82, NonHandledInterrupt}, /* trap  */
    {0x82, NonHandledInterrupt}, /* irq0  */
    {0x82, NonHandledInterrupt}, /* irq1  */
    {0x82, NonHandledInterrupt}, /* irq2  */
    {0x82, NonHandledInterrupt}, /* irq3  */
    {0x82, NonHandledInterrupt}, /* irq4  */
    {0x82, NonHandledInterrupt}, /* irq5  */
    {0x82, NonHandledInterrupt}, /* irq6  */
    {0x82, NonHandledInterrupt}, /* irq7  */
    {0x82, NonHandledInterrupt}, /* irq8  */
    {0x82, NonHandledInterrupt}, /* irq9  */
    {0x82, NonHandledInterrupt}, /* irq10 */
    {0x82, NonHandledInterrupt}, /* irq11 */
    {0x82, NonHandledInterrupt}, /* irq12 */
    {0x82, TIM2_UPD_ISR},        /* irq13 */
    {0x82, TIM2_CAP_ISR},        /* irq14 */
    {0x82, NonHandledInterrupt}, /* irq15 */
    {0x82, NonHandledInterrupt}, /* irq16 */
    {0x82, NonHandledInterrupt}, /* irq17 */
    {0x82, NonHandledInterrupt}, /* irq18 */
    {0x82, NonHandledInterrupt}, /* irq19 */
    {0x82, NonHandledInterrupt}, /* irq20 */
    {0x82, NonHandledInterrupt}, /* irq21 */
    {0x82, NonHandledInterrupt}, /* irq22 */
    {0x82, NonHandledInterrupt}, /* irq23 */
    {0x82, NonHandledInterrupt}, /* irq24 */
    {0x82, NonHandledInterrupt}, /* irq25 */
    {0x82, NonHandledInterrupt}, /* irq26 */
    {0x82, NonHandledInterrupt}, /* irq27 */
    {0x82, NonHandledInterrupt}, /* irq28 */
    {0x82, NonHandledInterrupt}, /* irq29 */
};
