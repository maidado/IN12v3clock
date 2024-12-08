   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 7 void RGBinit ( void )
  15                     ; 8 {
  16                     	scross	off
  17  0000               _RGBinit:
  19                     ; 10 	sfr_PORTC.DDR.DDR3 = 1;     // input(=0) or output(=1)
  20  0000 7216500c      	bset	20492,#3
  21                     ; 11 	sfr_PORTC.CR1.C13  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  22  0004 7216500d      	bset	20493,#3
  23                     ; 12 	sfr_PORTC.CR2.C23  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  24  0008 7216500e      	bset	20494,#3
  25                     ; 13 	sfr_PORTC.ODR.ODR3 = 0;
  26  000c 7217500a      	bres	20490,#3
  27                     ; 15 	sfr_PORTC.DDR.DDR6 = 1;     // input(=0) or output(=1)
  28  0010 721c500c      	bset	20492,#6
  29                     ; 16 	sfr_PORTC.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  30  0014 721c500d      	bset	20493,#6
  31                     ; 17 	sfr_PORTC.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  32  0018 721c500e      	bset	20494,#6
  33                     ; 18 	sfr_PORTC.ODR.ODR6 = 0;
  34  001c 721d500a      	bres	20490,#6
  35                     ; 20 	sfr_PORTC.DDR.DDR4 = 1;     // input(=0) or output(=1)
  36  0020 7218500c      	bset	20492,#4
  37                     ; 21 	sfr_PORTC.CR1.C14  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  38  0024 7218500d      	bset	20493,#4
  39                     ; 22 	sfr_PORTC.CR2.C24  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  40  0028 7218500e      	bset	20494,#4
  41                     ; 23 	sfr_PORTC.ODR.ODR4 = 0;
  42  002c 7219500a      	bres	20490,#4
  43                     ; 26   sfr_TIM1.CR1.CMS     = 0;                               // PWM Edge-aligned mode
  44  0030 721b5250      	bres	21072,#5
  45  0034 721d5250      	bres	21072,#6
  46                     ; 27 	sfr_TIM1.CR1.DIR     = 0;                               // Counter used as up-counter
  47  0038 72195250      	bres	21072,#4
  48                     ; 28   sfr_TIM1.CR1.ARPE    = 1;                               // buffer period register to avoid glitches when changing frequency
  49  003c 721e5250      	bset	21072,#7
  50                     ; 29   sfr_TIM1.CR1.OPM     = 0;                               // continuous PWM mode
  51  0040 72175250      	bres	21072,#3
  52                     ; 30   sfr_TIM1.PSCRH.byte  = 0;                               // set TIM1 prescaler to 1 --> fTIM1=16MHz
  53  0044 725f5260      	clr	21088
  54                     ; 31   sfr_TIM1.PSCRL.byte  = 0;
  55  0048 725f5261      	clr	21089
  56                     ; 32   sfr_TIM1.ARRH.byte   = (uint8_t) (RGB_RELOAD_VALUE >> 8);         // set TIM1 auto-reload value = PWM period
  57  004c 35275262      	mov	21090,#39
  58                     ; 33   sfr_TIM1.ARRL.byte   = (uint8_t) RGB_RELOAD_VALUE;
  59  0050 35105263      	mov	21091,#16
  60                     ; 34 	sfr_TIM1.CCR1H.byte  = 0;
  61  0054 725f5265      	clr	21093
  62                     ; 35   sfr_TIM1.CCR1L.byte  = 0;
  63  0058 725f5266      	clr	21094
  64                     ; 36 	sfr_TIM1.CCR3H.byte  = 0;
  65  005c 725f5269      	clr	21097
  66                     ; 37   sfr_TIM1.CCR3L.byte  = 0;
  67  0060 725f526a      	clr	21098
  68                     ; 38 	sfr_TIM1.CCR4H.byte  = 0;
  69  0064 725f526b      	clr	21099
  70                     ; 39   sfr_TIM1.CCR4L.byte  = 0;
  71  0068 725f526c      	clr	21100
  72                     ; 40   sfr_TIM1.CCER1.CC1P  = 1;                               // set CH1 active low 
  73  006c 7212525c      	bset	21084,#1
  74                     ; 41   sfr_TIM1.CCER2.CC3P  = 1;                               // set CH3 active low 
  75  0070 7212525d      	bset	21085,#1
  76                     ; 42 	sfr_TIM1.CCER2.CC4P  = 1;                               // set CH4 active low 
  77  0074 721a525d      	bset	21085,#5
  78                     ; 43   sfr_TIM1.CCER1.CC1E  = 1;                               // enable CH1 output
  79  0078 7210525c      	bset	21084,#0
  80                     ; 44   sfr_TIM1.CCER2.CC3E  = 1;                               // enable CH3 output
  81  007c 7210525d      	bset	21085,#0
  82                     ; 45 	sfr_TIM1.CCER2.CC4E  = 1;   														// enable CH4 output
  83  0080 7218525d      	bset	21085,#4
  84                     ; 46   sfr_TIM1.CCMR1.OC1M  = 7;                               // use PWM mode 2
  85  0084 c65258        	ld	a,21080
  86  0087 aa70          	or	a,#112
  87  0089 c75258        	ld	21080,a
  88                     ; 47 	sfr_TIM1.CCMR3.OC3M  = 7;
  89  008c c6525a        	ld	a,21082
  90  008f aa70          	or	a,#112
  91  0091 c7525a        	ld	21082,a
  92                     ; 48   sfr_TIM1.CCMR4.OC4M  = 7;
  93  0094 c6525b        	ld	a,21083
  94  0097 aa70          	or	a,#112
  95  0099 c7525b        	ld	21083,a
  96                     ; 49   sfr_TIM1.CCMR1.OC1PE = 1;                               // buffer compare register to avoid glitches when changing duty cycle
  97  009c 72165258      	bset	21080,#3
  98                     ; 50   sfr_TIM1.CCMR3.OC3PE = 1;
  99  00a0 7216525a      	bset	21082,#3
 100                     ; 51 	sfr_TIM1.CCMR4.OC4PE = 1;
 101  00a4 7216525b      	bset	21083,#3
 102                     ; 52   sfr_TIM1.BKR.MOE     = 1;                               // main output enable
 103  00a8 721e526d      	bset	21101,#7
 104                     ; 53   sfr_TIM1.CR1.CEN     = 1;                               // start TIM1
 105  00ac 72105250      	bset	21072,#0
 106                     ; 54 }
 107  00b0 81            	ret
 109                     ; 57 void RGBsetR ( uint16_t value )
 109                     ; 58 {
 110  00b1               _RGBsetR:
 112                     ; 59 	sfr_TIM1.CCR3H.byte = hibyte(value);
 113  00b1 9e            	ld	a,xh
 114  00b2 c75269        	ld	21097,a
 115                     ; 60 	sfr_TIM1.CCR3L.byte = lobyte(value);
 116  00b5 9f            	ld	a,xl
 117  00b6 a4ff          	and	a,#255
 118  00b8 c7526a        	ld	21098,a
 119                     ; 61 }
 120  00bb 81            	ret
 122                     ; 63 void RGBsetG ( uint16_t value )
 122                     ; 64 {
 123  00bc               _RGBsetG:
 125                     ; 65 	sfr_TIM1.CCR1H.byte = hibyte(value);
 126  00bc 9e            	ld	a,xh
 127  00bd c75265        	ld	21093,a
 128                     ; 66 	sfr_TIM1.CCR1L.byte = lobyte(value);
 129  00c0 9f            	ld	a,xl
 130  00c1 a4ff          	and	a,#255
 131  00c3 c75266        	ld	21094,a
 132                     ; 67 }
 133  00c6 81            	ret
 135                     ; 69 void RGBsetB ( uint16_t value )
 135                     ; 70 {
 136  00c7               _RGBsetB:
 138                     ; 71 	sfr_TIM1.CCR4H.byte = hibyte(value);
 139  00c7 9e            	ld	a,xh
 140  00c8 c7526b        	ld	21099,a
 141                     ; 72 	sfr_TIM1.CCR4L.byte = lobyte(value);
 142  00cb 9f            	ld	a,xl
 143  00cc a4ff          	and	a,#255
 144  00ce c7526c        	ld	21100,a
 145                     ; 73 }
 146  00d1 81            	ret
 148                     	xdef	_RGBsetB
 149                     	xdef	_RGBsetG
 150                     	xdef	_RGBsetR
 151                     	xdef	_RGBinit
 152                     	end
