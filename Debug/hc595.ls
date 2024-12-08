   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  43                     ; 10 void hc595Init (void) 
  43                     ; 11 {
  45                     	switch	.text
  46  0000               _hc595Init:
  50                     ; 15 	sfr_PORTD.DDR.DDR2 = 1;     // input(=0) or output(=1)
  52  0000 72145011      	bset	20497,#2
  53                     ; 16 	sfr_PORTD.CR1.C12  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  55  0004 72145012      	bset	20498,#2
  56                     ; 17 	sfr_PORTD.CR2.C22  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  58  0008 72145013      	bset	20499,#2
  59                     ; 20 	sfr_PORTC.DDR.DDR7 = 1;     // input(=0) or output(=1)
  61  000c 721e500c      	bset	20492,#7
  62                     ; 21 	sfr_PORTC.CR1.C17  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  64  0010 721e500d      	bset	20493,#7
  65                     ; 22 	sfr_PORTC.CR2.C27  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  67  0014 721e500e      	bset	20494,#7
  68                     ; 25 	sfr_PORTD.DDR.DDR3 = 1;     // input(=0) or output(=1)
  70  0018 72165011      	bset	20497,#3
  71                     ; 26 	sfr_PORTD.CR1.C13  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  73  001c 72165012      	bset	20498,#3
  74                     ; 27 	sfr_PORTD.CR2.C23  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope	
  76  0020 72165013      	bset	20499,#3
  77                     ; 30 	sfr_PORTC.DDR.DDR5 = 1;     // input(=0) or output(=1)
  79  0024 721a500c      	bset	20492,#5
  80                     ; 31 	sfr_PORTC.CR1.C15  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  82  0028 721a500d      	bset	20493,#5
  83                     ; 32 	sfr_PORTC.CR2.C25  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope	
  85  002c 721a500e      	bset	20494,#5
  86                     ; 35 	OE_PIN = 0;
  88  0030 7217500f      	bres	20495,#3
  89                     ; 37 }
  92  0034 81            	ret
 163                     ; 70 void hc595ChainShiftOut (uint8_t *data, uint8_t length) 
 163                     ; 71 {
 164                     	switch	.text
 165  0035               _hc595ChainShiftOut:
 167  0035 89            	pushw	x
 168  0036 5203          	subw	sp,#3
 169       00000003      OFST:	set	3
 172                     ; 74 	for (r = 0; r < length; r++){
 174  0038 0f01          	clr	(OFST-2,sp)
 177  003a 2033          	jra	L36
 178  003c               L75:
 179                     ; 75 		t = *data++;
 181  003c 1e04          	ldw	x,(OFST+1,sp)
 182  003e 1c0001        	addw	x,#1
 183  0041 1f04          	ldw	(OFST+1,sp),x
 184  0043 1d0001        	subw	x,#1
 185  0046 f6            	ld	a,(x)
 186  0047 6b03          	ld	(OFST+0,sp),a
 188                     ; 76 		for (b = 0; b < 8; b++) {
 190  0049 0f02          	clr	(OFST-1,sp)
 192  004b               L76:
 193                     ; 78 			if (t & 0x80) {
 195  004b 7b03          	ld	a,(OFST+0,sp)
 196  004d a580          	bcp	a,#128
 197  004f 2706          	jreq	L57
 198                     ; 79 					DATA_PIN = 1;
 200  0051 721a500a      	bset	20490,#5
 202  0055 2004          	jra	L77
 203  0057               L57:
 204                     ; 81 					DATA_PIN = 0;
 206  0057 721b500a      	bres	20490,#5
 207  005b               L77:
 208                     ; 84 			CLOCK_PIN = 1;
 210  005b 7214500f      	bset	20495,#2
 211                     ; 85 			t <<= 1;
 213  005f 0803          	sll	(OFST+0,sp)
 215                     ; 86 			CLOCK_PIN = 0;
 217  0061 7215500f      	bres	20495,#2
 218                     ; 76 		for (b = 0; b < 8; b++) {
 220  0065 0c02          	inc	(OFST-1,sp)
 224  0067 7b02          	ld	a,(OFST-1,sp)
 225  0069 a108          	cp	a,#8
 226  006b 25de          	jrult	L76
 227                     ; 74 	for (r = 0; r < length; r++){
 229  006d 0c01          	inc	(OFST-2,sp)
 231  006f               L36:
 234  006f 7b01          	ld	a,(OFST-2,sp)
 235  0071 1108          	cp	a,(OFST+5,sp)
 236  0073 25c7          	jrult	L75
 237                     ; 90 	LATCH_PIN = 1;
 239  0075 721e500a      	bset	20490,#7
 240                     ; 91 	LATCH_PIN = 0;
 242  0079 721f500a      	bres	20490,#7
 243                     ; 92 }
 246  007d 5b05          	addw	sp,#5
 247  007f 81            	ret
 260                     	xdef	_hc595ChainShiftOut
 261                     	xdef	_hc595Init
 280                     	end
