   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 12 void keyboard_init(void)
  15                     ; 13 {
  16                     	scross	off
  17  0000               _keyboard_init:
  19                     ; 15 	sfr_PORTD.DDR.DDR4 = 0;     // input(=0) or output(=1)
  20  0000 72195011      	bres	20497,#4
  21                     ; 16 	sfr_PORTD.CR1.C14  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  22  0004 72185012      	bset	20498,#4
  23                     ; 17 	sfr_PORTD.CR2.C24  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  24  0008 72195013      	bres	20499,#4
  25                     ; 18 	sfr_PORTD.ODR.ODR4 = 1;
  26  000c 7218500f      	bset	20495,#4
  27                     ; 20 	sfr_PORTD.DDR.DDR5 = 0;     // input(=0) or output(=1)
  28  0010 721b5011      	bres	20497,#5
  29                     ; 21 	sfr_PORTD.CR1.C15  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  30  0014 721a5012      	bset	20498,#5
  31                     ; 22 	sfr_PORTD.CR2.C25  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  32  0018 721b5013      	bres	20499,#5
  33                     ; 23 	sfr_PORTD.ODR.ODR5 = 1;
  34  001c 721a500f      	bset	20495,#5
  35                     ; 25 	kbd.S1_reg = 0xFE;
  36  0020 35fe0000      	mov	_kbd,#254
  37                     ; 26 	kbd.S2_reg = 0xFE;
  38  0024 35fe0001      	mov	_kbd+1,#254
  39                     ; 27 	kbd.HeadPtr = 0;
  40  0028 3f03          	clr	_kbd+3
  41                     ; 28 	kbd.TailPtr = 0;
  42  002a 3f04          	clr	_kbd+4
  43                     ; 29 	kbd.Refresh = 0;
  44  002c 3f02          	clr	_kbd+2
  45                     ; 30 }
  46  002e 81            	ret
  48                     ; 32 void keyboard_refresh( void )
  48                     ; 33 {
  49  002f               _keyboard_refresh:
  51                     ; 34 	kbd.S1_reg <<= 1;
  52  002f 3800          	sll	_kbd
  53                     ; 35 	if(!S1_PIN) kbd.S1_reg |= 0x01;
  54  0031 c65010        	ld	a,20496
  55  0034 a510          	bcp	a,#16
  56  0036 2604          	jrne	L5
  58  0038 72100000      	bset	_kbd,#0
  59  003c               L5:
  60                     ; 36 	if(kbd.S1_reg == 0x7F) {insert_button(S1_DOWN);}
  61  003c b600          	ld	a,_kbd
  62  003e a17f          	cp	a,#127
  63  0040 2604          	jrne	L7
  65  0042 a601          	ld	a,#1
  66  0044 ad4f          	call	L3_insert_button
  68  0046               L7:
  69                     ; 37 	if(kbd.S1_reg == 0x80) {insert_button(S1_UP);}
  70  0046 b600          	ld	a,_kbd
  71  0048 a180          	cp	a,#128
  72  004a 2604          	jrne	L11
  74  004c a681          	ld	a,#129
  75  004e ad45          	call	L3_insert_button
  77  0050               L11:
  78                     ; 39 	kbd.S2_reg <<= 1;
  79  0050 3801          	sll	_kbd+1
  80                     ; 40 	if(!S2_PIN) kbd.S2_reg |= 0x01;
  81  0052 c65010        	ld	a,20496
  82  0055 a520          	bcp	a,#32
  83  0057 2604          	jrne	L31
  85  0059 72100001      	bset	_kbd+1,#0
  86  005d               L31:
  87                     ; 41 	if(kbd.S2_reg == 0x7F) {insert_button(S2_DOWN);}
  88  005d b601          	ld	a,_kbd+1
  89  005f a17f          	cp	a,#127
  90  0061 2604          	jrne	L51
  92  0063 a602          	ld	a,#2
  93  0065 ad2e          	call	L3_insert_button
  95  0067               L51:
  96                     ; 42 	if(kbd.S2_reg == 0x80) {insert_button(S2_UP);}
  97  0067 b601          	ld	a,_kbd+1
  98  0069 a180          	cp	a,#128
  99  006b 2604          	jrne	L71
 101  006d a682          	ld	a,#130
 102  006f ad24          	call	L3_insert_button
 104  0071               L71:
 105                     ; 43 }
 106  0071 81            	ret
 108                     ; 46 uint8_t keyboard_get_key(void)
 108                     ; 47 {
 109  0072               _keyboard_get_key:
 110  0072 88            	push	a
 111       00000001      OFST:	set	1
 113                     ; 49 	if(kbd.HeadPtr == kbd.TailPtr) return 255;
 114  0073 b603          	ld	a,_kbd+3
 115  0075 b104          	cp	a,_kbd+4
 116  0077 2605          	jrne	L12
 118  0079 a6ff          	ld	a,#255
 120  007b 5b01          	addw	sp,#1
 121  007d 81            	ret
 122  007e               L12:
 123                     ; 50 	result = kbd.Buffer[kbd.TailPtr];
 124  007e b604          	ld	a,_kbd+4
 125  0080 5f            	clrw	x
 126  0081 97            	ld	xl,a
 127  0082 e605          	ld	a,(_kbd+5,x)
 128  0084 6b01          	ld	(OFST+0,sp),a
 129                     ; 51 	if(++kbd.TailPtr == 8) kbd.TailPtr = 0;
 130  0086 3c04          	inc	_kbd+4
 131  0088 b604          	ld	a,_kbd+4
 132  008a a108          	cp	a,#8
 133  008c 2602          	jrne	L32
 135  008e 3f04          	clr	_kbd+4
 136  0090               L32:
 137                     ; 52 	return(result);
 138  0090 7b01          	ld	a,(OFST+0,sp)
 140  0092 5b01          	addw	sp,#1
 141  0094 81            	ret
 143                     ; 55 static void insert_button(uint8_t b )
 143                     ; 56 {
 144  0095               L3_insert_button:
 145  0095 88            	push	a
 146       00000000      OFST:	set	0
 148                     ; 57 	kbd.Buffer[kbd.HeadPtr] = b;              
 149  0096 b603          	ld	a,_kbd+3
 150  0098 5f            	clrw	x
 151  0099 97            	ld	xl,a
 152  009a 7b01          	ld	a,(OFST+1,sp)
 153  009c e705          	ld	(_kbd+5,x),a
 154                     ; 58 	if(++kbd.HeadPtr == 8) kbd.HeadPtr = 0; 
 155  009e 3c03          	inc	_kbd+3
 156  00a0 b603          	ld	a,_kbd+3
 157  00a2 a108          	cp	a,#8
 158  00a4 2602          	jrne	L52
 160  00a6 3f03          	clr	_kbd+3
 161  00a8               L52:
 162                     ; 59 }
 163  00a8 84            	pop	a
 164  00a9 81            	ret
 166                     	switch	.ubsct
 167  0000               _kbd:
 168  0000 000000000000  	ds.b	13
 169                     	xdef	_kbd
 170                     	xdef	_keyboard_get_key
 171                     	xdef	_keyboard_refresh
 172                     	xdef	_keyboard_init
 173                     	end
