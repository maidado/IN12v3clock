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
  34                     ; 21 void displayInit ( void )
  34                     ; 22 {
  35                     	scross	off
  36                     	switch	.text
  37  0000               _displayInit:
  39                     ; 24 	sfr_PORTD.DDR.DDR6 = 1;     // input(=0) or output(=1)
  40  0000 721c5011      	bset	20497,#6
  41                     ; 25 	sfr_PORTD.CR1.C16  = 1;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  42  0004 721c5012      	bset	20498,#6
  43                     ; 26 	sfr_PORTD.CR2.C26  = 1;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  44  0008 721c5013      	bset	20499,#6
  45                     ; 27 	DOT_PIN = 0;
  46  000c 721d500f      	bres	20495,#6
  47                     ; 30   sfr_TIM2.CR1.ARPE = 1;								// use buffered period register to avoid glitches
  48  0010 721e5300      	bset	21248,#7
  49                     ; 31   sfr_TIM2.PSCR.PSC = 4;								// set TIM2 prescaler fTim = fcpu/2^pre with pre in [0..15]
  50  0014 c6530e        	ld	a,21262
  51  0017 a4f0          	and	a,#240
  52  0019 aa04          	or	a,#4
  53  001b c7530e        	ld	21262,a
  54                     ; 34   sfr_TIM2.ARRH.byte = hibyte(10000);		// set reload period = (ARR+1)/fTim
  55  001e 3527530f      	mov	21263,#39
  56                     ; 35   sfr_TIM2.ARRL.byte = lobyte(10000);
  57  0022 35105310      	mov	21264,#16
  58                     ; 37 	sfr_TIM2.CCR1H.byte = hibyte(1000);		// set PWM channel 1 duty period
  59  0026 35035311      	mov	21265,#3
  60                     ; 38 	sfr_TIM2.CCR1L.byte = lobyte(1000);
  61  002a 35e85312      	mov	21266,#232
  62                     ; 39 	sfr_TIM2.CCR2H.byte = hibyte(0);			// set PWM channel 2 duty period
  63  002e 725f5313      	clr	21267
  64                     ; 40 	sfr_TIM2.CCR2L.byte = lobyte(0);
  65  0032 725f5314      	clr	21268
  66                     ; 42 	sfr_TIM2.CCMR1.OC1PE 	= 1;						// buffer compare register to avoid glitches when changing duty cycle
  67  0036 72165307      	bset	21255,#3
  68                     ; 43 	sfr_TIM2.CCER1.CC1E 	= 0;						// TIM2 channel 1 output disable
  69  003a 7211530a      	bres	21258,#0
  70                     ; 44 	sfr_TIM2.CCER1.CC2E 	= 0;						// TIM2 channel 2 output disable
  71  003e 7219530a      	bres	21258,#4
  72                     ; 45 	sfr_TIM2.IER.CC1IE 		= 1;						// TIM2 channel 1 compare interrupt enable
  73  0042 72125303      	bset	21251,#1
  74                     ; 47 	sfr_TIM2.IER.UIE 			= 1;						// TIM2 update interrupt enable
  75  0046 72105303      	bset	21251,#0
  76                     ; 48 	sfr_TIM2.CR1.CEN     	= 1;						// start TIM2
  77  004a 72105300      	bset	21248,#0
  78                     ; 50 	hc595Init();
  79  004e cd0000        	call	_hc595Init
  81                     ; 51 	displaySetBright(100);
  82  0051 a664          	ld	a,#100
  83  0053 cd024a        	call	_displaySetBright
  85                     ; 52 	displayDot(0);
  86  0056 4f            	clr	a
  87  0057 cd02bd        	call	_displayDot
  89                     ; 53 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
  90  005a 4b05          	push	#5
  91  005c ae0005        	ldw	x,#L5_disp_data
  92  005f cd0000        	call	_hc595ChainShiftOut
  94  0062 84            	pop	a
  95                     ; 56 	RGBinit();
  96  0063 cd0000        	call	_RGBinit
  98                     ; 57 	displayRGBset(e.rgbGlobalEn);
  99  0066 b60b          	ld	a,_e+11
 100  0068 cd03e3        	call	_displayRGBset
 102                     ; 58 }
 103  006b 81            	ret
 105                     .const:	section	.text
 106  0000               L32_data:
 107  0000 00            	dc.b	0
 108  0001 00            	dc.b	0
 109  0002 00            	dc.b	0
 110  0003 00            	dc.b	0
 111  0004 00            	dc.b	0
 112                     ; 61 static uint8_t *displayNixieBuffPrepare(uint8_t *inbuff)
 112                     ; 62 {
 113                     	switch	.text
 114  006c               L71_displayNixieBuffPrepare:
 115  006c 89            	pushw	x
 116  006d 5205          	subw	sp,#5
 117       00000005      OFST:	set	5
 119                     ; 63 	uint8_t data[5] = {0,0,0,0,0};
 120  006f 96            	ldw	x,sp
 121  0070 1c0001        	addw	x,#OFST-4
 122  0073 90ae0000      	ldw	y,#L32_data
 123  0077 a605          	ld	a,#5
 124  0079 cd0000        	call	c_xymov
 126                     ; 66 	switch(inbuff[0]){
 127  007c 1e06          	ldw	x,(OFST+1,sp)
 128  007e f6            	ld	a,(x)
 130                     ; 97 		default:
 130                     ; 98 		break;
 131  007f 4d            	tnz	a
 132  0080 271d          	jreq	L52
 133  0082 4a            	dec	a
 134  0083 2722          	jreq	L72
 135  0085 4a            	dec	a
 136  0086 2727          	jreq	L13
 137  0088 4a            	dec	a
 138  0089 272c          	jreq	L33
 139  008b 4a            	dec	a
 140  008c 2731          	jreq	L53
 141  008e 4a            	dec	a
 142  008f 2736          	jreq	L73
 143  0091 4a            	dec	a
 144  0092 273b          	jreq	L14
 145  0094 4a            	dec	a
 146  0095 2740          	jreq	L34
 147  0097 4a            	dec	a
 148  0098 2745          	jreq	L54
 149  009a 4a            	dec	a
 150  009b 274a          	jreq	L74
 151  009d 204e          	jra	L751
 152  009f               L52:
 153                     ; 67 		case 0:
 153                     ; 68 			bitset(data[4],0);
 154  009f 7b05          	ld	a,(OFST+0,sp)
 155  00a1 aa01          	or	a,#1
 156  00a3 6b05          	ld	(OFST+0,sp),a
 157                     ; 69 			break;
 158  00a5 2046          	jra	L751
 159  00a7               L72:
 160                     ; 70 		case 1:
 160                     ; 71 			bitset(data[4],1);
 161  00a7 7b05          	ld	a,(OFST+0,sp)
 162  00a9 aa02          	or	a,#2
 163  00ab 6b05          	ld	(OFST+0,sp),a
 164                     ; 72 			break;
 165  00ad 203e          	jra	L751
 166  00af               L13:
 167                     ; 73 		case 2:
 167                     ; 74 			bitset(data[4],2);
 168  00af 7b05          	ld	a,(OFST+0,sp)
 169  00b1 aa04          	or	a,#4
 170  00b3 6b05          	ld	(OFST+0,sp),a
 171                     ; 75 			break;
 172  00b5 2036          	jra	L751
 173  00b7               L33:
 174                     ; 76 		case 3:
 174                     ; 77 			bitset(data[4],3);
 175  00b7 7b05          	ld	a,(OFST+0,sp)
 176  00b9 aa08          	or	a,#8
 177  00bb 6b05          	ld	(OFST+0,sp),a
 178                     ; 78 			break;
 179  00bd 202e          	jra	L751
 180  00bf               L53:
 181                     ; 79 		case 4:
 181                     ; 80 			bitset(data[4],4);
 182  00bf 7b05          	ld	a,(OFST+0,sp)
 183  00c1 aa10          	or	a,#16
 184  00c3 6b05          	ld	(OFST+0,sp),a
 185                     ; 81 			break;
 186  00c5 2026          	jra	L751
 187  00c7               L73:
 188                     ; 82 		case 5:
 188                     ; 83 			bitset(data[4],5);
 189  00c7 7b05          	ld	a,(OFST+0,sp)
 190  00c9 aa20          	or	a,#32
 191  00cb 6b05          	ld	(OFST+0,sp),a
 192                     ; 84 			break;
 193  00cd 201e          	jra	L751
 194  00cf               L14:
 195                     ; 85 		case 6:
 195                     ; 86 			bitset(data[4],6);
 196  00cf 7b05          	ld	a,(OFST+0,sp)
 197  00d1 aa40          	or	a,#64
 198  00d3 6b05          	ld	(OFST+0,sp),a
 199                     ; 87 			break;
 200  00d5 2016          	jra	L751
 201  00d7               L34:
 202                     ; 88 		case 7:
 202                     ; 89 			bitset(data[4],7);
 203  00d7 7b05          	ld	a,(OFST+0,sp)
 204  00d9 aa80          	or	a,#128
 205  00db 6b05          	ld	(OFST+0,sp),a
 206                     ; 90 			break;
 207  00dd 200e          	jra	L751
 208  00df               L54:
 209                     ; 91 		case 8:
 209                     ; 92 			bitset(data[3],0);
 210  00df 7b04          	ld	a,(OFST-1,sp)
 211  00e1 aa01          	or	a,#1
 212  00e3 6b04          	ld	(OFST-1,sp),a
 213                     ; 93 			break;
 214  00e5 2006          	jra	L751
 215  00e7               L74:
 216                     ; 94 		case 9:
 216                     ; 95 			bitset(data[3],1);
 217  00e7 7b04          	ld	a,(OFST-1,sp)
 218  00e9 aa02          	or	a,#2
 219  00eb 6b04          	ld	(OFST-1,sp),a
 220                     ; 96 			break;
 221  00ed               L15:
 222                     ; 97 		default:
 222                     ; 98 		break;
 223  00ed               L751:
 224                     ; 102 	switch(inbuff[1]){
 225  00ed 1e06          	ldw	x,(OFST+1,sp)
 226  00ef e601          	ld	a,(1,x)
 228                     ; 133 		default:
 228                     ; 134 		break;
 229  00f1 4d            	tnz	a
 230  00f2 271d          	jreq	L35
 231  00f4 4a            	dec	a
 232  00f5 2722          	jreq	L55
 233  00f7 4a            	dec	a
 234  00f8 2727          	jreq	L75
 235  00fa 4a            	dec	a
 236  00fb 272c          	jreq	L16
 237  00fd 4a            	dec	a
 238  00fe 2731          	jreq	L36
 239  0100 4a            	dec	a
 240  0101 2736          	jreq	L56
 241  0103 4a            	dec	a
 242  0104 273b          	jreq	L76
 243  0106 4a            	dec	a
 244  0107 2740          	jreq	L17
 245  0109 4a            	dec	a
 246  010a 2745          	jreq	L37
 247  010c 4a            	dec	a
 248  010d 274a          	jreq	L57
 249  010f 204e          	jra	L361
 250  0111               L35:
 251                     ; 103 		case 0:
 251                     ; 104 			bitset(data[3],2);
 252  0111 7b04          	ld	a,(OFST-1,sp)
 253  0113 aa04          	or	a,#4
 254  0115 6b04          	ld	(OFST-1,sp),a
 255                     ; 105 			break;
 256  0117 2046          	jra	L361
 257  0119               L55:
 258                     ; 106 		case 1:
 258                     ; 107 			bitset(data[3],3);
 259  0119 7b04          	ld	a,(OFST-1,sp)
 260  011b aa08          	or	a,#8
 261  011d 6b04          	ld	(OFST-1,sp),a
 262                     ; 108 			break;
 263  011f 203e          	jra	L361
 264  0121               L75:
 265                     ; 109 		case 2:
 265                     ; 110 			bitset(data[3],4);
 266  0121 7b04          	ld	a,(OFST-1,sp)
 267  0123 aa10          	or	a,#16
 268  0125 6b04          	ld	(OFST-1,sp),a
 269                     ; 111 			break;
 270  0127 2036          	jra	L361
 271  0129               L16:
 272                     ; 112 		case 3:
 272                     ; 113 			bitset(data[3],5);
 273  0129 7b04          	ld	a,(OFST-1,sp)
 274  012b aa20          	or	a,#32
 275  012d 6b04          	ld	(OFST-1,sp),a
 276                     ; 114 			break;
 277  012f 202e          	jra	L361
 278  0131               L36:
 279                     ; 115 		case 4:
 279                     ; 116 			bitset(data[3],6);
 280  0131 7b04          	ld	a,(OFST-1,sp)
 281  0133 aa40          	or	a,#64
 282  0135 6b04          	ld	(OFST-1,sp),a
 283                     ; 117 			break;
 284  0137 2026          	jra	L361
 285  0139               L56:
 286                     ; 118 		case 5:
 286                     ; 119 			bitset(data[3],7);
 287  0139 7b04          	ld	a,(OFST-1,sp)
 288  013b aa80          	or	a,#128
 289  013d 6b04          	ld	(OFST-1,sp),a
 290                     ; 120 			break;
 291  013f 201e          	jra	L361
 292  0141               L76:
 293                     ; 121 		case 6:
 293                     ; 122 			bitset(data[2],0);
 294  0141 7b03          	ld	a,(OFST-2,sp)
 295  0143 aa01          	or	a,#1
 296  0145 6b03          	ld	(OFST-2,sp),a
 297                     ; 123 			break;
 298  0147 2016          	jra	L361
 299  0149               L17:
 300                     ; 124 		case 7:
 300                     ; 125 			bitset(data[2],1);
 301  0149 7b03          	ld	a,(OFST-2,sp)
 302  014b aa02          	or	a,#2
 303  014d 6b03          	ld	(OFST-2,sp),a
 304                     ; 126 			break;
 305  014f 200e          	jra	L361
 306  0151               L37:
 307                     ; 127 		case 8:
 307                     ; 128 			bitset(data[2],2);
 308  0151 7b03          	ld	a,(OFST-2,sp)
 309  0153 aa04          	or	a,#4
 310  0155 6b03          	ld	(OFST-2,sp),a
 311                     ; 129 			break;
 312  0157 2006          	jra	L361
 313  0159               L57:
 314                     ; 130 		case 9:
 314                     ; 131 			bitset(data[2],3);
 315  0159 7b03          	ld	a,(OFST-2,sp)
 316  015b aa08          	or	a,#8
 317  015d 6b03          	ld	(OFST-2,sp),a
 318                     ; 132 			break;
 319  015f               L77:
 320                     ; 133 		default:
 320                     ; 134 		break;
 321  015f               L361:
 322                     ; 138 	switch(inbuff[2]){
 323  015f 1e06          	ldw	x,(OFST+1,sp)
 324  0161 e602          	ld	a,(2,x)
 326                     ; 169 		default:
 326                     ; 170 		break;
 327  0163 4d            	tnz	a
 328  0164 271d          	jreq	L101
 329  0166 4a            	dec	a
 330  0167 2722          	jreq	L301
 331  0169 4a            	dec	a
 332  016a 2727          	jreq	L501
 333  016c 4a            	dec	a
 334  016d 272c          	jreq	L701
 335  016f 4a            	dec	a
 336  0170 2731          	jreq	L111
 337  0172 4a            	dec	a
 338  0173 2736          	jreq	L311
 339  0175 4a            	dec	a
 340  0176 273b          	jreq	L511
 341  0178 4a            	dec	a
 342  0179 2740          	jreq	L711
 343  017b 4a            	dec	a
 344  017c 2745          	jreq	L121
 345  017e 4a            	dec	a
 346  017f 274a          	jreq	L321
 347  0181 204e          	jra	L761
 348  0183               L101:
 349                     ; 139 		case 0:
 349                     ; 140 			bitset(data[2],4);
 350  0183 7b03          	ld	a,(OFST-2,sp)
 351  0185 aa10          	or	a,#16
 352  0187 6b03          	ld	(OFST-2,sp),a
 353                     ; 141 			break;
 354  0189 2046          	jra	L761
 355  018b               L301:
 356                     ; 142 		case 1:
 356                     ; 143 			bitset(data[2],5);
 357  018b 7b03          	ld	a,(OFST-2,sp)
 358  018d aa20          	or	a,#32
 359  018f 6b03          	ld	(OFST-2,sp),a
 360                     ; 144 			break;
 361  0191 203e          	jra	L761
 362  0193               L501:
 363                     ; 145 		case 2:
 363                     ; 146 			bitset(data[2],6);
 364  0193 7b03          	ld	a,(OFST-2,sp)
 365  0195 aa40          	or	a,#64
 366  0197 6b03          	ld	(OFST-2,sp),a
 367                     ; 147 			break;
 368  0199 2036          	jra	L761
 369  019b               L701:
 370                     ; 148 		case 3:
 370                     ; 149 			bitset(data[2],7);
 371  019b 7b03          	ld	a,(OFST-2,sp)
 372  019d aa80          	or	a,#128
 373  019f 6b03          	ld	(OFST-2,sp),a
 374                     ; 150 			break;
 375  01a1 202e          	jra	L761
 376  01a3               L111:
 377                     ; 151 		case 4:
 377                     ; 152 			bitset(data[1],0);
 378  01a3 7b02          	ld	a,(OFST-3,sp)
 379  01a5 aa01          	or	a,#1
 380  01a7 6b02          	ld	(OFST-3,sp),a
 381                     ; 153 			break;
 382  01a9 2026          	jra	L761
 383  01ab               L311:
 384                     ; 154 		case 5:
 384                     ; 155 			bitset(data[1],1);
 385  01ab 7b02          	ld	a,(OFST-3,sp)
 386  01ad aa02          	or	a,#2
 387  01af 6b02          	ld	(OFST-3,sp),a
 388                     ; 156 			break;
 389  01b1 201e          	jra	L761
 390  01b3               L511:
 391                     ; 157 		case 6:
 391                     ; 158 			bitset(data[1],2);
 392  01b3 7b02          	ld	a,(OFST-3,sp)
 393  01b5 aa04          	or	a,#4
 394  01b7 6b02          	ld	(OFST-3,sp),a
 395                     ; 159 			break;
 396  01b9 2016          	jra	L761
 397  01bb               L711:
 398                     ; 160 		case 7:
 398                     ; 161 			bitset(data[1],3);
 399  01bb 7b02          	ld	a,(OFST-3,sp)
 400  01bd aa08          	or	a,#8
 401  01bf 6b02          	ld	(OFST-3,sp),a
 402                     ; 162 			break;
 403  01c1 200e          	jra	L761
 404  01c3               L121:
 405                     ; 163 		case 8:
 405                     ; 164 			bitset(data[1],4);
 406  01c3 7b02          	ld	a,(OFST-3,sp)
 407  01c5 aa10          	or	a,#16
 408  01c7 6b02          	ld	(OFST-3,sp),a
 409                     ; 165 			break;
 410  01c9 2006          	jra	L761
 411  01cb               L321:
 412                     ; 166 		case 9:
 412                     ; 167 			bitset(data[1],5);
 413  01cb 7b02          	ld	a,(OFST-3,sp)
 414  01cd aa20          	or	a,#32
 415  01cf 6b02          	ld	(OFST-3,sp),a
 416                     ; 168 			break;
 417  01d1               L521:
 418                     ; 169 		default:
 418                     ; 170 		break;
 419  01d1               L761:
 420                     ; 174   switch(inbuff[3]){
 421  01d1 1e06          	ldw	x,(OFST+1,sp)
 422  01d3 e603          	ld	a,(3,x)
 424                     ; 205 		default:
 424                     ; 206 		break;
 425  01d5 4d            	tnz	a
 426  01d6 271d          	jreq	L721
 427  01d8 4a            	dec	a
 428  01d9 2722          	jreq	L131
 429  01db 4a            	dec	a
 430  01dc 2727          	jreq	L331
 431  01de 4a            	dec	a
 432  01df 272c          	jreq	L531
 433  01e1 4a            	dec	a
 434  01e2 2731          	jreq	L731
 435  01e4 4a            	dec	a
 436  01e5 2736          	jreq	L141
 437  01e7 4a            	dec	a
 438  01e8 273b          	jreq	L341
 439  01ea 4a            	dec	a
 440  01eb 2740          	jreq	L541
 441  01ed 4a            	dec	a
 442  01ee 2745          	jreq	L741
 443  01f0 4a            	dec	a
 444  01f1 274a          	jreq	L151
 445  01f3 204e          	jra	L371
 446  01f5               L721:
 447                     ; 175 		case 0:
 447                     ; 176 			bitset(data[1],6);
 448  01f5 7b02          	ld	a,(OFST-3,sp)
 449  01f7 aa40          	or	a,#64
 450  01f9 6b02          	ld	(OFST-3,sp),a
 451                     ; 177 			break;
 452  01fb 2046          	jra	L371
 453  01fd               L131:
 454                     ; 178 		case 1:
 454                     ; 179 			bitset(data[1],7);
 455  01fd 7b02          	ld	a,(OFST-3,sp)
 456  01ff aa80          	or	a,#128
 457  0201 6b02          	ld	(OFST-3,sp),a
 458                     ; 180 			break;
 459  0203 203e          	jra	L371
 460  0205               L331:
 461                     ; 181 		case 2:
 461                     ; 182 			bitset(data[0],0);
 462  0205 7b01          	ld	a,(OFST-4,sp)
 463  0207 aa01          	or	a,#1
 464  0209 6b01          	ld	(OFST-4,sp),a
 465                     ; 183 			break;
 466  020b 2036          	jra	L371
 467  020d               L531:
 468                     ; 184 		case 3:
 468                     ; 185 			bitset(data[0],1);
 469  020d 7b01          	ld	a,(OFST-4,sp)
 470  020f aa02          	or	a,#2
 471  0211 6b01          	ld	(OFST-4,sp),a
 472                     ; 186 			break;
 473  0213 202e          	jra	L371
 474  0215               L731:
 475                     ; 187 		case 4:
 475                     ; 188 			bitset(data[0],2);
 476  0215 7b01          	ld	a,(OFST-4,sp)
 477  0217 aa04          	or	a,#4
 478  0219 6b01          	ld	(OFST-4,sp),a
 479                     ; 189 			break;
 480  021b 2026          	jra	L371
 481  021d               L141:
 482                     ; 190 		case 5:
 482                     ; 191 			bitset(data[0],3);
 483  021d 7b01          	ld	a,(OFST-4,sp)
 484  021f aa08          	or	a,#8
 485  0221 6b01          	ld	(OFST-4,sp),a
 486                     ; 192 			break;
 487  0223 201e          	jra	L371
 488  0225               L341:
 489                     ; 193 		case 6:
 489                     ; 194 			bitset(data[0],4);
 490  0225 7b01          	ld	a,(OFST-4,sp)
 491  0227 aa10          	or	a,#16
 492  0229 6b01          	ld	(OFST-4,sp),a
 493                     ; 195 			break;
 494  022b 2016          	jra	L371
 495  022d               L541:
 496                     ; 196 		case 7:
 496                     ; 197 			bitset(data[0],5);
 497  022d 7b01          	ld	a,(OFST-4,sp)
 498  022f aa20          	or	a,#32
 499  0231 6b01          	ld	(OFST-4,sp),a
 500                     ; 198 			break;
 501  0233 200e          	jra	L371
 502  0235               L741:
 503                     ; 199 		case 8:
 503                     ; 200 			bitset(data[0],6);
 504  0235 7b01          	ld	a,(OFST-4,sp)
 505  0237 aa40          	or	a,#64
 506  0239 6b01          	ld	(OFST-4,sp),a
 507                     ; 201 			break;
 508  023b 2006          	jra	L371
 509  023d               L151:
 510                     ; 202 		case 9:
 510                     ; 203 			bitset(data[0],7);
 511  023d 7b01          	ld	a,(OFST-4,sp)
 512  023f aa80          	or	a,#128
 513  0241 6b01          	ld	(OFST-4,sp),a
 514                     ; 204 			break;
 515  0243               L351:
 516                     ; 205 		default:
 516                     ; 206 		break;
 517  0243               L371:
 518                     ; 209 	return data;
 519  0243 96            	ldw	x,sp
 520  0244 1c0001        	addw	x,#OFST-4
 522  0247 5b07          	addw	sp,#7
 523  0249 81            	ret
 525                     ; 214 void displaySetBright(uint8_t bright)
 525                     ; 215 {
 526  024a               _displaySetBright:
 527  024a 88            	push	a
 528       00000000      OFST:	set	0
 530                     ; 216 	if (bright == 0){
 531  024b 4d            	tnz	a
 532  024c 260a          	jrne	L571
 533                     ; 217 		memset(disp_data,0,sizeof(disp_data));
 534  024e ae0005        	ldw	x,#5
 535  0251               L01:
 536  0251 6f04          	clr	(L5_disp_data-1,x)
 537  0253 5a            	decw	x
 538  0254 26fb          	jrne	L01
 540  0256 2023          	jra	L771
 541  0258               L571:
 542                     ; 219 		displayBright = scale(bright,100,10000);
 543  0258 7b01          	ld	a,(OFST+1,sp)
 544  025a 5f            	clrw	x
 545  025b 97            	ld	xl,a
 546  025c a664          	ld	a,#100
 547  025e cd0000        	call	c_bmulx
 549  0261 bf01          	ldw	L31_displayBright,x
 550                     ; 220 		if (displayBright < NIXIE_MIN_BRIGHT){
 551  0263 be01          	ldw	x,L31_displayBright
 552  0265 a30064        	cpw	x,#100
 553  0268 2405          	jruge	L102
 554                     ; 221 			displayBright = NIXIE_MIN_BRIGHT;
 555  026a ae0064        	ldw	x,#100
 556  026d bf01          	ldw	L31_displayBright,x
 557  026f               L102:
 558                     ; 223 		sfr_TIM2.CCR1H.byte = hibyte(displayBright);		// set PWM channel 1 duty period
 559  026f 5500015311    	mov	21265,L31_displayBright
 560                     ; 224 		sfr_TIM2.CCR1L.byte = lobyte(displayBright);
 561  0274 b602          	ld	a,L31_displayBright+1
 562  0276 a4ff          	and	a,#255
 563  0278 c75312        	ld	21266,a
 564  027b               L771:
 565                     ; 226 }
 566  027b 84            	pop	a
 567  027c 81            	ret
 569                     ; 231 void displayNixie(uint8_t *data)
 569                     ; 232 {
 570  027d               _displayNixie:
 572                     ; 233 	memcpy(disp_data,displayNixieBuffPrepare(data),sizeof(disp_data));
 573  027d cd006c        	call	L71_displayNixieBuffPrepare
 575  0280 bf00          	ldw	c_x,x
 576  0282 ae0005        	ldw	x,#5
 577  0285               L41:
 578  0285 5a            	decw	x
 579  0286 92d600        	ld	a,([c_x.w],x)
 580  0289 e705          	ld	(L5_disp_data,x),a
 581  028b 5d            	tnzw	x
 582  028c 26f7          	jrne	L41
 583                     ; 234 	flagBrightSet = 0;
 584  028e 3f00          	clr	L51_flagBrightSet
 585                     ; 235 }
 586  0290 81            	ret
 588                     ; 237 void displayNixieBrightSet(uint8_t *data)
 588                     ; 238 {
 589  0291               _displayNixieBrightSet:
 591                     ; 239 	memcpy(disp_data,displayNixieBuffPrepare(data),sizeof(disp_data));
 592  0291 cd006c        	call	L71_displayNixieBuffPrepare
 594  0294 bf00          	ldw	c_x,x
 595  0296 ae0005        	ldw	x,#5
 596  0299               L02:
 597  0299 5a            	decw	x
 598  029a 92d600        	ld	a,([c_x.w],x)
 599  029d e705          	ld	(L5_disp_data,x),a
 600  029f 5d            	tnzw	x
 601  02a0 26f7          	jrne	L02
 602                     ; 240 	memcpy(disp_data_bright_set,disp_data,sizeof(disp_data_bright_set));
 603  02a2 ae0005        	ldw	x,#5
 604  02a5               L22:
 605  02a5 e604          	ld	a,(L5_disp_data-1,x)
 606  02a7 e709          	ld	(L7_disp_data_bright_set-1,x),a
 607  02a9 5a            	decw	x
 608  02aa 26f9          	jrne	L22
 609                     ; 241 	disp_data_bright_set[1] &= bin(11000000);
 610  02ac b60b          	ld	a,L7_disp_data_bright_set+1
 611  02ae a4c0          	and	a,#192
 612  02b0 b70b          	ld	L7_disp_data_bright_set+1,a
 613                     ; 242 	disp_data_bright_set[2] = 0;
 614  02b2 3f0c          	clr	L7_disp_data_bright_set+2
 615                     ; 243 	disp_data_bright_set[3] = 0;
 616  02b4 3f0d          	clr	L7_disp_data_bright_set+3
 617                     ; 244 	disp_data_bright_set[4] = 0;
 618  02b6 3f0e          	clr	L7_disp_data_bright_set+4
 619                     ; 245 	flagBrightSet = 1;
 620  02b8 35010000      	mov	L51_flagBrightSet,#1
 621                     ; 246 }
 622  02bc 81            	ret
 624                     ; 248 void displayDot (uint8_t state) 
 624                     ; 249 {
 625  02bd               _displayDot:
 626  02bd 89            	pushw	x
 627       00000002      OFST:	set	2
 629                     ; 250 	uint16_t bright = displayBright;
 630  02be be01          	ldw	x,L31_displayBright
 631  02c0 1f01          	ldw	(OFST-1,sp),x
 632                     ; 252 	if (state == 0) {
 633  02c2 4d            	tnz	a
 634  02c3 260a          	jrne	L302
 635                     ; 253 		sfr_TIM2.IER.CC2IE 		= 0;							// TIM2 channel 2 compare interrupt disable
 636  02c5 72155303      	bres	21251,#2
 637                     ; 254 		DOT_PIN = 0;
 638  02c9 721d500f      	bres	20495,#6
 640  02cd 201c          	jra	L502
 641  02cf               L302:
 642                     ; 256 		if (bright < DOT_MIN_BRIGHT) {
 643  02cf 1e01          	ldw	x,(OFST-1,sp)
 644  02d1 a30064        	cpw	x,#100
 645  02d4 2405          	jruge	L702
 646                     ; 257 			bright = DOT_MIN_BRIGHT;
 647  02d6 ae0064        	ldw	x,#100
 648  02d9 1f01          	ldw	(OFST-1,sp),x
 649  02db               L702:
 650                     ; 259 		sfr_TIM2.CCR2H.byte = hibyte(bright);		// set PWM channel 2 duty period
 651  02db 7b01          	ld	a,(OFST-1,sp)
 652  02dd c75313        	ld	21267,a
 653                     ; 260 		sfr_TIM2.CCR2L.byte = lobyte(bright);
 654  02e0 7b02          	ld	a,(OFST+0,sp)
 655  02e2 a4ff          	and	a,#255
 656  02e4 c75314        	ld	21268,a
 657                     ; 261 		sfr_TIM2.IER.CC2IE 		= 1;							// TIM2 channel 2 compare interrupt enable
 658  02e7 72145303      	bset	21251,#2
 659  02eb               L502:
 660                     ; 263 }
 661  02eb 85            	popw	x
 662  02ec 81            	ret
 664                     ; 265 void displayDotPulse (void) 
 664                     ; 266 {
 665  02ed               _displayDotPulse:
 667                     ; 267 	dotPulseCounter = 0;
 668  02ed 3f04          	clr	L11_dotPulseCounter
 669                     ; 268 }
 670  02ef 81            	ret
 672                     ; 270 void displayDotPulseProc (void)
 672                     ; 271 {
 673  02f0               _displayDotPulseProc:
 675                     ; 272 	if (dotPulseCounter < 25){
 676  02f0 b604          	ld	a,L11_dotPulseCounter
 677  02f2 a119          	cp	a,#25
 678  02f4 2408          	jruge	L112
 679                     ; 273 		displaySetDotBright(dotPulseCounter*4);
 680  02f6 b604          	ld	a,L11_dotPulseCounter
 681  02f8 48            	sll	a
 682  02f9 48            	sll	a
 683  02fa ad19          	call	L12_displaySetDotBright
 686  02fc 200e          	jra	L312
 687  02fe               L112:
 688                     ; 274 	}else if (dotPulseCounter < 50){
 689  02fe b604          	ld	a,L11_dotPulseCounter
 690  0300 a132          	cp	a,#50
 691  0302 2408          	jruge	L312
 692                     ; 275 		displaySetDotBright((49-dotPulseCounter)*4);
 693  0304 a631          	ld	a,#49
 694  0306 b004          	sub	a,L11_dotPulseCounter
 695  0308 48            	sll	a
 696  0309 48            	sll	a
 697  030a ad09          	call	L12_displaySetDotBright
 699  030c               L312:
 700                     ; 277 	if (dotPulseCounter < 50){
 701  030c b604          	ld	a,L11_dotPulseCounter
 702  030e a132          	cp	a,#50
 703  0310 2402          	jruge	L712
 704                     ; 278 		dotPulseCounter++;
 705  0312 3c04          	inc	L11_dotPulseCounter
 706  0314               L712:
 707                     ; 280 }
 708  0314 81            	ret
 710                     	switch	.const
 711  0005               L43:
 712  0005 00000064      	dc.l	100
 713                     ; 282 static void displaySetDotBright( uint8_t bright)
 713                     ; 283 {
 714                     	switch	.text
 715  0315               L12_displaySetDotBright:
 716  0315 88            	push	a
 717  0316 89            	pushw	x
 718       00000002      OFST:	set	2
 720                     ; 286 	if (bright == 0) {
 721  0317 4d            	tnz	a
 722  0318 260a          	jrne	L122
 723                     ; 287 		sfr_TIM2.IER.CC2IE 		= 0;						// TIM2 channel 2 compare interrupt disable
 724  031a 72155303      	bres	21251,#2
 725                     ; 288 		DOT_PIN = 0;
 726  031e 721d500f      	bres	20495,#6
 728  0322 2030          	jra	L322
 729  0324               L122:
 730                     ; 290 		b = scale(bright,100,displayBright);
 731  0324 7b03          	ld	a,(OFST+1,sp)
 732  0326 5f            	clrw	x
 733  0327 97            	ld	xl,a
 734  0328 90be01        	ldw	y,L31_displayBright
 735  032b cd0000        	call	c_umul
 737  032e ae0005        	ldw	x,#L43
 738  0331 cd0000        	call	c_ldiv
 740  0334 be02          	ldw	x,c_lreg+2
 741  0336 1f01          	ldw	(OFST-1,sp),x
 742                     ; 291 		if (b < DOT_MIN_BRIGHT) {b = DOT_MIN_BRIGHT;}
 743  0338 1e01          	ldw	x,(OFST-1,sp)
 744  033a a30064        	cpw	x,#100
 745  033d 2405          	jruge	L522
 747  033f ae0064        	ldw	x,#100
 748  0342 1f01          	ldw	(OFST-1,sp),x
 749  0344               L522:
 750                     ; 292 		sfr_TIM2.CCR2H.byte = hibyte(b);		// set PWM channel 2 duty period
 751  0344 7b01          	ld	a,(OFST-1,sp)
 752  0346 c75313        	ld	21267,a
 753                     ; 293 		sfr_TIM2.CCR2L.byte = lobyte(b);
 754  0349 7b02          	ld	a,(OFST+0,sp)
 755  034b a4ff          	and	a,#255
 756  034d c75314        	ld	21268,a
 757                     ; 294 		sfr_TIM2.IER.CC2IE 		= 1;					// TIM2 channel 2 compare interrupt enable
 758  0350 72145303      	bset	21251,#2
 759  0354               L322:
 760                     ; 296 }
 761  0354 5b03          	addw	sp,#3
 762  0356 81            	ret
 764                     ; 298 ISR_HANDLER (TIM2_UPD_ISR, _TIM2_OVR_UIF_VECTOR_)
 764                     ; 299 {
 765                     	scross	on
 766  0357               f_TIM2_UPD_ISR:
 767  0357 8a            	push	cc
 768  0358 84            	pop	a
 769  0359 a4bf          	and	a,#191
 770  035b 88            	push	a
 771  035c 86            	pop	cc
 772  035d 3b0002        	push	c_x+2
 773  0360 be00          	ldw	x,c_x
 774  0362 89            	pushw	x
 775  0363 3b0002        	push	c_y+2
 776  0366 be00          	ldw	x,c_y
 777  0368 89            	pushw	x
 779                     ; 300 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
 780  0369 4b05          	push	#5
 781  036b ae0005        	ldw	x,#L5_disp_data
 782  036e cd0000        	call	_hc595ChainShiftOut
 784  0371 84            	pop	a
 785                     ; 301 	if (sfr_TIM2.IER.CC2IE)
 786  0372 c65303        	ld	a,21251
 787  0375 a504          	bcp	a,#4
 788  0377 2704          	jreq	L722
 789                     ; 303 		DOT_PIN = 1;
 790  0379 721c500f      	bset	20495,#6
 791  037d               L722:
 792                     ; 305 	flag10ms = 1;
 793  037d 35010003      	mov	_flag10ms,#1
 794                     ; 306 	sfr_TIM2.SR1.UIF = 0;
 795  0381 72115304      	bres	21252,#0
 796                     ; 307   return;
 797  0385 85            	popw	x
 798  0386 bf00          	ldw	c_y,x
 799  0388 320002        	pop	c_y+2
 800  038b 85            	popw	x
 801  038c bf00          	ldw	c_x,x
 802  038e 320002        	pop	c_x+2
 803  0391 80            	iret
 804                     ; 311 ISR_HANDLER (TIM2_CAP_ISR, _TIM2_CAPCOM_CC1IF_VECTOR_)
 804                     ; 312 {
 805  0392               f_TIM2_CAP_ISR:
 806  0392 8a            	push	cc
 807  0393 84            	pop	a
 808  0394 a4bf          	and	a,#191
 809  0396 88            	push	a
 810  0397 86            	pop	cc
 811  0398 3b0002        	push	c_x+2
 812  039b be00          	ldw	x,c_x
 813  039d 89            	pushw	x
 814  039e 3b0002        	push	c_y+2
 815  03a1 be00          	ldw	x,c_y
 816  03a3 89            	pushw	x
 818                     ; 314 	if(sfr_TIM2.SR1.CC1IF){
 819  03a4 c65304        	ld	a,21252
 820  03a7 a502          	bcp	a,#2
 821  03a9 271c          	jreq	L132
 822                     ; 315 		if(flagBrightSet){
 823  03ab 3d00          	tnz	L51_flagBrightSet
 824  03ad 270b          	jreq	L332
 825                     ; 316 			hc595ChainShiftOut(disp_data_bright_set,sizeof(disp_data_bright_set));
 826  03af 4b05          	push	#5
 827  03b1 ae000a        	ldw	x,#L7_disp_data_bright_set
 828  03b4 cd0000        	call	_hc595ChainShiftOut
 830  03b7 84            	pop	a
 832  03b8 2009          	jra	L532
 833  03ba               L332:
 834                     ; 318 			hc595ChainShiftOut(zero_data,sizeof(zero_data));
 835  03ba 4b05          	push	#5
 836  03bc ae0000        	ldw	x,#L3_zero_data
 837  03bf cd0000        	call	_hc595ChainShiftOut
 839  03c2 84            	pop	a
 840  03c3               L532:
 841                     ; 320 		sfr_TIM2.SR1.CC1IF = 0;
 842  03c3 72135304      	bres	21252,#1
 843  03c7               L132:
 844                     ; 324 	if(sfr_TIM2.SR1.CC2IF)
 845  03c7 c65304        	ld	a,21252
 846  03ca a504          	bcp	a,#4
 847  03cc 2708          	jreq	L732
 848                     ; 326 		DOT_PIN = 0;
 849  03ce 721d500f      	bres	20495,#6
 850                     ; 327 		sfr_TIM2.SR1.CC2IF = 0;
 851  03d2 72155304      	bres	21252,#2
 852  03d6               L732:
 853                     ; 329   return;
 854  03d6 85            	popw	x
 855  03d7 bf00          	ldw	c_y,x
 856  03d9 320002        	pop	c_y+2
 857  03dc 85            	popw	x
 858  03dd bf00          	ldw	c_x,x
 859  03df 320002        	pop	c_x+2
 860  03e2 80            	iret
 861                     	switch	.const
 862  0009               L44:
 863  0009 000000ff      	dc.l	255
 864                     ; 333 void displayRGBset (uint8_t state)
 864                     ; 334 {
 865                     	scross	off
 866                     	switch	.text
 867  03e3               _displayRGBset:
 869                     ; 335 	if (state){
 870  03e3 4d            	tnz	a
 871  03e4 274d          	jreq	L142
 872                     ; 336 		RGBsetR((uint16_t)scale(EEPROM_readByte(R_ADDR),255,displayBright));
 873  03e6 ae000b        	ldw	x,#11
 874  03e9 cd0000        	call	_EEPROM_readByte
 876  03ec 5f            	clrw	x
 877  03ed 97            	ld	xl,a
 878  03ee 90be01        	ldw	y,L31_displayBright
 879  03f1 cd0000        	call	c_umul
 881  03f4 ae0009        	ldw	x,#L44
 882  03f7 cd0000        	call	c_ldiv
 884  03fa be02          	ldw	x,c_lreg+2
 885  03fc cd0000        	call	_RGBsetR
 887                     ; 337 		RGBsetG((uint16_t)scale(EEPROM_readByte(G_ADDR),255,displayBright));
 888  03ff ae000c        	ldw	x,#12
 889  0402 cd0000        	call	_EEPROM_readByte
 891  0405 5f            	clrw	x
 892  0406 97            	ld	xl,a
 893  0407 90be01        	ldw	y,L31_displayBright
 894  040a cd0000        	call	c_umul
 896  040d ae0009        	ldw	x,#L44
 897  0410 cd0000        	call	c_ldiv
 899  0413 be02          	ldw	x,c_lreg+2
 900  0415 cd0000        	call	_RGBsetG
 902                     ; 338 		RGBsetB((uint16_t)scale(EEPROM_readByte(B_ADDR),255,displayBright));
 903  0418 ae000d        	ldw	x,#13
 904  041b cd0000        	call	_EEPROM_readByte
 906  041e 5f            	clrw	x
 907  041f 97            	ld	xl,a
 908  0420 90be01        	ldw	y,L31_displayBright
 909  0423 cd0000        	call	c_umul
 911  0426 ae0009        	ldw	x,#L44
 912  0429 cd0000        	call	c_ldiv
 914  042c be02          	ldw	x,c_lreg+2
 915  042e cd0000        	call	_RGBsetB
 918  0431 200c          	jra	L342
 919  0433               L142:
 920                     ; 340 		RGBsetR(0);
 921  0433 5f            	clrw	x
 922  0434 cd0000        	call	_RGBsetR
 924                     ; 341 		RGBsetG(0);
 925  0437 5f            	clrw	x
 926  0438 cd0000        	call	_RGBsetG
 928                     ; 342 		RGBsetB(0);
 929  043b 5f            	clrw	x
 930  043c cd0000        	call	_RGBsetB
 932  043f               L342:
 933                     ; 344 }
 934  043f 81            	ret
 936                     ; 346 void displayRset(uint8_t value)
 936                     ; 347 {
 937  0440               _displayRset:
 939                     ; 348 	RGBsetR((uint16_t)scale(value,255,displayBright));
 940  0440 5f            	clrw	x
 941  0441 97            	ld	xl,a
 942  0442 90be01        	ldw	y,L31_displayBright
 943  0445 cd0000        	call	c_umul
 945  0448 ae0009        	ldw	x,#L44
 946  044b cd0000        	call	c_ldiv
 948  044e be02          	ldw	x,c_lreg+2
 949  0450 cd0000        	call	_RGBsetR
 951                     ; 349 }
 952  0453 81            	ret
 954                     ; 351 void displayGset(uint8_t value)
 954                     ; 352 {
 955  0454               _displayGset:
 957                     ; 353 	RGBsetG((uint16_t)scale(value,255,displayBright));
 958  0454 5f            	clrw	x
 959  0455 97            	ld	xl,a
 960  0456 90be01        	ldw	y,L31_displayBright
 961  0459 cd0000        	call	c_umul
 963  045c ae0009        	ldw	x,#L44
 964  045f cd0000        	call	c_ldiv
 966  0462 be02          	ldw	x,c_lreg+2
 967  0464 cd0000        	call	_RGBsetG
 969                     ; 354 }
 970  0467 81            	ret
 972                     ; 356 void displayBset(uint8_t value)
 972                     ; 357 {
 973  0468               _displayBset:
 975                     ; 358 	RGBsetB((uint16_t)scale(value,255,displayBright));
 976  0468 5f            	clrw	x
 977  0469 97            	ld	xl,a
 978  046a 90be01        	ldw	y,L31_displayBright
 979  046d cd0000        	call	c_umul
 981  0470 ae0009        	ldw	x,#L44
 982  0473 cd0000        	call	c_ldiv
 984  0476 be02          	ldw	x,c_lreg+2
 985  0478 cd0000        	call	_RGBsetB
 987                     ; 359 }
 988  047b 81            	ret
 990                     	xdef	f_TIM2_CAP_ISR
 991                     	xdef	f_TIM2_UPD_ISR
 992                     	switch	.ubsct
 993  0000               L51_flagBrightSet:
 994  0000 00            	ds.b	1
 995  0001               L31_displayBright:
 996  0001 0000          	ds.b	2
 997  0003               _flag10ms:
 998  0003 00            	ds.b	1
 999                     	xdef	_flag10ms
1000  0004               L11_dotPulseCounter:
1001  0004 00            	ds.b	1
1002                     	xref	_EEPROM_readByte
1003                     	xref.b	_e
1004                     	xref	_RGBsetB
1005                     	xref	_RGBsetG
1006                     	xref	_RGBsetR
1007                     	xref	_RGBinit
1008                     	xdef	_displayBset
1009                     	xdef	_displayGset
1010                     	xdef	_displayRset
1011                     	xdef	_displayRGBset
1012                     	xdef	_displayDotPulseProc
1013                     	xdef	_displayDotPulse
1014                     	xdef	_displayDot
1015                     	xdef	_displayNixieBrightSet
1016                     	xdef	_displayNixie
1017                     	xdef	_displaySetBright
1018                     	xdef	_displayInit
1019                     	xref	_hc595ChainShiftOut
1020                     	xref	_hc595Init
1021                     	xref.b	c_lreg
1022                     	xref.b	c_x
1023                     	xref.b	c_y
1024                     	xref	c_ldiv
1025                     	xref	c_umul
1026                     	xref	c_bmulx
1027                     	xref	c_xymov
1028                     	end
