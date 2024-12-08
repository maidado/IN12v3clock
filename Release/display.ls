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
  87  0057 cd02bf        	call	_displayDot
  89                     ; 53 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
  90  005a 4b05          	push	#5
  91  005c ae0005        	ldw	x,#L5_disp_data
  92  005f cd0000        	call	_hc595ChainShiftOut
  94  0062 84            	pop	a
  95                     ; 56 	RGBinit();
  96  0063 cd0000        	call	_RGBinit
  98                     ; 57 	displayRGBset(e.rgbGlobalEn);
  99  0066 b60b          	ld	a,_e+11
 100  0068 cd03e5        	call	_displayRGBset
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
 119                     ; 64 	uint8_t data[5] = {0,0,0,0,0};
 120  006f 96            	ldw	x,sp
 121  0070 1c0001        	addw	x,#OFST-4
 122  0073 90ae0000      	ldw	y,#L32_data
 123  0077 a605          	ld	a,#5
 124  0079 cd0000        	call	c_xymov
 126                     ; 81 	switch(inbuff[0]){
 127  007c 1e06          	ldw	x,(OFST+1,sp)
 128  007e f6            	ld	a,(x)
 130                     ; 112 		default:
 130                     ; 113 		break;
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
 153                     ; 82 		case 0:
 153                     ; 83 			bitset(data[4],0);
 154  009f 7b05          	ld	a,(OFST+0,sp)
 155  00a1 aa01          	or	a,#1
 156  00a3 6b05          	ld	(OFST+0,sp),a
 157                     ; 84 			break;
 158  00a5 2046          	jra	L751
 159  00a7               L72:
 160                     ; 85 		case 1:
 160                     ; 86 			bitset(data[4],1);
 161  00a7 7b05          	ld	a,(OFST+0,sp)
 162  00a9 aa02          	or	a,#2
 163  00ab 6b05          	ld	(OFST+0,sp),a
 164                     ; 87 			break;
 165  00ad 203e          	jra	L751
 166  00af               L13:
 167                     ; 88 		case 2:
 167                     ; 89 			bitset(data[4],2);
 168  00af 7b05          	ld	a,(OFST+0,sp)
 169  00b1 aa04          	or	a,#4
 170  00b3 6b05          	ld	(OFST+0,sp),a
 171                     ; 90 			break;
 172  00b5 2036          	jra	L751
 173  00b7               L33:
 174                     ; 91 		case 3:
 174                     ; 92 			bitset(data[4],3);
 175  00b7 7b05          	ld	a,(OFST+0,sp)
 176  00b9 aa08          	or	a,#8
 177  00bb 6b05          	ld	(OFST+0,sp),a
 178                     ; 93 			break;
 179  00bd 202e          	jra	L751
 180  00bf               L53:
 181                     ; 94 		case 4:
 181                     ; 95 			bitset(data[4],4);
 182  00bf 7b05          	ld	a,(OFST+0,sp)
 183  00c1 aa10          	or	a,#16
 184  00c3 6b05          	ld	(OFST+0,sp),a
 185                     ; 96 			break;
 186  00c5 2026          	jra	L751
 187  00c7               L73:
 188                     ; 97 		case 5:
 188                     ; 98 			bitset(data[4],5);
 189  00c7 7b05          	ld	a,(OFST+0,sp)
 190  00c9 aa20          	or	a,#32
 191  00cb 6b05          	ld	(OFST+0,sp),a
 192                     ; 99 			break;
 193  00cd 201e          	jra	L751
 194  00cf               L14:
 195                     ; 100 		case 6:
 195                     ; 101 			bitset(data[4],6);
 196  00cf 7b05          	ld	a,(OFST+0,sp)
 197  00d1 aa40          	or	a,#64
 198  00d3 6b05          	ld	(OFST+0,sp),a
 199                     ; 102 			break;
 200  00d5 2016          	jra	L751
 201  00d7               L34:
 202                     ; 103 		case 7:
 202                     ; 104 			bitset(data[4],7);
 203  00d7 7b05          	ld	a,(OFST+0,sp)
 204  00d9 aa80          	or	a,#128
 205  00db 6b05          	ld	(OFST+0,sp),a
 206                     ; 105 			break;
 207  00dd 200e          	jra	L751
 208  00df               L54:
 209                     ; 106 		case 8:
 209                     ; 107 			bitset(data[3],0);
 210  00df 7b04          	ld	a,(OFST-1,sp)
 211  00e1 aa01          	or	a,#1
 212  00e3 6b04          	ld	(OFST-1,sp),a
 213                     ; 108 			break;
 214  00e5 2006          	jra	L751
 215  00e7               L74:
 216                     ; 109 		case 9:
 216                     ; 110 			bitset(data[3],1);
 217  00e7 7b04          	ld	a,(OFST-1,sp)
 218  00e9 aa02          	or	a,#2
 219  00eb 6b04          	ld	(OFST-1,sp),a
 220                     ; 111 			break;
 221  00ed               L15:
 222                     ; 112 		default:
 222                     ; 113 		break;
 223  00ed               L751:
 224                     ; 117 	switch(inbuff[1]){
 225  00ed 1e06          	ldw	x,(OFST+1,sp)
 226  00ef e601          	ld	a,(1,x)
 228                     ; 148 		default:
 228                     ; 149 		break;
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
 251                     ; 118 		case 0:
 251                     ; 119 			bitset(data[3],2);
 252  0111 7b04          	ld	a,(OFST-1,sp)
 253  0113 aa04          	or	a,#4
 254  0115 6b04          	ld	(OFST-1,sp),a
 255                     ; 120 			break;
 256  0117 2046          	jra	L361
 257  0119               L55:
 258                     ; 121 		case 1:
 258                     ; 122 			bitset(data[3],3);
 259  0119 7b04          	ld	a,(OFST-1,sp)
 260  011b aa08          	or	a,#8
 261  011d 6b04          	ld	(OFST-1,sp),a
 262                     ; 123 			break;
 263  011f 203e          	jra	L361
 264  0121               L75:
 265                     ; 124 		case 2:
 265                     ; 125 			bitset(data[3],4);
 266  0121 7b04          	ld	a,(OFST-1,sp)
 267  0123 aa10          	or	a,#16
 268  0125 6b04          	ld	(OFST-1,sp),a
 269                     ; 126 			break;
 270  0127 2036          	jra	L361
 271  0129               L16:
 272                     ; 127 		case 3:
 272                     ; 128 			bitset(data[3],5);
 273  0129 7b04          	ld	a,(OFST-1,sp)
 274  012b aa20          	or	a,#32
 275  012d 6b04          	ld	(OFST-1,sp),a
 276                     ; 129 			break;
 277  012f 202e          	jra	L361
 278  0131               L36:
 279                     ; 130 		case 4:
 279                     ; 131 			bitset(data[3],6);
 280  0131 7b04          	ld	a,(OFST-1,sp)
 281  0133 aa40          	or	a,#64
 282  0135 6b04          	ld	(OFST-1,sp),a
 283                     ; 132 			break;
 284  0137 2026          	jra	L361
 285  0139               L56:
 286                     ; 133 		case 5:
 286                     ; 134 			bitset(data[3],7);
 287  0139 7b04          	ld	a,(OFST-1,sp)
 288  013b aa80          	or	a,#128
 289  013d 6b04          	ld	(OFST-1,sp),a
 290                     ; 135 			break;
 291  013f 201e          	jra	L361
 292  0141               L76:
 293                     ; 136 		case 6:
 293                     ; 137 			bitset(data[2],0);
 294  0141 7b03          	ld	a,(OFST-2,sp)
 295  0143 aa01          	or	a,#1
 296  0145 6b03          	ld	(OFST-2,sp),a
 297                     ; 138 			break;
 298  0147 2016          	jra	L361
 299  0149               L17:
 300                     ; 139 		case 7:
 300                     ; 140 			bitset(data[2],1);
 301  0149 7b03          	ld	a,(OFST-2,sp)
 302  014b aa02          	or	a,#2
 303  014d 6b03          	ld	(OFST-2,sp),a
 304                     ; 141 			break;
 305  014f 200e          	jra	L361
 306  0151               L37:
 307                     ; 142 		case 8:
 307                     ; 143 			bitset(data[2],2);
 308  0151 7b03          	ld	a,(OFST-2,sp)
 309  0153 aa04          	or	a,#4
 310  0155 6b03          	ld	(OFST-2,sp),a
 311                     ; 144 			break;
 312  0157 2006          	jra	L361
 313  0159               L57:
 314                     ; 145 		case 9:
 314                     ; 146 			bitset(data[2],3);
 315  0159 7b03          	ld	a,(OFST-2,sp)
 316  015b aa08          	or	a,#8
 317  015d 6b03          	ld	(OFST-2,sp),a
 318                     ; 147 			break;
 319  015f               L77:
 320                     ; 148 		default:
 320                     ; 149 		break;
 321  015f               L361:
 322                     ; 153 	switch(inbuff[2]){
 323  015f 1e06          	ldw	x,(OFST+1,sp)
 324  0161 e602          	ld	a,(2,x)
 326                     ; 184 		default:
 326                     ; 185 		break;
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
 349                     ; 154 		case 0:
 349                     ; 155 			bitset(data[2],4);
 350  0183 7b03          	ld	a,(OFST-2,sp)
 351  0185 aa10          	or	a,#16
 352  0187 6b03          	ld	(OFST-2,sp),a
 353                     ; 156 			break;
 354  0189 2046          	jra	L761
 355  018b               L301:
 356                     ; 157 		case 1:
 356                     ; 158 			bitset(data[2],5);
 357  018b 7b03          	ld	a,(OFST-2,sp)
 358  018d aa20          	or	a,#32
 359  018f 6b03          	ld	(OFST-2,sp),a
 360                     ; 159 			break;
 361  0191 203e          	jra	L761
 362  0193               L501:
 363                     ; 160 		case 2:
 363                     ; 161 			bitset(data[2],6);
 364  0193 7b03          	ld	a,(OFST-2,sp)
 365  0195 aa40          	or	a,#64
 366  0197 6b03          	ld	(OFST-2,sp),a
 367                     ; 162 			break;
 368  0199 2036          	jra	L761
 369  019b               L701:
 370                     ; 163 		case 3:
 370                     ; 164 			bitset(data[2],7);
 371  019b 7b03          	ld	a,(OFST-2,sp)
 372  019d aa80          	or	a,#128
 373  019f 6b03          	ld	(OFST-2,sp),a
 374                     ; 165 			break;
 375  01a1 202e          	jra	L761
 376  01a3               L111:
 377                     ; 166 		case 4:
 377                     ; 167 			bitset(data[1],0);
 378  01a3 7b02          	ld	a,(OFST-3,sp)
 379  01a5 aa01          	or	a,#1
 380  01a7 6b02          	ld	(OFST-3,sp),a
 381                     ; 168 			break;
 382  01a9 2026          	jra	L761
 383  01ab               L311:
 384                     ; 169 		case 5:
 384                     ; 170 			bitset(data[1],1);
 385  01ab 7b02          	ld	a,(OFST-3,sp)
 386  01ad aa02          	or	a,#2
 387  01af 6b02          	ld	(OFST-3,sp),a
 388                     ; 171 			break;
 389  01b1 201e          	jra	L761
 390  01b3               L511:
 391                     ; 172 		case 6:
 391                     ; 173 			bitset(data[1],2);
 392  01b3 7b02          	ld	a,(OFST-3,sp)
 393  01b5 aa04          	or	a,#4
 394  01b7 6b02          	ld	(OFST-3,sp),a
 395                     ; 174 			break;
 396  01b9 2016          	jra	L761
 397  01bb               L711:
 398                     ; 175 		case 7:
 398                     ; 176 			bitset(data[1],3);
 399  01bb 7b02          	ld	a,(OFST-3,sp)
 400  01bd aa08          	or	a,#8
 401  01bf 6b02          	ld	(OFST-3,sp),a
 402                     ; 177 			break;
 403  01c1 200e          	jra	L761
 404  01c3               L121:
 405                     ; 178 		case 8:
 405                     ; 179 			bitset(data[1],4);
 406  01c3 7b02          	ld	a,(OFST-3,sp)
 407  01c5 aa10          	or	a,#16
 408  01c7 6b02          	ld	(OFST-3,sp),a
 409                     ; 180 			break;
 410  01c9 2006          	jra	L761
 411  01cb               L321:
 412                     ; 181 		case 9:
 412                     ; 182 			bitset(data[1],5);
 413  01cb 7b02          	ld	a,(OFST-3,sp)
 414  01cd aa20          	or	a,#32
 415  01cf 6b02          	ld	(OFST-3,sp),a
 416                     ; 183 			break;
 417  01d1               L521:
 418                     ; 184 		default:
 418                     ; 185 		break;
 419  01d1               L761:
 420                     ; 189   switch(inbuff[3]){
 421  01d1 1e06          	ldw	x,(OFST+1,sp)
 422  01d3 e603          	ld	a,(3,x)
 424                     ; 220 		default:
 424                     ; 221 		break;
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
 447                     ; 190 		case 0:
 447                     ; 191 			bitset(data[1],6);
 448  01f5 7b02          	ld	a,(OFST-3,sp)
 449  01f7 aa40          	or	a,#64
 450  01f9 6b02          	ld	(OFST-3,sp),a
 451                     ; 192 			break;
 452  01fb 2046          	jra	L371
 453  01fd               L131:
 454                     ; 193 		case 1:
 454                     ; 194 			bitset(data[1],7);
 455  01fd 7b02          	ld	a,(OFST-3,sp)
 456  01ff aa80          	or	a,#128
 457  0201 6b02          	ld	(OFST-3,sp),a
 458                     ; 195 			break;
 459  0203 203e          	jra	L371
 460  0205               L331:
 461                     ; 196 		case 2:
 461                     ; 197 			bitset(data[0],0);
 462  0205 7b01          	ld	a,(OFST-4,sp)
 463  0207 aa01          	or	a,#1
 464  0209 6b01          	ld	(OFST-4,sp),a
 465                     ; 198 			break;
 466  020b 2036          	jra	L371
 467  020d               L531:
 468                     ; 199 		case 3:
 468                     ; 200 			bitset(data[0],1);
 469  020d 7b01          	ld	a,(OFST-4,sp)
 470  020f aa02          	or	a,#2
 471  0211 6b01          	ld	(OFST-4,sp),a
 472                     ; 201 			break;
 473  0213 202e          	jra	L371
 474  0215               L731:
 475                     ; 202 		case 4:
 475                     ; 203 			bitset(data[0],2);
 476  0215 7b01          	ld	a,(OFST-4,sp)
 477  0217 aa04          	or	a,#4
 478  0219 6b01          	ld	(OFST-4,sp),a
 479                     ; 204 			break;
 480  021b 2026          	jra	L371
 481  021d               L141:
 482                     ; 205 		case 5:
 482                     ; 206 			bitset(data[0],3);
 483  021d 7b01          	ld	a,(OFST-4,sp)
 484  021f aa08          	or	a,#8
 485  0221 6b01          	ld	(OFST-4,sp),a
 486                     ; 207 			break;
 487  0223 201e          	jra	L371
 488  0225               L341:
 489                     ; 208 		case 6:
 489                     ; 209 			bitset(data[0],4);
 490  0225 7b01          	ld	a,(OFST-4,sp)
 491  0227 aa10          	or	a,#16
 492  0229 6b01          	ld	(OFST-4,sp),a
 493                     ; 210 			break;
 494  022b 2016          	jra	L371
 495  022d               L541:
 496                     ; 211 		case 7:
 496                     ; 212 			bitset(data[0],5);
 497  022d 7b01          	ld	a,(OFST-4,sp)
 498  022f aa20          	or	a,#32
 499  0231 6b01          	ld	(OFST-4,sp),a
 500                     ; 213 			break;
 501  0233 200e          	jra	L371
 502  0235               L741:
 503                     ; 214 		case 8:
 503                     ; 215 			bitset(data[0],6);
 504  0235 7b01          	ld	a,(OFST-4,sp)
 505  0237 aa40          	or	a,#64
 506  0239 6b01          	ld	(OFST-4,sp),a
 507                     ; 216 			break;
 508  023b 2006          	jra	L371
 509  023d               L151:
 510                     ; 217 		case 9:
 510                     ; 218 			bitset(data[0],7);
 511  023d 7b01          	ld	a,(OFST-4,sp)
 512  023f aa80          	or	a,#128
 513  0241 6b01          	ld	(OFST-4,sp),a
 514                     ; 219 			break;
 515  0243               L351:
 516                     ; 220 		default:
 516                     ; 221 		break;
 517  0243               L371:
 518                     ; 224 	return data;
 519  0243 96            	ldw	x,sp
 520  0244 1c0001        	addw	x,#OFST-4
 522  0247 5b07          	addw	sp,#7
 523  0249 81            	ret
 525                     ; 229 void displaySetBright(uint8_t bright)
 525                     ; 230 {
 526  024a               _displaySetBright:
 527  024a 88            	push	a
 528       00000000      OFST:	set	0
 530                     ; 231 	if (bright == 0){
 531  024b 4d            	tnz	a
 532  024c 260c          	jrne	L571
 533                     ; 233 		memcpy(disp_data,zero_data,sizeof(disp_data));
 534  024e ae0005        	ldw	x,#5
 535  0251               L01:
 536  0251 e6ff          	ld	a,(L3_zero_data-1,x)
 537  0253 e704          	ld	(L5_disp_data-1,x),a
 538  0255 5a            	decw	x
 539  0256 26f9          	jrne	L01
 541  0258 2023          	jra	L771
 542  025a               L571:
 543                     ; 235 		displayBright = scale(bright,100,10000);
 544  025a 7b01          	ld	a,(OFST+1,sp)
 545  025c 5f            	clrw	x
 546  025d 97            	ld	xl,a
 547  025e a664          	ld	a,#100
 548  0260 cd0000        	call	c_bmulx
 550  0263 bf01          	ldw	L31_displayBright,x
 551                     ; 236 		if (displayBright < NIXIE_MIN_BRIGHT){
 552  0265 be01          	ldw	x,L31_displayBright
 553  0267 a30064        	cpw	x,#100
 554  026a 2405          	jruge	L102
 555                     ; 237 			displayBright = NIXIE_MIN_BRIGHT;
 556  026c ae0064        	ldw	x,#100
 557  026f bf01          	ldw	L31_displayBright,x
 558  0271               L102:
 559                     ; 239 		sfr_TIM2.CCR1H.byte = hibyte(displayBright);		// set PWM channel 1 duty period
 560  0271 5500015311    	mov	21265,L31_displayBright
 561                     ; 240 		sfr_TIM2.CCR1L.byte = lobyte(displayBright);
 562  0276 b602          	ld	a,L31_displayBright+1
 563  0278 a4ff          	and	a,#255
 564  027a c75312        	ld	21266,a
 565  027d               L771:
 566                     ; 242 }
 567  027d 84            	pop	a
 568  027e 81            	ret
 570                     ; 247 void displayNixie(uint8_t *data)
 570                     ; 248 {
 571  027f               _displayNixie:
 573                     ; 249 	memcpy(disp_data,displayNixieBuffPrepare(data),sizeof(disp_data));
 574  027f cd006c        	call	L71_displayNixieBuffPrepare
 576  0282 bf00          	ldw	c_x,x
 577  0284 ae0005        	ldw	x,#5
 578  0287               L41:
 579  0287 5a            	decw	x
 580  0288 92d600        	ld	a,([c_x.w],x)
 581  028b e705          	ld	(L5_disp_data,x),a
 582  028d 5d            	tnzw	x
 583  028e 26f7          	jrne	L41
 584                     ; 250 	flagBrightSet = 0;
 585  0290 3f00          	clr	L51_flagBrightSet
 586                     ; 251 }
 587  0292 81            	ret
 589                     ; 253 void displayNixieBrightSet(uint8_t *data)
 589                     ; 254 {
 590  0293               _displayNixieBrightSet:
 592                     ; 255 	memcpy(disp_data,displayNixieBuffPrepare(data),sizeof(disp_data));
 593  0293 cd006c        	call	L71_displayNixieBuffPrepare
 595  0296 bf00          	ldw	c_x,x
 596  0298 ae0005        	ldw	x,#5
 597  029b               L02:
 598  029b 5a            	decw	x
 599  029c 92d600        	ld	a,([c_x.w],x)
 600  029f e705          	ld	(L5_disp_data,x),a
 601  02a1 5d            	tnzw	x
 602  02a2 26f7          	jrne	L02
 603                     ; 256 	memcpy(disp_data_bright_set,disp_data,sizeof(disp_data_bright_set));
 604  02a4 ae0005        	ldw	x,#5
 605  02a7               L22:
 606  02a7 e604          	ld	a,(L5_disp_data-1,x)
 607  02a9 e709          	ld	(L7_disp_data_bright_set-1,x),a
 608  02ab 5a            	decw	x
 609  02ac 26f9          	jrne	L22
 610                     ; 257 	disp_data_bright_set[1] &= bin(11000000);
 611  02ae b60b          	ld	a,L7_disp_data_bright_set+1
 612  02b0 a4c0          	and	a,#192
 613  02b2 b70b          	ld	L7_disp_data_bright_set+1,a
 614                     ; 258 	disp_data_bright_set[2] = 0;
 615  02b4 3f0c          	clr	L7_disp_data_bright_set+2
 616                     ; 259 	disp_data_bright_set[3] = 0;
 617  02b6 3f0d          	clr	L7_disp_data_bright_set+3
 618                     ; 260 	disp_data_bright_set[4] = 0;
 619  02b8 3f0e          	clr	L7_disp_data_bright_set+4
 620                     ; 261 	flagBrightSet = 1;
 621  02ba 35010000      	mov	L51_flagBrightSet,#1
 622                     ; 262 }
 623  02be 81            	ret
 625                     ; 264 void displayDot (uint8_t state) 
 625                     ; 265 {
 626  02bf               _displayDot:
 627  02bf 89            	pushw	x
 628       00000002      OFST:	set	2
 630                     ; 266 	uint16_t bright = displayBright;
 631  02c0 be01          	ldw	x,L31_displayBright
 632  02c2 1f01          	ldw	(OFST-1,sp),x
 633                     ; 268 	if (state == 0) {
 634  02c4 4d            	tnz	a
 635  02c5 260a          	jrne	L302
 636                     ; 269 		sfr_TIM2.IER.CC2IE 		= 0;							// TIM2 channel 2 compare interrupt disable
 637  02c7 72155303      	bres	21251,#2
 638                     ; 270 		DOT_PIN = 0;
 639  02cb 721d500f      	bres	20495,#6
 641  02cf 201c          	jra	L502
 642  02d1               L302:
 643                     ; 272 		if (bright < DOT_MIN_BRIGHT) {
 644  02d1 1e01          	ldw	x,(OFST-1,sp)
 645  02d3 a30064        	cpw	x,#100
 646  02d6 2405          	jruge	L702
 647                     ; 273 			bright = DOT_MIN_BRIGHT;
 648  02d8 ae0064        	ldw	x,#100
 649  02db 1f01          	ldw	(OFST-1,sp),x
 650  02dd               L702:
 651                     ; 275 		sfr_TIM2.CCR2H.byte = hibyte(bright);		// set PWM channel 2 duty period
 652  02dd 7b01          	ld	a,(OFST-1,sp)
 653  02df c75313        	ld	21267,a
 654                     ; 276 		sfr_TIM2.CCR2L.byte = lobyte(bright);
 655  02e2 7b02          	ld	a,(OFST+0,sp)
 656  02e4 a4ff          	and	a,#255
 657  02e6 c75314        	ld	21268,a
 658                     ; 277 		sfr_TIM2.IER.CC2IE 		= 1;							// TIM2 channel 2 compare interrupt enable
 659  02e9 72145303      	bset	21251,#2
 660  02ed               L502:
 661                     ; 279 }
 662  02ed 85            	popw	x
 663  02ee 81            	ret
 665                     ; 281 void displayDotPulse (void) 
 665                     ; 282 {
 666  02ef               _displayDotPulse:
 668                     ; 283 	dotPulseCounter = 0;
 669  02ef 3f04          	clr	L11_dotPulseCounter
 670                     ; 284 }
 671  02f1 81            	ret
 673                     ; 286 void displayDotPulseProc (void)
 673                     ; 287 {
 674  02f2               _displayDotPulseProc:
 676                     ; 288 	if (dotPulseCounter < 25){
 677  02f2 b604          	ld	a,L11_dotPulseCounter
 678  02f4 a119          	cp	a,#25
 679  02f6 2408          	jruge	L112
 680                     ; 289 		displaySetDotBright(dotPulseCounter*4);
 681  02f8 b604          	ld	a,L11_dotPulseCounter
 682  02fa 48            	sll	a
 683  02fb 48            	sll	a
 684  02fc ad19          	call	L12_displaySetDotBright
 687  02fe 200e          	jra	L312
 688  0300               L112:
 689                     ; 290 	}else if (dotPulseCounter < 50){
 690  0300 b604          	ld	a,L11_dotPulseCounter
 691  0302 a132          	cp	a,#50
 692  0304 2408          	jruge	L312
 693                     ; 291 		displaySetDotBright((49-dotPulseCounter)*4);
 694  0306 a631          	ld	a,#49
 695  0308 b004          	sub	a,L11_dotPulseCounter
 696  030a 48            	sll	a
 697  030b 48            	sll	a
 698  030c ad09          	call	L12_displaySetDotBright
 700  030e               L312:
 701                     ; 293 	if (dotPulseCounter < 50){
 702  030e b604          	ld	a,L11_dotPulseCounter
 703  0310 a132          	cp	a,#50
 704  0312 2402          	jruge	L712
 705                     ; 294 		dotPulseCounter++;
 706  0314 3c04          	inc	L11_dotPulseCounter
 707  0316               L712:
 708                     ; 296 }
 709  0316 81            	ret
 711                     	switch	.const
 712  0005               L43:
 713  0005 00000064      	dc.l	100
 714                     ; 298 static void displaySetDotBright( uint8_t bright)
 714                     ; 299 {
 715                     	switch	.text
 716  0317               L12_displaySetDotBright:
 717  0317 88            	push	a
 718  0318 89            	pushw	x
 719       00000002      OFST:	set	2
 721                     ; 302 	if (bright == 0) {
 722  0319 4d            	tnz	a
 723  031a 260a          	jrne	L122
 724                     ; 303 		sfr_TIM2.IER.CC2IE 		= 0;						// TIM2 channel 2 compare interrupt disable
 725  031c 72155303      	bres	21251,#2
 726                     ; 304 		DOT_PIN = 0;
 727  0320 721d500f      	bres	20495,#6
 729  0324 2030          	jra	L322
 730  0326               L122:
 731                     ; 306 		b = scale(bright,100,displayBright);
 732  0326 7b03          	ld	a,(OFST+1,sp)
 733  0328 5f            	clrw	x
 734  0329 97            	ld	xl,a
 735  032a 90be01        	ldw	y,L31_displayBright
 736  032d cd0000        	call	c_umul
 738  0330 ae0005        	ldw	x,#L43
 739  0333 cd0000        	call	c_ldiv
 741  0336 be02          	ldw	x,c_lreg+2
 742  0338 1f01          	ldw	(OFST-1,sp),x
 743                     ; 307 		if (b < DOT_MIN_BRIGHT) {b = DOT_MIN_BRIGHT;}
 744  033a 1e01          	ldw	x,(OFST-1,sp)
 745  033c a30064        	cpw	x,#100
 746  033f 2405          	jruge	L522
 748  0341 ae0064        	ldw	x,#100
 749  0344 1f01          	ldw	(OFST-1,sp),x
 750  0346               L522:
 751                     ; 308 		sfr_TIM2.CCR2H.byte = hibyte(b);		// set PWM channel 2 duty period
 752  0346 7b01          	ld	a,(OFST-1,sp)
 753  0348 c75313        	ld	21267,a
 754                     ; 309 		sfr_TIM2.CCR2L.byte = lobyte(b);
 755  034b 7b02          	ld	a,(OFST+0,sp)
 756  034d a4ff          	and	a,#255
 757  034f c75314        	ld	21268,a
 758                     ; 310 		sfr_TIM2.IER.CC2IE 		= 1;					// TIM2 channel 2 compare interrupt enable
 759  0352 72145303      	bset	21251,#2
 760  0356               L322:
 761                     ; 312 }
 762  0356 5b03          	addw	sp,#3
 763  0358 81            	ret
 765                     ; 314 ISR_HANDLER (TIM2_UPD_ISR, _TIM2_OVR_UIF_VECTOR_)
 765                     ; 315 {
 766                     	scross	on
 767  0359               f_TIM2_UPD_ISR:
 768  0359 8a            	push	cc
 769  035a 84            	pop	a
 770  035b a4bf          	and	a,#191
 771  035d 88            	push	a
 772  035e 86            	pop	cc
 773  035f 3b0002        	push	c_x+2
 774  0362 be00          	ldw	x,c_x
 775  0364 89            	pushw	x
 776  0365 3b0002        	push	c_y+2
 777  0368 be00          	ldw	x,c_y
 778  036a 89            	pushw	x
 780                     ; 316 	hc595ChainShiftOut(disp_data,sizeof(disp_data));
 781  036b 4b05          	push	#5
 782  036d ae0005        	ldw	x,#L5_disp_data
 783  0370 cd0000        	call	_hc595ChainShiftOut
 785  0373 84            	pop	a
 786                     ; 317 	if (sfr_TIM2.IER.CC2IE)
 787  0374 c65303        	ld	a,21251
 788  0377 a504          	bcp	a,#4
 789  0379 2704          	jreq	L722
 790                     ; 319 		DOT_PIN = 1;
 791  037b 721c500f      	bset	20495,#6
 792  037f               L722:
 793                     ; 321 	flag10ms = 1;
 794  037f 35010003      	mov	_flag10ms,#1
 795                     ; 322 	sfr_TIM2.SR1.UIF = 0;
 796  0383 72115304      	bres	21252,#0
 797                     ; 323   return;
 798  0387 85            	popw	x
 799  0388 bf00          	ldw	c_y,x
 800  038a 320002        	pop	c_y+2
 801  038d 85            	popw	x
 802  038e bf00          	ldw	c_x,x
 803  0390 320002        	pop	c_x+2
 804  0393 80            	iret
 805                     ; 327 ISR_HANDLER (TIM2_CAP_ISR, _TIM2_CAPCOM_CC1IF_VECTOR_)
 805                     ; 328 {
 806  0394               f_TIM2_CAP_ISR:
 807  0394 8a            	push	cc
 808  0395 84            	pop	a
 809  0396 a4bf          	and	a,#191
 810  0398 88            	push	a
 811  0399 86            	pop	cc
 812  039a 3b0002        	push	c_x+2
 813  039d be00          	ldw	x,c_x
 814  039f 89            	pushw	x
 815  03a0 3b0002        	push	c_y+2
 816  03a3 be00          	ldw	x,c_y
 817  03a5 89            	pushw	x
 819                     ; 330 	if(sfr_TIM2.SR1.CC1IF){
 820  03a6 c65304        	ld	a,21252
 821  03a9 a502          	bcp	a,#2
 822  03ab 271c          	jreq	L132
 823                     ; 331 		if(flagBrightSet){
 824  03ad 3d00          	tnz	L51_flagBrightSet
 825  03af 270b          	jreq	L332
 826                     ; 332 			hc595ChainShiftOut(disp_data_bright_set,sizeof(disp_data_bright_set));
 827  03b1 4b05          	push	#5
 828  03b3 ae000a        	ldw	x,#L7_disp_data_bright_set
 829  03b6 cd0000        	call	_hc595ChainShiftOut
 831  03b9 84            	pop	a
 833  03ba 2009          	jra	L532
 834  03bc               L332:
 835                     ; 334 			hc595ChainShiftOut(zero_data,sizeof(zero_data));
 836  03bc 4b05          	push	#5
 837  03be ae0000        	ldw	x,#L3_zero_data
 838  03c1 cd0000        	call	_hc595ChainShiftOut
 840  03c4 84            	pop	a
 841  03c5               L532:
 842                     ; 336 		sfr_TIM2.SR1.CC1IF = 0;
 843  03c5 72135304      	bres	21252,#1
 844  03c9               L132:
 845                     ; 340 	if(sfr_TIM2.SR1.CC2IF)
 846  03c9 c65304        	ld	a,21252
 847  03cc a504          	bcp	a,#4
 848  03ce 2708          	jreq	L732
 849                     ; 342 		DOT_PIN = 0;
 850  03d0 721d500f      	bres	20495,#6
 851                     ; 343 		sfr_TIM2.SR1.CC2IF = 0;
 852  03d4 72155304      	bres	21252,#2
 853  03d8               L732:
 854                     ; 345   return;
 855  03d8 85            	popw	x
 856  03d9 bf00          	ldw	c_y,x
 857  03db 320002        	pop	c_y+2
 858  03de 85            	popw	x
 859  03df bf00          	ldw	c_x,x
 860  03e1 320002        	pop	c_x+2
 861  03e4 80            	iret
 862                     	switch	.const
 863  0009               L44:
 864  0009 000000ff      	dc.l	255
 865                     ; 350 void displayRGBset (uint8_t state)
 865                     ; 351 {
 866                     	scross	off
 867                     	switch	.text
 868  03e5               _displayRGBset:
 870                     ; 352 	if (state){
 871  03e5 4d            	tnz	a
 872  03e6 274d          	jreq	L142
 873                     ; 354 		RGBsetR((uint16_t)scale(EEPROM_readByte(R_ADDR),255,displayBright));
 874  03e8 ae000b        	ldw	x,#11
 875  03eb cd0000        	call	_EEPROM_readByte
 877  03ee 5f            	clrw	x
 878  03ef 97            	ld	xl,a
 879  03f0 90be01        	ldw	y,L31_displayBright
 880  03f3 cd0000        	call	c_umul
 882  03f6 ae0009        	ldw	x,#L44
 883  03f9 cd0000        	call	c_ldiv
 885  03fc be02          	ldw	x,c_lreg+2
 886  03fe cd0000        	call	_RGBsetR
 888                     ; 355 		RGBsetG((uint16_t)scale(EEPROM_readByte(G_ADDR),255,displayBright));
 889  0401 ae000c        	ldw	x,#12
 890  0404 cd0000        	call	_EEPROM_readByte
 892  0407 5f            	clrw	x
 893  0408 97            	ld	xl,a
 894  0409 90be01        	ldw	y,L31_displayBright
 895  040c cd0000        	call	c_umul
 897  040f ae0009        	ldw	x,#L44
 898  0412 cd0000        	call	c_ldiv
 900  0415 be02          	ldw	x,c_lreg+2
 901  0417 cd0000        	call	_RGBsetG
 903                     ; 356 		RGBsetB((uint16_t)scale(EEPROM_readByte(B_ADDR),255,displayBright));
 904  041a ae000d        	ldw	x,#13
 905  041d cd0000        	call	_EEPROM_readByte
 907  0420 5f            	clrw	x
 908  0421 97            	ld	xl,a
 909  0422 90be01        	ldw	y,L31_displayBright
 910  0425 cd0000        	call	c_umul
 912  0428 ae0009        	ldw	x,#L44
 913  042b cd0000        	call	c_ldiv
 915  042e be02          	ldw	x,c_lreg+2
 916  0430 cd0000        	call	_RGBsetB
 919  0433 200c          	jra	L342
 920  0435               L142:
 921                     ; 358 		RGBsetR(0);
 922  0435 5f            	clrw	x
 923  0436 cd0000        	call	_RGBsetR
 925                     ; 359 		RGBsetG(0);
 926  0439 5f            	clrw	x
 927  043a cd0000        	call	_RGBsetG
 929                     ; 360 		RGBsetB(0);
 930  043d 5f            	clrw	x
 931  043e cd0000        	call	_RGBsetB
 933  0441               L342:
 934                     ; 362 }
 935  0441 81            	ret
 937                     ; 364 void displayRset(uint8_t value)
 937                     ; 365 {
 938  0442               _displayRset:
 940                     ; 366 	RGBsetR((uint16_t)scale(value,255,displayBright));
 941  0442 5f            	clrw	x
 942  0443 97            	ld	xl,a
 943  0444 90be01        	ldw	y,L31_displayBright
 944  0447 cd0000        	call	c_umul
 946  044a ae0009        	ldw	x,#L44
 947  044d cd0000        	call	c_ldiv
 949  0450 be02          	ldw	x,c_lreg+2
 950  0452 cd0000        	call	_RGBsetR
 952                     ; 367 }
 953  0455 81            	ret
 955                     ; 369 void displayGset(uint8_t value)
 955                     ; 370 {
 956  0456               _displayGset:
 958                     ; 371 	RGBsetG((uint16_t)scale(value,255,displayBright));
 959  0456 5f            	clrw	x
 960  0457 97            	ld	xl,a
 961  0458 90be01        	ldw	y,L31_displayBright
 962  045b cd0000        	call	c_umul
 964  045e ae0009        	ldw	x,#L44
 965  0461 cd0000        	call	c_ldiv
 967  0464 be02          	ldw	x,c_lreg+2
 968  0466 cd0000        	call	_RGBsetG
 970                     ; 372 }
 971  0469 81            	ret
 973                     ; 374 void displayBset(uint8_t value)
 973                     ; 375 {
 974  046a               _displayBset:
 976                     ; 376 	RGBsetB((uint16_t)scale(value,255,displayBright));
 977  046a 5f            	clrw	x
 978  046b 97            	ld	xl,a
 979  046c 90be01        	ldw	y,L31_displayBright
 980  046f cd0000        	call	c_umul
 982  0472 ae0009        	ldw	x,#L44
 983  0475 cd0000        	call	c_ldiv
 985  0478 be02          	ldw	x,c_lreg+2
 986  047a cd0000        	call	_RGBsetB
 988                     ; 377 }
 989  047d 81            	ret
 991                     	xdef	f_TIM2_CAP_ISR
 992                     	xdef	f_TIM2_UPD_ISR
 993                     	switch	.ubsct
 994  0000               L51_flagBrightSet:
 995  0000 00            	ds.b	1
 996  0001               L31_displayBright:
 997  0001 0000          	ds.b	2
 998  0003               _flag10ms:
 999  0003 00            	ds.b	1
1000                     	xdef	_flag10ms
1001  0004               L11_dotPulseCounter:
1002  0004 00            	ds.b	1
1003                     	xref	_EEPROM_readByte
1004                     	xref.b	_e
1005                     	xref	_RGBsetB
1006                     	xref	_RGBsetG
1007                     	xref	_RGBsetR
1008                     	xref	_RGBinit
1009                     	xdef	_displayBset
1010                     	xdef	_displayGset
1011                     	xdef	_displayRset
1012                     	xdef	_displayRGBset
1013                     	xdef	_displayDotPulseProc
1014                     	xdef	_displayDotPulse
1015                     	xdef	_displayDot
1016                     	xdef	_displayNixieBrightSet
1017                     	xdef	_displayNixie
1018                     	xdef	_displaySetBright
1019                     	xdef	_displayInit
1020                     	xref	_hc595ChainShiftOut
1021                     	xref	_hc595Init
1022                     	xref.b	c_lreg
1023                     	xref.b	c_x
1024                     	xref.b	c_y
1025                     	xref	c_ldiv
1026                     	xref	c_umul
1027                     	xref	c_bmulx
1028                     	xref	c_xymov
1029                     	end
