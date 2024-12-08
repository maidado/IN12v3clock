
# IN12v3clock

Alternate firmware for the GeekStyles IN12 V3 Nixie clock PCB.

## Version
- **1.00**: Initial release.

## Description
This firmware is designed for the IN12 V3 clock board, utilizing the STM8S003F3 microcontroller. 
It supports the frontside board **NixieClock IN12 V3** 
and the backside board **JM NixieClock IN12 V4.2 20190514**. 
The microcontroller features 8 KB of Flash memory, 1 KB of RAM, and 128 bytes of EEPROM.

---

## Requirements
1. **Cosmic STM8 compiller + STVD**
2. **External Libraries**:
   - Added submodule: [STM8_headers](https://github.com/gicking/STM8_headers).

---

## Important Configuration
Before flashing the firmware, set the option byte `AFR0` in the ST Visual Programmer:
- **Port C5, C6 & C7**: Configure to **Alternate Function**.

---

## Pinout
### Microcontroller Pin Assignment
| Pin  | Signal                          | Description                                                        |
|------|---------------------------------|--------------------------------------------------------------------|
| 1    | PD4 (HS) UART1_CK/TIM2_CH1/BEEP | Input: SW UP with 10k pull-up resistor. Grounded when pressed.     |
| 2    | PD5 (HS) UART1_TX/AIN5          | Input: SW DOWN with 10k pull-up resistor. Grounded when pressed.   |
| 3    | PD6 (HS) UART1_RX               | Output: Drives colon neons (DS1 & DS2) through 1k resistor.       |
| 4    | NRST                            | Debug connector pin 3.                                             |
| 5    | PA1 OSCIN                       | Clock input.                                                       |
| 6    | PA2 OSCOUT                      | Clock output.                                                      |
| 7    | Vss                             | Ground.                                                            |
| 8    | Vcap                            | Decoupling capacitor.                                              |
| 9    | Vdd                             | +3.3V supply.                                                      |
| 10   | PA3 (HS) SPI_NSS/TIM2_CH3       | Reserved.                                                          |
| 11   | PB5 (T) I2C_SDA/TIM1_BKIN       | I2C SDA for DS3231 RTC with 10k pull-up resistor.                  |
| 12   | PB4 (T) I2C_SCL/ADC_ETR         | I2C SCL for DS3231 RTC with 10k pull-up resistor.                  |
| 13   | PC3 (HS) TIM1_CH3               | Drives LEDs (red) through 1k resistor.                             |
| 14   | PC4 (HS) TIM1_CH4               | Drives LEDs (blue) through 1k resistor.                            |
| 15   | PC5 (HS) SPI_SCK/TIM2_CH1       | Drives 595 shift register data input with 10k pull-up resistor.    |
| 16   | PC6 (HS) SPI_MOSI/TIM1_CH1      | Drives LEDs (green) through 1k resistor.                           |
| 17   | PC7 (HS) SPI_MISO/TIM1_CH2      | Drives 595 RCLK (latch) with 10k pull-up resistor.                 |
| 18   | PD1 (HS) SWIM                   | Debug connector pin 2.                                             |
| 19   | PD2 (HS) AIN3/TIM2_CH3          | Drives 595 SRCLK with 10k pull-up resistor.                        |
| 20   | PD3 (HS) AIN4/TIM2_CH2          | Drives 595 U4 OE.                                                  |

### Debug Connector
| Pin | Signal | Description |
|-----|--------|-------------|
| 1   | 3.3V   | Power supply. |
| 2   | SWIM   | Programming interface. |
| 3   | NRST   | Reset.       |
| 4   | GND    | Ground.      |

---

## Shift Register Wiring
The project uses a series of 74HC595 shift registers, driving 2003A darlington arrays to control the Nixie tubes. Here is the wiring layout:

- **Shift Registers (595)**: Connected in series to control multiple outputs.
- **Darlington Arrays (2003A)**: Drive the Nixie tubes from shift register outputs.

```
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
```

---

## Usage
1. Clone the repository with submodules:
   ```bash
   git clone --recurse-submodules <repository_url>
   ```
2. Compile the firmware using Cosmic STM8 v4.6 toolchain.
3. Flash the firmware to the STM8S003F3 microcontroller.
4. Verify the board's functionality.

---

### Control by buttons
1.
2.
3.
4.
5.
6.


---

## License
This project is distributed under the **MIT License**.

---

## Acknowledgments
- [STM8_headers](https://github.com/gicking/STM8_headers): Header files for STM8 microcontrollers.
