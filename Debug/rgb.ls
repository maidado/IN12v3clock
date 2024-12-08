   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  43                     ; 7 void RGBinit ( void )
  43                     ; 8 {
  45                     	switch	.text
  46  0000               _RGBinit:
  50                     ; 10 	sfr_PORTC.DDR.DDR3 = 1;     // input(=0) or output(=1)
  52  0000 7216500c      	bset	20492,#3
  53                     ; 11 	sfr_PORTC.CR1.C13  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  55  0004 7216500d      	bset	20493,#3
  56                     ; 12 	sfr_PORTC.CR2.C23  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  58  0008 7216500e      	bset	20494,#3
  59                     ; 13 	sfr_PORTC.ODR.ODR3 = 0;
  61  000c 7217500a      	bres	20490,#3
  62                     ; 15 	sfr_PORTC.DDR.DDR6 = 1;     // input(=0) or output(=1)
  64  0010 721c500c      	bset	20492,#6
  65                     ; 16 	sfr_PORTC.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  67  0014 721c500d      	bset	20493,#6
  68                     ; 17 	sfr_PORTC.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  70  0018 721c500e      	bset	20494,#6
  71                     ; 18 	sfr_PORTC.ODR.ODR6 = 0;
  73  001c 721d500a      	bres	20490,#6
  74                     ; 20 	sfr_PORTC.DDR.DDR4 = 1;     // input(=0) or output(=1)
  76  0020 7218500c      	bset	20492,#4
  77                     ; 21 	sfr_PORTC.CR1.C14  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  79  0024 7218500d      	bset	20493,#4
  80                     ; 22 	sfr_PORTC.CR2.C24  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  82  0028 7218500e      	bset	20494,#4
  83                     ; 23 	sfr_PORTC.ODR.ODR4 = 0;
  85  002c 7219500a      	bres	20490,#4
  86                     ; 26   sfr_TIM1.CR1.CMS     = 0;                               // PWM Edge-aligned mode
  88  0030 721b5250      	bres	21072,#5
  89  0034 721d5250      	bres	21072,#6
  90                     ; 27 	sfr_TIM1.CR1.DIR     = 0;                               // Counter used as up-counter
  92  0038 72195250      	bres	21072,#4
  93                     ; 28   sfr_TIM1.CR1.ARPE    = 1;                               // buffer period register to avoid glitches when changing frequency
  95  003c 721e5250      	bset	21072,#7
  96                     ; 29   sfr_TIM1.CR1.OPM     = 0;                               // continuous PWM mode
  98  0040 72175250      	bres	21072,#3
  99                     ; 30   sfr_TIM1.PSCRH.byte  = 0;                               // set TIM1 prescaler to 1 --> fTIM1=16MHz
 101  0044 725f5260      	clr	21088
 102                     ; 31   sfr_TIM1.PSCRL.byte  = 0;
 104  0048 725f5261      	clr	21089
 105                     ; 32   sfr_TIM1.ARRH.byte   = (uint8_t) (RGB_RELOAD_VALUE >> 8);         // set TIM1 auto-reload value = PWM period
 107  004c 35275262      	mov	21090,#39
 108                     ; 33   sfr_TIM1.ARRL.byte   = (uint8_t) RGB_RELOAD_VALUE;
 110  0050 35105263      	mov	21091,#16
 111                     ; 34 	sfr_TIM1.CCR1H.byte  = 0;
 113  0054 725f5265      	clr	21093
 114                     ; 35   sfr_TIM1.CCR1L.byte  = 0;
 116  0058 725f5266      	clr	21094
 117                     ; 36 	sfr_TIM1.CCR3H.byte  = 0;
 119  005c 725f5269      	clr	21097
 120                     ; 37   sfr_TIM1.CCR3L.byte  = 0;
 122  0060 725f526a      	clr	21098
 123                     ; 38 	sfr_TIM1.CCR4H.byte  = 0;
 125  0064 725f526b      	clr	21099
 126                     ; 39   sfr_TIM1.CCR4L.byte  = 0;
 128  0068 725f526c      	clr	21100
 129                     ; 40   sfr_TIM1.CCER1.CC1P  = 1;                               // set CH1 active low 
 131  006c 7212525c      	bset	21084,#1
 132                     ; 41   sfr_TIM1.CCER2.CC3P  = 1;                               // set CH3 active low 
 134  0070 7212525d      	bset	21085,#1
 135                     ; 42 	sfr_TIM1.CCER2.CC4P  = 1;                               // set CH4 active low 
 137  0074 721a525d      	bset	21085,#5
 138                     ; 43   sfr_TIM1.CCER1.CC1E  = 1;                               // enable CH1 output
 140  0078 7210525c      	bset	21084,#0
 141                     ; 44   sfr_TIM1.CCER2.CC3E  = 1;                               // enable CH3 output
 143  007c 7210525d      	bset	21085,#0
 144                     ; 45 	sfr_TIM1.CCER2.CC4E  = 1;   														// enable CH4 output
 146  0080 7218525d      	bset	21085,#4
 147                     ; 46   sfr_TIM1.CCMR1.OC1M  = 7;                               // use PWM mode 2
 149  0084 c65258        	ld	a,21080
 150  0087 aa70          	or	a,#112
 151  0089 c75258        	ld	21080,a
 152                     ; 47 	sfr_TIM1.CCMR3.OC3M  = 7;
 154  008c c6525a        	ld	a,21082
 155  008f aa70          	or	a,#112
 156  0091 c7525a        	ld	21082,a
 157                     ; 48   sfr_TIM1.CCMR4.OC4M  = 7;
 159  0094 c6525b        	ld	a,21083
 160  0097 aa70          	or	a,#112
 161  0099 c7525b        	ld	21083,a
 162                     ; 49   sfr_TIM1.CCMR1.OC1PE = 1;                               // buffer compare register to avoid glitches when changing duty cycle
 164  009c 72165258      	bset	21080,#3
 165                     ; 50   sfr_TIM1.CCMR3.OC3PE = 1;
 167  00a0 7216525a      	bset	21082,#3
 168                     ; 51 	sfr_TIM1.CCMR4.OC4PE = 1;
 170  00a4 7216525b      	bset	21083,#3
 171                     ; 52   sfr_TIM1.BKR.MOE     = 1;                               // main output enable
 173  00a8 721e526d      	bset	21101,#7
 174                     ; 53   sfr_TIM1.CR1.CEN     = 1;                               // start TIM1
 176  00ac 72105250      	bset	21072,#0
 177                     ; 54 }
 180  00b0 81            	ret
 214                     ; 57 void RGBsetR ( uint16_t value )
 214                     ; 58 {
 215                     	switch	.text
 216  00b1               _RGBsetR:
 220                     ; 59 	sfr_TIM1.CCR3H.byte = hibyte(value);
 222  00b1 9e            	ld	a,xh
 223  00b2 c75269        	ld	21097,a
 224                     ; 60 	sfr_TIM1.CCR3L.byte = lobyte(value);
 226  00b5 9f            	ld	a,xl
 227  00b6 a4ff          	and	a,#255
 228  00b8 c7526a        	ld	21098,a
 229                     ; 61 }
 232  00bb 81            	ret
 266                     ; 63 void RGBsetG ( uint16_t value )
 266                     ; 64 {
 267                     	switch	.text
 268  00bc               _RGBsetG:
 272                     ; 65 	sfr_TIM1.CCR1H.byte = hibyte(value);
 274  00bc 9e            	ld	a,xh
 275  00bd c75265        	ld	21093,a
 276                     ; 66 	sfr_TIM1.CCR1L.byte = lobyte(value);
 278  00c0 9f            	ld	a,xl
 279  00c1 a4ff          	and	a,#255
 280  00c3 c75266        	ld	21094,a
 281                     ; 67 }
 284  00c6 81            	ret
 318                     ; 69 void RGBsetB ( uint16_t value )
 318                     ; 70 {
 319                     	switch	.text
 320  00c7               _RGBsetB:
 324                     ; 71 	sfr_TIM1.CCR4H.byte = hibyte(value);
 326  00c7 9e            	ld	a,xh
 327  00c8 c7526b        	ld	21099,a
 328                     ; 72 	sfr_TIM1.CCR4L.byte = lobyte(value);
 330  00cb 9f            	ld	a,xl
 331  00cc a4ff          	and	a,#255
 332  00ce c7526c        	ld	21100,a
 333                     ; 73 }
 336  00d1 81            	ret
 349                     	xdef	_RGBsetB
 350                     	xdef	_RGBsetG
 351                     	xdef	_RGBsetR
 352                     	xdef	_RGBinit
 371                     	end
