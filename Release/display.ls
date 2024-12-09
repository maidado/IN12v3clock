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
  28                     ; 18 void displayInit ( void )
  28                     ; 19 {
  29                     	scross	off
  30                     	switch	.text
  31  0000               _displayInit:
  33                     ; 21 	sfr_PORTD.DDR.DDR6 = 1;     // input(=0) or output(=1)
  34  0000 721c5011      	bset	20497,#6
  35                     ; 22 	sfr_PORTD.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  36  0004 721c5012      	bset	20498,#6
  37                     ; 23 	sfr_PORTD.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  38  0008 721c5013      	bset	20499,#6
  39                     ; 24 	DOT_PIN = 0;
  40  000c 721d500f      	bres	20495,#6
  41                     ; 27   sfr_TIM2.CR1.ARPE = 1;								// use buffered period register to avoid glitches
  42  0010 721e5300      	bset	21248,#7
  43                     ; 28   sfr_TIM2.PSCR.PSC = 4;								// set TIM2 prescaler fTim = fcpu/2^pre with pre in [0..15]
  44  0014 c6530e        	ld	a,21262
  45  0017 a4f0          	and	a,#240
  46  0019 aa04          	or	a,#4
  47  001b c7530e        	ld	21262,a
  48                     ; 31   sfr_TIM2.ARRH.byte = hibyte(10000);		// set reload period = (ARR+1)/fTim
  49  001e 3527530f      	mov	21263,#39
  50                     ; 32   sfr_TIM2.ARRL.byte = lobyte(10000);
  51  0022 35105310      	mov	21264,#16
  52                     ; 34 	sfr_TIM2.CCR1H.byte = hibyte(1000);		// set PWM channel 1 duty period
  53  0026 35035311      	mov	21265,#3
  54                     ; 35 	sfr_TIM2.CCR1L.byte = lobyte(1000);
  55  002a 35e85312      	mov	21266,#232
  56                     ; 36 	sfr_TIM2.CCR2H.byte = hibyte(0);			// set PWM channel 2 duty period
  57  002e 725f5313      	clr	21267
  58                     ; 37 	sfr_TIM2.CCR2L.byte = lobyte(0);
  59  0032 725f5314      	clr	21268
  60                     ; 39 	sfr_TIM2.CCMR1.OC1PE 	= 1;						// buffer compare register to avoid glitches when changing duty cycle
  61  0036 72165307      	bset	21255,#3
  62                     ; 40 	sfr_TIM2.CCER1.CC1E 	= 0;						// TIM2 channel 1 output disable
  63  003a 7211530a      	bres	21258,#0
  64                     ; 41 	sfr_TIM2.CCER1.CC2E 	= 0;						// TIM2 channel 2 output disable
  65  003e 7219530a      	bres	21258,#4
  66                     ; 42 	sfr_TIM2.IER.CC1IE 		= 1;						// TIM2 channel 1 compare interrupt enable
  67  0042 72125303      	bset	21251,#1
  68                     ; 44 	sfr_TIM2.IER.UIE 			= 1;						// TIM2 update interrupt enable
  69  0046 72105303      	bset	21251,#0
  70                     ; 45 	sfr_TIM2.CR1.CEN     	= 1;						// start TIM2
  71  004a 72105300      	bset	21248,#0
  72                     ; 47 	hc595Init();
  73  004e cd0000        	call	_hc595Init
  75                     ; 48 	displaySetBright(100);
  76  0051 a664          	ld	a,#100
  77  0053 cd0262        	call	_displaySetBright
  79                     ; 49 	displayDot(0);
  80  0056 4f            	clr	a
  81  0057 cd02c3        	call	_displayDot
  83                     ; 50 	hc595ChainShiftOut(zero_data,sizeof(zero_data));
  84  005a 4b05          	push	#5
  85  005c ae0000        	ldw	x,#L3_zero_data
  86  005f cd0000        	call	_hc595ChainShiftOut
  88  0062 84            	pop	a
  89                     ; 53 	RGBinit();
  90  0063 cd0000        	call	_RGBinit
  92                     ; 54 	displayRGBset(e.rgbGlobalEn);
  93  0066 b60b          	ld	a,_e+11
  94  0068 cd03da        	call	_displayRGBset
  96                     ; 55 }
  97  006b 81            	ret
  99                     .const:	section	.text
 100  0000               L71_data:
 101  0000 00            	dc.b	0
 102  0001 00            	dc.b	0
 103  0002 00            	dc.b	0
 104  0003 00            	dc.b	0
 105  0004 00            	dc.b	0
 106                     ; 59 static uint8_t *displayNixieBuffPrepare(uint8_t *inbuff, uint8_t dmask)
 106                     ; 60 {
 107                     	switch	.text
 108  006c               L31_displayNixieBuffPrepare:
 109  006c 89            	pushw	x
 110  006d 5205          	subw	sp,#5
 111       00000005      OFST:	set	5
 113                     ; 61 	uint8_t data[5] = {0,0,0,0,0};
 114  006f 96            	ldw	x,sp
 115  0070 1c0001        	addw	x,#OFST-4
 116  0073 90ae0000      	ldw	y,#L71_data
 117  0077 a605          	ld	a,#5
 118  0079 cd0000        	call	c_xymov
 120                     ; 63 	if (bitchk(dmask,0)){
 121  007c 7b0a          	ld	a,(OFST+5,sp)
 122  007e a501          	bcp	a,#1
 123  0080 2771          	jreq	L151
 124                     ; 65 		switch(inbuff[0]){
 125  0082 1e06          	ldw	x,(OFST+1,sp)
 126  0084 f6            	ld	a,(x)
 128                     ; 96 			default:
 128                     ; 97 				break;
 129  0085 4d            	tnz	a
 130  0086 271d          	jreq	L12
 131  0088 4a            	dec	a
 132  0089 2722          	jreq	L32
 133  008b 4a            	dec	a
 134  008c 2727          	jreq	L52
 135  008e 4a            	dec	a
 136  008f 272c          	jreq	L72
 137  0091 4a            	dec	a
 138  0092 2731          	jreq	L13
 139  0094 4a            	dec	a
 140  0095 2736          	jreq	L33
 141  0097 4a            	dec	a
 142  0098 273b          	jreq	L53
 143  009a 4a            	dec	a
 144  009b 2740          	jreq	L73
 145  009d 4a            	dec	a
 146  009e 2745          	jreq	L14
 147  00a0 4a            	dec	a
 148  00a1 274a          	jreq	L34
 149  00a3 204e          	jra	L151
 150  00a5               L12:
 151                     ; 66 			case 0:
 151                     ; 67 				bitset(data[4],0);
 152  00a5 7b05          	ld	a,(OFST+0,sp)
 153  00a7 aa01          	or	a,#1
 154  00a9 6b05          	ld	(OFST+0,sp),a
 155                     ; 68 				break;
 156  00ab 2046          	jra	L151
 157  00ad               L32:
 158                     ; 69 			case 1:
 158                     ; 70 				bitset(data[4],1);
 159  00ad 7b05          	ld	a,(OFST+0,sp)
 160  00af aa02          	or	a,#2
 161  00b1 6b05          	ld	(OFST+0,sp),a
 162                     ; 71 				break;
 163  00b3 203e          	jra	L151
 164  00b5               L52:
 165                     ; 72 			case 2:
 165                     ; 73 				bitset(data[4],2);
 166  00b5 7b05          	ld	a,(OFST+0,sp)
 167  00b7 aa04          	or	a,#4
 168  00b9 6b05          	ld	(OFST+0,sp),a
 169                     ; 74 				break;
 170  00bb 2036          	jra	L151
 171  00bd               L72:
 172                     ; 75 			case 3:
 172                     ; 76 				bitset(data[4],3);
 173  00bd 7b05          	ld	a,(OFST+0,sp)
 174  00bf aa08          	or	a,#8
 175  00c1 6b05          	ld	(OFST+0,sp),a
 176                     ; 77 				break;
 177  00c3 202e          	jra	L151
 178  00c5               L13:
 179                     ; 78 			case 4:
 179                     ; 79 				bitset(data[4],4);
 180  00c5 7b05          	ld	a,(OFST+0,sp)
 181  00c7 aa10          	or	a,#16
 182  00c9 6b05          	ld	(OFST+0,sp),a
 183                     ; 80 				break;
 184  00cb 2026          	jra	L151
 185  00cd               L33:
 186                     ; 81 			case 5:
 186                     ; 82 				bitset(data[4],5);
 187  00cd 7b05          	ld	a,(OFST+0,sp)
 188  00cf aa20          	or	a,#32
 189  00d1 6b05          	ld	(OFST+0,sp),a
 190                     ; 83 				break;
 191  00d3 201e          	jra	L151
 192  00d5               L53:
 193                     ; 84 			case 6:
 193                     ; 85 				bitset(data[4],6);
 194  00d5 7b05          	ld	a,(OFST+0,sp)
 195  00d7 aa40          	or	a,#64
 196  00d9 6b05          	ld	(OFST+0,sp),a
 197                     ; 86 				break;
 198  00db 2016          	jra	L151
 199  00dd               L73:
 200                     ; 87 			case 7:
 200                     ; 88 				bitset(data[4],7);
 201  00dd 7b05          	ld	a,(OFST+0,sp)
 202  00df aa80          	or	a,#128
 203  00e1 6b05          	ld	(OFST+0,sp),a
 204                     ; 89 				break;
 205  00e3 200e          	jra	L151
 206  00e5               L14:
 207                     ; 90 			case 8:
 207                     ; 91 				bitset(data[3],0);
 208  00e5 7b04          	ld	a,(OFST-1,sp)
 209  00e7 aa01          	or	a,#1
 210  00e9 6b04          	ld	(OFST-1,sp),a
 211                     ; 92 				break;
 212  00eb 2006          	jra	L151
 213  00ed               L34:
 214                     ; 93 			case 9:
 214                     ; 94 				bitset(data[3],1);
 215  00ed 7b04          	ld	a,(OFST-1,sp)
 216  00ef aa02          	or	a,#2
 217  00f1 6b04          	ld	(OFST-1,sp),a
 218                     ; 95 				break;
 219  00f3               L54:
 220                     ; 96 			default:
 220                     ; 97 				break;
 221  00f3               L551:
 222  00f3               L151:
 223                     ; 100 	if (bitchk(dmask,1)){
 224  00f3 7b0a          	ld	a,(OFST+5,sp)
 225  00f5 a502          	bcp	a,#2
 226  00f7 2772          	jreq	L751
 227                     ; 102 		switch(inbuff[1]){
 228  00f9 1e06          	ldw	x,(OFST+1,sp)
 229  00fb e601          	ld	a,(1,x)
 231                     ; 133 			default:
 231                     ; 134 			break;
 232  00fd 4d            	tnz	a
 233  00fe 271d          	jreq	L74
 234  0100 4a            	dec	a
 235  0101 2722          	jreq	L15
 236  0103 4a            	dec	a
 237  0104 2727          	jreq	L35
 238  0106 4a            	dec	a
 239  0107 272c          	jreq	L55
 240  0109 4a            	dec	a
 241  010a 2731          	jreq	L75
 242  010c 4a            	dec	a
 243  010d 2736          	jreq	L16
 244  010f 4a            	dec	a
 245  0110 273b          	jreq	L36
 246  0112 4a            	dec	a
 247  0113 2740          	jreq	L56
 248  0115 4a            	dec	a
 249  0116 2745          	jreq	L76
 250  0118 4a            	dec	a
 251  0119 274a          	jreq	L17
 252  011b 204e          	jra	L751
 253  011d               L74:
 254                     ; 103 			case 0:
 254                     ; 104 				bitset(data[3],2);
 255  011d 7b04          	ld	a,(OFST-1,sp)
 256  011f aa04          	or	a,#4
 257  0121 6b04          	ld	(OFST-1,sp),a
 258                     ; 105 				break;
 259  0123 2046          	jra	L751
 260  0125               L15:
 261                     ; 106 			case 1:
 261                     ; 107 				bitset(data[3],3);
 262  0125 7b04          	ld	a,(OFST-1,sp)
 263  0127 aa08          	or	a,#8
 264  0129 6b04          	ld	(OFST-1,sp),a
 265                     ; 108 				break;
 266  012b 203e          	jra	L751
 267  012d               L35:
 268                     ; 109 			case 2:
 268                     ; 110 				bitset(data[3],4);
 269  012d 7b04          	ld	a,(OFST-1,sp)
 270  012f aa10          	or	a,#16
 271  0131 6b04          	ld	(OFST-1,sp),a
 272                     ; 111 				break;
 273  0133 2036          	jra	L751
 274  0135               L55:
 275                     ; 112 			case 3:
 275                     ; 113 				bitset(data[3],5);
 276  0135 7b04          	ld	a,(OFST-1,sp)
 277  0137 aa20          	or	a,#32
 278  0139 6b04          	ld	(OFST-1,sp),a
 279                     ; 114 				break;
 280  013b 202e          	jra	L751
 281  013d               L75:
 282                     ; 115 			case 4:
 282                     ; 116 				bitset(data[3],6);
 283  013d 7b04          	ld	a,(OFST-1,sp)
 284  013f aa40          	or	a,#64
 285  0141 6b04          	ld	(OFST-1,sp),a
 286                     ; 117 				break;
 287  0143 2026          	jra	L751
 288  0145               L16:
 289                     ; 118 			case 5:
 289                     ; 119 				bitset(data[3],7);
 290  0145 7b04          	ld	a,(OFST-1,sp)
 291  0147 aa80          	or	a,#128
 292  0149 6b04          	ld	(OFST-1,sp),a
 293                     ; 120 				break;
 294  014b 201e          	jra	L751
 295  014d               L36:
 296                     ; 121 			case 6:
 296                     ; 122 				bitset(data[2],0);
 297  014d 7b03          	ld	a,(OFST-2,sp)
 298  014f aa01          	or	a,#1
 299  0151 6b03          	ld	(OFST-2,sp),a
 300                     ; 123 				break;
 301  0153 2016          	jra	L751
 302  0155               L56:
 303                     ; 124 			case 7:
 303                     ; 125 				bitset(data[2],1);
 304  0155 7b03          	ld	a,(OFST-2,sp)
 305  0157 aa02          	or	a,#2
 306  0159 6b03          	ld	(OFST-2,sp),a
 307                     ; 126 				break;
 308  015b 200e          	jra	L751
 309  015d               L76:
 310                     ; 127 			case 8:
 310                     ; 128 				bitset(data[2],2);
 311  015d 7b03          	ld	a,(OFST-2,sp)
 312  015f aa04          	or	a,#4
 313  0161 6b03          	ld	(OFST-2,sp),a
 314                     ; 129 				break;
 315  0163 2006          	jra	L751
 316  0165               L17:
 317                     ; 130 			case 9:
 317                     ; 131 				bitset(data[2],3);
 318  0165 7b03          	ld	a,(OFST-2,sp)
 319  0167 aa08          	or	a,#8
 320  0169 6b03          	ld	(OFST-2,sp),a
 321                     ; 132 				break;
 322  016b               L37:
 323                     ; 133 			default:
 323                     ; 134 			break;
 324  016b               L361:
 325  016b               L751:
 326                     ; 137 	if (bitchk(dmask,2)){
 327  016b 7b0a          	ld	a,(OFST+5,sp)
 328  016d a504          	bcp	a,#4
 329  016f 2772          	jreq	L561
 330                     ; 139 		switch(inbuff[2]){
 331  0171 1e06          	ldw	x,(OFST+1,sp)
 332  0173 e602          	ld	a,(2,x)
 334                     ; 170 			default:
 334                     ; 171 			break;
 335  0175 4d            	tnz	a
 336  0176 271d          	jreq	L57
 337  0178 4a            	dec	a
 338  0179 2722          	jreq	L77
 339  017b 4a            	dec	a
 340  017c 2727          	jreq	L101
 341  017e 4a            	dec	a
 342  017f 272c          	jreq	L301
 343  0181 4a            	dec	a
 344  0182 2731          	jreq	L501
 345  0184 4a            	dec	a
 346  0185 2736          	jreq	L701
 347  0187 4a            	dec	a
 348  0188 273b          	jreq	L111
 349  018a 4a            	dec	a
 350  018b 2740          	jreq	L311
 351  018d 4a            	dec	a
 352  018e 2745          	jreq	L511
 353  0190 4a            	dec	a
 354  0191 274a          	jreq	L711
 355  0193 204e          	jra	L561
 356  0195               L57:
 357                     ; 140 			case 0:
 357                     ; 141 				bitset(data[2],4);
 358  0195 7b03          	ld	a,(OFST-2,sp)
 359  0197 aa10          	or	a,#16
 360  0199 6b03          	ld	(OFST-2,sp),a
 361                     ; 142 				break;
 362  019b 2046          	jra	L561
 363  019d               L77:
 364                     ; 143 			case 1:
 364                     ; 144 				bitset(data[2],5);
 365  019d 7b03          	ld	a,(OFST-2,sp)
 366  019f aa20          	or	a,#32
 367  01a1 6b03          	ld	(OFST-2,sp),a
 368                     ; 145 				break;
 369  01a3 203e          	jra	L561
 370  01a5               L101:
 371                     ; 146 			case 2:
 371                     ; 147 				bitset(data[2],6);
 372  01a5 7b03          	ld	a,(OFST-2,sp)
 373  01a7 aa40          	or	a,#64
 374  01a9 6b03          	ld	(OFST-2,sp),a
 375                     ; 148 				break;
 376  01ab 2036          	jra	L561
 377  01ad               L301:
 378                     ; 149 			case 3:
 378                     ; 150 				bitset(data[2],7);
 379  01ad 7b03          	ld	a,(OFST-2,sp)
 380  01af aa80          	or	a,#128
 381  01b1 6b03          	ld	(OFST-2,sp),a
 382                     ; 151 				break;
 383  01b3 202e          	jra	L561
 384  01b5               L501:
 385                     ; 152 			case 4:
 385                     ; 153 				bitset(data[1],0);
 386  01b5 7b02          	ld	a,(OFST-3,sp)
 387  01b7 aa01          	or	a,#1
 388  01b9 6b02          	ld	(OFST-3,sp),a
 389                     ; 154 				break;
 390  01bb 2026          	jra	L561
 391  01bd               L701:
 392                     ; 155 			case 5:
 392                     ; 156 				bitset(data[1],1);
 393  01bd 7b02          	ld	a,(OFST-3,sp)
 394  01bf aa02          	or	a,#2
 395  01c1 6b02          	ld	(OFST-3,sp),a
 396                     ; 157 				break;
 397  01c3 201e          	jra	L561
 398  01c5               L111:
 399                     ; 158 			case 6:
 399                     ; 159 				bitset(data[1],2);
 400  01c5 7b02          	ld	a,(OFST-3,sp)
 401  01c7 aa04          	or	a,#4
 402  01c9 6b02          	ld	(OFST-3,sp),a
 403                     ; 160 				break;
 404  01cb 2016          	jra	L561
 405  01cd               L311:
 406                     ; 161 			case 7:
 406                     ; 162 				bitset(data[1],3);
 407  01cd 7b02          	ld	a,(OFST-3,sp)
 408  01cf aa08          	or	a,#8
 409  01d1 6b02          	ld	(OFST-3,sp),a
 410                     ; 163 				break;
 411  01d3 200e          	jra	L561
 412  01d5               L511:
 413                     ; 164 			case 8:
 413                     ; 165 				bitset(data[1],4);
 414  01d5 7b02          	ld	a,(OFST-3,sp)
 415  01d7 aa10          	or	a,#16
 416  01d9 6b02          	ld	(OFST-3,sp),a
 417                     ; 166 				break;
 418  01db 2006          	jra	L561
 419  01dd               L711:
 420                     ; 167 			case 9:
 420                     ; 168 				bitset(data[1],5);
 421  01dd 7b02          	ld	a,(OFST-3,sp)
 422  01df aa20          	or	a,#32
 423  01e1 6b02          	ld	(OFST-3,sp),a
 424                     ; 169 				break;
 425  01e3               L121:
 426                     ; 170 			default:
 426                     ; 171 			break;
 427  01e3               L171:
 428  01e3               L561:
 429                     ; 174 	if (bitchk(dmask,3)){
 430  01e3 7b0a          	ld	a,(OFST+5,sp)
 431  01e5 a508          	bcp	a,#8
 432  01e7 2772          	jreq	L371
 433                     ; 176 		switch(inbuff[3]){
 434  01e9 1e06          	ldw	x,(OFST+1,sp)
 435  01eb e603          	ld	a,(3,x)
 437                     ; 207 			default:
 437                     ; 208 			break;
 438  01ed 4d            	tnz	a
 439  01ee 271d          	jreq	L321
 440  01f0 4a            	dec	a
 441  01f1 2722          	jreq	L521
 442  01f3 4a            	dec	a
 443  01f4 2727          	jreq	L721
 444  01f6 4a            	dec	a
 445  01f7 272c          	jreq	L131
 446  01f9 4a            	dec	a
 447  01fa 2731          	jreq	L331
 448  01fc 4a            	dec	a
 449  01fd 2736          	jreq	L531
 450  01ff 4a            	dec	a
 451  0200 273b          	jreq	L731
 452  0202 4a            	dec	a
 453  0203 2740          	jreq	L141
 454  0205 4a            	dec	a
 455  0206 2745          	jreq	L341
 456  0208 4a            	dec	a
 457  0209 274a          	jreq	L541
 458  020b 204e          	jra	L371
 459  020d               L321:
 460                     ; 177 			case 0:
 460                     ; 178 				bitset(data[1],6);
 461  020d 7b02          	ld	a,(OFST-3,sp)
 462  020f aa40          	or	a,#64
 463  0211 6b02          	ld	(OFST-3,sp),a
 464                     ; 179 				break;
 465  0213 2046          	jra	L371
 466  0215               L521:
 467                     ; 180 			case 1:
 467                     ; 181 				bitset(data[1],7);
 468  0215 7b02          	ld	a,(OFST-3,sp)
 469  0217 aa80          	or	a,#128
 470  0219 6b02          	ld	(OFST-3,sp),a
 471                     ; 182 				break;
 472  021b 203e          	jra	L371
 473  021d               L721:
 474                     ; 183 			case 2:
 474                     ; 184 				bitset(data[0],0);
 475  021d 7b01          	ld	a,(OFST-4,sp)
 476  021f aa01          	or	a,#1
 477  0221 6b01          	ld	(OFST-4,sp),a
 478                     ; 185 				break;
 479  0223 2036          	jra	L371
 480  0225               L131:
 481                     ; 186 			case 3:
 481                     ; 187 				bitset(data[0],1);
 482  0225 7b01          	ld	a,(OFST-4,sp)
 483  0227 aa02          	or	a,#2
 484  0229 6b01          	ld	(OFST-4,sp),a
 485                     ; 188 				break;
 486  022b 202e          	jra	L371
 487  022d               L331:
 488                     ; 189 			case 4:
 488                     ; 190 				bitset(data[0],2);
 489  022d 7b01          	ld	a,(OFST-4,sp)
 490  022f aa04          	or	a,#4
 491  0231 6b01          	ld	(OFST-4,sp),a
 492                     ; 191 				break;
 493  0233 2026          	jra	L371
 494  0235               L531:
 495                     ; 192 			case 5:
 495                     ; 193 				bitset(data[0],3);
 496  0235 7b01          	ld	a,(OFST-4,sp)
 497  0237 aa08          	or	a,#8
 498  0239 6b01          	ld	(OFST-4,sp),a
 499                     ; 194 				break;
 500  023b 201e          	jra	L371
 501  023d               L731:
 502                     ; 195 			case 6:
 502                     ; 196 				bitset(data[0],4);
 503  023d 7b01          	ld	a,(OFST-4,sp)
 504  023f aa10          	or	a,#16
 505  0241 6b01          	ld	(OFST-4,sp),a
 506                     ; 197 				break;
 507  0243 2016          	jra	L371
 508  0245               L141:
 509                     ; 198 			case 7:
 509                     ; 199 				bitset(data[0],5);
 510  0245 7b01          	ld	a,(OFST-4,sp)
 511  0247 aa20          	or	a,#32
 512  0249 6b01          	ld	(OFST-4,sp),a
 513                     ; 200 				break;
 514  024b 200e          	jra	L371
 515  024d               L341:
 516                     ; 201 			case 8:
 516                     ; 202 				bitset(data[0],6);
 517  024d 7b01          	ld	a,(OFST-4,sp)
 518  024f aa40          	or	a,#64
 519  0251 6b01          	ld	(OFST-4,sp),a
 520                     ; 203 				break;
 521  0253 2006          	jra	L371
 522  0255               L541:
 523                     ; 204 			case 9:
 523                     ; 205 				bitset(data[0],7);
 524  0255 7b01          	ld	a,(OFST-4,sp)
 525  0257 aa80          	or	a,#128
 526  0259 6b01          	ld	(OFST-4,sp),a
 527                     ; 206 				break;
 528  025b               L741:
 529                     ; 207 			default:
 529                     ; 208 			break;
 530  025b               L771:
 531  025b               L371:
 532                     ; 211 	return data;
 533  025b 96            	ldw	x,sp
 534  025c 1c0001        	addw	x,#OFST-4
 536  025f 5b07          	addw	sp,#7
 537  0261 81            	ret
 539                     ; 216 void displaySetBright(uint8_t bright)
 539                     ; 217 {
 540  0262               _displaySetBright:
 541  0262 88            	push	a
 542       00000000      OFST:	set	0
 544                     ; 218 	if (bright == 0){
 545  0263 4d            	tnz	a
 546  0264 260a          	jrne	L102
 547                     ; 219 		memset(disp_data,0,sizeof(disp_data));
 548  0266 ae0005        	ldw	x,#5
 549  0269               L01:
 550  0269 6f04          	clr	(L5_disp_data-1,x)
 551  026b 5a            	decw	x
 552  026c 26fb          	jrne	L01
 554  026e 2023          	jra	L302
 555  0270               L102:
 556                     ; 221 		displayBright = scale(bright,100,10000);
 557  0270 7b01          	ld	a,(OFST+1,sp)
 558  0272 5f            	clrw	x
 559  0273 97            	ld	xl,a
 560  0274 a664          	ld	a,#100
 561  0276 cd0000        	call	c_bmulx
 563  0279 bf00          	ldw	L11_displayBright,x
 564                     ; 222 		if (displayBright < NIXIE_MIN_BRIGHT){
 565  027b be00          	ldw	x,L11_displayBright
 566  027d a30064        	cpw	x,#100
 567  0280 2405          	jruge	L502
 568                     ; 223 			displayBright = NIXIE_MIN_BRIGHT;
 569  0282 ae0064        	ldw	x,#100
 570  0285 bf00          	ldw	L11_displayBright,x
 571  0287               L502:
 572                     ; 225 		sfr_TIM2.CCR1H.byte = hibyte(displayBright);		// set PWM channel 1 duty period
 573  0287 5500005311    	mov	21265,L11_displayBright
 574                     ; 226 		sfr_TIM2.CCR1L.byte = lobyte(displayBright);
 575  028c b601          	ld	a,L11_displayBright+1
 576  028e a4ff          	and	a,#255
 577  0290 c75312        	ld	21266,a
 578  0293               L302:
 579                     ; 228 }
 580  0293 84            	pop	a
 581  0294 81            	ret
 583                     ; 233 void displayNixie(uint8_t *data, uint8_t full_bright_bitmask)
 583                     ; 234 {
 584  0295               _displayNixie:
 585  0295 89            	pushw	x
 586       00000000      OFST:	set	0
 588                     ; 235 	memcpy(disp_data,displayNixieBuffPrepare(data,bin(00001111)),sizeof(disp_data));
 589  0296 4b0f          	push	#15
 590  0298 cd006c        	call	L31_displayNixieBuffPrepare
 592  029b 84            	pop	a
 593  029c bf00          	ldw	c_x,x
 594  029e ae0005        	ldw	x,#5
 595  02a1               L41:
 596  02a1 5a            	decw	x
 597  02a2 92d600        	ld	a,([c_x.w],x)
 598  02a5 e705          	ld	(L5_disp_data,x),a
 599  02a7 5d            	tnzw	x
 600  02a8 26f7          	jrne	L41
 601                     ; 236 	memcpy(zero_data,displayNixieBuffPrepare(data,full_bright_bitmask),sizeof(zero_data));
 602  02aa 7b05          	ld	a,(OFST+5,sp)
 603  02ac 88            	push	a
 604  02ad 1e02          	ldw	x,(OFST+2,sp)
 605  02af cd006c        	call	L31_displayNixieBuffPrepare
 607  02b2 84            	pop	a
 608  02b3 bf00          	ldw	c_x,x
 609  02b5 ae0005        	ldw	x,#5
 610  02b8               L61:
 611  02b8 5a            	decw	x
 612  02b9 92d600        	ld	a,([c_x.w],x)
 613  02bc e700          	ld	(L3_zero_data,x),a
 614  02be 5d            	tnzw	x
 615  02bf 26f7          	jrne	L61
 616                     ; 237 }
 617  02c1 85            	popw	x
 618  02c2 81            	ret
 620                     ; 239 void displayDot (uint8_t state) 
 620                     ; 240 {
 621  02c3               _displayDot:
 622  02c3 89            	pushw	x
 623       00000002      OFST:	set	2
 625                     ; 241 	uint16_t bright = displayBright;
 626  02c4 be00          	ldw	x,L11_displayBright
 627  02c6 1f01          	ldw	(OFST-1,sp),x
 628                     ; 243 	if (state == 0) {
 629  02c8 4d            	tnz	a
 630  02c9 260a          	jrne	L702
 631                     ; 244 		sfr_TIM2.IER.CC2IE 		= 0;							// TIM2 channel 2 compare interrupt disable
 632  02cb 72155303      	bres	21251,#2
 633                     ; 245 		DOT_PIN = 0;
 634  02cf 721d500f      	bres	20495,#6
 636  02d3 201c          	jra	L112
 637  02d5               L702:
 638                     ; 247 		if (bright < DOT_MIN_BRIGHT) {
 639  02d5 1e01          	ldw	x,(OFST-1,sp)
 640  02d7 a30064        	cpw	x,#100
 641  02da 2405          	jruge	L312
 642                     ; 248 			bright = DOT_MIN_BRIGHT;
 643  02dc ae0064        	ldw	x,#100
 644  02df 1f01          	ldw	(OFST-1,sp),x
 645  02e1               L312:
 646                     ; 250 		sfr_TIM2.CCR2H.byte = hibyte(bright);		// set PWM channel 2 duty period
 647  02e1 7b01          	ld	a,(OFST-1,sp)
 648  02e3 c75313        	ld	21267,a
 649                     ; 251 		sfr_TIM2.CCR2L.byte = lobyte(bright);
 650  02e6 7b02          	ld	a,(OFST+0,sp)
 651  02e8 a4ff          	and	a,#255
 652  02ea c75314        	ld	21268,a
 653                     ; 252 		sfr_TIM2.IER.CC2IE 		= 1;							// TIM2 channel 2 compare interrupt enable
 654  02ed 72145303      	bset	21251,#2
 655  02f1               L112:
 656                     ; 254 }
 657  02f1 85            	popw	x
 658  02f2 81            	ret
 660                     ; 256 void displayDotPulse (void) 
 660                     ; 257 {
 661  02f3               _displayDotPulse:
 663                     ; 258 	dotPulseCounter = 0;
 664  02f3 3f03          	clr	L7_dotPulseCounter
 665                     ; 259 }
 666  02f5 81            	ret
 668                     ; 261 void displayDotPulseProc (void)
 668                     ; 262 {
 669  02f6               _displayDotPulseProc:
 671                     ; 263 	if (dotPulseCounter < 25){
 672  02f6 b603          	ld	a,L7_dotPulseCounter
 673  02f8 a119          	cp	a,#25
 674  02fa 2408          	jruge	L512
 675                     ; 264 		displaySetDotBright(dotPulseCounter*4);
 676  02fc b603          	ld	a,L7_dotPulseCounter
 677  02fe 48            	sll	a
 678  02ff 48            	sll	a
 679  0300 ad19          	call	L51_displaySetDotBright
 682  0302 200e          	jra	L712
 683  0304               L512:
 684                     ; 265 	}else if (dotPulseCounter < 50){
 685  0304 b603          	ld	a,L7_dotPulseCounter
 686  0306 a132          	cp	a,#50
 687  0308 2408          	jruge	L712
 688                     ; 266 		displaySetDotBright((49-dotPulseCounter)*4);
 689  030a a631          	ld	a,#49
 690  030c b003          	sub	a,L7_dotPulseCounter
 691  030e 48            	sll	a
 692  030f 48            	sll	a
 693  0310 ad09          	call	L51_displaySetDotBright
 695  0312               L712:
 696                     ; 268 	if (dotPulseCounter < 50){
 697  0312 b603          	ld	a,L7_dotPulseCounter
 698  0314 a132          	cp	a,#50
 699  0316 2402          	jruge	L322
 700                     ; 269 		dotPulseCounter++;
 701  0318 3c03          	inc	L7_dotPulseCounter
 702  031a               L322:
 703                     ; 271 }
 704  031a 81            	ret
 706                     	switch	.const
 707  0005               L03:
 708  0005 00000064      	dc.l	100
 709                     ; 273 static void displaySetDotBright( uint8_t bright)
 709                     ; 274 {
 710                     	switch	.text
 711  031b               L51_displaySetDotBright:
 712  031b 88            	push	a
 713  031c 89            	pushw	x
 714       00000002      OFST:	set	2
 716                     ; 277 	if (bright == 0) {
 717  031d 4d            	tnz	a
 718  031e 260a          	jrne	L522
 719                     ; 278 		sfr_TIM2.IER.CC2IE 		= 0;						// TIM2 channel 2 compare interrupt disable
 720  0320 72155303      	bres	21251,#2
 721                     ; 279 		DOT_PIN = 0;
 722  0324 721d500f      	bres	20495,#6
 724  0328 2030          	jra	L722
 725  032a               L522:
 726                     ; 281 		b = scale(bright,100,displayBright);
 727  032a 7b03          	ld	a,(OFST+1,sp)
 728  032c 5f            	clrw	x
 729  032d 97            	ld	xl,a
 730  032e 90be00        	ldw	y,L11_displayBright
 731  0331 cd0000        	call	c_umul
 733  0334 ae0005        	ldw	x,#L03
 734  0337 cd0000        	call	c_ldiv
 736  033a be02          	ldw	x,c_lreg+2
 737  033c 1f01          	ldw	(OFST-1,sp),x
 738                     ; 282 		if (b < DOT_MIN_BRIGHT) {b = DOT_MIN_BRIGHT;}
 739  033e 1e01          	ldw	x,(OFST-1,sp)
 740  0340 a30064        	cpw	x,#100
 741  0343 2405          	jruge	L132
 743  0345 ae0064        	ldw	x,#100
 744  0348 1f01          	ldw	(OFST-1,sp),x
 745  034a               L132:
 746                     ; 283 		sfr_TIM2.CCR2H.byte = hibyte(b);		// set PWM channel 2 duty period
 747  034a 7b01          	ld	a,(OFST-1,sp)
 748  034c c75313        	ld	21267,a
 749                     ; 284 		sfr_TIM2.CCR2L.byte = lobyte(b);
 750  034f 7b02          	ld	a,(OFST+0,sp)
 751  0351 a4ff          	and	a,#255
 752  0353 c75314        	ld	21268,a
 753                     ; 285 		sfr_TIM2.IER.CC2IE 		= 1;					// TIM2 channel 2 compare interrupt enable
 754  0356 72145303      	bset	21251,#2
 755  035a               L722:
 756                     ; 287 }
 757  035a 5b03          	addw	sp,#3
 758  035c 81            	ret
 760                     ; 289 ISR_HANDLER (TIM2_UPD_ISR, _TIM2_OVR_UIF_VECTOR_)
 760                     ; 290 {
 761                     	scross	on
 762  035d               f_TIM2_UPD_ISR:
 763  035d 8a            	push	cc
 764  035e 84            	pop	a
 765  035f a4bf          	and	a,#191
 766  0361 88            	push	a
 767  0362 86            	pop	cc
 768  0363 3b0002        	push	c_x+2
 769  0366 be00          	ldw	x,c_x
 770  0368 89            	pushw	x
 771  0369 3b0002        	push	c_y+2
 772  036c be00          	ldw	x,c_y
 773  036e 89            	pushw	x
 775                     ; 291 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
 776  036f 4b05          	push	#5
 777  0371 ae0005        	ldw	x,#L5_disp_data
 778  0374 cd0000        	call	_hc595ChainShiftOut
 780  0377 84            	pop	a
 781                     ; 292 	if (sfr_TIM2.IER.CC2IE)
 782  0378 c65303        	ld	a,21251
 783  037b a504          	bcp	a,#4
 784  037d 2704          	jreq	L332
 785                     ; 294 		DOT_PIN = 1;
 786  037f 721c500f      	bset	20495,#6
 787  0383               L332:
 788                     ; 296 	flag10ms = 1;
 789  0383 35010002      	mov	_flag10ms,#1
 790                     ; 297 	sfr_TIM2.SR1.UIF = 0;
 791  0387 72115304      	bres	21252,#0
 792                     ; 298   return;
 793  038b 85            	popw	x
 794  038c bf00          	ldw	c_y,x
 795  038e 320002        	pop	c_y+2
 796  0391 85            	popw	x
 797  0392 bf00          	ldw	c_x,x
 798  0394 320002        	pop	c_x+2
 799  0397 80            	iret
 800                     ; 302 ISR_HANDLER (TIM2_CAP_ISR, _TIM2_CAPCOM_CC1IF_VECTOR_)
 800                     ; 303 {
 801  0398               f_TIM2_CAP_ISR:
 802  0398 8a            	push	cc
 803  0399 84            	pop	a
 804  039a a4bf          	and	a,#191
 805  039c 88            	push	a
 806  039d 86            	pop	cc
 807  039e 3b0002        	push	c_x+2
 808  03a1 be00          	ldw	x,c_x
 809  03a3 89            	pushw	x
 810  03a4 3b0002        	push	c_y+2
 811  03a7 be00          	ldw	x,c_y
 812  03a9 89            	pushw	x
 814                     ; 305 	if(sfr_TIM2.SR1.CC1IF){
 815  03aa c65304        	ld	a,21252
 816  03ad a502          	bcp	a,#2
 817  03af 270d          	jreq	L532
 818                     ; 306 		hc595ChainShiftOut(zero_data,sizeof(zero_data));
 819  03b1 4b05          	push	#5
 820  03b3 ae0000        	ldw	x,#L3_zero_data
 821  03b6 cd0000        	call	_hc595ChainShiftOut
 823  03b9 84            	pop	a
 824                     ; 307 		sfr_TIM2.SR1.CC1IF = 0;
 825  03ba 72135304      	bres	21252,#1
 826  03be               L532:
 827                     ; 311 	if(sfr_TIM2.SR1.CC2IF)
 828  03be c65304        	ld	a,21252
 829  03c1 a504          	bcp	a,#4
 830  03c3 2708          	jreq	L732
 831                     ; 313 		DOT_PIN = 0;
 832  03c5 721d500f      	bres	20495,#6
 833                     ; 314 		sfr_TIM2.SR1.CC2IF = 0;
 834  03c9 72155304      	bres	21252,#2
 835  03cd               L732:
 836                     ; 316   return;
 837  03cd 85            	popw	x
 838  03ce bf00          	ldw	c_y,x
 839  03d0 320002        	pop	c_y+2
 840  03d3 85            	popw	x
 841  03d4 bf00          	ldw	c_x,x
 842  03d6 320002        	pop	c_x+2
 843  03d9 80            	iret
 844                     	switch	.const
 845  0009               L04:
 846  0009 000000ff      	dc.l	255
 847                     ; 320 void displayRGBset (uint8_t state)
 847                     ; 321 {
 848                     	scross	off
 849                     	switch	.text
 850  03da               _displayRGBset:
 852                     ; 322 	if (state){
 853  03da 4d            	tnz	a
 854  03db 274d          	jreq	L142
 855                     ; 323 		RGBsetR((uint16_t)scale(EEPROM_readByte(R_ADDR),255,displayBright));
 856  03dd ae000b        	ldw	x,#11
 857  03e0 cd0000        	call	_EEPROM_readByte
 859  03e3 5f            	clrw	x
 860  03e4 97            	ld	xl,a
 861  03e5 90be00        	ldw	y,L11_displayBright
 862  03e8 cd0000        	call	c_umul
 864  03eb ae0009        	ldw	x,#L04
 865  03ee cd0000        	call	c_ldiv
 867  03f1 be02          	ldw	x,c_lreg+2
 868  03f3 cd0000        	call	_RGBsetR
 870                     ; 324 		RGBsetG((uint16_t)scale(EEPROM_readByte(G_ADDR),255,displayBright));
 871  03f6 ae000c        	ldw	x,#12
 872  03f9 cd0000        	call	_EEPROM_readByte
 874  03fc 5f            	clrw	x
 875  03fd 97            	ld	xl,a
 876  03fe 90be00        	ldw	y,L11_displayBright
 877  0401 cd0000        	call	c_umul
 879  0404 ae0009        	ldw	x,#L04
 880  0407 cd0000        	call	c_ldiv
 882  040a be02          	ldw	x,c_lreg+2
 883  040c cd0000        	call	_RGBsetG
 885                     ; 325 		RGBsetB((uint16_t)scale(EEPROM_readByte(B_ADDR),255,displayBright));
 886  040f ae000d        	ldw	x,#13
 887  0412 cd0000        	call	_EEPROM_readByte
 889  0415 5f            	clrw	x
 890  0416 97            	ld	xl,a
 891  0417 90be00        	ldw	y,L11_displayBright
 892  041a cd0000        	call	c_umul
 894  041d ae0009        	ldw	x,#L04
 895  0420 cd0000        	call	c_ldiv
 897  0423 be02          	ldw	x,c_lreg+2
 898  0425 cd0000        	call	_RGBsetB
 901  0428 200c          	jra	L342
 902  042a               L142:
 903                     ; 327 		RGBsetR(0);
 904  042a 5f            	clrw	x
 905  042b cd0000        	call	_RGBsetR
 907                     ; 328 		RGBsetG(0);
 908  042e 5f            	clrw	x
 909  042f cd0000        	call	_RGBsetG
 911                     ; 329 		RGBsetB(0);
 912  0432 5f            	clrw	x
 913  0433 cd0000        	call	_RGBsetB
 915  0436               L342:
 916                     ; 331 }
 917  0436 81            	ret
 919                     ; 333 void displayRset(uint8_t value)
 919                     ; 334 {
 920  0437               _displayRset:
 922                     ; 335 	RGBsetR((uint16_t)scale(value,255,displayBright));
 923  0437 5f            	clrw	x
 924  0438 97            	ld	xl,a
 925  0439 90be00        	ldw	y,L11_displayBright
 926  043c cd0000        	call	c_umul
 928  043f ae0009        	ldw	x,#L04
 929  0442 cd0000        	call	c_ldiv
 931  0445 be02          	ldw	x,c_lreg+2
 932  0447 cd0000        	call	_RGBsetR
 934                     ; 336 }
 935  044a 81            	ret
 937                     ; 338 void displayGset(uint8_t value)
 937                     ; 339 {
 938  044b               _displayGset:
 940                     ; 340 	RGBsetG((uint16_t)scale(value,255,displayBright));
 941  044b 5f            	clrw	x
 942  044c 97            	ld	xl,a
 943  044d 90be00        	ldw	y,L11_displayBright
 944  0450 cd0000        	call	c_umul
 946  0453 ae0009        	ldw	x,#L04
 947  0456 cd0000        	call	c_ldiv
 949  0459 be02          	ldw	x,c_lreg+2
 950  045b cd0000        	call	_RGBsetG
 952                     ; 341 }
 953  045e 81            	ret
 955                     ; 343 void displayBset(uint8_t value)
 955                     ; 344 {
 956  045f               _displayBset:
 958                     ; 345 	RGBsetB((uint16_t)scale(value,255,displayBright));
 959  045f 5f            	clrw	x
 960  0460 97            	ld	xl,a
 961  0461 90be00        	ldw	y,L11_displayBright
 962  0464 cd0000        	call	c_umul
 964  0467 ae0009        	ldw	x,#L04
 965  046a cd0000        	call	c_ldiv
 967  046d be02          	ldw	x,c_lreg+2
 968  046f cd0000        	call	_RGBsetB
 970                     ; 346 }
 971  0472 81            	ret
 973                     	xdef	f_TIM2_CAP_ISR
 974                     	xdef	f_TIM2_UPD_ISR
 975                     	switch	.ubsct
 976  0000               L11_displayBright:
 977  0000 0000          	ds.b	2
 978  0002               _flag10ms:
 979  0002 00            	ds.b	1
 980                     	xdef	_flag10ms
 981  0003               L7_dotPulseCounter:
 982  0003 00            	ds.b	1
 983                     	xref	_EEPROM_readByte
 984                     	xref.b	_e
 985                     	xref	_RGBsetB
 986                     	xref	_RGBsetG
 987                     	xref	_RGBsetR
 988                     	xref	_RGBinit
 989                     	xdef	_displayBset
 990                     	xdef	_displayGset
 991                     	xdef	_displayRset
 992                     	xdef	_displayRGBset
 993                     	xdef	_displayDotPulseProc
 994                     	xdef	_displayDotPulse
 995                     	xdef	_displayDot
 996                     	xdef	_displayNixie
 997                     	xdef	_displaySetBright
 998                     	xdef	_displayInit
 999                     	xref	_hc595ChainShiftOut
1000                     	xref	_hc595Init
1001                     	xref.b	c_lreg
1002                     	xref.b	c_x
1003                     	xref.b	c_y
1004                     	xref	c_ldiv
1005                     	xref	c_umul
1006                     	xref	c_bmulx
1007                     	xref	c_xymov
1008                     	end
