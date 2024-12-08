version 1.00 initial release

IMPORTANT: SET OPTIONBYTE AFR0 to Port C5, C6 & C7 to Alternative Function with the ST Visual Programmer

NixieClock IN12 V3 board (frontside board)
JM Nixieclock IN12 V4.2 20190514 (backside board)

STM8S003F3  TSSOP20 8K FLASH, 1K RAM, 128 byte eeprom.

Pin 1   PD4 (HS) UART1_CK/TIM2_CH1/BEEP          input <= SW UP  & 10k R28 pullup, GND when pressed

Pin 2   PD5 (HS) UART1_TX/AIN5                   input <= SW DOWN & 10k R29 pullup, GND when pressed
Pin 3   PD6 (HS) UART1_RX                        output => 1k R11 => Q2b for colon neons DS1 & DS2
Pin 4   NRST                                     debug connector pin 3
Pin 5   PA1 OSCIN                           
Pin 6   PA2 OSCOUT
Pin 7   Vss                                      GND       
Pin 8   Vcap     
Pin 9   Vdd                                      +3.3V     
Pin 10  PA3 (HS) SPI_NSS/TIM2_CH3
Pin 11  PB5 (T)  I2C_SDA/TIM1_BKIN               inout <=> DS3231 SDA & 10k R21 pullup
Pin 12  PB4 (T)  I2C_SCL/ADC_ETR                 output => DS3231 scl & 10k R20 pullup 
Pin 13  PC3 (HS) TIM1_CH3/[TLI]/[TIM1_CH1N]      output => 1k R25 => Q4b for LEDs red
Pin 14  PC4 (HS) TIM1_CH4/CLK_CCO/AIN2/TIM1_CH2N output => 1k R26 => Q3b for LEDs blue
Pin 15  PC5 (HS) SPI_SCK/TIM2_CH1                output => 595 U4 sr data in & 10k R19 pullup
Pin 16  PC6 (HS) SPI_MOSI/TIM1_CH1               output => 1k R27 => Q5b for LEDs green
Pin 17  PC7 (HS) SPI_MISO/TIM1_CH2               output => all 595 RCLK (latch) & 10k R18 pullup
Pin 18  PD1 (HS) SWIM                            debug connector pin 2
Pin 19  PD2 (HS) AIN3/TIM2_CH3                   output => all 595 SRCLK & 10k R17 pullup
Pin 20  PD3 (HS) AIN4/TIM2_CH2/ADC_ETR           output => 595 U4 /OE (all other 595 /OE grounded)


PC5
|
V
595 U4
Q0 -> 2003A U5  I1, O1-> N4 0
Q1 -> 2003A U5  I2, O2-> N4 1
Q2 -> 2003A U5  I3, O3-> N4 2
Q3 -> 2003A U5  I4, O4-> N4 3
Q4 -> 2003A U5  I5, O5-> N4 4
Q5 -> 2003A U5  I6, O6-> N4 5
Q6 -> 2003A U5  I7, O7-> N4 6
Q7 -> 2003A U6  I1, O1-> N4 7
|
V
595 U7
Q0 -> 2003A U6  I2, O2-> N4 8
Q1 -> 2003A U6  I3, O3-> N4 9
Q2 -> 2003A U6  I4, O4-> N3 0
Q3 -> 2003A U6  I5, O5-> N3 1
Q4 -> 2003A U6  I6, O6-> N3 2
Q5 -> 2003A U6  I7, O7-> N3 3
Q6 -> 2003A U8  I1, O1-> N3 4
Q7 -> 2003A U8  I2, O2-> N3 5
|
V
595 U9
Q0 -> 2003A U8  I3, O3-> N3 6
Q1 -> 2003A U8  I4, O4-> N3 7
Q2 -> 2003A U8  I5, O5-> N3 8
Q3 -> 2003A U8  I6, O6-> N3 9
Q4 -> 2003A U8  I7, O7-> N2 0
Q5 -> 2003A U10 I1, O1-> N2 1
Q6 -> 2003A U10 I2, O2-> N2 2
Q7 -> 2003A U10 I3, O3-> N2 3
|
V
595 U11
Q0 -> 2003A U10 I4, O4-> N2 4
Q1 -> 2003A U10 I5, O5-> N2 5
Q2 -> 2003A U10 I6, O6-> N2 6
Q3 -> 2003A U10 I7, O7-> N2 7
Q4 -> 2003A U12 I1, O1-> N2 8
Q5 -> 2003A U12 I2, O2-> N2 9
Q6 -> 2003A U12 I3, O3-> N1 0
Q7 -> 2003A U12 I4, O4-> N1 1
|
V
595 U13
Q0 -> 2003A U12 I5, O5-> N1 2
Q1 -> 2003A U12 I6, O6-> N1 3
Q2 -> 2003A U12 I7, O7-> N1 4
Q3 -> 2003A U14 I1, O1-> N1 5
Q4 -> 2003A U14 I2, O2-> N1 6
Q5 -> 2003A U14 I3, O3-> N1 7
Q6 -> 2003A U14 I4, O4-> N1 8
Q7 -> 2003A U14 I5, O5-> N1 9

debug connector
Pin 1   3.3V
Pin 2   SWIM
Pin 3   NRST
Pin 4   GND
  