   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 18 void iface_init( void )
  15                     ; 19 {
  16                     	scross	off
  17  0000               _iface_init:
  19                     ; 20 	i.display_state = SETUP_NO;
  20  0000 35ff0008      	mov	_i+7,#255
  21                     ; 23 	i.display_state = SETUP_ZERO;
  22  0004 3f08          	clr	_i+7
  23                     ; 24 	i.setupValue = e.zeroEn;
  24  0006 45000c        	mov	_i+11,_e
  25                     ; 25 	i.timeSetupCounter = 60*10;
  26  0009 ae0258        	ldw	x,#600
  27  000c bf01          	ldw	_i,x
  28                     ; 26 	displayRGBset(0);
  29  000e 4f            	clr	a
  30  000f cd0000        	call	_displayRGBset
  32                     ; 27 }
  33  0012 81            	ret
  35                     	bsct
  36  0000               L51_proc_fase:
  37  0000 00            	dc.b	0
  38  0001               L71_counter50ms:
  39  0001 00            	dc.b	0
  40  0002               L12_counter100ms:
  41  0002 00            	dc.b	0
  42  0003               L32_localFlag100ms:
  43  0003 00            	dc.b	0
  44                     ; 29 void iface_proc ( void ) 
  44                     ; 30 {
  45                     	switch	.text
  46  0013               _iface_proc:
  48                     ; 36 	keyevents_proc();
  49  0013 cd0000        	call	_keyevents_proc
  51                     ; 38 	if (i.flag10ms) {
  52  0016 3d07          	tnz	_i+6
  53  0018 2774          	jreq	L73
  54                     ; 39 		set_service_timing_mutex();
  55  001a cd0000        	call	_set_service_timing_mutex
  57                     ; 40 		proc_fase++;
  58  001d 3c00          	inc	L51_proc_fase
  59                     ; 41 		switch(proc_fase){
  60  001f b600          	ld	a,L51_proc_fase
  62                     ; 93 				break;
  63  0021 4a            	dec	a
  64  0022 2712          	jreq	L52
  65  0024 4a            	dec	a
  66  0025 271d          	jreq	L72
  67  0027 4a            	dec	a
  68  0028 274c          	jreq	L13
  69  002a 4a            	dec	a
  70  002b 2752          	jreq	L33
  71  002d               L53:
  72                     ; 89 			default:
  72                     ; 90 				proc_fase = 0;
  73  002d 3f00          	clr	L51_proc_fase
  74                     ; 91 				i.flag10ms = 0;
  75  002f 3f07          	clr	_i+6
  76                     ; 92 				reset_service_timing_mutex();
  77  0031 cd0000        	call	_reset_service_timing_mutex
  79                     ; 93 				break;
  80  0034 2058          	jra	L73
  81  0036               L52:
  82                     ; 42 			case 1: 
  82                     ; 43 				// counter for time get time from ds3231 and start blinking dot if needed
  82                     ; 44 				if (++counter50ms>(5-1)){
  83  0036 3c01          	inc	L71_counter50ms
  84  0038 b601          	ld	a,L71_counter50ms
  85  003a a105          	cp	a,#5
  86  003c 2550          	jrult	L73
  87                     ; 45 					counter50ms = 0;
  88  003e 3f01          	clr	L71_counter50ms
  89                     ; 46 					timer50msProc();
  90  0040 ad57          	call	L3_timer50msProc
  92  0042 204a          	jra	L73
  93  0044               L72:
  94                     ; 50 			case 2:
  94                     ; 51 				if (++counter100ms>(10-1)){
  95  0044 3c02          	inc	L12_counter100ms
  96  0046 b602          	ld	a,L12_counter100ms
  97  0048 a10a          	cp	a,#10
  98  004a 2542          	jrult	L73
  99                     ; 52 					counter100ms = 0;
 100  004c 3f02          	clr	L12_counter100ms
 101                     ; 53 					localFlag100ms = 1;	//flag for pocess 100ms tasks
 102  004e 35010003      	mov	L32_localFlag100ms,#1
 103                     ; 56 					if (++i.counter1s > 10-1){
 104  0052 3c0f          	inc	_i+14
 105  0054 b60f          	ld	a,_i+14
 106  0056 a10a          	cp	a,#10
 107  0058 2504          	jrult	L15
 108                     ; 57 						i.counter1s = 0;
 109  005a 3f0f          	clr	_i+14
 110                     ; 58 						i.flag05s = 0;
 111  005c 3f10          	clr	_i+15
 112  005e               L15:
 113                     ; 60 					if (i.counter1s > 4){
 114  005e b60f          	ld	a,_i+14
 115  0060 a105          	cp	a,#5
 116  0062 2504          	jrult	L35
 117                     ; 61 						i.flag05s = 1;
 118  0064 35010010      	mov	_i+15,#1
 119  0068               L35:
 120                     ; 65 					if (i.flag100ms){
 121  0068 3d11          	tnz	_i+16
 122  006a 2704          	jreq	L55
 123                     ; 66 						i.flag100ms = 0;
 124  006c 3f11          	clr	_i+16
 126  006e 201e          	jra	L73
 127  0070               L55:
 128                     ; 68 						i.flag100ms = 1;
 129  0070 35010011      	mov	_i+16,#1
 130  0074 2018          	jra	L73
 131  0076               L13:
 132                     ; 73 			case 3:
 132                     ; 74 				if (localFlag100ms){
 133  0076 3d03          	tnz	L32_localFlag100ms
 134  0078 2714          	jreq	L73
 135                     ; 75 					keyevents_counters();
 136  007a cd0000        	call	_keyevents_counters
 138  007d 200f          	jra	L73
 139  007f               L33:
 140                     ; 79 			case 4:
 140                     ; 80 				if (localFlag100ms) {
 141  007f 3d03          	tnz	L32_localFlag100ms
 142  0081 2704          	jreq	L36
 143                     ; 81 					iface_display();
 144  0083 ad37          	call	L5_iface_display
 146                     ; 82 					localFlag100ms = 0;
 147  0085 3f03          	clr	L32_localFlag100ms
 148  0087               L36:
 149                     ; 84 				proc_fase = 0;
 150  0087 3f00          	clr	L51_proc_fase
 151                     ; 85 				i.flag10ms = 0;
 152  0089 3f07          	clr	_i+6
 153                     ; 86 				reset_service_timing_mutex();
 154  008b cd0000        	call	_reset_service_timing_mutex
 156                     ; 87 				break;
 157  008e               L34:
 158  008e               L73:
 159                     ; 96 }
 160  008e 81            	ret
 162                     ; 98 void iface_flag05sReset(void)
 162                     ; 99 {
 163  008f               _iface_flag05sReset:
 165                     ; 100 	i.counter1s = 0;
 166  008f 3f0f          	clr	_i+14
 167                     ; 101 	i.flag05s = 0;
 168  0091 3f10          	clr	_i+15
 169                     ; 102 }
 170  0093 81            	ret
 172                     ; 104 void iface_10ms_proc_en (void)
 172                     ; 105 {
 173  0094               _iface_10ms_proc_en:
 175                     ; 106 	i.flag10ms = 1;
 176  0094 35010007      	mov	_i+6,#1
 177                     ; 107 }
 178  0098 81            	ret
 180                     	switch	.ubsct
 181  0000               L56_secondsLast:
 182  0000 00            	ds.b	1
 183                     ; 109 static void timer50msProc(void)
 183                     ; 110 {
 184                     	switch	.text
 185  0099               L3_timer50msProc:
 187                     ; 113 	if (i.display_state == SETUP_NO){
 188  0099 b608          	ld	a,_i+7
 189  009b a1ff          	cp	a,#255
 190  009d 261c          	jrne	L76
 191                     ; 114 		ds3231_read_time(&i.seconds,&i.minutes,&i.hours);
 192  009f ae000b        	ldw	x,#_i+10
 193  00a2 89            	pushw	x
 194  00a3 ae000a        	ldw	x,#_i+9
 195  00a6 89            	pushw	x
 196  00a7 ae0009        	ldw	x,#_i+8
 197  00aa cd0000        	call	_ds3231_read_time
 199  00ad 5b04          	addw	sp,#4
 200                     ; 115 		if (i.seconds != secondsLast){
 201  00af b609          	ld	a,_i+8
 202  00b1 b100          	cp	a,L56_secondsLast
 203  00b3 2706          	jreq	L76
 204                     ; 116 			secondsLast = i.seconds;
 205  00b5 450900        	mov	L56_secondsLast,_i+8
 206                     ; 117 			displayDotPulse();
 207  00b8 cd0000        	call	_displayDotPulse
 209  00bb               L76:
 210                     ; 120 }
 211  00bb 81            	ret
 213                     .const:	section	.text
 214  0000               L02:
 215  0000 025b          	dc.w	L501
 216  0002 025b          	dc.w	L501
 217  0004 0237          	dc.w	L301
 218  0006 0237          	dc.w	L301
 219  0008 025b          	dc.w	L501
 220  000a 028b          	dc.w	L701
 221  000c 028b          	dc.w	L701
 222  000e 028b          	dc.w	L701
 223  0010 028b          	dc.w	L701
 224  0012 025b          	dc.w	L501
 225  0014 025b          	dc.w	L501
 226  0016 0206          	dc.w	L101
 227  0018 0206          	dc.w	L101
 228  001a 0206          	dc.w	L101
 229  001c 0194          	dc.w	L57
 230  001e 01cd          	dc.w	L77
 231                     ; 122 static void iface_display(void)
 231                     ; 123 {
 232                     	switch	.text
 233  00bc               L5_iface_display:
 234  00bc 5207          	subw	sp,#7
 235       00000007      OFST:	set	7
 237                     ; 129 	switch(i.display_state){
 238  00be b608          	ld	a,_i+7
 240                     ; 244 		default:
 240                     ; 245 			break;
 241  00c0 a110          	cp	a,#16
 242  00c2 2407          	jruge	L61
 243  00c4 5f            	clrw	x
 244  00c5 97            	ld	xl,a
 245  00c6 58            	sllw	x
 246  00c7 de0000        	ldw	x,(L02,x)
 247  00ca fc            	jp	(x)
 248  00cb               L61:
 249  00cb 4c            	inc	a
 250  00cc 2703          	jreq	L22
 251  00ce cc02aa        	jp	L511
 252  00d1               L22:
 253                     ; 130 		case SETUP_NO:
 253                     ; 131 			iface_disp2bcdDigit(i.minutes, &i.display[0], &i.display[1]);
 254  00d1 ae0004        	ldw	x,#_i+3
 255  00d4 89            	pushw	x
 256  00d5 ae0003        	ldw	x,#_i+2
 257  00d8 89            	pushw	x
 258  00d9 b60a          	ld	a,_i+9
 259  00db cd0305        	call	L11_iface_disp2bcdDigit
 261  00de 5b04          	addw	sp,#4
 262                     ; 132 			iface_disp2bcdDigit(i.hours, &i.display[2], &i.display[3]);
 263  00e0 ae0006        	ldw	x,#_i+5
 264  00e3 89            	pushw	x
 265  00e4 ae0005        	ldw	x,#_i+4
 266  00e7 89            	pushw	x
 267  00e8 b60b          	ld	a,_i+10
 268  00ea cd0305        	call	L11_iface_disp2bcdDigit
 270  00ed 5b04          	addw	sp,#4
 271                     ; 133 			if (!e.zeroEn){
 272  00ef 3d00          	tnz	_e
 273  00f1 260a          	jrne	L711
 274                     ; 134 				if ((i.hours&0xF0)==0){
 275  00f3 b60b          	ld	a,_i+10
 276  00f5 a5f0          	bcp	a,#240
 277  00f7 2604          	jrne	L711
 278                     ; 135 					i.display[3] = NIXIE_OFF;
 279  00f9 350a0006      	mov	_i+5,#10
 280  00fd               L711:
 281                     ; 138 			displayNixie(&i.display[0]);
 282  00fd ae0003        	ldw	x,#_i+2
 283  0100 cd0000        	call	_displayNixie
 285                     ; 140 			if (i.seconds != secondsLast){
 286  0103 b609          	ld	a,_i+8
 287  0105 1101          	cp	a,(OFST-6,sp)
 288  0107 2603          	jrne	L42
 289  0109 cc02aa        	jp	L511
 290  010c               L42:
 291                     ; 141 				secondsLast = i.seconds;
 292                     ; 143 				if (e.nBrightEn){
 293  010c 3d04          	tnz	_e+4
 294  010e 276f          	jreq	L521
 295                     ; 144 					current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
 296  0110 b60a          	ld	a,_i+9
 297  0112 cd031f        	call	_bcd_to_decimal
 299  0115 97            	ld	xl,a
 300  0116 89            	pushw	x
 301  0117 b60b          	ld	a,_i+10
 302  0119 cd031f        	call	_bcd_to_decimal
 304  011c 85            	popw	x
 305  011d 95            	ld	xh,a
 306  011e cd0350        	call	_time_to_minutes
 308  0121 1f02          	ldw	(OFST-5,sp),x
 309                     ; 145 					start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
 310  0123 b606          	ld	a,_e+6
 311  0125 97            	ld	xl,a
 312  0126 b605          	ld	a,_e+5
 313  0128 95            	ld	xh,a
 314  0129 cd0350        	call	_time_to_minutes
 316  012c 1f04          	ldw	(OFST-3,sp),x
 317                     ; 146 					end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
 318  012e b608          	ld	a,_e+8
 319  0130 97            	ld	xl,a
 320  0131 b607          	ld	a,_e+7
 321  0133 95            	ld	xh,a
 322  0134 cd0350        	call	_time_to_minutes
 324  0137 1f06          	ldw	(OFST-1,sp),x
 325                     ; 148 					if (is_time_in_interval(current_minutes, start_minutes, end_minutes)) {
 326  0139 1e06          	ldw	x,(OFST-1,sp)
 327  013b 89            	pushw	x
 328  013c 1e06          	ldw	x,(OFST-1,sp)
 329  013e 89            	pushw	x
 330  013f 1e06          	ldw	x,(OFST-1,sp)
 331  0141 cd0366        	call	_is_time_in_interval
 333  0144 5b04          	addw	sp,#4
 334  0146 4d            	tnz	a
 335  0147 2721          	jreq	L721
 336                     ; 149 						displaySetBright(e.nBright);
 337  0149 b603          	ld	a,_e+3
 338  014b cd0000        	call	_displaySetBright
 340                     ; 150 						if (e.rgbGlobalEn){
 341  014e 3d0b          	tnz	_e+11
 342  0150 2603          	jrne	L62
 343  0152 cc02aa        	jp	L511
 344  0155               L62:
 345                     ; 151 							if (e.rgbAtNightEn){
 346  0155 3d09          	tnz	_e+9
 347  0157 2709          	jreq	L331
 348                     ; 152 								displayRGBset(1);
 349  0159 a601          	ld	a,#1
 350  015b cd0000        	call	_displayRGBset
 353  015e acaa02aa      	jpf	L511
 354  0162               L331:
 355                     ; 154 								displayRGBset(0);
 356  0162 4f            	clr	a
 357  0163 cd0000        	call	_displayRGBset
 359  0166 acaa02aa      	jpf	L511
 360  016a               L721:
 361                     ; 158 						displaySetBright(e.bright);
 362  016a b602          	ld	a,_e+2
 363  016c cd0000        	call	_displaySetBright
 365                     ; 159 						if (e.rgbGlobalEn){
 366  016f 3d0b          	tnz	_e+11
 367  0171 2603          	jrne	L03
 368  0173 cc02aa        	jp	L511
 369  0176               L03:
 370                     ; 160 							displayRGBset(1);
 371  0176 a601          	ld	a,#1
 372  0178 cd0000        	call	_displayRGBset
 374  017b acaa02aa      	jpf	L511
 375  017f               L521:
 376                     ; 164 					displaySetBright(e.bright);
 377  017f b602          	ld	a,_e+2
 378  0181 cd0000        	call	_displaySetBright
 380                     ; 165 					if (e.rgbGlobalEn){
 381  0184 3d0b          	tnz	_e+11
 382  0186 2603          	jrne	L23
 383  0188 cc02aa        	jp	L511
 384  018b               L23:
 385                     ; 166 						displayRGBset(1);
 386  018b a601          	ld	a,#1
 387  018d cd0000        	call	_displayRGBset
 389  0190 acaa02aa      	jpf	L511
 390  0194               L57:
 391                     ; 173 		case SETUP_HOURS:
 391                     ; 174 			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
 392  0194 ae0004        	ldw	x,#_i+3
 393  0197 89            	pushw	x
 394  0198 ae0003        	ldw	x,#_i+2
 395  019b 89            	pushw	x
 396  019c b60d          	ld	a,_i+12
 397  019e cd0305        	call	L11_iface_disp2bcdDigit
 399  01a1 5b04          	addw	sp,#4
 400                     ; 175 			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
 401  01a3 ae0006        	ldw	x,#_i+5
 402  01a6 89            	pushw	x
 403  01a7 ae0005        	ldw	x,#_i+4
 404  01aa 89            	pushw	x
 405  01ab b60e          	ld	a,_i+13
 406  01ad cd0305        	call	L11_iface_disp2bcdDigit
 408  01b0 5b04          	addw	sp,#4
 409                     ; 176 			if(i.flag05s){
 410  01b2 3d10          	tnz	_i+15
 411  01b4 2708          	jreq	L741
 412                     ; 177 				i.display[2] = NIXIE_OFF;
 413  01b6 350a0005      	mov	_i+4,#10
 414                     ; 178 				i.display[3] = NIXIE_OFF;
 415  01ba 350a0006      	mov	_i+5,#10
 416  01be               L741:
 417                     ; 180 			displayNixie(&i.display[0]);
 418  01be ae0003        	ldw	x,#_i+2
 419  01c1 cd0000        	call	_displayNixie
 421                     ; 181 			displayDot(1);
 422  01c4 a601          	ld	a,#1
 423  01c6 cd0000        	call	_displayDot
 425                     ; 182 			break;
 426  01c9 acaa02aa      	jpf	L511
 427  01cd               L77:
 428                     ; 184 		case SETUP_MINUTES:
 428                     ; 185 			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
 429  01cd ae0004        	ldw	x,#_i+3
 430  01d0 89            	pushw	x
 431  01d1 ae0003        	ldw	x,#_i+2
 432  01d4 89            	pushw	x
 433  01d5 b60d          	ld	a,_i+12
 434  01d7 cd0305        	call	L11_iface_disp2bcdDigit
 436  01da 5b04          	addw	sp,#4
 437                     ; 186 			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
 438  01dc ae0006        	ldw	x,#_i+5
 439  01df 89            	pushw	x
 440  01e0 ae0005        	ldw	x,#_i+4
 441  01e3 89            	pushw	x
 442  01e4 b60e          	ld	a,_i+13
 443  01e6 cd0305        	call	L11_iface_disp2bcdDigit
 445  01e9 5b04          	addw	sp,#4
 446                     ; 187 			if(i.flag05s){
 447  01eb 3d10          	tnz	_i+15
 448  01ed 2708          	jreq	L151
 449                     ; 188 				i.display[0] = NIXIE_OFF;
 450  01ef 350a0003      	mov	_i+2,#10
 451                     ; 189 				i.display[1] = NIXIE_OFF;
 452  01f3 350a0004      	mov	_i+3,#10
 453  01f7               L151:
 454                     ; 191 			displayNixie(&i.display[0]);
 455  01f7 ae0003        	ldw	x,#_i+2
 456  01fa cd0000        	call	_displayNixie
 458                     ; 192 			displayDot(1);
 459  01fd a601          	ld	a,#1
 460  01ff cd0000        	call	_displayDot
 462                     ; 193 			break;
 463  0202 acaa02aa      	jpf	L511
 464  0206               L101:
 465                     ; 195 		case SETUP_R:
 465                     ; 196 		case SETUP_G:
 465                     ; 197 		case SETUP_B:
 465                     ; 198 			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
 466  0206 ae0005        	ldw	x,#_i+4
 467  0209 89            	pushw	x
 468  020a ae0004        	ldw	x,#_i+3
 469  020d 89            	pushw	x
 470  020e ae0003        	ldw	x,#_i+2
 471  0211 89            	pushw	x
 472  0212 b60c          	ld	a,_i+11
 473  0214 5f            	clrw	x
 474  0215 97            	ld	xl,a
 475  0216 cd02d0        	call	L31_iface_disp3decDigit
 477  0219 5b06          	addw	sp,#6
 478                     ; 199 			if (i.flag100ms){
 479  021b 3d11          	tnz	_i+16
 480  021d 2706          	jreq	L351
 481                     ; 200 				i.display[3] = NIXIE_OFF;
 482  021f 350a0006      	mov	_i+5,#10
 484  0223 2006          	jra	L551
 485  0225               L351:
 486                     ; 202 				i.display[3] = i.display_state-11;
 487  0225 b608          	ld	a,_i+7
 488  0227 a00b          	sub	a,#11
 489  0229 b706          	ld	_i+5,a
 490  022b               L551:
 491                     ; 204 			displayNixie(&i.display[0]);
 492  022b ae0003        	ldw	x,#_i+2
 493  022e cd0000        	call	_displayNixie
 495                     ; 205 			displayDot(0);
 496  0231 4f            	clr	a
 497  0232 cd0000        	call	_displayDot
 499                     ; 206 			break;
 500  0235 2073          	jra	L511
 501  0237               L301:
 502                     ; 208 		case SETUP_BRIGHT:
 502                     ; 209 		case SETUP_NIGHT_BR:
 502                     ; 210 			i.display[3] = i.display_state;
 503  0237 450806        	mov	_i+5,_i+7
 504                     ; 211 			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
 505  023a ae0005        	ldw	x,#_i+4
 506  023d 89            	pushw	x
 507  023e ae0004        	ldw	x,#_i+3
 508  0241 89            	pushw	x
 509  0242 ae0003        	ldw	x,#_i+2
 510  0245 89            	pushw	x
 511  0246 b60c          	ld	a,_i+11
 512  0248 5f            	clrw	x
 513  0249 97            	ld	xl,a
 514  024a cd02d0        	call	L31_iface_disp3decDigit
 516  024d 5b06          	addw	sp,#6
 517                     ; 212 			displayNixieBrightSet(&i.display[0]);
 518  024f ae0003        	ldw	x,#_i+2
 519  0252 cd0000        	call	_displayNixieBrightSet
 521                     ; 213 			displayDot(0);
 522  0255 4f            	clr	a
 523  0256 cd0000        	call	_displayDot
 525                     ; 214 		break;
 526  0259 204f          	jra	L511
 527  025b               L501:
 528                     ; 216 		case SETUP_ZERO:
 528                     ; 217 		case SETUP_F1224:
 528                     ; 218 		case SETUP_NIGHT_BR_EN:
 528                     ; 219 		case SETUP_NIGHT_RGB_EN:
 528                     ; 220 		case SETUP_ANTIPOISONING_AT_NIGHT_ONLY:
 528                     ; 221 			if (i.display_state > 9){
 529  025b b608          	ld	a,_i+7
 530  025d a10a          	cp	a,#10
 531  025f 2510          	jrult	L751
 532                     ; 222 				iface_disp2decDigit(i.display_state,&i.display[2],&i.display[3]);
 533  0261 ae0006        	ldw	x,#_i+5
 534  0264 89            	pushw	x
 535  0265 ae0005        	ldw	x,#_i+4
 536  0268 89            	pushw	x
 537  0269 b608          	ld	a,_i+7
 538  026b ad40          	call	L7_iface_disp2decDigit
 540  026d 5b04          	addw	sp,#4
 542  026f 2007          	jra	L161
 543  0271               L751:
 544                     ; 224 				i.display[3] = i.display_state;
 545  0271 450806        	mov	_i+5,_i+7
 546                     ; 225 				i.display[2] = NIXIE_OFF;	
 547  0274 350a0005      	mov	_i+4,#10
 548  0278               L161:
 549                     ; 227 			i.display[1] = NIXIE_OFF;
 550  0278 350a0004      	mov	_i+3,#10
 551                     ; 228 			i.display[0] = i.setupValue;
 552  027c 450c03        	mov	_i+2,_i+11
 553                     ; 229 			displayNixie(&i.display[0]);
 554  027f ae0003        	ldw	x,#_i+2
 555  0282 cd0000        	call	_displayNixie
 557                     ; 230 			displayDot(0);
 558  0285 4f            	clr	a
 559  0286 cd0000        	call	_displayDot
 561                     ; 231 			break;
 562  0289 201f          	jra	L511
 563  028b               L701:
 564                     ; 233 		case SETUP_NIGHT_BR_START_H:
 564                     ; 234 		case SETUP_NIGHT_BR_START_M:
 564                     ; 235 		case SETUP_NIGHT_BR_END_H:
 564                     ; 236 		case SETUP_NIGHT_BR_END_M:
 564                     ; 237 			iface_disp2decDigit(i.setupValue, &i.display[0], &i.display[1]);
 565  028b ae0004        	ldw	x,#_i+3
 566  028e 89            	pushw	x
 567  028f ae0003        	ldw	x,#_i+2
 568  0292 89            	pushw	x
 569  0293 b60c          	ld	a,_i+11
 570  0295 ad16          	call	L7_iface_disp2decDigit
 572  0297 5b04          	addw	sp,#4
 573                     ; 238 			i.display[2] = NIXIE_OFF;
 574  0299 350a0005      	mov	_i+4,#10
 575                     ; 239 			i.display[3] = i.display_state;
 576  029d 450806        	mov	_i+5,_i+7
 577                     ; 240 			displayNixie(&i.display[0]);
 578  02a0 ae0003        	ldw	x,#_i+2
 579  02a3 cd0000        	call	_displayNixie
 581                     ; 241 			displayDot(0);
 582  02a6 4f            	clr	a
 583  02a7 cd0000        	call	_displayDot
 585                     ; 242 			break;
 586  02aa               L111:
 587                     ; 244 		default:
 587                     ; 245 			break;
 588  02aa               L511:
 589                     ; 249 }
 590  02aa 5b07          	addw	sp,#7
 591  02ac 81            	ret
 593                     ; 251 static void iface_disp2decDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
 593                     ; 252 {
 594  02ad               L7_iface_disp2decDigit:
 595  02ad 88            	push	a
 596       00000000      OFST:	set	0
 598                     ; 253 	if (value > 99) {value = 99;}
 599  02ae a164          	cp	a,#100
 600  02b0 2504          	jrult	L361
 602  02b2 a663          	ld	a,#99
 603  02b4 6b01          	ld	(OFST+1,sp),a
 604  02b6               L361:
 605                     ; 254 	*d0 = value%10;
 606  02b6 7b01          	ld	a,(OFST+1,sp)
 607  02b8 5f            	clrw	x
 608  02b9 97            	ld	xl,a
 609  02ba a60a          	ld	a,#10
 610  02bc 62            	div	x,a
 611  02bd 5f            	clrw	x
 612  02be 97            	ld	xl,a
 613  02bf 9f            	ld	a,xl
 614  02c0 1e04          	ldw	x,(OFST+4,sp)
 615  02c2 f7            	ld	(x),a
 616                     ; 255 	*d1 = value/10;
 617  02c3 7b01          	ld	a,(OFST+1,sp)
 618  02c5 5f            	clrw	x
 619  02c6 97            	ld	xl,a
 620  02c7 a60a          	ld	a,#10
 621  02c9 62            	div	x,a
 622  02ca 9f            	ld	a,xl
 623  02cb 1e06          	ldw	x,(OFST+6,sp)
 624  02cd f7            	ld	(x),a
 625                     ; 256 }
 626  02ce 84            	pop	a
 627  02cf 81            	ret
 629                     ; 258 static void iface_disp3decDigit (uint16_t value, uint8_t *d0, uint8_t *d1, uint8_t *d2)
 629                     ; 259 {
 630  02d0               L31_iface_disp3decDigit:
 631  02d0 89            	pushw	x
 632       00000000      OFST:	set	0
 634                     ; 260 	if (value > 999) {value = 999;}
 635  02d1 a303e8        	cpw	x,#1000
 636  02d4 2505          	jrult	L561
 638  02d6 ae03e7        	ldw	x,#999
 639  02d9 1f01          	ldw	(OFST+1,sp),x
 640  02db               L561:
 641                     ; 261 	*d0 = value%10;
 642  02db 1e01          	ldw	x,(OFST+1,sp)
 643  02dd a60a          	ld	a,#10
 644  02df 62            	div	x,a
 645  02e0 5f            	clrw	x
 646  02e1 97            	ld	xl,a
 647  02e2 1605          	ldw	y,(OFST+5,sp)
 648  02e4 01            	rrwa	x,a
 649  02e5 90f7          	ld	(y),a
 650  02e7 02            	rlwa	x,a
 651                     ; 262 	*d1 = (value/10)%10;
 652  02e8 1e01          	ldw	x,(OFST+1,sp)
 653  02ea a60a          	ld	a,#10
 654  02ec 62            	div	x,a
 655  02ed a60a          	ld	a,#10
 656  02ef 62            	div	x,a
 657  02f0 5f            	clrw	x
 658  02f1 97            	ld	xl,a
 659  02f2 1607          	ldw	y,(OFST+7,sp)
 660  02f4 01            	rrwa	x,a
 661  02f5 90f7          	ld	(y),a
 662  02f7 02            	rlwa	x,a
 663                     ; 263 	*d2 = value/100;
 664  02f8 1e01          	ldw	x,(OFST+1,sp)
 665  02fa a664          	ld	a,#100
 666  02fc 62            	div	x,a
 667  02fd 1609          	ldw	y,(OFST+9,sp)
 668  02ff 01            	rrwa	x,a
 669  0300 90f7          	ld	(y),a
 670  0302 02            	rlwa	x,a
 671                     ; 264 }
 672  0303 85            	popw	x
 673  0304 81            	ret
 675                     ; 266 static void iface_disp2bcdDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
 675                     ; 267 {
 676  0305               L11_iface_disp2bcdDigit:
 677  0305 88            	push	a
 678       00000000      OFST:	set	0
 680                     ; 268 	if (value > 0x99) {value = 0x99;}
 681  0306 a19a          	cp	a,#154
 682  0308 2504          	jrult	L761
 684  030a a699          	ld	a,#153
 685  030c 6b01          	ld	(OFST+1,sp),a
 686  030e               L761:
 687                     ; 269 	*d0 = value&0x0F;
 688  030e 7b01          	ld	a,(OFST+1,sp)
 689  0310 a40f          	and	a,#15
 690  0312 1e04          	ldw	x,(OFST+4,sp)
 691  0314 f7            	ld	(x),a
 692                     ; 270 	*d1 = (value&0xF0)>>4;
 693  0315 7b01          	ld	a,(OFST+1,sp)
 694  0317 4e            	swap	a
 695  0318 a40f          	and	a,#15
 696  031a 1e06          	ldw	x,(OFST+6,sp)
 697  031c f7            	ld	(x),a
 698                     ; 271 }
 699  031d 84            	pop	a
 700  031e 81            	ret
 702                     ; 273 uint8_t bcd_to_decimal(uint8_t bcd)
 702                     ; 274 {
 703  031f               _bcd_to_decimal:
 704  031f 88            	push	a
 705  0320 88            	push	a
 706       00000001      OFST:	set	1
 708                     ; 275 	return ((bcd >> 4) * 10) + (bcd & 0x0F);
 709  0321 a40f          	and	a,#15
 710  0323 6b01          	ld	(OFST+0,sp),a
 711  0325 7b02          	ld	a,(OFST+1,sp)
 712  0327 4e            	swap	a
 713  0328 a40f          	and	a,#15
 714  032a 97            	ld	xl,a
 715  032b a60a          	ld	a,#10
 716  032d 42            	mul	x,a
 717  032e 9f            	ld	a,xl
 718  032f 1b01          	add	a,(OFST+0,sp)
 720  0331 85            	popw	x
 721  0332 81            	ret
 723                     ; 278 uint8_t decimal_to_bcd(uint8_t decimal) 
 723                     ; 279 {
 724  0333               _decimal_to_bcd:
 725  0333 88            	push	a
 726  0334 88            	push	a
 727       00000001      OFST:	set	1
 729                     ; 280 	return ((decimal / 10) << 4) | (decimal % 10);
 730  0335 5f            	clrw	x
 731  0336 97            	ld	xl,a
 732  0337 a60a          	ld	a,#10
 733  0339 62            	div	x,a
 734  033a 5f            	clrw	x
 735  033b 97            	ld	xl,a
 736  033c 9f            	ld	a,xl
 737  033d 6b01          	ld	(OFST+0,sp),a
 738  033f 7b02          	ld	a,(OFST+1,sp)
 739  0341 5f            	clrw	x
 740  0342 97            	ld	xl,a
 741  0343 a60a          	ld	a,#10
 742  0345 62            	div	x,a
 743  0346 9f            	ld	a,xl
 744  0347 97            	ld	xl,a
 745  0348 a610          	ld	a,#16
 746  034a 42            	mul	x,a
 747  034b 9f            	ld	a,xl
 748  034c 1a01          	or	a,(OFST+0,sp)
 750  034e 85            	popw	x
 751  034f 81            	ret
 753                     ; 283 uint16_t time_to_minutes(uint8_t hours, uint8_t minutes) 
 753                     ; 284 {
 754  0350               _time_to_minutes:
 755  0350 89            	pushw	x
 756  0351 89            	pushw	x
 757       00000002      OFST:	set	2
 759                     ; 285 	return (uint16_t)hours * 60 + (uint16_t)minutes;
 760  0352 9f            	ld	a,xl
 761  0353 5f            	clrw	x
 762  0354 97            	ld	xl,a
 763  0355 1f01          	ldw	(OFST-1,sp),x
 764  0357 7b03          	ld	a,(OFST+1,sp)
 765  0359 5f            	clrw	x
 766  035a 97            	ld	xl,a
 767  035b a63c          	ld	a,#60
 768  035d cd0000        	call	c_bmulx
 770  0360 72fb01        	addw	x,(OFST-1,sp)
 772  0363 5b04          	addw	sp,#4
 773  0365 81            	ret
 775                     ; 288 uint8_t is_time_in_interval(uint16_t current_minutes, uint16_t start_minutes, uint16_t end_minutes) 
 775                     ; 289 {
 776  0366               _is_time_in_interval:
 777  0366 89            	pushw	x
 778       00000000      OFST:	set	0
 780                     ; 290 	if (start_minutes <= end_minutes) {
 781  0367 1e05          	ldw	x,(OFST+5,sp)
 782  0369 1307          	cpw	x,(OFST+7,sp)
 783  036b 2213          	jrugt	L171
 784                     ; 292 			return current_minutes >= start_minutes && current_minutes < end_minutes;
 785  036d 1e01          	ldw	x,(OFST+1,sp)
 786  036f 1305          	cpw	x,(OFST+5,sp)
 787  0371 250a          	jrult	L25
 788  0373 1e01          	ldw	x,(OFST+1,sp)
 789  0375 1307          	cpw	x,(OFST+7,sp)
 790  0377 2404          	jruge	L25
 791  0379 a601          	ld	a,#1
 792  037b 2001          	jra	L45
 793  037d               L25:
 794  037d 4f            	clr	a
 795  037e               L45:
 797  037e 2011          	jra	L46
 798  0380               L171:
 799                     ; 295 			return current_minutes >= start_minutes || current_minutes < end_minutes;
 800  0380 1e01          	ldw	x,(OFST+1,sp)
 801  0382 1305          	cpw	x,(OFST+5,sp)
 802  0384 2406          	jruge	L06
 803  0386 1e01          	ldw	x,(OFST+1,sp)
 804  0388 1307          	cpw	x,(OFST+7,sp)
 805  038a 2404          	jruge	L65
 806  038c               L06:
 807  038c a601          	ld	a,#1
 808  038e 2001          	jra	L26
 809  0390               L65:
 810  0390 4f            	clr	a
 811  0391               L26:
 813  0391               L46:
 814  0391 85            	popw	x
 815  0392 81            	ret
 817                     ; 304 void RGBtoggle ( void )
 817                     ; 305 {
 818  0393               _RGBtoggle:
 819  0393 5206          	subw	sp,#6
 820       00000006      OFST:	set	6
 822                     ; 310 	current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
 823  0395 b60a          	ld	a,_i+9
 824  0397 ad86          	call	_bcd_to_decimal
 826  0399 97            	ld	xl,a
 827  039a 89            	pushw	x
 828  039b b60b          	ld	a,_i+10
 829  039d ad80          	call	_bcd_to_decimal
 831  039f 85            	popw	x
 832  03a0 95            	ld	xh,a
 833  03a1 adad          	call	_time_to_minutes
 835  03a3 1f01          	ldw	(OFST-5,sp),x
 836                     ; 311 	start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
 837  03a5 b606          	ld	a,_e+6
 838  03a7 97            	ld	xl,a
 839  03a8 b605          	ld	a,_e+5
 840  03aa 95            	ld	xh,a
 841  03ab ada3          	call	_time_to_minutes
 843  03ad 1f03          	ldw	(OFST-3,sp),x
 844                     ; 312 	end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
 845  03af b608          	ld	a,_e+8
 846  03b1 97            	ld	xl,a
 847  03b2 b607          	ld	a,_e+7
 848  03b4 95            	ld	xh,a
 849  03b5 ad99          	call	_time_to_minutes
 851  03b7 1f05          	ldw	(OFST-1,sp),x
 852                     ; 314 	if (is_time_in_interval(current_minutes, start_minutes, end_minutes)&&e.nBrightEn) {
 853  03b9 1e05          	ldw	x,(OFST-1,sp)
 854  03bb 89            	pushw	x
 855  03bc 1e05          	ldw	x,(OFST-1,sp)
 856  03be 89            	pushw	x
 857  03bf 1e05          	ldw	x,(OFST-1,sp)
 858  03c1 ada3          	call	_is_time_in_interval
 860  03c3 5b04          	addw	sp,#4
 861  03c5 4d            	tnz	a
 862  03c6 2721          	jreq	L571
 864  03c8 3d04          	tnz	_e+4
 865  03ca 271d          	jreq	L571
 866                     ; 315 		if (e.rgbAtNightEn){
 867  03cc 3d09          	tnz	_e+9
 868  03ce 2704          	jreq	L771
 869                     ; 316 			e.rgbAtNightEn = 0;
 870  03d0 3f09          	clr	_e+9
 872  03d2 2004          	jra	L102
 873  03d4               L771:
 874                     ; 318 			e.rgbAtNightEn = 1;
 875  03d4 35010009      	mov	_e+9,#1
 876  03d8               L102:
 877                     ; 320 		displayRGBset(e.rgbAtNightEn);
 878  03d8 b609          	ld	a,_e+9
 879  03da cd0000        	call	_displayRGBset
 881                     ; 321 		EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbGlobalEn);
 882  03dd 3b000b        	push	_e+11
 883  03e0 ae0009        	ldw	x,#9
 884  03e3 cd0000        	call	_EEPROM_writeByte
 886  03e6 84            	pop	a
 888  03e7 201b          	jra	L302
 889  03e9               L571:
 890                     ; 324 		if (e.rgbGlobalEn){
 891  03e9 3d0b          	tnz	_e+11
 892  03eb 2704          	jreq	L502
 893                     ; 325 			e.rgbGlobalEn = 0;
 894  03ed 3f0b          	clr	_e+11
 896  03ef 2004          	jra	L702
 897  03f1               L502:
 898                     ; 327 			e.rgbGlobalEn = 1;
 899  03f1 3501000b      	mov	_e+11,#1
 900  03f5               L702:
 901                     ; 329 		displayRGBset(e.rgbGlobalEn);
 902  03f5 b60b          	ld	a,_e+11
 903  03f7 cd0000        	call	_displayRGBset
 905                     ; 330 		EEPROM_writeByte(RGB_EN_ADDR,e.rgbGlobalEn);
 906  03fa 3b000b        	push	_e+11
 907  03fd ae000f        	ldw	x,#15
 908  0400 cd0000        	call	_EEPROM_writeByte
 910  0403 84            	pop	a
 911  0404               L302:
 912                     ; 332 }
 913  0404 5b06          	addw	sp,#6
 914  0406 81            	ret
 916                     	switch	.ubsct
 917  0001               _i:
 918  0001 000000000000  	ds.b	17
 919                     	xdef	_i
 920                     	xref	_EEPROM_writeByte
 921                     	xref.b	_e
 922                     	xref	_displayRGBset
 923                     	xref	_displayDotPulse
 924                     	xref	_displayDot
 925                     	xref	_displayNixieBrightSet
 926                     	xref	_displayNixie
 927                     	xref	_displaySetBright
 928                     	xref	_ds3231_read_time
 929                     	xref	_reset_service_timing_mutex
 930                     	xref	_set_service_timing_mutex
 931                     	xref	_keyevents_counters
 932                     	xref	_keyevents_proc
 933                     	xdef	_RGBtoggle
 934                     	xdef	_is_time_in_interval
 935                     	xdef	_time_to_minutes
 936                     	xdef	_decimal_to_bcd
 937                     	xdef	_bcd_to_decimal
 938                     	xdef	_iface_flag05sReset
 939                     	xdef	_iface_10ms_proc_en
 940                     	xdef	_iface_proc
 941                     	xdef	_iface_init
 942                     	xref.b	c_x
 943                     	xref	c_bmulx
 944                     	end
