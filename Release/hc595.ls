   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 10 void hc595Init (void) 
  15                     ; 11 {
  16                     	scross	off
  17  0000               _hc595Init:
  19                     ; 15 	sfr_PORTD.DDR.DDR2 = 1;     // input(=0) or output(=1)
  20  0000 72145011      	bset	20497,#2
  21                     ; 16 	sfr_PORTD.CR1.C12  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  22  0004 72145012      	bset	20498,#2
  23                     ; 17 	sfr_PORTD.CR2.C22  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  24  0008 72145013      	bset	20499,#2
  25                     ; 20 	sfr_PORTC.DDR.DDR7 = 1;     // input(=0) or output(=1)
  26  000c 721e500c      	bset	20492,#7
  27                     ; 21 	sfr_PORTC.CR1.C17  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  28  0010 721e500d      	bset	20493,#7
  29                     ; 22 	sfr_PORTC.CR2.C27  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  30  0014 721e500e      	bset	20494,#7
  31                     ; 25 	sfr_PORTD.DDR.DDR3 = 1;     // input(=0) or output(=1)
  32  0018 72165011      	bset	20497,#3
  33                     ; 26 	sfr_PORTD.CR1.C13  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  34  001c 72165012      	bset	20498,#3
  35                     ; 27 	sfr_PORTD.CR2.C23  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope	
  36  0020 72165013      	bset	20499,#3
  37                     ; 30 	sfr_PORTC.DDR.DDR5 = 1;     // input(=0) or output(=1)
  38  0024 721a500c      	bset	20492,#5
  39                     ; 31 	sfr_PORTC.CR1.C15  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  40  0028 721a500d      	bset	20493,#5
  41                     ; 32 	sfr_PORTC.CR2.C25  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope	
  42  002c 721a500e      	bset	20494,#5
  43                     ; 35 	OE_PIN = 0;
  44  0030 7217500f      	bres	20495,#3
  45                     ; 37 }
  46  0034 81            	ret
  48                     ; 70 void hc595ChainShiftOut (uint8_t *data, uint8_t length) 
  48                     ; 71 {
  49  0035               _hc595ChainShiftOut:
  50  0035 89            	pushw	x
  51  0036 5203          	subw	sp,#3
  52       00000003      OFST:	set	3
  54                     ; 74 	for (r = 0; r < length; r++){
  55  0038 0f01          	clr	(OFST-2,sp)
  57  003a 2033          	jra	L7
  58  003c               L3:
  59                     ; 75 		t = *data++;
  60  003c 1e04          	ldw	x,(OFST+1,sp)
  61  003e 1c0001        	addw	x,#1
  62  0041 1f04          	ldw	(OFST+1,sp),x
  63  0043 1d0001        	subw	x,#1
  64  0046 f6            	ld	a,(x)
  65  0047 6b03          	ld	(OFST+0,sp),a
  66                     ; 76 		for (b = 0; b < 8; b++) {
  67  0049 0f02          	clr	(OFST-1,sp)
  68  004b               L31:
  69                     ; 78 			if (t & 0x80) {
  70  004b 7b03          	ld	a,(OFST+0,sp)
  71  004d a580          	bcp	a,#128
  72  004f 2706          	jreq	L12
  73                     ; 79 					DATA_PIN = 1;
  74  0051 721a500a      	bset	20490,#5
  76  0055 2004          	jra	L32
  77  0057               L12:
  78                     ; 81 					DATA_PIN = 0;
  79  0057 721b500a      	bres	20490,#5
  80  005b               L32:
  81                     ; 84 			CLOCK_PIN = 1;
  82  005b 7214500f      	bset	20495,#2
  83                     ; 85 			t <<= 1;
  84  005f 0803          	sll	(OFST+0,sp)
  85                     ; 86 			CLOCK_PIN = 0;
  86  0061 7215500f      	bres	20495,#2
  87                     ; 76 		for (b = 0; b < 8; b++) {
  88  0065 0c02          	inc	(OFST-1,sp)
  90  0067 7b02          	ld	a,(OFST-1,sp)
  91  0069 a108          	cp	a,#8
  92  006b 25de          	jrult	L31
  93                     ; 74 	for (r = 0; r < length; r++){
  94  006d 0c01          	inc	(OFST-2,sp)
  95  006f               L7:
  97  006f 7b01          	ld	a,(OFST-2,sp)
  98  0071 1108          	cp	a,(OFST+5,sp)
  99  0073 25c7          	jrult	L3
 100                     ; 90 	LATCH_PIN = 1;
 101  0075 721e500a      	bset	20490,#7
 102                     ; 91 	LATCH_PIN = 0;
 103  0079 721f500a      	bres	20490,#7
 104                     ; 92 }
 105  007d 5b05          	addw	sp,#5
 106  007f 81            	ret
 108                     	xdef	_hc595ChainShiftOut
 109                     	xdef	_hc595Init
 110                     	end
