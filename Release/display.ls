   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     	bsct
  16  0000               L3_zero_data:
  17  0000 00            	dc.b	0
  18  0001 00            	dc.b	0
  19  0002 00            	dc.b	0
  20  0003 00            	dc.b	0
  21  0004 00            	dc.b	0
  22  0005               L5_disp_data:
  23  0005 00            	dc.b	0
  24  0006 00            	dc.b	0
  25  0007 00            	dc.b	0
  26  0008 00            	dc.b	0
  27  0009 00            	dc.b	0
  28  000a               L7_disp_data_bright_set:
  29  000a 00            	dc.b	0
  30  000b 00            	dc.b	0
  31  000c 00            	dc.b	0
  32  000d 00            	dc.b	0
  33  000e 00            	dc.b	0
  34                     ; 20 void displayInit ( void )
  34                     ; 21 {
  35                     	scross	off
  36                     	switch	.text
  37  0000               _displayInit:
  39                     ; 23 	sfr_PORTD.DDR.DDR6 = 1;     // input(=0) or output(=1)
  40  0000 721c5011      	bset	20497,#6
  41                     ; 24 	sfr_PORTD.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  42  0004 721c5012      	bset	20498,#6
  43                     ; 25 	sfr_PORTD.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  44  0008 721c5013      	bset	20499,#6
  45                     ; 26 	DOT_PIN = 0;
  46  000c 721d500f      	bres	20495,#6
  47                     ; 29   sfr_TIM2.CR1.ARPE = 1;								// use buffered period register to avoid glitches
  48  0010 721e5300      	bset	21248,#7
  49                     ; 30   sfr_TIM2.PSCR.PSC = 4;								// set TIM2 prescaler fTim = fcpu/2^pre with pre in [0..15]
  50  0014 c6530e        	ld	a,21262
  51  0017 a4f0          	and	a,#240
  52  0019 aa04          	or	a,#4
  53  001b c7530e        	ld	21262,a
  54                     ; 33   sfr_TIM2.ARRH.byte = hibyte(10000);		// set reload period = (ARR+1)/fTim
  55  001e 3527530f      	mov	21263,#39
  56                     ; 34   sfr_TIM2.ARRL.byte = lobyte(10000);
  57  0022 35105310      	mov	21264,#16
  58                     ; 36 	sfr_TIM2.CCR1H.byte = hibyte(1000);		// set PWM channel 1 duty period
  59  0026 35035311      	mov	21265,#3
  60                     ; 37 	sfr_TIM2.CCR1L.byte = lobyte(1000);
  61  002a 35e85312      	mov	21266,#232
  62                     ; 38 	sfr_TIM2.CCR2H.byte = hibyte(0);			// set PWM channel 2 duty period
  63  002e 725f5313      	clr	21267
  64                     ; 39 	sfr_TIM2.CCR2L.byte = lobyte(0);
  65  0032 725f5314      	clr	21268
  66                     ; 41 	sfr_TIM2.CCMR1.OC1PE 	= 1;						// buffer compare register to avoid glitches when changing duty cycle
  67  0036 72165307      	bset	21255,#3
  68                     ; 42 	sfr_TIM2.CCER1.CC1E 	= 0;						// TIM2 channel 1 output disable
  69  003a 7211530a      	bres	21258,#0
  70                     ; 43 	sfr_TIM2.CCER1.CC2E 	= 0;						// TIM2 channel 2 output disable
  71  003e 7219530a      	bres	21258,#4
  72                     ; 44 	sfr_TIM2.IER.CC1IE 		= 1;						// TIM2 channel 1 compare interrupt enable
  73  0042 72125303      	bset	21251,#1
  74                     ; 46 	sfr_TIM2.IER.UIE 			= 1;						// TIM2 update interrupt enable
  75  0046 72105303      	bset	21251,#0
  76                     ; 47 	sfr_TIM2.CR1.CEN     	= 1;						// start TIM2
  77  004a 72105300      	bset	21248,#0
  78                     ; 49 	hc595Init();
  79  004e cd0000        	call	_hc595Init
  81                     ; 50 	displaySetBright(100);
  82  0051 a664          	ld	a,#100
  83  0053 cd0262        	call	_displaySetBright
  85                     ; 51 	displayDot(0);
  86  0056 4f            	clr	a
  87  0057 cd02c3        	call	_displayDot
  89                     ; 52 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
  90  005a 4b05          	push	#5
  91  005c ae0005        	ldw	x,#L5_disp_data
  92  005f cd0000        	call	_hc595ChainShiftOut
  94  0062 84            	pop	a
  95                     ; 55 	RGBinit();
  96  0063 cd0000        	call	_RGBinit
  98                     ; 56 	displayRGBset(e.rgbGlobalEn);
  99  0066 b60b          	ld	a,_e+11
 100  0068 cd03da        	call	_displayRGBset
 102                     ; 57 }
 103  006b 81            	ret
 105                     .const:	section	.text
 106  0000               L12_data:
 107  0000 00            	dc.b	0
 108  0001 00            	dc.b	0
 109  0002 00            	dc.b	0
 110  0003 00            	dc.b	0
 111  0004 00            	dc.b	0
 112                     ; 61 static uint8_t *displayNixieBuffPrepare(uint8_t *inbuff, uint8_t dmask)
 112                     ; 62 {
 113                     	switch	.text
 114  006c               L51_displayNixieBuffPrepare:
 115  006c 89            	pushw	x
 116  006d 5205          	subw	sp,#5
 117       00000005      OFST:	set	5
 119                     ; 63 	uint8_t data[5] = {0,0,0,0,0};
 120  006f 96            	ldw	x,sp
 121  0070 1c0001        	addw	x,#OFST-4
 122  0073 90ae0000      	ldw	y,#L12_data
 123  0077 a605          	ld	a,#5
 124  0079 cd0000        	call	c_xymov
 126                     ; 65 	if (bitchk(dmask,0)){
 127  007c 7b0a          	ld	a,(OFST+5,sp)
 128  007e a501          	bcp	a,#1
 129  0080 2771          	jreq	L351
 130                     ; 67 		switch(inbuff[0]){
 131  0082 1e06          	ldw	x,(OFST+1,sp)
 132  0084 f6            	ld	a,(x)
 134                     ; 98 			default:
 134                     ; 99 				break;
 135  0085 4d            	tnz	a
 136  0086 271d          	jreq	L32
 137  0088 4a            	dec	a
 138  0089 2722          	jreq	L52
 139  008b 4a            	dec	a
 140  008c 2727          	jreq	L72
 141  008e 4a            	dec	a
 142  008f 272c          	jreq	L13
 143  0091 4a            	dec	a
 144  0092 2731          	jreq	L33
 145  0094 4a            	dec	a
 146  0095 2736          	jreq	L53
 147  0097 4a            	dec	a
 148  0098 273b          	jreq	L73
 149  009a 4a            	dec	a
 150  009b 2740          	jreq	L14
 151  009d 4a            	dec	a
 152  009e 2745          	jreq	L34
 153  00a0 4a            	dec	a
 154  00a1 274a          	jreq	L54
 155  00a3 204e          	jra	L351
 156  00a5               L32:
 157                     ; 68 			case 0:
 157                     ; 69 				bitset(data[4],0);
 158  00a5 7b05          	ld	a,(OFST+0,sp)
 159  00a7 aa01          	or	a,#1
 160  00a9 6b05          	ld	(OFST+0,sp),a
 161                     ; 70 				break;
 162  00ab 2046          	jra	L351
 163  00ad               L52:
 164                     ; 71 			case 1:
 164                     ; 72 				bitset(data[4],1);
 165  00ad 7b05          	ld	a,(OFST+0,sp)
 166  00af aa02          	or	a,#2
 167  00b1 6b05          	ld	(OFST+0,sp),a
 168                     ; 73 				break;
 169  00b3 203e          	jra	L351
 170  00b5               L72:
 171                     ; 74 			case 2:
 171                     ; 75 				bitset(data[4],2);
 172  00b5 7b05          	ld	a,(OFST+0,sp)
 173  00b7 aa04          	or	a,#4
 174  00b9 6b05          	ld	(OFST+0,sp),a
 175                     ; 76 				break;
 176  00bb 2036          	jra	L351
 177  00bd               L13:
 178                     ; 77 			case 3:
 178                     ; 78 				bitset(data[4],3);
 179  00bd 7b05          	ld	a,(OFST+0,sp)
 180  00bf aa08          	or	a,#8
 181  00c1 6b05          	ld	(OFST+0,sp),a
 182                     ; 79 				break;
 183  00c3 202e          	jra	L351
 184  00c5               L33:
 185                     ; 80 			case 4:
 185                     ; 81 				bitset(data[4],4);
 186  00c5 7b05          	ld	a,(OFST+0,sp)
 187  00c7 aa10          	or	a,#16
 188  00c9 6b05          	ld	(OFST+0,sp),a
 189                     ; 82 				break;
 190  00cb 2026          	jra	L351
 191  00cd               L53:
 192                     ; 83 			case 5:
 192                     ; 84 				bitset(data[4],5);
 193  00cd 7b05          	ld	a,(OFST+0,sp)
 194  00cf aa20          	or	a,#32
 195  00d1 6b05          	ld	(OFST+0,sp),a
 196                     ; 85 				break;
 197  00d3 201e          	jra	L351
 198  00d5               L73:
 199                     ; 86 			case 6:
 199                     ; 87 				bitset(data[4],6);
 200  00d5 7b05          	ld	a,(OFST+0,sp)
 201  00d7 aa40          	or	a,#64
 202  00d9 6b05          	ld	(OFST+0,sp),a
 203                     ; 88 				break;
 204  00db 2016          	jra	L351
 205  00dd               L14:
 206                     ; 89 			case 7:
 206                     ; 90 				bitset(data[4],7);
 207  00dd 7b05          	ld	a,(OFST+0,sp)
 208  00df aa80          	or	a,#128
 209  00e1 6b05          	ld	(OFST+0,sp),a
 210                     ; 91 				break;
 211  00e3 200e          	jra	L351
 212  00e5               L34:
 213                     ; 92 			case 8:
 213                     ; 93 				bitset(data[3],0);
 214  00e5 7b04          	ld	a,(OFST-1,sp)
 215  00e7 aa01          	or	a,#1
 216  00e9 6b04          	ld	(OFST-1,sp),a
 217                     ; 94 				break;
 218  00eb 2006          	jra	L351
 219  00ed               L54:
 220                     ; 95 			case 9:
 220                     ; 96 				bitset(data[3],1);
 221  00ed 7b04          	ld	a,(OFST-1,sp)
 222  00ef aa02          	or	a,#2
 223  00f1 6b04          	ld	(OFST-1,sp),a
 224                     ; 97 				break;
 225  00f3               L74:
 226                     ; 98 			default:
 226                     ; 99 				break;
 227  00f3               L751:
 228  00f3               L351:
 229                     ; 102 	if (bitchk(dmask,1)){
 230  00f3 7b0a          	ld	a,(OFST+5,sp)
 231  00f5 a502          	bcp	a,#2
 232  00f7 2772          	jreq	L161
 233                     ; 104 		switch(inbuff[1]){
 234  00f9 1e06          	ldw	x,(OFST+1,sp)
 235  00fb e601          	ld	a,(1,x)
 237                     ; 135 			default:
 237                     ; 136 			break;
 238  00fd 4d            	tnz	a
 239  00fe 271d          	jreq	L15
 240  0100 4a            	dec	a
 241  0101 2722          	jreq	L35
 242  0103 4a            	dec	a
 243  0104 2727          	jreq	L55
 244  0106 4a            	dec	a
 245  0107 272c          	jreq	L75
 246  0109 4a            	dec	a
 247  010a 2731          	jreq	L16
 248  010c 4a            	dec	a
 249  010d 2736          	jreq	L36
 250  010f 4a            	dec	a
 251  0110 273b          	jreq	L56
 252  0112 4a            	dec	a
 253  0113 2740          	jreq	L76
 254  0115 4a            	dec	a
 255  0116 2745          	jreq	L17
 256  0118 4a            	dec	a
 257  0119 274a          	jreq	L37
 258  011b 204e          	jra	L161
 259  011d               L15:
 260                     ; 105 			case 0:
 260                     ; 106 				bitset(data[3],2);
 261  011d 7b04          	ld	a,(OFST-1,sp)
 262  011f aa04          	or	a,#4
 263  0121 6b04          	ld	(OFST-1,sp),a
 264                     ; 107 				break;
 265  0123 2046          	jra	L161
 266  0125               L35:
 267                     ; 108 			case 1:
 267                     ; 109 				bitset(data[3],3);
 268  0125 7b04          	ld	a,(OFST-1,sp)
 269  0127 aa08          	or	a,#8
 270  0129 6b04          	ld	(OFST-1,sp),a
 271                     ; 110 				break;
 272  012b 203e          	jra	L161
 273  012d               L55:
 274                     ; 111 			case 2:
 274                     ; 112 				bitset(data[3],4);
 275  012d 7b04          	ld	a,(OFST-1,sp)
 276  012f aa10          	or	a,#16
 277  0131 6b04          	ld	(OFST-1,sp),a
 278                     ; 113 				break;
 279  0133 2036          	jra	L161
 280  0135               L75:
 281                     ; 114 			case 3:
 281                     ; 115 				bitset(data[3],5);
 282  0135 7b04          	ld	a,(OFST-1,sp)
 283  0137 aa20          	or	a,#32
 284  0139 6b04          	ld	(OFST-1,sp),a
 285                     ; 116 				break;
 286  013b 202e          	jra	L161
 287  013d               L16:
 288                     ; 117 			case 4:
 288                     ; 118 				bitset(data[3],6);
 289  013d 7b04          	ld	a,(OFST-1,sp)
 290  013f aa40          	or	a,#64
 291  0141 6b04          	ld	(OFST-1,sp),a
 292                     ; 119 				break;
 293  0143 2026          	jra	L161
 294  0145               L36:
 295                     ; 120 			case 5:
 295                     ; 121 				bitset(data[3],7);
 296  0145 7b04          	ld	a,(OFST-1,sp)
 297  0147 aa80          	or	a,#128
 298  0149 6b04          	ld	(OFST-1,sp),a
 299                     ; 122 				break;
 300  014b 201e          	jra	L161
 301  014d               L56:
 302                     ; 123 			case 6:
 302                     ; 124 				bitset(data[2],0);
 303  014d 7b03          	ld	a,(OFST-2,sp)
 304  014f aa01          	or	a,#1
 305  0151 6b03          	ld	(OFST-2,sp),a
 306                     ; 125 				break;
 307  0153 2016          	jra	L161
 308  0155               L76:
 309                     ; 126 			case 7:
 309                     ; 127 				bitset(data[2],1);
 310  0155 7b03          	ld	a,(OFST-2,sp)
 311  0157 aa02          	or	a,#2
 312  0159 6b03          	ld	(OFST-2,sp),a
 313                     ; 128 				break;
 314  015b 200e          	jra	L161
 315  015d               L17:
 316                     ; 129 			case 8:
 316                     ; 130 				bitset(data[2],2);
 317  015d 7b03          	ld	a,(OFST-2,sp)
 318  015f aa04          	or	a,#4
 319  0161 6b03          	ld	(OFST-2,sp),a
 320                     ; 131 				break;
 321  0163 2006          	jra	L161
 322  0165               L37:
 323                     ; 132 			case 9:
 323                     ; 133 				bitset(data[2],3);
 324  0165 7b03          	ld	a,(OFST-2,sp)
 325  0167 aa08          	or	a,#8
 326  0169 6b03          	ld	(OFST-2,sp),a
 327                     ; 134 				break;
 328  016b               L57:
 329                     ; 135 			default:
 329                     ; 136 			break;
 330  016b               L561:
 331  016b               L161:
 332                     ; 139 	if (bitchk(dmask,2)){
 333  016b 7b0a          	ld	a,(OFST+5,sp)
 334  016d a504          	bcp	a,#4
 335  016f 2772          	jreq	L761
 336                     ; 141 		switch(inbuff[2]){
 337  0171 1e06          	ldw	x,(OFST+1,sp)
 338  0173 e602          	ld	a,(2,x)
 340                     ; 172 			default:
 340                     ; 173 			break;
 341  0175 4d            	tnz	a
 342  0176 271d          	jreq	L77
 343  0178 4a            	dec	a
 344  0179 2722          	jreq	L101
 345  017b 4a            	dec	a
 346  017c 2727          	jreq	L301
 347  017e 4a            	dec	a
 348  017f 272c          	jreq	L501
 349  0181 4a            	dec	a
 350  0182 2731          	jreq	L701
 351  0184 4a            	dec	a
 352  0185 2736          	jreq	L111
 353  0187 4a            	dec	a
 354  0188 273b          	jreq	L311
 355  018a 4a            	dec	a
 356  018b 2740          	jreq	L511
 357  018d 4a            	dec	a
 358  018e 2745          	jreq	L711
 359  0190 4a            	dec	a
 360  0191 274a          	jreq	L121
 361  0193 204e          	jra	L761
 362  0195               L77:
 363                     ; 142 			case 0:
 363                     ; 143 				bitset(data[2],4);
 364  0195 7b03          	ld	a,(OFST-2,sp)
 365  0197 aa10          	or	a,#16
 366  0199 6b03          	ld	(OFST-2,sp),a
 367                     ; 144 				break;
 368  019b 2046          	jra	L761
 369  019d               L101:
 370                     ; 145 			case 1:
 370                     ; 146 				bitset(data[2],5);
 371  019d 7b03          	ld	a,(OFST-2,sp)
 372  019f aa20          	or	a,#32
 373  01a1 6b03          	ld	(OFST-2,sp),a
 374                     ; 147 				break;
 375  01a3 203e          	jra	L761
 376  01a5               L301:
 377                     ; 148 			case 2:
 377                     ; 149 				bitset(data[2],6);
 378  01a5 7b03          	ld	a,(OFST-2,sp)
 379  01a7 aa40          	or	a,#64
 380  01a9 6b03          	ld	(OFST-2,sp),a
 381                     ; 150 				break;
 382  01ab 2036          	jra	L761
 383  01ad               L501:
 384                     ; 151 			case 3:
 384                     ; 152 				bitset(data[2],7);
 385  01ad 7b03          	ld	a,(OFST-2,sp)
 386  01af aa80          	or	a,#128
 387  01b1 6b03          	ld	(OFST-2,sp),a
 388                     ; 153 				break;
 389  01b3 202e          	jra	L761
 390  01b5               L701:
 391                     ; 154 			case 4:
 391                     ; 155 				bitset(data[1],0);
 392  01b5 7b02          	ld	a,(OFST-3,sp)
 393  01b7 aa01          	or	a,#1
 394  01b9 6b02          	ld	(OFST-3,sp),a
 395                     ; 156 				break;
 396  01bb 2026          	jra	L761
 397  01bd               L111:
 398                     ; 157 			case 5:
 398                     ; 158 				bitset(data[1],1);
 399  01bd 7b02          	ld	a,(OFST-3,sp)
 400  01bf aa02          	or	a,#2
 401  01c1 6b02          	ld	(OFST-3,sp),a
 402                     ; 159 				break;
 403  01c3 201e          	jra	L761
 404  01c5               L311:
 405                     ; 160 			case 6:
 405                     ; 161 				bitset(data[1],2);
 406  01c5 7b02          	ld	a,(OFST-3,sp)
 407  01c7 aa04          	or	a,#4
 408  01c9 6b02          	ld	(OFST-3,sp),a
 409                     ; 162 				break;
 410  01cb 2016          	jra	L761
 411  01cd               L511:
 412                     ; 163 			case 7:
 412                     ; 164 				bitset(data[1],3);
 413  01cd 7b02          	ld	a,(OFST-3,sp)
 414  01cf aa08          	or	a,#8
 415  01d1 6b02          	ld	(OFST-3,sp),a
 416                     ; 165 				break;
 417  01d3 200e          	jra	L761
 418  01d5               L711:
 419                     ; 166 			case 8:
 419                     ; 167 				bitset(data[1],4);
 420  01d5 7b02          	ld	a,(OFST-3,sp)
 421  01d7 aa10          	or	a,#16
 422  01d9 6b02          	ld	(OFST-3,sp),a
 423                     ; 168 				break;
 424  01db 2006          	jra	L761
 425  01dd               L121:
 426                     ; 169 			case 9:
 426                     ; 170 				bitset(data[1],5);
 427  01dd 7b02          	ld	a,(OFST-3,sp)
 428  01df aa20          	or	a,#32
 429  01e1 6b02          	ld	(OFST-3,sp),a
 430                     ; 171 				break;
 431  01e3               L321:
 432                     ; 172 			default:
 432                     ; 173 			break;
 433  01e3               L371:
 434  01e3               L761:
 435                     ; 176 	if (bitchk(dmask,3)){
 436  01e3 7b0a          	ld	a,(OFST+5,sp)
 437  01e5 a508          	bcp	a,#8
 438  01e7 2772          	jreq	L571
 439                     ; 178 		switch(inbuff[3]){
 440  01e9 1e06          	ldw	x,(OFST+1,sp)
 441  01eb e603          	ld	a,(3,x)
 443                     ; 209 			default:
 443                     ; 210 			break;
 444  01ed 4d            	tnz	a
 445  01ee 271d          	jreq	L521
 446  01f0 4a            	dec	a
 447  01f1 2722          	jreq	L721
 448  01f3 4a            	dec	a
 449  01f4 2727          	jreq	L131
 450  01f6 4a            	dec	a
 451  01f7 272c          	jreq	L331
 452  01f9 4a            	dec	a
 453  01fa 2731          	jreq	L531
 454  01fc 4a            	dec	a
 455  01fd 2736          	jreq	L731
 456  01ff 4a            	dec	a
 457  0200 273b          	jreq	L141
 458  0202 4a            	dec	a
 459  0203 2740          	jreq	L341
 460  0205 4a            	dec	a
 461  0206 2745          	jreq	L541
 462  0208 4a            	dec	a
 463  0209 274a          	jreq	L741
 464  020b 204e          	jra	L571
 465  020d               L521:
 466                     ; 179 			case 0:
 466                     ; 180 				bitset(data[1],6);
 467  020d 7b02          	ld	a,(OFST-3,sp)
 468  020f aa40          	or	a,#64
 469  0211 6b02          	ld	(OFST-3,sp),a
 470                     ; 181 				break;
 471  0213 2046          	jra	L571
 472  0215               L721:
 473                     ; 182 			case 1:
 473                     ; 183 				bitset(data[1],7);
 474  0215 7b02          	ld	a,(OFST-3,sp)
 475  0217 aa80          	or	a,#128
 476  0219 6b02          	ld	(OFST-3,sp),a
 477                     ; 184 				break;
 478  021b 203e          	jra	L571
 479  021d               L131:
 480                     ; 185 			case 2:
 480                     ; 186 				bitset(data[0],0);
 481  021d 7b01          	ld	a,(OFST-4,sp)
 482  021f aa01          	or	a,#1
 483  0221 6b01          	ld	(OFST-4,sp),a
 484                     ; 187 				break;
 485  0223 2036          	jra	L571
 486  0225               L331:
 487                     ; 188 			case 3:
 487                     ; 189 				bitset(data[0],1);
 488  0225 7b01          	ld	a,(OFST-4,sp)
 489  0227 aa02          	or	a,#2
 490  0229 6b01          	ld	(OFST-4,sp),a
 491                     ; 190 				break;
 492  022b 202e          	jra	L571
 493  022d               L531:
 494                     ; 191 			case 4:
 494                     ; 192 				bitset(data[0],2);
 495  022d 7b01          	ld	a,(OFST-4,sp)
 496  022f aa04          	or	a,#4
 497  0231 6b01          	ld	(OFST-4,sp),a
 498                     ; 193 				break;
 499  0233 2026          	jra	L571
 500  0235               L731:
 501                     ; 194 			case 5:
 501                     ; 195 				bitset(data[0],3);
 502  0235 7b01          	ld	a,(OFST-4,sp)
 503  0237 aa08          	or	a,#8
 504  0239 6b01          	ld	(OFST-4,sp),a
 505                     ; 196 				break;
 506  023b 201e          	jra	L571
 507  023d               L141:
 508                     ; 197 			case 6:
 508                     ; 198 				bitset(data[0],4);
 509  023d 7b01          	ld	a,(OFST-4,sp)
 510  023f aa10          	or	a,#16
 511  0241 6b01          	ld	(OFST-4,sp),a
 512                     ; 199 				break;
 513  0243 2016          	jra	L571
 514  0245               L341:
 515                     ; 200 			case 7:
 515                     ; 201 				bitset(data[0],5);
 516  0245 7b01          	ld	a,(OFST-4,sp)
 517  0247 aa20          	or	a,#32
 518  0249 6b01          	ld	(OFST-4,sp),a
 519                     ; 202 				break;
 520  024b 200e          	jra	L571
 521  024d               L541:
 522                     ; 203 			case 8:
 522                     ; 204 				bitset(data[0],6);
 523  024d 7b01          	ld	a,(OFST-4,sp)
 524  024f aa40          	or	a,#64
 525  0251 6b01          	ld	(OFST-4,sp),a
 526                     ; 205 				break;
 527  0253 2006          	jra	L571
 528  0255               L741:
 529                     ; 206 			case 9:
 529                     ; 207 				bitset(data[0],7);
 530  0255 7b01          	ld	a,(OFST-4,sp)
 531  0257 aa80          	or	a,#128
 532  0259 6b01          	ld	(OFST-4,sp),a
 533                     ; 208 				break;
 534  025b               L151:
 535                     ; 209 			default:
 535                     ; 210 			break;
 536  025b               L102:
 537  025b               L571:
 538                     ; 213 	return data;
 539  025b 96            	ldw	x,sp
 540  025c 1c0001        	addw	x,#OFST-4
 542  025f 5b07          	addw	sp,#7
 543  0261 81            	ret
 545                     ; 371 void displaySetBright(uint8_t bright)
 545                     ; 372 {
 546  0262               _displaySetBright:
 547  0262 88            	push	a
 548       00000000      OFST:	set	0
 550                     ; 373 	if (bright == 0){
 551  0263 4d            	tnz	a
 552  0264 260a          	jrne	L302
 553                     ; 374 		memset(disp_data,0,sizeof(disp_data));
 554  0266 ae0005        	ldw	x,#5
 555  0269               L01:
 556  0269 6f04          	clr	(L5_disp_data-1,x)
 557  026b 5a            	decw	x
 558  026c 26fb          	jrne	L01
 560  026e 2023          	jra	L502
 561  0270               L302:
 562                     ; 376 		displayBright = scale(bright,100,10000);
 563  0270 7b01          	ld	a,(OFST+1,sp)
 564  0272 5f            	clrw	x
 565  0273 97            	ld	xl,a
 566  0274 a664          	ld	a,#100
 567  0276 cd0000        	call	c_bmulx
 569  0279 bf00          	ldw	L31_displayBright,x
 570                     ; 377 		if (displayBright < NIXIE_MIN_BRIGHT){
 571  027b be00          	ldw	x,L31_displayBright
 572  027d a30064        	cpw	x,#100
 573  0280 2405          	jruge	L702
 574                     ; 378 			displayBright = NIXIE_MIN_BRIGHT;
 575  0282 ae0064        	ldw	x,#100
 576  0285 bf00          	ldw	L31_displayBright,x
 577  0287               L702:
 578                     ; 380 		sfr_TIM2.CCR1H.byte = hibyte(displayBright);		// set PWM channel 1 duty period
 579  0287 5500005311    	mov	21265,L31_displayBright
 580                     ; 381 		sfr_TIM2.CCR1L.byte = lobyte(displayBright);
 581  028c b601          	ld	a,L31_displayBright+1
 582  028e a4ff          	and	a,#255
 583  0290 c75312        	ld	21266,a
 584  0293               L502:
 585                     ; 383 }
 586  0293 84            	pop	a
 587  0294 81            	ret
 589                     ; 388 void displayNixie(uint8_t *data, uint8_t full_bright_bitmask)
 589                     ; 389 {
 590  0295               _displayNixie:
 591  0295 89            	pushw	x
 592       00000000      OFST:	set	0
 594                     ; 390 	memcpy(disp_data,displayNixieBuffPrepare(data,bin(00001111)),sizeof(disp_data));
 595  0296 4b0f          	push	#15
 596  0298 cd006c        	call	L51_displayNixieBuffPrepare
 598  029b 84            	pop	a
 599  029c bf00          	ldw	c_x,x
 600  029e ae0005        	ldw	x,#5
 601  02a1               L41:
 602  02a1 5a            	decw	x
 603  02a2 92d600        	ld	a,([c_x.w],x)
 604  02a5 e705          	ld	(L5_disp_data,x),a
 605  02a7 5d            	tnzw	x
 606  02a8 26f7          	jrne	L41
 607                     ; 391 	memcpy(zero_data,displayNixieBuffPrepare(data,full_bright_bitmask),sizeof(zero_data));
 608  02aa 7b05          	ld	a,(OFST+5,sp)
 609  02ac 88            	push	a
 610  02ad 1e02          	ldw	x,(OFST+2,sp)
 611  02af cd006c        	call	L51_displayNixieBuffPrepare
 613  02b2 84            	pop	a
 614  02b3 bf00          	ldw	c_x,x
 615  02b5 ae0005        	ldw	x,#5
 616  02b8               L61:
 617  02b8 5a            	decw	x
 618  02b9 92d600        	ld	a,([c_x.w],x)
 619  02bc e700          	ld	(L3_zero_data,x),a
 620  02be 5d            	tnzw	x
 621  02bf 26f7          	jrne	L61
 622                     ; 392 }
 623  02c1 85            	popw	x
 624  02c2 81            	ret
 626                     ; 394 void displayDot (uint8_t state) 
 626                     ; 395 {
 627  02c3               _displayDot:
 628  02c3 89            	pushw	x
 629       00000002      OFST:	set	2
 631                     ; 396 	uint16_t bright = displayBright;
 632  02c4 be00          	ldw	x,L31_displayBright
 633  02c6 1f01          	ldw	(OFST-1,sp),x
 634                     ; 398 	if (state == 0) {
 635  02c8 4d            	tnz	a
 636  02c9 260a          	jrne	L112
 637                     ; 399 		sfr_TIM2.IER.CC2IE 		= 0;							// TIM2 channel 2 compare interrupt disable
 638  02cb 72155303      	bres	21251,#2
 639                     ; 400 		DOT_PIN = 0;
 640  02cf 721d500f      	bres	20495,#6
 642  02d3 201c          	jra	L312
 643  02d5               L112:
 644                     ; 402 		if (bright < DOT_MIN_BRIGHT) {
 645  02d5 1e01          	ldw	x,(OFST-1,sp)
 646  02d7 a30064        	cpw	x,#100
 647  02da 2405          	jruge	L512
 648                     ; 403 			bright = DOT_MIN_BRIGHT;
 649  02dc ae0064        	ldw	x,#100
 650  02df 1f01          	ldw	(OFST-1,sp),x
 651  02e1               L512:
 652                     ; 405 		sfr_TIM2.CCR2H.byte = hibyte(bright);		// set PWM channel 2 duty period
 653  02e1 7b01          	ld	a,(OFST-1,sp)
 654  02e3 c75313        	ld	21267,a
 655                     ; 406 		sfr_TIM2.CCR2L.byte = lobyte(bright);
 656  02e6 7b02          	ld	a,(OFST+0,sp)
 657  02e8 a4ff          	and	a,#255
 658  02ea c75314        	ld	21268,a
 659                     ; 407 		sfr_TIM2.IER.CC2IE 		= 1;							// TIM2 channel 2 compare interrupt enable
 660  02ed 72145303      	bset	21251,#2
 661  02f1               L312:
 662                     ; 409 }
 663  02f1 85            	popw	x
 664  02f2 81            	ret
 666                     ; 411 void displayDotPulse (void) 
 666                     ; 412 {
 667  02f3               _displayDotPulse:
 669                     ; 413 	dotPulseCounter = 0;
 670  02f3 3f03          	clr	L11_dotPulseCounter
 671                     ; 414 }
 672  02f5 81            	ret
 674                     ; 416 void displayDotPulseProc (void)
 674                     ; 417 {
 675  02f6               _displayDotPulseProc:
 677                     ; 418 	if (dotPulseCounter < 25){
 678  02f6 b603          	ld	a,L11_dotPulseCounter
 679  02f8 a119          	cp	a,#25
 680  02fa 2408          	jruge	L712
 681                     ; 419 		displaySetDotBright(dotPulseCounter*4);
 682  02fc b603          	ld	a,L11_dotPulseCounter
 683  02fe 48            	sll	a
 684  02ff 48            	sll	a
 685  0300 ad19          	call	L71_displaySetDotBright
 688  0302 200e          	jra	L122
 689  0304               L712:
 690                     ; 420 	}else if (dotPulseCounter < 50){
 691  0304 b603          	ld	a,L11_dotPulseCounter
 692  0306 a132          	cp	a,#50
 693  0308 2408          	jruge	L122
 694                     ; 421 		displaySetDotBright((49-dotPulseCounter)*4);
 695  030a a631          	ld	a,#49
 696  030c b003          	sub	a,L11_dotPulseCounter
 697  030e 48            	sll	a
 698  030f 48            	sll	a
 699  0310 ad09          	call	L71_displaySetDotBright
 701  0312               L122:
 702                     ; 423 	if (dotPulseCounter < 50){
 703  0312 b603          	ld	a,L11_dotPulseCounter
 704  0314 a132          	cp	a,#50
 705  0316 2402          	jruge	L522
 706                     ; 424 		dotPulseCounter++;
 707  0318 3c03          	inc	L11_dotPulseCounter
 708  031a               L522:
 709                     ; 426 }
 710  031a 81            	ret
 712                     	switch	.const
 713  0005               L03:
 714  0005 00000064      	dc.l	100
 715                     ; 428 static void displaySetDotBright( uint8_t bright)
 715                     ; 429 {
 716                     	switch	.text
 717  031b               L71_displaySetDotBright:
 718  031b 88            	push	a
 719  031c 89            	pushw	x
 720       00000002      OFST:	set	2
 722                     ; 432 	if (bright == 0) {
 723  031d 4d            	tnz	a
 724  031e 260a          	jrne	L722
 725                     ; 433 		sfr_TIM2.IER.CC2IE 		= 0;						// TIM2 channel 2 compare interrupt disable
 726  0320 72155303      	bres	21251,#2
 727                     ; 434 		DOT_PIN = 0;
 728  0324 721d500f      	bres	20495,#6
 730  0328 2030          	jra	L132
 731  032a               L722:
 732                     ; 436 		b = scale(bright,100,displayBright);
 733  032a 7b03          	ld	a,(OFST+1,sp)
 734  032c 5f            	clrw	x
 735  032d 97            	ld	xl,a
 736  032e 90be00        	ldw	y,L31_displayBright
 737  0331 cd0000        	call	c_umul
 739  0334 ae0005        	ldw	x,#L03
 740  0337 cd0000        	call	c_ldiv
 742  033a be02          	ldw	x,c_lreg+2
 743  033c 1f01          	ldw	(OFST-1,sp),x
 744                     ; 437 		if (b < DOT_MIN_BRIGHT) {b = DOT_MIN_BRIGHT;}
 745  033e 1e01          	ldw	x,(OFST-1,sp)
 746  0340 a30064        	cpw	x,#100
 747  0343 2405          	jruge	L332
 749  0345 ae0064        	ldw	x,#100
 750  0348 1f01          	ldw	(OFST-1,sp),x
 751  034a               L332:
 752                     ; 438 		sfr_TIM2.CCR2H.byte = hibyte(b);		// set PWM channel 2 duty period
 753  034a 7b01          	ld	a,(OFST-1,sp)
 754  034c c75313        	ld	21267,a
 755                     ; 439 		sfr_TIM2.CCR2L.byte = lobyte(b);
 756  034f 7b02          	ld	a,(OFST+0,sp)
 757  0351 a4ff          	and	a,#255
 758  0353 c75314        	ld	21268,a
 759                     ; 440 		sfr_TIM2.IER.CC2IE 		= 1;					// TIM2 channel 2 compare interrupt enable
 760  0356 72145303      	bset	21251,#2
 761  035a               L132:
 762                     ; 442 }
 763  035a 5b03          	addw	sp,#3
 764  035c 81            	ret
 766                     ; 444 ISR_HANDLER (TIM2_UPD_ISR, _TIM2_OVR_UIF_VECTOR_)
 766                     ; 445 {
 767                     	scross	on
 768  035d               f_TIM2_UPD_ISR:
 769  035d 8a            	push	cc
 770  035e 84            	pop	a
 771  035f a4bf          	and	a,#191
 772  0361 88            	push	a
 773  0362 86            	pop	cc
 774  0363 3b0002        	push	c_x+2
 775  0366 be00          	ldw	x,c_x
 776  0368 89            	pushw	x
 777  0369 3b0002        	push	c_y+2
 778  036c be00          	ldw	x,c_y
 779  036e 89            	pushw	x
 781                     ; 446 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
 782  036f 4b05          	push	#5
 783  0371 ae0005        	ldw	x,#L5_disp_data
 784  0374 cd0000        	call	_hc595ChainShiftOut
 786  0377 84            	pop	a
 787                     ; 447 	if (sfr_TIM2.IER.CC2IE)
 788  0378 c65303        	ld	a,21251
 789  037b a504          	bcp	a,#4
 790  037d 2704          	jreq	L532
 791                     ; 449 		DOT_PIN = 1;
 792  037f 721c500f      	bset	20495,#6
 793  0383               L532:
 794                     ; 451 	flag10ms = 1;
 795  0383 35010002      	mov	_flag10ms,#1
 796                     ; 452 	sfr_TIM2.SR1.UIF = 0;
 797  0387 72115304      	bres	21252,#0
 798                     ; 453   return;
 799  038b 85            	popw	x
 800  038c bf00          	ldw	c_y,x
 801  038e 320002        	pop	c_y+2
 802  0391 85            	popw	x
 803  0392 bf00          	ldw	c_x,x
 804  0394 320002        	pop	c_x+2
 805  0397 80            	iret
 806                     ; 457 ISR_HANDLER (TIM2_CAP_ISR, _TIM2_CAPCOM_CC1IF_VECTOR_)
 806                     ; 458 {
 807  0398               f_TIM2_CAP_ISR:
 808  0398 8a            	push	cc
 809  0399 84            	pop	a
 810  039a a4bf          	and	a,#191
 811  039c 88            	push	a
 812  039d 86            	pop	cc
 813  039e 3b0002        	push	c_x+2
 814  03a1 be00          	ldw	x,c_x
 815  03a3 89            	pushw	x
 816  03a4 3b0002        	push	c_y+2
 817  03a7 be00          	ldw	x,c_y
 818  03a9 89            	pushw	x
 820                     ; 460 	if(sfr_TIM2.SR1.CC1IF){
 821  03aa c65304        	ld	a,21252
 822  03ad a502          	bcp	a,#2
 823  03af 270d          	jreq	L732
 824                     ; 461 		hc595ChainShiftOut(zero_data,sizeof(zero_data));
 825  03b1 4b05          	push	#5
 826  03b3 ae0000        	ldw	x,#L3_zero_data
 827  03b6 cd0000        	call	_hc595ChainShiftOut
 829  03b9 84            	pop	a
 830                     ; 462 		sfr_TIM2.SR1.CC1IF = 0;
 831  03ba 72135304      	bres	21252,#1
 832  03be               L732:
 833                     ; 466 	if(sfr_TIM2.SR1.CC2IF)
 834  03be c65304        	ld	a,21252
 835  03c1 a504          	bcp	a,#4
 836  03c3 2708          	jreq	L142
 837                     ; 468 		DOT_PIN = 0;
 838  03c5 721d500f      	bres	20495,#6
 839                     ; 469 		sfr_TIM2.SR1.CC2IF = 0;
 840  03c9 72155304      	bres	21252,#2
 841  03cd               L142:
 842                     ; 471   return;
 843  03cd 85            	popw	x
 844  03ce bf00          	ldw	c_y,x
 845  03d0 320002        	pop	c_y+2
 846  03d3 85            	popw	x
 847  03d4 bf00          	ldw	c_x,x
 848  03d6 320002        	pop	c_x+2
 849  03d9 80            	iret
 850                     	switch	.const
 851  0009               L04:
 852  0009 000000ff      	dc.l	255
 853                     ; 475 void displayRGBset (uint8_t state)
 853                     ; 476 {
 854                     	scross	off
 855                     	switch	.text
 856  03da               _displayRGBset:
 858                     ; 477 	if (state){
 859  03da 4d            	tnz	a
 860  03db 274d          	jreq	L342
 861                     ; 478 		RGBsetR((uint16_t)scale(EEPROM_readByte(R_ADDR),255,displayBright));
 862  03dd ae000b        	ldw	x,#11
 863  03e0 cd0000        	call	_EEPROM_readByte
 865  03e3 5f            	clrw	x
 866  03e4 97            	ld	xl,a
 867  03e5 90be00        	ldw	y,L31_displayBright
 868  03e8 cd0000        	call	c_umul
 870  03eb ae0009        	ldw	x,#L04
 871  03ee cd0000        	call	c_ldiv
 873  03f1 be02          	ldw	x,c_lreg+2
 874  03f3 cd0000        	call	_RGBsetR
 876                     ; 479 		RGBsetG((uint16_t)scale(EEPROM_readByte(G_ADDR),255,displayBright));
 877  03f6 ae000c        	ldw	x,#12
 878  03f9 cd0000        	call	_EEPROM_readByte
 880  03fc 5f            	clrw	x
 881  03fd 97            	ld	xl,a
 882  03fe 90be00        	ldw	y,L31_displayBright
 883  0401 cd0000        	call	c_umul
 885  0404 ae0009        	ldw	x,#L04
 886  0407 cd0000        	call	c_ldiv
 888  040a be02          	ldw	x,c_lreg+2
 889  040c cd0000        	call	_RGBsetG
 891                     ; 480 		RGBsetB((uint16_t)scale(EEPROM_readByte(B_ADDR),255,displayBright));
 892  040f ae000d        	ldw	x,#13
 893  0412 cd0000        	call	_EEPROM_readByte
 895  0415 5f            	clrw	x
 896  0416 97            	ld	xl,a
 897  0417 90be00        	ldw	y,L31_displayBright
 898  041a cd0000        	call	c_umul
 900  041d ae0009        	ldw	x,#L04
 901  0420 cd0000        	call	c_ldiv
 903  0423 be02          	ldw	x,c_lreg+2
 904  0425 cd0000        	call	_RGBsetB
 907  0428 200c          	jra	L542
 908  042a               L342:
 909                     ; 482 		RGBsetR(0);
 910  042a 5f            	clrw	x
 911  042b cd0000        	call	_RGBsetR
 913                     ; 483 		RGBsetG(0);
 914  042e 5f            	clrw	x
 915  042f cd0000        	call	_RGBsetG
 917                     ; 484 		RGBsetB(0);
 918  0432 5f            	clrw	x
 919  0433 cd0000        	call	_RGBsetB
 921  0436               L542:
 922                     ; 486 }
 923  0436 81            	ret
 925                     ; 488 void displayRset(uint8_t value)
 925                     ; 489 {
 926  0437               _displayRset:
 928                     ; 490 	RGBsetR((uint16_t)scale(value,255,displayBright));
 929  0437 5f            	clrw	x
 930  0438 97            	ld	xl,a
 931  0439 90be00        	ldw	y,L31_displayBright
 932  043c cd0000        	call	c_umul
 934  043f ae0009        	ldw	x,#L04
 935  0442 cd0000        	call	c_ldiv
 937  0445 be02          	ldw	x,c_lreg+2
 938  0447 cd0000        	call	_RGBsetR
 940                     ; 491 }
 941  044a 81            	ret
 943                     ; 493 void displayGset(uint8_t value)
 943                     ; 494 {
 944  044b               _displayGset:
 946                     ; 495 	RGBsetG((uint16_t)scale(value,255,displayBright));
 947  044b 5f            	clrw	x
 948  044c 97            	ld	xl,a
 949  044d 90be00        	ldw	y,L31_displayBright
 950  0450 cd0000        	call	c_umul
 952  0453 ae0009        	ldw	x,#L04
 953  0456 cd0000        	call	c_ldiv
 955  0459 be02          	ldw	x,c_lreg+2
 956  045b cd0000        	call	_RGBsetG
 958                     ; 496 }
 959  045e 81            	ret
 961                     ; 498 void displayBset(uint8_t value)
 961                     ; 499 {
 962  045f               _displayBset:
 964                     ; 500 	RGBsetB((uint16_t)scale(value,255,displayBright));
 965  045f 5f            	clrw	x
 966  0460 97            	ld	xl,a
 967  0461 90be00        	ldw	y,L31_displayBright
 968  0464 cd0000        	call	c_umul
 970  0467 ae0009        	ldw	x,#L04
 971  046a cd0000        	call	c_ldiv
 973  046d be02          	ldw	x,c_lreg+2
 974  046f cd0000        	call	_RGBsetB
 976                     ; 501 }
 977  0472 81            	ret
 979                     	xdef	f_TIM2_CAP_ISR
 980                     	xdef	f_TIM2_UPD_ISR
 981                     	switch	.ubsct
 982  0000               L31_displayBright:
 983  0000 0000          	ds.b	2
 984  0002               _flag10ms:
 985  0002 00            	ds.b	1
 986                     	xdef	_flag10ms
 987  0003               L11_dotPulseCounter:
 988  0003 00            	ds.b	1
 989                     	xref	_EEPROM_readByte
 990                     	xref.b	_e
 991                     	xref	_RGBsetB
 992                     	xref	_RGBsetG
 993                     	xref	_RGBsetR
 994                     	xref	_RGBinit
 995                     	xdef	_displayBset
 996                     	xdef	_displayGset
 997                     	xdef	_displayRset
 998                     	xdef	_displayRGBset
 999                     	xdef	_displayDotPulseProc
1000                     	xdef	_displayDotPulse
1001                     	xdef	_displayDot
1002                     	xdef	_displayNixie
1003                     	xdef	_displaySetBright
1004                     	xdef	_displayInit
1005                     	xref	_hc595ChainShiftOut
1006                     	xref	_hc595Init
1007                     	xref.b	c_lreg
1008                     	xref.b	c_x
1009                     	xref.b	c_y
1010                     	xref	c_ldiv
1011                     	xref	c_umul
1012                     	xref	c_bmulx
1013                     	xref	c_xymov
1014                     	end
