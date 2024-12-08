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
  66                     ; 20 void displayInit ( void )
  66                     ; 21 {
  68                     	switch	.text
  69  0000               _displayInit:
  73                     ; 23 	sfr_PORTD.DDR.DDR6 = 1;     // input(=0) or output(=1)
  75  0000 721c5011      	bset	20497,#6
  76                     ; 24 	sfr_PORTD.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  78  0004 721c5012      	bset	20498,#6
  79                     ; 25 	sfr_PORTD.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  81  0008 721c5013      	bset	20499,#6
  82                     ; 26 	DOT_PIN = 0;
  84  000c 721d500f      	bres	20495,#6
  85                     ; 29   sfr_TIM2.CR1.ARPE = 1;								// use buffered period register to avoid glitches
  87  0010 721e5300      	bset	21248,#7
  88                     ; 30   sfr_TIM2.PSCR.PSC = 4;								// set TIM2 prescaler fTim = fcpu/2^pre with pre in [0..15]
  90  0014 c6530e        	ld	a,21262
  91  0017 a4f0          	and	a,#240
  92  0019 aa04          	or	a,#4
  93  001b c7530e        	ld	21262,a
  94                     ; 33   sfr_TIM2.ARRH.byte = hibyte(10000);		// set reload period = (ARR+1)/fTim
  96  001e 3527530f      	mov	21263,#39
  97                     ; 34   sfr_TIM2.ARRL.byte = lobyte(10000);
  99  0022 35105310      	mov	21264,#16
 100                     ; 36 	sfr_TIM2.CCR1H.byte = hibyte(1000);		// set PWM channel 1 duty period
 102  0026 35035311      	mov	21265,#3
 103                     ; 37 	sfr_TIM2.CCR1L.byte = lobyte(1000);
 105  002a 35e85312      	mov	21266,#232
 106                     ; 38 	sfr_TIM2.CCR2H.byte = hibyte(0);			// set PWM channel 2 duty period
 108  002e 725f5313      	clr	21267
 109                     ; 39 	sfr_TIM2.CCR2L.byte = lobyte(0);
 111  0032 725f5314      	clr	21268
 112                     ; 41 	sfr_TIM2.CCMR1.OC1PE 	= 1;						// buffer compare register to avoid glitches when changing duty cycle
 114  0036 72165307      	bset	21255,#3
 115                     ; 42 	sfr_TIM2.CCER1.CC1E 	= 0;						// TIM2 channel 1 output disable
 117  003a 7211530a      	bres	21258,#0
 118                     ; 43 	sfr_TIM2.CCER1.CC2E 	= 0;						// TIM2 channel 2 output disable
 120  003e 7219530a      	bres	21258,#4
 121                     ; 44 	sfr_TIM2.IER.CC1IE 		= 1;						// TIM2 channel 1 compare interrupt enable
 123  0042 72125303      	bset	21251,#1
 124                     ; 46 	sfr_TIM2.IER.UIE 			= 1;						// TIM2 update interrupt enable
 126  0046 72105303      	bset	21251,#0
 127                     ; 47 	sfr_TIM2.CR1.CEN     	= 1;						// start TIM2
 129  004a 72105300      	bset	21248,#0
 130                     ; 49 	hc595Init();
 132  004e cd0000        	call	_hc595Init
 134                     ; 50 	displaySetBright(100);
 136  0051 a664          	ld	a,#100
 137  0053 cd025f        	call	_displaySetBright
 139                     ; 51 	displayDot(0);
 141  0056 4f            	clr	a
 142  0057 cd02a6        	call	_displayDot
 144                     ; 52 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
 146  005a 4b05          	push	#5
 147  005c ae0005        	ldw	x,#L5_disp_data
 148  005f cd0000        	call	_hc595ChainShiftOut
 150  0062 84            	pop	a
 151                     ; 55 	RGBinit();
 153  0063 cd0000        	call	_RGBinit
 155                     ; 56 	rgbGlobalEn = EEPROM_readByte(RGB_EN_ADDR);
 157  0066 5f            	clrw	x
 158  0067 cd0000        	call	_EEPROM_readByte
 160  006a b700          	ld	L31_rgbGlobalEn,a
 161                     ; 57 	if (rgbGlobalEn > 1) {
 163  006c b600          	ld	a,L31_rgbGlobalEn
 164  006e a102          	cp	a,#2
 165  0070 2509          	jrult	L14
 166                     ; 58 		rgbGlobalEn = 0;
 168  0072 3f00          	clr	L31_rgbGlobalEn
 169                     ; 59 		EEPROM_writeByte(RGB_EN_ADDR,rgbGlobalEn);
 171  0074 4b00          	push	#0
 172  0076 5f            	clrw	x
 173  0077 cd0000        	call	_EEPROM_writeByte
 175  007a 84            	pop	a
 176  007b               L14:
 177                     ; 61 	displayRGBset(rgbGlobalEn);
 179  007b b600          	ld	a,L31_rgbGlobalEn
 180  007d cd03bd        	call	L12_displayRGBset
 182                     ; 62 }
 185  0080 81            	ret
 188                     .const:	section	.text
 189  0000               L34_data:
 190  0000 00            	dc.b	0
 191  0001 00            	dc.b	0
 192  0002 00            	dc.b	0
 193  0003 00            	dc.b	0
 194  0004 00            	dc.b	0
 239                     ; 65 static uint8_t *displayNixieBuffPrepare(uint8_t *inbuff)
 239                     ; 66 {
 240                     	switch	.text
 241  0081               L51_displayNixieBuffPrepare:
 243  0081 89            	pushw	x
 244  0082 5205          	subw	sp,#5
 245       00000005      OFST:	set	5
 248                     ; 68 	uint8_t data[5] = {0,0,0,0,0};
 250  0084 96            	ldw	x,sp
 251  0085 1c0001        	addw	x,#OFST-4
 252  0088 90ae0000      	ldw	y,#L34_data
 253  008c a605          	ld	a,#5
 254  008e cd0000        	call	c_xymov
 256                     ; 85 	switch(inbuff[0]){
 258  0091 1e06          	ldw	x,(OFST+1,sp)
 259  0093 f6            	ld	a,(x)
 261                     ; 116 		default:
 261                     ; 117 		break;
 262  0094 4d            	tnz	a
 263  0095 271d          	jreq	L54
 264  0097 4a            	dec	a
 265  0098 2722          	jreq	L74
 266  009a 4a            	dec	a
 267  009b 2727          	jreq	L15
 268  009d 4a            	dec	a
 269  009e 272c          	jreq	L35
 270  00a0 4a            	dec	a
 271  00a1 2731          	jreq	L55
 272  00a3 4a            	dec	a
 273  00a4 2736          	jreq	L75
 274  00a6 4a            	dec	a
 275  00a7 273b          	jreq	L16
 276  00a9 4a            	dec	a
 277  00aa 2740          	jreq	L36
 278  00ac 4a            	dec	a
 279  00ad 2745          	jreq	L56
 280  00af 4a            	dec	a
 281  00b0 274a          	jreq	L76
 282  00b2 204e          	jra	L122
 283  00b4               L54:
 284                     ; 86 		case 0:
 284                     ; 87 			bitset(data[4],0);
 286  00b4 7b05          	ld	a,(OFST+0,sp)
 287  00b6 aa01          	or	a,#1
 288  00b8 6b05          	ld	(OFST+0,sp),a
 290                     ; 88 			break;
 292  00ba 2046          	jra	L122
 293  00bc               L74:
 294                     ; 89 		case 1:
 294                     ; 90 			bitset(data[4],1);
 296  00bc 7b05          	ld	a,(OFST+0,sp)
 297  00be aa02          	or	a,#2
 298  00c0 6b05          	ld	(OFST+0,sp),a
 300                     ; 91 			break;
 302  00c2 203e          	jra	L122
 303  00c4               L15:
 304                     ; 92 		case 2:
 304                     ; 93 			bitset(data[4],2);
 306  00c4 7b05          	ld	a,(OFST+0,sp)
 307  00c6 aa04          	or	a,#4
 308  00c8 6b05          	ld	(OFST+0,sp),a
 310                     ; 94 			break;
 312  00ca 2036          	jra	L122
 313  00cc               L35:
 314                     ; 95 		case 3:
 314                     ; 96 			bitset(data[4],3);
 316  00cc 7b05          	ld	a,(OFST+0,sp)
 317  00ce aa08          	or	a,#8
 318  00d0 6b05          	ld	(OFST+0,sp),a
 320                     ; 97 			break;
 322  00d2 202e          	jra	L122
 323  00d4               L55:
 324                     ; 98 		case 4:
 324                     ; 99 			bitset(data[4],4);
 326  00d4 7b05          	ld	a,(OFST+0,sp)
 327  00d6 aa10          	or	a,#16
 328  00d8 6b05          	ld	(OFST+0,sp),a
 330                     ; 100 			break;
 332  00da 2026          	jra	L122
 333  00dc               L75:
 334                     ; 101 		case 5:
 334                     ; 102 			bitset(data[4],5);
 336  00dc 7b05          	ld	a,(OFST+0,sp)
 337  00de aa20          	or	a,#32
 338  00e0 6b05          	ld	(OFST+0,sp),a
 340                     ; 103 			break;
 342  00e2 201e          	jra	L122
 343  00e4               L16:
 344                     ; 104 		case 6:
 344                     ; 105 			bitset(data[4],6);
 346  00e4 7b05          	ld	a,(OFST+0,sp)
 347  00e6 aa40          	or	a,#64
 348  00e8 6b05          	ld	(OFST+0,sp),a
 350                     ; 106 			break;
 352  00ea 2016          	jra	L122
 353  00ec               L36:
 354                     ; 107 		case 7:
 354                     ; 108 			bitset(data[4],7);
 356  00ec 7b05          	ld	a,(OFST+0,sp)
 357  00ee aa80          	or	a,#128
 358  00f0 6b05          	ld	(OFST+0,sp),a
 360                     ; 109 			break;
 362  00f2 200e          	jra	L122
 363  00f4               L56:
 364                     ; 110 		case 8:
 364                     ; 111 			bitset(data[3],0);
 366  00f4 7b04          	ld	a,(OFST-1,sp)
 367  00f6 aa01          	or	a,#1
 368  00f8 6b04          	ld	(OFST-1,sp),a
 370                     ; 112 			break;
 372  00fa 2006          	jra	L122
 373  00fc               L76:
 374                     ; 113 		case 9:
 374                     ; 114 			bitset(data[3],1);
 376  00fc 7b04          	ld	a,(OFST-1,sp)
 377  00fe aa02          	or	a,#2
 378  0100 6b04          	ld	(OFST-1,sp),a
 380                     ; 115 			break;
 382  0102               L17:
 383                     ; 116 		default:
 383                     ; 117 		break;
 385  0102               L122:
 386                     ; 121 	switch(inbuff[1]){
 388  0102 1e06          	ldw	x,(OFST+1,sp)
 389  0104 e601          	ld	a,(1,x)
 391                     ; 152 		default:
 391                     ; 153 		break;
 392  0106 4d            	tnz	a
 393  0107 271d          	jreq	L37
 394  0109 4a            	dec	a
 395  010a 2722          	jreq	L57
 396  010c 4a            	dec	a
 397  010d 2727          	jreq	L77
 398  010f 4a            	dec	a
 399  0110 272c          	jreq	L101
 400  0112 4a            	dec	a
 401  0113 2731          	jreq	L301
 402  0115 4a            	dec	a
 403  0116 2736          	jreq	L501
 404  0118 4a            	dec	a
 405  0119 273b          	jreq	L701
 406  011b 4a            	dec	a
 407  011c 2740          	jreq	L111
 408  011e 4a            	dec	a
 409  011f 2745          	jreq	L311
 410  0121 4a            	dec	a
 411  0122 274a          	jreq	L511
 412  0124 204e          	jra	L522
 413  0126               L37:
 414                     ; 122 		case 0:
 414                     ; 123 			bitset(data[3],2);
 416  0126 7b04          	ld	a,(OFST-1,sp)
 417  0128 aa04          	or	a,#4
 418  012a 6b04          	ld	(OFST-1,sp),a
 420                     ; 124 			break;
 422  012c 2046          	jra	L522
 423  012e               L57:
 424                     ; 125 		case 1:
 424                     ; 126 			bitset(data[3],3);
 426  012e 7b04          	ld	a,(OFST-1,sp)
 427  0130 aa08          	or	a,#8
 428  0132 6b04          	ld	(OFST-1,sp),a
 430                     ; 127 			break;
 432  0134 203e          	jra	L522
 433  0136               L77:
 434                     ; 128 		case 2:
 434                     ; 129 			bitset(data[3],4);
 436  0136 7b04          	ld	a,(OFST-1,sp)
 437  0138 aa10          	or	a,#16
 438  013a 6b04          	ld	(OFST-1,sp),a
 440                     ; 130 			break;
 442  013c 2036          	jra	L522
 443  013e               L101:
 444                     ; 131 		case 3:
 444                     ; 132 			bitset(data[3],5);
 446  013e 7b04          	ld	a,(OFST-1,sp)
 447  0140 aa20          	or	a,#32
 448  0142 6b04          	ld	(OFST-1,sp),a
 450                     ; 133 			break;
 452  0144 202e          	jra	L522
 453  0146               L301:
 454                     ; 134 		case 4:
 454                     ; 135 			bitset(data[3],6);
 456  0146 7b04          	ld	a,(OFST-1,sp)
 457  0148 aa40          	or	a,#64
 458  014a 6b04          	ld	(OFST-1,sp),a
 460                     ; 136 			break;
 462  014c 2026          	jra	L522
 463  014e               L501:
 464                     ; 137 		case 5:
 464                     ; 138 			bitset(data[3],7);
 466  014e 7b04          	ld	a,(OFST-1,sp)
 467  0150 aa80          	or	a,#128
 468  0152 6b04          	ld	(OFST-1,sp),a
 470                     ; 139 			break;
 472  0154 201e          	jra	L522
 473  0156               L701:
 474                     ; 140 		case 6:
 474                     ; 141 			bitset(data[2],0);
 476  0156 7b03          	ld	a,(OFST-2,sp)
 477  0158 aa01          	or	a,#1
 478  015a 6b03          	ld	(OFST-2,sp),a
 480                     ; 142 			break;
 482  015c 2016          	jra	L522
 483  015e               L111:
 484                     ; 143 		case 7:
 484                     ; 144 			bitset(data[2],1);
 486  015e 7b03          	ld	a,(OFST-2,sp)
 487  0160 aa02          	or	a,#2
 488  0162 6b03          	ld	(OFST-2,sp),a
 490                     ; 145 			break;
 492  0164 200e          	jra	L522
 493  0166               L311:
 494                     ; 146 		case 8:
 494                     ; 147 			bitset(data[2],2);
 496  0166 7b03          	ld	a,(OFST-2,sp)
 497  0168 aa04          	or	a,#4
 498  016a 6b03          	ld	(OFST-2,sp),a
 500                     ; 148 			break;
 502  016c 2006          	jra	L522
 503  016e               L511:
 504                     ; 149 		case 9:
 504                     ; 150 			bitset(data[2],3);
 506  016e 7b03          	ld	a,(OFST-2,sp)
 507  0170 aa08          	or	a,#8
 508  0172 6b03          	ld	(OFST-2,sp),a
 510                     ; 151 			break;
 512  0174               L711:
 513                     ; 152 		default:
 513                     ; 153 		break;
 515  0174               L522:
 516                     ; 157 	switch(inbuff[2]){
 518  0174 1e06          	ldw	x,(OFST+1,sp)
 519  0176 e602          	ld	a,(2,x)
 521                     ; 188 		default:
 521                     ; 189 		break;
 522  0178 4d            	tnz	a
 523  0179 271d          	jreq	L121
 524  017b 4a            	dec	a
 525  017c 2722          	jreq	L321
 526  017e 4a            	dec	a
 527  017f 2727          	jreq	L521
 528  0181 4a            	dec	a
 529  0182 272c          	jreq	L721
 530  0184 4a            	dec	a
 531  0185 2731          	jreq	L131
 532  0187 4a            	dec	a
 533  0188 2736          	jreq	L331
 534  018a 4a            	dec	a
 535  018b 273b          	jreq	L531
 536  018d 4a            	dec	a
 537  018e 2740          	jreq	L731
 538  0190 4a            	dec	a
 539  0191 2745          	jreq	L141
 540  0193 4a            	dec	a
 541  0194 274a          	jreq	L341
 542  0196 204e          	jra	L132
 543  0198               L121:
 544                     ; 158 		case 0:
 544                     ; 159 			bitset(data[2],4);
 546  0198 7b03          	ld	a,(OFST-2,sp)
 547  019a aa10          	or	a,#16
 548  019c 6b03          	ld	(OFST-2,sp),a
 550                     ; 160 			break;
 552  019e 2046          	jra	L132
 553  01a0               L321:
 554                     ; 161 		case 1:
 554                     ; 162 			bitset(data[2],5);
 556  01a0 7b03          	ld	a,(OFST-2,sp)
 557  01a2 aa20          	or	a,#32
 558  01a4 6b03          	ld	(OFST-2,sp),a
 560                     ; 163 			break;
 562  01a6 203e          	jra	L132
 563  01a8               L521:
 564                     ; 164 		case 2:
 564                     ; 165 			bitset(data[2],6);
 566  01a8 7b03          	ld	a,(OFST-2,sp)
 567  01aa aa40          	or	a,#64
 568  01ac 6b03          	ld	(OFST-2,sp),a
 570                     ; 166 			break;
 572  01ae 2036          	jra	L132
 573  01b0               L721:
 574                     ; 167 		case 3:
 574                     ; 168 			bitset(data[2],7);
 576  01b0 7b03          	ld	a,(OFST-2,sp)
 577  01b2 aa80          	or	a,#128
 578  01b4 6b03          	ld	(OFST-2,sp),a
 580                     ; 169 			break;
 582  01b6 202e          	jra	L132
 583  01b8               L131:
 584                     ; 170 		case 4:
 584                     ; 171 			bitset(data[1],0);
 586  01b8 7b02          	ld	a,(OFST-3,sp)
 587  01ba aa01          	or	a,#1
 588  01bc 6b02          	ld	(OFST-3,sp),a
 590                     ; 172 			break;
 592  01be 2026          	jra	L132
 593  01c0               L331:
 594                     ; 173 		case 5:
 594                     ; 174 			bitset(data[1],1);
 596  01c0 7b02          	ld	a,(OFST-3,sp)
 597  01c2 aa02          	or	a,#2
 598  01c4 6b02          	ld	(OFST-3,sp),a
 600                     ; 175 			break;
 602  01c6 201e          	jra	L132
 603  01c8               L531:
 604                     ; 176 		case 6:
 604                     ; 177 			bitset(data[1],2);
 606  01c8 7b02          	ld	a,(OFST-3,sp)
 607  01ca aa04          	or	a,#4
 608  01cc 6b02          	ld	(OFST-3,sp),a
 610                     ; 178 			break;
 612  01ce 2016          	jra	L132
 613  01d0               L731:
 614                     ; 179 		case 7:
 614                     ; 180 			bitset(data[1],3);
 616  01d0 7b02          	ld	a,(OFST-3,sp)
 617  01d2 aa08          	or	a,#8
 618  01d4 6b02          	ld	(OFST-3,sp),a
 620                     ; 181 			break;
 622  01d6 200e          	jra	L132
 623  01d8               L141:
 624                     ; 182 		case 8:
 624                     ; 183 			bitset(data[1],4);
 626  01d8 7b02          	ld	a,(OFST-3,sp)
 627  01da aa10          	or	a,#16
 628  01dc 6b02          	ld	(OFST-3,sp),a
 630                     ; 184 			break;
 632  01de 2006          	jra	L132
 633  01e0               L341:
 634                     ; 185 		case 9:
 634                     ; 186 			bitset(data[1],5);
 636  01e0 7b02          	ld	a,(OFST-3,sp)
 637  01e2 aa20          	or	a,#32
 638  01e4 6b02          	ld	(OFST-3,sp),a
 640                     ; 187 			break;
 642  01e6               L541:
 643                     ; 188 		default:
 643                     ; 189 		break;
 645  01e6               L132:
 646                     ; 193   switch(inbuff[3]){
 648  01e6 1e06          	ldw	x,(OFST+1,sp)
 649  01e8 e603          	ld	a,(3,x)
 651                     ; 224 		default:
 651                     ; 225 		break;
 652  01ea 4d            	tnz	a
 653  01eb 271d          	jreq	L741
 654  01ed 4a            	dec	a
 655  01ee 2722          	jreq	L151
 656  01f0 4a            	dec	a
 657  01f1 2727          	jreq	L351
 658  01f3 4a            	dec	a
 659  01f4 272c          	jreq	L551
 660  01f6 4a            	dec	a
 661  01f7 2731          	jreq	L751
 662  01f9 4a            	dec	a
 663  01fa 2736          	jreq	L161
 664  01fc 4a            	dec	a
 665  01fd 273b          	jreq	L361
 666  01ff 4a            	dec	a
 667  0200 2740          	jreq	L561
 668  0202 4a            	dec	a
 669  0203 2745          	jreq	L761
 670  0205 4a            	dec	a
 671  0206 274a          	jreq	L171
 672  0208 204e          	jra	L532
 673  020a               L741:
 674                     ; 194 		case 0:
 674                     ; 195 			bitset(data[1],6);
 676  020a 7b02          	ld	a,(OFST-3,sp)
 677  020c aa40          	or	a,#64
 678  020e 6b02          	ld	(OFST-3,sp),a
 680                     ; 196 			break;
 682  0210 2046          	jra	L532
 683  0212               L151:
 684                     ; 197 		case 1:
 684                     ; 198 			bitset(data[1],7);
 686  0212 7b02          	ld	a,(OFST-3,sp)
 687  0214 aa80          	or	a,#128
 688  0216 6b02          	ld	(OFST-3,sp),a
 690                     ; 199 			break;
 692  0218 203e          	jra	L532
 693  021a               L351:
 694                     ; 200 		case 2:
 694                     ; 201 			bitset(data[0],0);
 696  021a 7b01          	ld	a,(OFST-4,sp)
 697  021c aa01          	or	a,#1
 698  021e 6b01          	ld	(OFST-4,sp),a
 700                     ; 202 			break;
 702  0220 2036          	jra	L532
 703  0222               L551:
 704                     ; 203 		case 3:
 704                     ; 204 			bitset(data[0],1);
 706  0222 7b01          	ld	a,(OFST-4,sp)
 707  0224 aa02          	or	a,#2
 708  0226 6b01          	ld	(OFST-4,sp),a
 710                     ; 205 			break;
 712  0228 202e          	jra	L532
 713  022a               L751:
 714                     ; 206 		case 4:
 714                     ; 207 			bitset(data[0],2);
 716  022a 7b01          	ld	a,(OFST-4,sp)
 717  022c aa04          	or	a,#4
 718  022e 6b01          	ld	(OFST-4,sp),a
 720                     ; 208 			break;
 722  0230 2026          	jra	L532
 723  0232               L161:
 724                     ; 209 		case 5:
 724                     ; 210 			bitset(data[0],3);
 726  0232 7b01          	ld	a,(OFST-4,sp)
 727  0234 aa08          	or	a,#8
 728  0236 6b01          	ld	(OFST-4,sp),a
 730                     ; 211 			break;
 732  0238 201e          	jra	L532
 733  023a               L361:
 734                     ; 212 		case 6:
 734                     ; 213 			bitset(data[0],4);
 736  023a 7b01          	ld	a,(OFST-4,sp)
 737  023c aa10          	or	a,#16
 738  023e 6b01          	ld	(OFST-4,sp),a
 740                     ; 214 			break;
 742  0240 2016          	jra	L532
 743  0242               L561:
 744                     ; 215 		case 7:
 744                     ; 216 			bitset(data[0],5);
 746  0242 7b01          	ld	a,(OFST-4,sp)
 747  0244 aa20          	or	a,#32
 748  0246 6b01          	ld	(OFST-4,sp),a
 750                     ; 217 			break;
 752  0248 200e          	jra	L532
 753  024a               L761:
 754                     ; 218 		case 8:
 754                     ; 219 			bitset(data[0],6);
 756  024a 7b01          	ld	a,(OFST-4,sp)
 757  024c aa40          	or	a,#64
 758  024e 6b01          	ld	(OFST-4,sp),a
 760                     ; 220 			break;
 762  0250 2006          	jra	L532
 763  0252               L171:
 764                     ; 221 		case 9:
 764                     ; 222 			bitset(data[0],7);
 766  0252 7b01          	ld	a,(OFST-4,sp)
 767  0254 aa80          	or	a,#128
 768  0256 6b01          	ld	(OFST-4,sp),a
 770                     ; 223 			break;
 772  0258               L371:
 773                     ; 224 		default:
 773                     ; 225 		break;
 775  0258               L532:
 776                     ; 228 	return data;
 778  0258 96            	ldw	x,sp
 779  0259 1c0001        	addw	x,#OFST-4
 782  025c 5b07          	addw	sp,#7
 783  025e 81            	ret
 821                     ; 233 void displaySetBright(uint8_t bright)
 821                     ; 234 {
 822                     	switch	.text
 823  025f               _displaySetBright:
 825  025f 88            	push	a
 826       00000000      OFST:	set	0
 829                     ; 235 	if (bright == 0){
 831  0260 4d            	tnz	a
 832  0261 260c          	jrne	L552
 833                     ; 237 		memcpy(disp_data,zero_data,sizeof(disp_data));
 835  0263 ae0005        	ldw	x,#5
 836  0266               L21:
 837  0266 e6ff          	ld	a,(L3_zero_data-1,x)
 838  0268 e704          	ld	(L5_disp_data-1,x),a
 839  026a 5a            	decw	x
 840  026b 26f9          	jrne	L21
 842  026d 2023          	jra	L752
 843  026f               L552:
 844                     ; 239 		displayBright = scale(bright,100,10000);
 846  026f 7b01          	ld	a,(OFST+1,sp)
 847  0271 5f            	clrw	x
 848  0272 97            	ld	xl,a
 849  0273 a664          	ld	a,#100
 850  0275 cd0000        	call	c_bmulx
 852  0278 bf01          	ldw	L11_displayBright,x
 853                     ; 240 		if (displayBright < NIXIE_MIN_BRIGHT){
 855  027a be01          	ldw	x,L11_displayBright
 856  027c a30064        	cpw	x,#100
 857  027f 2405          	jruge	L162
 858                     ; 241 			displayBright = NIXIE_MIN_BRIGHT;
 860  0281 ae0064        	ldw	x,#100
 861  0284 bf01          	ldw	L11_displayBright,x
 862  0286               L162:
 863                     ; 243 		sfr_TIM2.CCR1H.byte = hibyte(displayBright);		// set PWM channel 1 duty period
 865  0286 5500015311    	mov	21265,L11_displayBright
 866                     ; 244 		sfr_TIM2.CCR1L.byte = lobyte(displayBright);
 868  028b b602          	ld	a,L11_displayBright+1
 869  028d a4ff          	and	a,#255
 870  028f c75312        	ld	21266,a
 871  0292               L752:
 872                     ; 246 }
 875  0292 84            	pop	a
 876  0293 81            	ret
 914                     ; 251 void displayNixie(uint8_t *data)
 914                     ; 252 {
 915                     	switch	.text
 916  0294               _displayNixie:
 920                     ; 253 	memcpy(disp_data,displayNixieBuffPrepare(data),sizeof(disp_data));
 922  0294 cd0081        	call	L51_displayNixieBuffPrepare
 924  0297 bf00          	ldw	c_x,x
 925  0299 ae0005        	ldw	x,#5
 926  029c               L61:
 927  029c 5a            	decw	x
 928  029d 92d600        	ld	a,([c_x.w],x)
 929  02a0 e705          	ld	(L5_disp_data,x),a
 930  02a2 5d            	tnzw	x
 931  02a3 26f7          	jrne	L61
 932                     ; 254 }
 935  02a5 81            	ret
 979                     ; 256 void displayDot (uint8_t state) 
 979                     ; 257 {
 980                     	switch	.text
 981  02a6               _displayDot:
 983  02a6 89            	pushw	x
 984       00000002      OFST:	set	2
 987                     ; 258 	uint16_t bright = displayBright;
 989  02a7 be01          	ldw	x,L11_displayBright
 990  02a9 1f01          	ldw	(OFST-1,sp),x
 992                     ; 260 	if (state == 0) {
 994  02ab 4d            	tnz	a
 995  02ac 260a          	jrne	L323
 996                     ; 261 		sfr_TIM2.IER.CC2IE 		= 0;							// TIM2 channel 2 compare interrupt disable
 998  02ae 72155303      	bres	21251,#2
 999                     ; 262 		DOT_PIN = 0;
1001  02b2 721d500f      	bres	20495,#6
1003  02b6 201c          	jra	L523
1004  02b8               L323:
1005                     ; 264 		if (bright < DOT_MIN_BRIGHT) {
1007  02b8 1e01          	ldw	x,(OFST-1,sp)
1008  02ba a30064        	cpw	x,#100
1009  02bd 2405          	jruge	L723
1010                     ; 265 			bright = DOT_MIN_BRIGHT;
1012  02bf ae0064        	ldw	x,#100
1013  02c2 1f01          	ldw	(OFST-1,sp),x
1015  02c4               L723:
1016                     ; 267 		sfr_TIM2.CCR2H.byte = hibyte(bright);		// set PWM channel 2 duty period
1018  02c4 7b01          	ld	a,(OFST-1,sp)
1019  02c6 c75313        	ld	21267,a
1020                     ; 268 		sfr_TIM2.CCR2L.byte = lobyte(bright);
1022  02c9 7b02          	ld	a,(OFST+0,sp)
1023  02cb a4ff          	and	a,#255
1024  02cd c75314        	ld	21268,a
1025                     ; 269 		sfr_TIM2.IER.CC2IE 		= 1;							// TIM2 channel 2 compare interrupt enable
1027  02d0 72145303      	bset	21251,#2
1028  02d4               L523:
1029                     ; 271 }
1032  02d4 85            	popw	x
1033  02d5 81            	ret
1057                     ; 273 void displayDotPulse (void) 
1057                     ; 274 {
1058                     	switch	.text
1059  02d6               _displayDotPulse:
1063                     ; 275 	dotPulseCounter = 0;
1065  02d6 3f04          	clr	L7_dotPulseCounter
1066                     ; 276 }
1069  02d8 81            	ret
1095                     ; 278 void displayDotPulseProc (void)
1095                     ; 279 {
1096                     	switch	.text
1097  02d9               _displayDotPulseProc:
1101                     ; 280 	if (dotPulseCounter < 25){
1103  02d9 b604          	ld	a,L7_dotPulseCounter
1104  02db a119          	cp	a,#25
1105  02dd 2408          	jruge	L153
1106                     ; 281 		displaySetDotBright(dotPulseCounter*4);
1108  02df b604          	ld	a,L7_dotPulseCounter
1109  02e1 48            	sll	a
1110  02e2 48            	sll	a
1111  02e3 ad19          	call	L71_displaySetDotBright
1114  02e5 200e          	jra	L353
1115  02e7               L153:
1116                     ; 282 	}else if (dotPulseCounter < 50){
1118  02e7 b604          	ld	a,L7_dotPulseCounter
1119  02e9 a132          	cp	a,#50
1120  02eb 2408          	jruge	L353
1121                     ; 283 		displaySetDotBright((49-dotPulseCounter)*4);
1123  02ed a631          	ld	a,#49
1124  02ef b004          	sub	a,L7_dotPulseCounter
1125  02f1 48            	sll	a
1126  02f2 48            	sll	a
1127  02f3 ad09          	call	L71_displaySetDotBright
1129  02f5               L353:
1130                     ; 285 	if (dotPulseCounter < 50){
1132  02f5 b604          	ld	a,L7_dotPulseCounter
1133  02f7 a132          	cp	a,#50
1134  02f9 2402          	jruge	L753
1135                     ; 286 		dotPulseCounter++;
1137  02fb 3c04          	inc	L7_dotPulseCounter
1138  02fd               L753:
1139                     ; 288 }
1142  02fd 81            	ret
1187                     	switch	.const
1188  0005               L03:
1189  0005 00000064      	dc.l	100
1190                     ; 290 static void displaySetDotBright( uint8_t bright)
1190                     ; 291 {
1191                     	switch	.text
1192  02fe               L71_displaySetDotBright:
1194  02fe 88            	push	a
1195  02ff 89            	pushw	x
1196       00000002      OFST:	set	2
1199                     ; 294 	if (bright == 0) {
1201  0300 4d            	tnz	a
1202  0301 260a          	jrne	L304
1203                     ; 295 		sfr_TIM2.IER.CC2IE 		= 0;						// TIM2 channel 2 compare interrupt disable
1205  0303 72155303      	bres	21251,#2
1206                     ; 296 		DOT_PIN = 0;
1208  0307 721d500f      	bres	20495,#6
1210  030b 2030          	jra	L504
1211  030d               L304:
1212                     ; 298 		b = scale(bright,100,displayBright);
1214  030d 7b03          	ld	a,(OFST+1,sp)
1215  030f 5f            	clrw	x
1216  0310 97            	ld	xl,a
1217  0311 90be01        	ldw	y,L11_displayBright
1218  0314 cd0000        	call	c_umul
1220  0317 ae0005        	ldw	x,#L03
1221  031a cd0000        	call	c_ldiv
1223  031d be02          	ldw	x,c_lreg+2
1224  031f 1f01          	ldw	(OFST-1,sp),x
1226                     ; 299 		if (b < DOT_MIN_BRIGHT) {b = DOT_MIN_BRIGHT;}
1228  0321 1e01          	ldw	x,(OFST-1,sp)
1229  0323 a30064        	cpw	x,#100
1230  0326 2405          	jruge	L704
1233  0328 ae0064        	ldw	x,#100
1234  032b 1f01          	ldw	(OFST-1,sp),x
1236  032d               L704:
1237                     ; 300 		sfr_TIM2.CCR2H.byte = hibyte(b);		// set PWM channel 2 duty period
1239  032d 7b01          	ld	a,(OFST-1,sp)
1240  032f c75313        	ld	21267,a
1241                     ; 301 		sfr_TIM2.CCR2L.byte = lobyte(b);
1243  0332 7b02          	ld	a,(OFST+0,sp)
1244  0334 a4ff          	and	a,#255
1245  0336 c75314        	ld	21268,a
1246                     ; 302 		sfr_TIM2.IER.CC2IE 		= 1;					// TIM2 channel 2 compare interrupt enable
1248  0339 72145303      	bset	21251,#2
1249  033d               L504:
1250                     ; 304 }
1253  033d 5b03          	addw	sp,#3
1254  033f 81            	ret
1280                     ; 306 ISR_HANDLER (TIM2_UPD_ISR, _TIM2_OVR_UIF_VECTOR_)
1280                     ; 307 {
1282                     	switch	.text
1283  0340               f_TIM2_UPD_ISR:
1285  0340 8a            	push	cc
1286  0341 84            	pop	a
1287  0342 a4bf          	and	a,#191
1288  0344 88            	push	a
1289  0345 86            	pop	cc
1290  0346 3b0002        	push	c_x+2
1291  0349 be00          	ldw	x,c_x
1292  034b 89            	pushw	x
1293  034c 3b0002        	push	c_y+2
1294  034f be00          	ldw	x,c_y
1295  0351 89            	pushw	x
1298                     ; 308 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
1300  0352 4b05          	push	#5
1301  0354 ae0005        	ldw	x,#L5_disp_data
1302  0357 cd0000        	call	_hc595ChainShiftOut
1304  035a 84            	pop	a
1305                     ; 309 	if (sfr_TIM2.IER.CC2IE)
1307  035b c65303        	ld	a,21251
1308  035e a504          	bcp	a,#4
1309  0360 2704          	jreq	L124
1310                     ; 311 		DOT_PIN = 1;
1312  0362 721c500f      	bset	20495,#6
1313  0366               L124:
1314                     ; 313 	flag10ms = 1;
1316  0366 35010003      	mov	_flag10ms,#1
1317                     ; 314 	sfr_TIM2.SR1.UIF = 0;
1319  036a 72115304      	bres	21252,#0
1320                     ; 315   return;
1323  036e 85            	popw	x
1324  036f bf00          	ldw	c_y,x
1325  0371 320002        	pop	c_y+2
1326  0374 85            	popw	x
1327  0375 bf00          	ldw	c_x,x
1328  0377 320002        	pop	c_x+2
1329  037a 80            	iret
1353                     ; 319 ISR_HANDLER (TIM2_CAP_ISR, _TIM2_CAPCOM_CC1IF_VECTOR_)
1353                     ; 320 {
1354                     	switch	.text
1355  037b               f_TIM2_CAP_ISR:
1357  037b 8a            	push	cc
1358  037c 84            	pop	a
1359  037d a4bf          	and	a,#191
1360  037f 88            	push	a
1361  0380 86            	pop	cc
1362  0381 3b0002        	push	c_x+2
1363  0384 be00          	ldw	x,c_x
1364  0386 89            	pushw	x
1365  0387 3b0002        	push	c_y+2
1366  038a be00          	ldw	x,c_y
1367  038c 89            	pushw	x
1370                     ; 322 	if(sfr_TIM2.SR1.CC1IF){
1372  038d c65304        	ld	a,21252
1373  0390 a502          	bcp	a,#2
1374  0392 270d          	jreq	L334
1375                     ; 323 		hc595ChainShiftOut(zero_data,sizeof(zero_data));
1377  0394 4b05          	push	#5
1378  0396 ae0000        	ldw	x,#L3_zero_data
1379  0399 cd0000        	call	_hc595ChainShiftOut
1381  039c 84            	pop	a
1382                     ; 324 		sfr_TIM2.SR1.CC1IF = 0;
1384  039d 72135304      	bres	21252,#1
1385  03a1               L334:
1386                     ; 328 	if(sfr_TIM2.SR1.CC2IF)
1388  03a1 c65304        	ld	a,21252
1389  03a4 a504          	bcp	a,#4
1390  03a6 2708          	jreq	L534
1391                     ; 330 		DOT_PIN = 0;
1393  03a8 721d500f      	bres	20495,#6
1394                     ; 331 		sfr_TIM2.SR1.CC2IF = 0;
1396  03ac 72155304      	bres	21252,#2
1397  03b0               L534:
1398                     ; 333   return;
1401  03b0 85            	popw	x
1402  03b1 bf00          	ldw	c_y,x
1403  03b3 320002        	pop	c_y+2
1404  03b6 85            	popw	x
1405  03b7 bf00          	ldw	c_x,x
1406  03b9 320002        	pop	c_x+2
1407  03bc 80            	iret
1444                     	switch	.const
1445  0009               L04:
1446  0009 000000ff      	dc.l	255
1447                     ; 337 static void displayRGBset (uint8_t state)
1447                     ; 338 {
1448                     	scross	off
1449                     	switch	.text
1450  03bd               L12_displayRGBset:
1454                     ; 339 	if (state){
1456  03bd 4d            	tnz	a
1457  03be 272a          	jreq	L554
1458                     ; 341 		RGBsetR((uint16_t)scale(30,255,displayBright));
1460  03c0 be01          	ldw	x,L11_displayBright
1461  03c2 a61e          	ld	a,#30
1462  03c4 cd0000        	call	c_cmulx
1464  03c7 ae0009        	ldw	x,#L04
1465  03ca cd0000        	call	c_ldiv
1467  03cd be02          	ldw	x,c_lreg+2
1468  03cf cd0000        	call	_RGBsetR
1470                     ; 342 		RGBsetG((uint16_t)scale(0,255,displayBright));
1472  03d2 5f            	clrw	x
1473  03d3 cd0000        	call	_RGBsetG
1475                     ; 343 		RGBsetB((uint16_t)scale(30,255,displayBright));
1477  03d6 be01          	ldw	x,L11_displayBright
1478  03d8 a61e          	ld	a,#30
1479  03da cd0000        	call	c_cmulx
1481  03dd ae0009        	ldw	x,#L04
1482  03e0 cd0000        	call	c_ldiv
1484  03e3 be02          	ldw	x,c_lreg+2
1485  03e5 cd0000        	call	_RGBsetB
1488  03e8 200c          	jra	L754
1489  03ea               L554:
1490                     ; 345 		RGBsetR(0);
1492  03ea 5f            	clrw	x
1493  03eb cd0000        	call	_RGBsetR
1495                     ; 346 		RGBsetG(0);
1497  03ee 5f            	clrw	x
1498  03ef cd0000        	call	_RGBsetG
1500                     ; 347 		RGBsetB(0);
1502  03f2 5f            	clrw	x
1503  03f3 cd0000        	call	_RGBsetB
1505  03f6               L754:
1506                     ; 349 }
1509  03f6 81            	ret
1535                     ; 351 void displayRGBtoggle ( void )
1535                     ; 352 {
1536                     	switch	.text
1537  03f7               _displayRGBtoggle:
1541                     ; 353 	if (rgbGlobalEn){
1543  03f7 3d00          	tnz	L31_rgbGlobalEn
1544  03f9 2704          	jreq	L174
1545                     ; 354 		rgbGlobalEn = 0;
1547  03fb 3f00          	clr	L31_rgbGlobalEn
1549  03fd 2004          	jra	L374
1550  03ff               L174:
1551                     ; 356 		rgbGlobalEn = 1;
1553  03ff 35010000      	mov	L31_rgbGlobalEn,#1
1554  0403               L374:
1555                     ; 358 	displayRGBset(rgbGlobalEn);
1557  0403 b600          	ld	a,L31_rgbGlobalEn
1558  0405 adb6          	call	L12_displayRGBset
1560                     ; 359 	EEPROM_writeByte(RGB_EN_ADDR,rgbGlobalEn);
1562  0407 3b0000        	push	L31_rgbGlobalEn
1563  040a 5f            	clrw	x
1564  040b cd0000        	call	_EEPROM_writeByte
1566  040e 84            	pop	a
1567                     ; 360 }
1570  040f 81            	ret
1641                     	xdef	f_TIM2_CAP_ISR
1642                     	xdef	f_TIM2_UPD_ISR
1643                     	switch	.ubsct
1644  0000               L31_rgbGlobalEn:
1645  0000 00            	ds.b	1
1646  0001               L11_displayBright:
1647  0001 0000          	ds.b	2
1648  0003               _flag10ms:
1649  0003 00            	ds.b	1
1650                     	xdef	_flag10ms
1651  0004               L7_dotPulseCounter:
1652  0004 00            	ds.b	1
1653                     	xref	_EEPROM_readByte
1654                     	xref	_EEPROM_writeByte
1655                     	xref	_RGBsetB
1656                     	xref	_RGBsetG
1657                     	xref	_RGBsetR
1658                     	xref	_RGBinit
1659                     	xdef	_displayRGBtoggle
1660                     	xdef	_displayDotPulseProc
1661                     	xdef	_displayDotPulse
1662                     	xdef	_displayDot
1663                     	xdef	_displayNixie
1664                     	xdef	_displaySetBright
1665                     	xdef	_displayInit
1666                     	xref	_hc595ChainShiftOut
1667                     	xref	_hc595Init
1668                     	xref.b	c_lreg
1669                     	xref.b	c_x
1670                     	xref.b	c_y
1690                     	xref	c_cmulx
1691                     	xref	c_ldiv
1692                     	xref	c_umul
1693                     	xref	c_bmulx
1694                     	xref	c_xymov
1695                     	end
