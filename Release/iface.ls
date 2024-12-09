   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 19 void iface_init( void )
  15                     ; 20 {
  16                     	scross	off
  17  0000               _iface_init:
  19                     ; 21 	i.display_state = SETUP_NO;
  20  0000 35ff000a      	mov	_i+7,#255
  21                     ; 27 	displayRGBset(0);
  22  0004 4f            	clr	a
  23  0005 cd0000        	call	_displayRGBset
  25                     ; 28 }
  26  0008 81            	ret
  28                     	bsct
  29  0000               L71_proc_fase:
  30  0000 00            	dc.b	0
  31  0001               L12_counter50ms:
  32  0001 00            	dc.b	0
  33  0002               L32_counter100ms:
  34  0002 00            	dc.b	0
  35  0003               L52_localFlag100ms:
  36  0003 00            	dc.b	0
  37                     ; 30 void iface_proc ( void ) 
  37                     ; 31 {
  38                     	switch	.text
  39  0009               _iface_proc:
  41                     ; 37 	keyevents_proc();
  42  0009 cd0000        	call	_keyevents_proc
  44                     ; 39 	if (i.flag10ms) {
  45  000c 3d09          	tnz	_i+6
  46  000e 2603          	jrne	L6
  47  0010 cc0098        	jp	L34
  48  0013               L6:
  49                     ; 40 		set_service_timing_mutex();
  50  0013 cd0000        	call	_set_service_timing_mutex
  52                     ; 41 		proc_fase++;
  53  0016 3c00          	inc	L71_proc_fase
  54                     ; 42 		switch(proc_fase){
  55  0018 b600          	ld	a,L71_proc_fase
  57                     ; 101 				break;
  58  001a 4a            	dec	a
  59  001b 2715          	jreq	L72
  60  001d 4a            	dec	a
  61  001e 2720          	jreq	L13
  62  0020 4a            	dec	a
  63  0021 274f          	jreq	L33
  64  0023 4a            	dec	a
  65  0024 275a          	jreq	L53
  66  0026 4a            	dec	a
  67  0027 2760          	jreq	L73
  68  0029               L14:
  69                     ; 97 			default:
  69                     ; 98 				proc_fase = 0;
  70  0029 3f00          	clr	L71_proc_fase
  71                     ; 99 				i.flag10ms = 0;
  72  002b 3f09          	clr	_i+6
  73                     ; 100 				reset_service_timing_mutex();
  74  002d cd0000        	call	_reset_service_timing_mutex
  76                     ; 101 				break;
  77  0030 2066          	jra	L34
  78  0032               L72:
  79                     ; 43 			case 1: 
  79                     ; 44 				// counter for time get time from ds3231 and start blinking dot if needed
  79                     ; 45 				if (++counter50ms> 5-1){
  80  0032 3c01          	inc	L12_counter50ms
  81  0034 b601          	ld	a,L12_counter50ms
  82  0036 a105          	cp	a,#5
  83  0038 255e          	jrult	L34
  84                     ; 46 					counter50ms = 0;
  85  003a 3f01          	clr	L12_counter50ms
  86                     ; 47 					timer50msProc();
  87  003c ad65          	call	L3_timer50msProc
  89  003e 2058          	jra	L34
  90  0040               L13:
  91                     ; 51 			case 2:
  91                     ; 52 				if (++counter100ms> 10-1){
  92  0040 3c02          	inc	L32_counter100ms
  93  0042 b602          	ld	a,L32_counter100ms
  94  0044 a10a          	cp	a,#10
  95  0046 2550          	jrult	L34
  96                     ; 53 					counter100ms = 0;
  97  0048 3f02          	clr	L32_counter100ms
  98                     ; 54 					localFlag100ms = 1;	//flag for pocess 100ms tasks
  99  004a 35010003      	mov	L52_localFlag100ms,#1
 100                     ; 57 					if (++i.counter1s > 10-1){
 101  004e 3c11          	inc	_i+14
 102  0050 b611          	ld	a,_i+14
 103  0052 a10a          	cp	a,#10
 104  0054 2504          	jrult	L55
 105                     ; 58 						i.counter1s = 0;
 106  0056 3f11          	clr	_i+14
 107                     ; 59 						i.flag05s = 0;
 108  0058 3f12          	clr	_i+15
 109  005a               L55:
 110                     ; 61 					if (i.counter1s > 4){
 111  005a b611          	ld	a,_i+14
 112  005c a105          	cp	a,#5
 113  005e 2504          	jrult	L75
 114                     ; 62 						i.flag05s = 1;
 115  0060 35010012      	mov	_i+15,#1
 116  0064               L75:
 117                     ; 66 					if (i.flag100ms){
 118  0064 3d13          	tnz	_i+16
 119  0066 2704          	jreq	L16
 120                     ; 67 						i.flag100ms = 0;
 121  0068 3f13          	clr	_i+16
 123  006a 202c          	jra	L34
 124  006c               L16:
 125                     ; 69 						i.flag100ms = 1;
 126  006c 35010013      	mov	_i+16,#1
 127  0070 2026          	jra	L34
 128  0072               L33:
 129                     ; 74 			case 3:
 129                     ; 75 				if (++i.counter150ms > 10-1){
 130  0072 3c14          	inc	_i+17
 131  0074 b614          	ld	a,_i+17
 132  0076 a10a          	cp	a,#10
 133  0078 251e          	jrult	L34
 134                     ; 76 					i.counter150ms = 0;
 135  007a 3f14          	clr	_i+17
 136                     ; 77 					timer150msProc();
 137  007c ad48          	call	L5_timer150msProc
 139  007e 2018          	jra	L34
 140  0080               L53:
 141                     ; 81 			case 4:
 141                     ; 82 				if (localFlag100ms){
 142  0080 3d03          	tnz	L52_localFlag100ms
 143  0082 2714          	jreq	L34
 144                     ; 83 					keyevents_counters();
 145  0084 cd0000        	call	_keyevents_counters
 147  0087 200f          	jra	L34
 148  0089               L73:
 149                     ; 87 			case 5:
 149                     ; 88 				if (localFlag100ms) {
 150  0089 3d03          	tnz	L52_localFlag100ms
 151  008b 2704          	jreq	L17
 152                     ; 89 					iface_display();
 153  008d ad7c          	call	L7_iface_display
 155                     ; 90 					localFlag100ms = 0;
 156  008f 3f03          	clr	L52_localFlag100ms
 157  0091               L17:
 158                     ; 92 				proc_fase = 0;
 159  0091 3f00          	clr	L71_proc_fase
 160                     ; 93 				i.flag10ms = 0;
 161  0093 3f09          	clr	_i+6
 162                     ; 94 				reset_service_timing_mutex();
 163  0095 cd0000        	call	_reset_service_timing_mutex
 165                     ; 95 				break;
 166  0098               L74:
 167  0098               L34:
 168                     ; 104 }
 169  0098 81            	ret
 171                     ; 106 void iface_flag05sReset(void)
 171                     ; 107 {
 172  0099               _iface_flag05sReset:
 174                     ; 108 	i.counter1s = 0;
 175  0099 3f11          	clr	_i+14
 176                     ; 109 	i.flag05s = 0;
 177  009b 3f12          	clr	_i+15
 178                     ; 110 }
 179  009d 81            	ret
 181                     ; 112 void iface_10ms_proc_en (void)
 181                     ; 113 {
 182  009e               _iface_10ms_proc_en:
 184                     ; 114 	i.flag10ms = 1;
 185  009e 35010009      	mov	_i+6,#1
 186                     ; 115 }
 187  00a2 81            	ret
 189                     	switch	.ubsct
 190  0000               L37_secondsLast:
 191  0000 00            	ds.b	1
 192                     ; 117 static void timer50msProc(void)
 192                     ; 118 {
 193                     	switch	.text
 194  00a3               L3_timer50msProc:
 196                     ; 121 	if (i.display_state == SETUP_NO){
 197  00a3 b60a          	ld	a,_i+7
 198  00a5 a1ff          	cp	a,#255
 199  00a7 261c          	jrne	L57
 200                     ; 122 		ds3231_read_time(&i.seconds,&i.minutes,&i.hours);
 201  00a9 ae000d        	ldw	x,#_i+10
 202  00ac 89            	pushw	x
 203  00ad ae000c        	ldw	x,#_i+9
 204  00b0 89            	pushw	x
 205  00b1 ae000b        	ldw	x,#_i+8
 206  00b4 cd0000        	call	_ds3231_read_time
 208  00b7 5b04          	addw	sp,#4
 209                     ; 123 		if (i.seconds != secondsLast){
 210  00b9 b60b          	ld	a,_i+8
 211  00bb b100          	cp	a,L37_secondsLast
 212  00bd 2706          	jreq	L57
 213                     ; 124 			secondsLast = i.seconds;
 214  00bf 450b00        	mov	L37_secondsLast,_i+8
 215                     ; 125 			displayDotPulse();
 216  00c2 cd0000        	call	_displayDotPulse
 218  00c5               L57:
 219                     ; 128 }
 220  00c5 81            	ret
 222                     ; 130 static void timer150msProc(void)
 222                     ; 131 {
 223  00c6               L5_timer150msProc:
 225                     ; 132 	if (i.antipoisoningEn) {
 226  00c6 3d15          	tnz	_i+18
 227  00c8 2740          	jreq	L101
 228                     ; 133 		i.antipoisoningOldDigit--;
 229  00ca 3a16          	dec	_i+19
 230                     ; 134 		if (i.antipoisoningOldDigit == 255){
 231  00cc b616          	ld	a,_i+19
 232  00ce a1ff          	cp	a,#255
 233  00d0 2604          	jrne	L301
 234                     ; 135 			i.antipoisoningOldDigit = 9;
 235  00d2 35090016      	mov	_i+19,#9
 236  00d6               L301:
 237                     ; 137 		if (i.antipoisoningOldDigit == i.antipoisoningCurrentDigit){
 238  00d6 b616          	ld	a,_i+19
 239  00d8 b117          	cp	a,_i+20
 240  00da 2604          	jrne	L501
 241                     ; 138 			i.antipoisoningEn = 0;
 242  00dc 3f15          	clr	_i+18
 244  00de 202a          	jra	L101
 245  00e0               L501:
 246                     ; 140 			iface_disp2bcdDigit(i.minutes, &i.display[0], &i.display[1]);
 247  00e0 ae0006        	ldw	x,#_i+3
 248  00e3 89            	pushw	x
 249  00e4 ae0005        	ldw	x,#_i+2
 250  00e7 89            	pushw	x
 251  00e8 b60c          	ld	a,_i+9
 252  00ea cd0397        	call	L31_iface_disp2bcdDigit
 254  00ed 5b04          	addw	sp,#4
 255                     ; 141 			iface_disp2bcdDigit(i.hours, &i.display[2], &i.display[3]);
 256  00ef ae0008        	ldw	x,#_i+5
 257  00f2 89            	pushw	x
 258  00f3 ae0007        	ldw	x,#_i+4
 259  00f6 89            	pushw	x
 260  00f7 b60d          	ld	a,_i+10
 261  00f9 cd0397        	call	L31_iface_disp2bcdDigit
 263  00fc 5b04          	addw	sp,#4
 264                     ; 142 			i.display[0] = i.antipoisoningOldDigit;
 265  00fe 451605        	mov	_i+2,_i+19
 266                     ; 143 			displayNixie(&i.display[0],bin(00000001));
 267  0101 4b01          	push	#1
 268  0103 ae0005        	ldw	x,#_i+2
 269  0106 cd0000        	call	_displayNixie
 271  0109 84            	pop	a
 272  010a               L101:
 273                     ; 146 }
 274  010a 81            	ret
 276                     	switch	.ubsct
 277  0001               L311_minutesLast:
 278  0001 00            	ds.b	1
 279  0002               L111_secondsLast:
 280  0002 00            	ds.b	1
 281                     .const:	section	.text
 282  0000               L42:
 283  0000 02e7          	dc.w	L721
 284  0002 02e7          	dc.w	L721
 285  0004 02c0          	dc.w	L521
 286  0006 02c0          	dc.w	L521
 287  0008 02e7          	dc.w	L721
 288  000a 031a          	dc.w	L131
 289  000c 031a          	dc.w	L131
 290  000e 031a          	dc.w	L131
 291  0010 031a          	dc.w	L131
 292  0012 02e7          	dc.w	L721
 293  0014 02e7          	dc.w	L721
 294  0016 028c          	dc.w	L321
 295  0018 028c          	dc.w	L321
 296  001a 028c          	dc.w	L321
 297  001c 0214          	dc.w	L711
 298  001e 0250          	dc.w	L121
 299                     ; 148 static void iface_display(void)
 299                     ; 149 {
 300                     	switch	.text
 301  010b               L7_iface_display:
 302  010b 5206          	subw	sp,#6
 303       00000006      OFST:	set	6
 305                     ; 156 	switch(i.display_state){
 306  010d b60a          	ld	a,_i+7
 308                     ; 285 		default:
 308                     ; 286 			break;
 309  010f a110          	cp	a,#16
 310  0111 2407          	jruge	L22
 311  0113 5f            	clrw	x
 312  0114 97            	ld	xl,a
 313  0115 58            	sllw	x
 314  0116 de0000        	ldw	x,(L42,x)
 315  0119 fc            	jp	(x)
 316  011a               L22:
 317  011a 4c            	inc	a
 318  011b 2703          	jreq	L62
 319  011d cc033c        	jp	L731
 320  0120               L62:
 321                     ; 157 		case SETUP_NO:
 321                     ; 158 			if (i.minutes != minutesLast){
 322  0120 b60c          	ld	a,_i+9
 323  0122 b101          	cp	a,L311_minutesLast
 324  0124 271e          	jreq	L141
 325                     ; 159 				minutesLast = i.minutes;
 326  0126 450c01        	mov	L311_minutesLast,_i+9
 327                     ; 160 				i.antipoisoningCurrentDigit = i.minutes&0x0F;
 328  0129 b60c          	ld	a,_i+9
 329  012b a40f          	and	a,#15
 330  012d b717          	ld	_i+20,a
 331                     ; 161 				i.antipoisoningOldDigit = i.antipoisoningCurrentDigit;
 332  012f 451716        	mov	_i+19,_i+20
 333                     ; 163 				if (--i.antipoisoningOldDigit  == 0xFF){
 334  0132 3a16          	dec	_i+19
 335  0134 b616          	ld	a,_i+19
 336  0136 a1ff          	cp	a,#255
 337  0138 2604          	jrne	L341
 338                     ; 164 					i.antipoisoningOldDigit = 9;
 339  013a 35090016      	mov	_i+19,#9
 340  013e               L341:
 341                     ; 166 				i.antipoisoningEn = 1; 
 342  013e 35010015      	mov	_i+18,#1
 343                     ; 167 				i.counter150ms = 0;
 344  0142 3f14          	clr	_i+17
 345  0144               L141:
 346                     ; 170 			if (!i.antipoisoningEn) {
 347  0144 3d15          	tnz	_i+18
 348  0146 2703          	jreq	L03
 349  0148 cc033c        	jp	L731
 350  014b               L03:
 351                     ; 171 				iface_disp2bcdDigit(i.minutes, &i.display[0], &i.display[1]);
 352  014b ae0006        	ldw	x,#_i+3
 353  014e 89            	pushw	x
 354  014f ae0005        	ldw	x,#_i+2
 355  0152 89            	pushw	x
 356  0153 b60c          	ld	a,_i+9
 357  0155 cd0397        	call	L31_iface_disp2bcdDigit
 359  0158 5b04          	addw	sp,#4
 360                     ; 172 				iface_disp2bcdDigit(i.hours, &i.display[2], &i.display[3]);
 361  015a ae0008        	ldw	x,#_i+5
 362  015d 89            	pushw	x
 363  015e ae0007        	ldw	x,#_i+4
 364  0161 89            	pushw	x
 365  0162 b60d          	ld	a,_i+10
 366  0164 cd0397        	call	L31_iface_disp2bcdDigit
 368  0167 5b04          	addw	sp,#4
 369                     ; 173 				if (!e.zeroEn){
 370  0169 3d00          	tnz	_e
 371  016b 260a          	jrne	L741
 372                     ; 174 					if ((i.hours&0xF0)==0){
 373  016d b60d          	ld	a,_i+10
 374  016f a5f0          	bcp	a,#240
 375  0171 2604          	jrne	L741
 376                     ; 175 						i.display[3] = NIXIE_OFF;
 377  0173 350a0008      	mov	_i+5,#10
 378  0177               L741:
 379                     ; 178 				displayNixie(&i.display[0],0);
 380  0177 4b00          	push	#0
 381  0179 ae0005        	ldw	x,#_i+2
 382  017c cd0000        	call	_displayNixie
 384  017f 84            	pop	a
 385                     ; 181 				if (i.seconds != secondsLast){
 386  0180 b60b          	ld	a,_i+8
 387  0182 b102          	cp	a,L111_secondsLast
 388  0184 2603          	jrne	L23
 389  0186 cc033c        	jp	L731
 390  0189               L23:
 391                     ; 182 					secondsLast = i.seconds;
 392  0189 450b02        	mov	L111_secondsLast,_i+8
 393                     ; 184 					if (e.nBrightEn){
 394  018c 3d04          	tnz	_e+4
 395  018e 276f          	jreq	L551
 396                     ; 185 						current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
 397  0190 b60c          	ld	a,_i+9
 398  0192 cd03b1        	call	_bcd_to_decimal
 400  0195 97            	ld	xl,a
 401  0196 89            	pushw	x
 402  0197 b60d          	ld	a,_i+10
 403  0199 cd03b1        	call	_bcd_to_decimal
 405  019c 85            	popw	x
 406  019d 95            	ld	xh,a
 407  019e cd03e2        	call	_time_to_minutes
 409  01a1 1f01          	ldw	(OFST-5,sp),x
 410                     ; 186 						start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
 411  01a3 b606          	ld	a,_e+6
 412  01a5 97            	ld	xl,a
 413  01a6 b605          	ld	a,_e+5
 414  01a8 95            	ld	xh,a
 415  01a9 cd03e2        	call	_time_to_minutes
 417  01ac 1f03          	ldw	(OFST-3,sp),x
 418                     ; 187 						end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
 419  01ae b608          	ld	a,_e+8
 420  01b0 97            	ld	xl,a
 421  01b1 b607          	ld	a,_e+7
 422  01b3 95            	ld	xh,a
 423  01b4 cd03e2        	call	_time_to_minutes
 425  01b7 1f05          	ldw	(OFST-1,sp),x
 426                     ; 189 						if (is_time_in_interval(current_minutes, start_minutes, end_minutes)) {
 427  01b9 1e05          	ldw	x,(OFST-1,sp)
 428  01bb 89            	pushw	x
 429  01bc 1e05          	ldw	x,(OFST-1,sp)
 430  01be 89            	pushw	x
 431  01bf 1e05          	ldw	x,(OFST-1,sp)
 432  01c1 cd03f8        	call	_is_time_in_interval
 434  01c4 5b04          	addw	sp,#4
 435  01c6 4d            	tnz	a
 436  01c7 2721          	jreq	L751
 437                     ; 190 							displaySetBright(e.nBright);
 438  01c9 b603          	ld	a,_e+3
 439  01cb cd0000        	call	_displaySetBright
 441                     ; 191 							if (e.rgbGlobalEn){
 442  01ce 3d0b          	tnz	_e+11
 443  01d0 2603          	jrne	L43
 444  01d2 cc033c        	jp	L731
 445  01d5               L43:
 446                     ; 192 								if (e.rgbAtNightEn){
 447  01d5 3d09          	tnz	_e+9
 448  01d7 2709          	jreq	L361
 449                     ; 193 									displayRGBset(1);
 450  01d9 a601          	ld	a,#1
 451  01db cd0000        	call	_displayRGBset
 454  01de ac3c033c      	jpf	L731
 455  01e2               L361:
 456                     ; 195 									displayRGBset(0);
 457  01e2 4f            	clr	a
 458  01e3 cd0000        	call	_displayRGBset
 460  01e6 ac3c033c      	jpf	L731
 461  01ea               L751:
 462                     ; 199 							displaySetBright(e.bright);
 463  01ea b602          	ld	a,_e+2
 464  01ec cd0000        	call	_displaySetBright
 466                     ; 200 							if (e.rgbGlobalEn){
 467  01ef 3d0b          	tnz	_e+11
 468  01f1 2603          	jrne	L63
 469  01f3 cc033c        	jp	L731
 470  01f6               L63:
 471                     ; 201 								displayRGBset(1);
 472  01f6 a601          	ld	a,#1
 473  01f8 cd0000        	call	_displayRGBset
 475  01fb ac3c033c      	jpf	L731
 476  01ff               L551:
 477                     ; 205 						displaySetBright(e.bright);
 478  01ff b602          	ld	a,_e+2
 479  0201 cd0000        	call	_displaySetBright
 481                     ; 206 						if (e.rgbGlobalEn){
 482  0204 3d0b          	tnz	_e+11
 483  0206 2603          	jrne	L04
 484  0208 cc033c        	jp	L731
 485  020b               L04:
 486                     ; 207 							displayRGBset(1);
 487  020b a601          	ld	a,#1
 488  020d cd0000        	call	_displayRGBset
 490  0210 ac3c033c      	jpf	L731
 491  0214               L711:
 492                     ; 214 		case SETUP_HOURS:
 492                     ; 215 			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
 493  0214 ae0006        	ldw	x,#_i+3
 494  0217 89            	pushw	x
 495  0218 ae0005        	ldw	x,#_i+2
 496  021b 89            	pushw	x
 497  021c b60f          	ld	a,_i+12
 498  021e cd0397        	call	L31_iface_disp2bcdDigit
 500  0221 5b04          	addw	sp,#4
 501                     ; 216 			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
 502  0223 ae0008        	ldw	x,#_i+5
 503  0226 89            	pushw	x
 504  0227 ae0007        	ldw	x,#_i+4
 505  022a 89            	pushw	x
 506  022b b610          	ld	a,_i+13
 507  022d cd0397        	call	L31_iface_disp2bcdDigit
 509  0230 5b04          	addw	sp,#4
 510                     ; 217 			if(i.flag05s){
 511  0232 3d12          	tnz	_i+15
 512  0234 2708          	jreq	L771
 513                     ; 218 				i.display[2] = NIXIE_OFF;
 514  0236 350a0007      	mov	_i+4,#10
 515                     ; 219 				i.display[3] = NIXIE_OFF;
 516  023a 350a0008      	mov	_i+5,#10
 517  023e               L771:
 518                     ; 221 			displayNixie(&i.display[0],0);
 519  023e 4b00          	push	#0
 520  0240 ae0005        	ldw	x,#_i+2
 521  0243 cd0000        	call	_displayNixie
 523  0246 84            	pop	a
 524                     ; 222 			displayDot(1);
 525  0247 a601          	ld	a,#1
 526  0249 cd0000        	call	_displayDot
 528                     ; 223 			break;
 529  024c ac3c033c      	jpf	L731
 530  0250               L121:
 531                     ; 225 		case SETUP_MINUTES:
 531                     ; 226 			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
 532  0250 ae0006        	ldw	x,#_i+3
 533  0253 89            	pushw	x
 534  0254 ae0005        	ldw	x,#_i+2
 535  0257 89            	pushw	x
 536  0258 b60f          	ld	a,_i+12
 537  025a cd0397        	call	L31_iface_disp2bcdDigit
 539  025d 5b04          	addw	sp,#4
 540                     ; 227 			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
 541  025f ae0008        	ldw	x,#_i+5
 542  0262 89            	pushw	x
 543  0263 ae0007        	ldw	x,#_i+4
 544  0266 89            	pushw	x
 545  0267 b610          	ld	a,_i+13
 546  0269 cd0397        	call	L31_iface_disp2bcdDigit
 548  026c 5b04          	addw	sp,#4
 549                     ; 228 			if(i.flag05s){
 550  026e 3d12          	tnz	_i+15
 551  0270 2708          	jreq	L102
 552                     ; 229 				i.display[0] = NIXIE_OFF;
 553  0272 350a0005      	mov	_i+2,#10
 554                     ; 230 				i.display[1] = NIXIE_OFF;
 555  0276 350a0006      	mov	_i+3,#10
 556  027a               L102:
 557                     ; 232 			displayNixie(&i.display[0],0);
 558  027a 4b00          	push	#0
 559  027c ae0005        	ldw	x,#_i+2
 560  027f cd0000        	call	_displayNixie
 562  0282 84            	pop	a
 563                     ; 233 			displayDot(1);
 564  0283 a601          	ld	a,#1
 565  0285 cd0000        	call	_displayDot
 567                     ; 234 			break;
 568  0288 ac3c033c      	jpf	L731
 569  028c               L321:
 570                     ; 236 		case SETUP_R:
 570                     ; 237 		case SETUP_G:
 570                     ; 238 		case SETUP_B:
 570                     ; 239 			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
 571  028c ae0007        	ldw	x,#_i+4
 572  028f 89            	pushw	x
 573  0290 ae0006        	ldw	x,#_i+3
 574  0293 89            	pushw	x
 575  0294 ae0005        	ldw	x,#_i+2
 576  0297 89            	pushw	x
 577  0298 b60e          	ld	a,_i+11
 578  029a 5f            	clrw	x
 579  029b 97            	ld	xl,a
 580  029c cd0362        	call	L51_iface_disp3decDigit
 582  029f 5b06          	addw	sp,#6
 583                     ; 240 			if (i.flag100ms){
 584  02a1 3d13          	tnz	_i+16
 585  02a3 2706          	jreq	L302
 586                     ; 241 				i.display[3] = NIXIE_OFF;
 587  02a5 350a0008      	mov	_i+5,#10
 589  02a9 2006          	jra	L502
 590  02ab               L302:
 591                     ; 243 				i.display[3] = i.display_state-11;
 592  02ab b60a          	ld	a,_i+7
 593  02ad a00b          	sub	a,#11
 594  02af b708          	ld	_i+5,a
 595  02b1               L502:
 596                     ; 245 			displayNixie(&i.display[0],0);
 597  02b1 4b00          	push	#0
 598  02b3 ae0005        	ldw	x,#_i+2
 599  02b6 cd0000        	call	_displayNixie
 601  02b9 84            	pop	a
 602                     ; 246 			displayDot(0);
 603  02ba 4f            	clr	a
 604  02bb cd0000        	call	_displayDot
 606                     ; 247 			break;
 607  02be 207c          	jra	L731
 608  02c0               L521:
 609                     ; 249 		case SETUP_BRIGHT:
 609                     ; 250 		case SETUP_NIGHT_BR:
 609                     ; 251 			i.display[3] = i.display_state;
 610  02c0 450a08        	mov	_i+5,_i+7
 611                     ; 252 			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
 612  02c3 ae0007        	ldw	x,#_i+4
 613  02c6 89            	pushw	x
 614  02c7 ae0006        	ldw	x,#_i+3
 615  02ca 89            	pushw	x
 616  02cb ae0005        	ldw	x,#_i+2
 617  02ce 89            	pushw	x
 618  02cf b60e          	ld	a,_i+11
 619  02d1 5f            	clrw	x
 620  02d2 97            	ld	xl,a
 621  02d3 cd0362        	call	L51_iface_disp3decDigit
 623  02d6 5b06          	addw	sp,#6
 624                     ; 253 			displayNixie(&i.display[0],bin(00001000));
 625  02d8 4b08          	push	#8
 626  02da ae0005        	ldw	x,#_i+2
 627  02dd cd0000        	call	_displayNixie
 629  02e0 84            	pop	a
 630                     ; 254 			displayDot(0);
 631  02e1 4f            	clr	a
 632  02e2 cd0000        	call	_displayDot
 634                     ; 255 		break;
 635  02e5 2055          	jra	L731
 636  02e7               L721:
 637                     ; 257 		case SETUP_ZERO:
 637                     ; 258 		case SETUP_F1224:
 637                     ; 259 		case SETUP_NIGHT_BR_EN:
 637                     ; 260 		case SETUP_NIGHT_RGB_EN:
 637                     ; 261 		case SETUP_ANTIPOISONING_AT_NIGHT_ONLY:
 637                     ; 262 			if (i.display_state > 9){
 638  02e7 b60a          	ld	a,_i+7
 639  02e9 a10a          	cp	a,#10
 640  02eb 2510          	jrult	L702
 641                     ; 263 				iface_disp2decDigit(i.display_state,&i.display[2],&i.display[3]);
 642  02ed ae0008        	ldw	x,#_i+5
 643  02f0 89            	pushw	x
 644  02f1 ae0007        	ldw	x,#_i+4
 645  02f4 89            	pushw	x
 646  02f5 b60a          	ld	a,_i+7
 647  02f7 ad46          	call	L11_iface_disp2decDigit
 649  02f9 5b04          	addw	sp,#4
 651  02fb 2007          	jra	L112
 652  02fd               L702:
 653                     ; 265 				i.display[3] = i.display_state;
 654  02fd 450a08        	mov	_i+5,_i+7
 655                     ; 266 				i.display[2] = NIXIE_OFF;	
 656  0300 350a0007      	mov	_i+4,#10
 657  0304               L112:
 658                     ; 268 			i.display[1] = NIXIE_OFF;
 659  0304 350a0006      	mov	_i+3,#10
 660                     ; 269 			i.display[0] = i.setupValue;
 661  0308 450e05        	mov	_i+2,_i+11
 662                     ; 270 			displayNixie(&i.display[0],0);
 663  030b 4b00          	push	#0
 664  030d ae0005        	ldw	x,#_i+2
 665  0310 cd0000        	call	_displayNixie
 667  0313 84            	pop	a
 668                     ; 271 			displayDot(0);
 669  0314 4f            	clr	a
 670  0315 cd0000        	call	_displayDot
 672                     ; 272 			break;
 673  0318 2022          	jra	L731
 674  031a               L131:
 675                     ; 274 		case SETUP_NIGHT_BR_START_H:
 675                     ; 275 		case SETUP_NIGHT_BR_START_M:
 675                     ; 276 		case SETUP_NIGHT_BR_END_H:
 675                     ; 277 		case SETUP_NIGHT_BR_END_M:
 675                     ; 278 			iface_disp2decDigit(i.setupValue, &i.display[0], &i.display[1]);
 676  031a ae0006        	ldw	x,#_i+3
 677  031d 89            	pushw	x
 678  031e ae0005        	ldw	x,#_i+2
 679  0321 89            	pushw	x
 680  0322 b60e          	ld	a,_i+11
 681  0324 ad19          	call	L11_iface_disp2decDigit
 683  0326 5b04          	addw	sp,#4
 684                     ; 279 			i.display[2] = NIXIE_OFF;
 685  0328 350a0007      	mov	_i+4,#10
 686                     ; 280 			i.display[3] = i.display_state;
 687  032c 450a08        	mov	_i+5,_i+7
 688                     ; 281 			displayNixie(&i.display[0],0);
 689  032f 4b00          	push	#0
 690  0331 ae0005        	ldw	x,#_i+2
 691  0334 cd0000        	call	_displayNixie
 693  0337 84            	pop	a
 694                     ; 282 			displayDot(0);
 695  0338 4f            	clr	a
 696  0339 cd0000        	call	_displayDot
 698                     ; 283 			break;
 699  033c               L331:
 700                     ; 285 		default:
 700                     ; 286 			break;
 701  033c               L731:
 702                     ; 290 }
 703  033c 5b06          	addw	sp,#6
 704  033e 81            	ret
 706                     ; 292 static void iface_disp2decDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
 706                     ; 293 {
 707  033f               L11_iface_disp2decDigit:
 708  033f 88            	push	a
 709       00000000      OFST:	set	0
 711                     ; 294 	if (value > 99) {value = 99;}
 712  0340 a164          	cp	a,#100
 713  0342 2504          	jrult	L312
 715  0344 a663          	ld	a,#99
 716  0346 6b01          	ld	(OFST+1,sp),a
 717  0348               L312:
 718                     ; 295 	*d0 = value%10;
 719  0348 7b01          	ld	a,(OFST+1,sp)
 720  034a 5f            	clrw	x
 721  034b 97            	ld	xl,a
 722  034c a60a          	ld	a,#10
 723  034e 62            	div	x,a
 724  034f 5f            	clrw	x
 725  0350 97            	ld	xl,a
 726  0351 9f            	ld	a,xl
 727  0352 1e04          	ldw	x,(OFST+4,sp)
 728  0354 f7            	ld	(x),a
 729                     ; 296 	*d1 = value/10;
 730  0355 7b01          	ld	a,(OFST+1,sp)
 731  0357 5f            	clrw	x
 732  0358 97            	ld	xl,a
 733  0359 a60a          	ld	a,#10
 734  035b 62            	div	x,a
 735  035c 9f            	ld	a,xl
 736  035d 1e06          	ldw	x,(OFST+6,sp)
 737  035f f7            	ld	(x),a
 738                     ; 297 }
 739  0360 84            	pop	a
 740  0361 81            	ret
 742                     ; 299 static void iface_disp3decDigit (uint16_t value, uint8_t *d0, uint8_t *d1, uint8_t *d2)
 742                     ; 300 {
 743  0362               L51_iface_disp3decDigit:
 744  0362 89            	pushw	x
 745       00000000      OFST:	set	0
 747                     ; 301 	if (value > 999) {value = 999;}
 748  0363 a303e8        	cpw	x,#1000
 749  0366 2505          	jrult	L512
 751  0368 ae03e7        	ldw	x,#999
 752  036b 1f01          	ldw	(OFST+1,sp),x
 753  036d               L512:
 754                     ; 302 	*d0 = value%10;
 755  036d 1e01          	ldw	x,(OFST+1,sp)
 756  036f a60a          	ld	a,#10
 757  0371 62            	div	x,a
 758  0372 5f            	clrw	x
 759  0373 97            	ld	xl,a
 760  0374 1605          	ldw	y,(OFST+5,sp)
 761  0376 01            	rrwa	x,a
 762  0377 90f7          	ld	(y),a
 763  0379 02            	rlwa	x,a
 764                     ; 303 	*d1 = (value/10)%10;
 765  037a 1e01          	ldw	x,(OFST+1,sp)
 766  037c a60a          	ld	a,#10
 767  037e 62            	div	x,a
 768  037f a60a          	ld	a,#10
 769  0381 62            	div	x,a
 770  0382 5f            	clrw	x
 771  0383 97            	ld	xl,a
 772  0384 1607          	ldw	y,(OFST+7,sp)
 773  0386 01            	rrwa	x,a
 774  0387 90f7          	ld	(y),a
 775  0389 02            	rlwa	x,a
 776                     ; 304 	*d2 = value/100;
 777  038a 1e01          	ldw	x,(OFST+1,sp)
 778  038c a664          	ld	a,#100
 779  038e 62            	div	x,a
 780  038f 1609          	ldw	y,(OFST+9,sp)
 781  0391 01            	rrwa	x,a
 782  0392 90f7          	ld	(y),a
 783  0394 02            	rlwa	x,a
 784                     ; 305 }
 785  0395 85            	popw	x
 786  0396 81            	ret
 788                     ; 307 static void iface_disp2bcdDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
 788                     ; 308 {
 789  0397               L31_iface_disp2bcdDigit:
 790  0397 88            	push	a
 791       00000000      OFST:	set	0
 793                     ; 309 	if (value > 0x99) {value = 0x99;}
 794  0398 a19a          	cp	a,#154
 795  039a 2504          	jrult	L712
 797  039c a699          	ld	a,#153
 798  039e 6b01          	ld	(OFST+1,sp),a
 799  03a0               L712:
 800                     ; 310 	*d0 = value&0x0F;
 801  03a0 7b01          	ld	a,(OFST+1,sp)
 802  03a2 a40f          	and	a,#15
 803  03a4 1e04          	ldw	x,(OFST+4,sp)
 804  03a6 f7            	ld	(x),a
 805                     ; 311 	*d1 = (value&0xF0)>>4;
 806  03a7 7b01          	ld	a,(OFST+1,sp)
 807  03a9 4e            	swap	a
 808  03aa a40f          	and	a,#15
 809  03ac 1e06          	ldw	x,(OFST+6,sp)
 810  03ae f7            	ld	(x),a
 811                     ; 312 }
 812  03af 84            	pop	a
 813  03b0 81            	ret
 815                     ; 314 uint8_t bcd_to_decimal(uint8_t bcd)
 815                     ; 315 {
 816  03b1               _bcd_to_decimal:
 817  03b1 88            	push	a
 818  03b2 88            	push	a
 819       00000001      OFST:	set	1
 821                     ; 316 	return ((bcd >> 4) * 10) + (bcd & 0x0F);
 822  03b3 a40f          	and	a,#15
 823  03b5 6b01          	ld	(OFST+0,sp),a
 824  03b7 7b02          	ld	a,(OFST+1,sp)
 825  03b9 4e            	swap	a
 826  03ba a40f          	and	a,#15
 827  03bc 97            	ld	xl,a
 828  03bd a60a          	ld	a,#10
 829  03bf 42            	mul	x,a
 830  03c0 9f            	ld	a,xl
 831  03c1 1b01          	add	a,(OFST+0,sp)
 833  03c3 85            	popw	x
 834  03c4 81            	ret
 836                     ; 319 uint8_t decimal_to_bcd(uint8_t decimal) 
 836                     ; 320 {
 837  03c5               _decimal_to_bcd:
 838  03c5 88            	push	a
 839  03c6 88            	push	a
 840       00000001      OFST:	set	1
 842                     ; 321 	return ((decimal / 10) << 4) | (decimal % 10);
 843  03c7 5f            	clrw	x
 844  03c8 97            	ld	xl,a
 845  03c9 a60a          	ld	a,#10
 846  03cb 62            	div	x,a
 847  03cc 5f            	clrw	x
 848  03cd 97            	ld	xl,a
 849  03ce 9f            	ld	a,xl
 850  03cf 6b01          	ld	(OFST+0,sp),a
 851  03d1 7b02          	ld	a,(OFST+1,sp)
 852  03d3 5f            	clrw	x
 853  03d4 97            	ld	xl,a
 854  03d5 a60a          	ld	a,#10
 855  03d7 62            	div	x,a
 856  03d8 9f            	ld	a,xl
 857  03d9 97            	ld	xl,a
 858  03da a610          	ld	a,#16
 859  03dc 42            	mul	x,a
 860  03dd 9f            	ld	a,xl
 861  03de 1a01          	or	a,(OFST+0,sp)
 863  03e0 85            	popw	x
 864  03e1 81            	ret
 866                     ; 324 uint16_t time_to_minutes(uint8_t hours, uint8_t minutes) 
 866                     ; 325 {
 867  03e2               _time_to_minutes:
 868  03e2 89            	pushw	x
 869  03e3 89            	pushw	x
 870       00000002      OFST:	set	2
 872                     ; 326 	return (uint16_t)hours * 60 + (uint16_t)minutes;
 873  03e4 9f            	ld	a,xl
 874  03e5 5f            	clrw	x
 875  03e6 97            	ld	xl,a
 876  03e7 1f01          	ldw	(OFST-1,sp),x
 877  03e9 7b03          	ld	a,(OFST+1,sp)
 878  03eb 5f            	clrw	x
 879  03ec 97            	ld	xl,a
 880  03ed a63c          	ld	a,#60
 881  03ef cd0000        	call	c_bmulx
 883  03f2 72fb01        	addw	x,(OFST-1,sp)
 885  03f5 5b04          	addw	sp,#4
 886  03f7 81            	ret
 888                     ; 329 uint8_t is_time_in_interval(uint16_t current_minutes, uint16_t start_minutes, uint16_t end_minutes) 
 888                     ; 330 {
 889  03f8               _is_time_in_interval:
 890  03f8 89            	pushw	x
 891       00000000      OFST:	set	0
 893                     ; 331 	if (start_minutes <= end_minutes) {
 894  03f9 1e05          	ldw	x,(OFST+5,sp)
 895  03fb 1307          	cpw	x,(OFST+7,sp)
 896  03fd 2213          	jrugt	L122
 897                     ; 333 			return current_minutes >= start_minutes && current_minutes < end_minutes;
 898  03ff 1e01          	ldw	x,(OFST+1,sp)
 899  0401 1305          	cpw	x,(OFST+5,sp)
 900  0403 250a          	jrult	L06
 901  0405 1e01          	ldw	x,(OFST+1,sp)
 902  0407 1307          	cpw	x,(OFST+7,sp)
 903  0409 2404          	jruge	L06
 904  040b a601          	ld	a,#1
 905  040d 2001          	jra	L26
 906  040f               L06:
 907  040f 4f            	clr	a
 908  0410               L26:
 910  0410 2011          	jra	L27
 911  0412               L122:
 912                     ; 336 			return current_minutes >= start_minutes || current_minutes < end_minutes;
 913  0412 1e01          	ldw	x,(OFST+1,sp)
 914  0414 1305          	cpw	x,(OFST+5,sp)
 915  0416 2406          	jruge	L66
 916  0418 1e01          	ldw	x,(OFST+1,sp)
 917  041a 1307          	cpw	x,(OFST+7,sp)
 918  041c 2404          	jruge	L46
 919  041e               L66:
 920  041e a601          	ld	a,#1
 921  0420 2001          	jra	L07
 922  0422               L46:
 923  0422 4f            	clr	a
 924  0423               L07:
 926  0423               L27:
 927  0423 85            	popw	x
 928  0424 81            	ret
 930                     ; 345 void RGBtoggle ( void )
 930                     ; 346 {
 931  0425               _RGBtoggle:
 932  0425 5206          	subw	sp,#6
 933       00000006      OFST:	set	6
 935                     ; 351 	current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
 936  0427 b60c          	ld	a,_i+9
 937  0429 ad86          	call	_bcd_to_decimal
 939  042b 97            	ld	xl,a
 940  042c 89            	pushw	x
 941  042d b60d          	ld	a,_i+10
 942  042f ad80          	call	_bcd_to_decimal
 944  0431 85            	popw	x
 945  0432 95            	ld	xh,a
 946  0433 adad          	call	_time_to_minutes
 948  0435 1f01          	ldw	(OFST-5,sp),x
 949                     ; 352 	start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
 950  0437 b606          	ld	a,_e+6
 951  0439 97            	ld	xl,a
 952  043a b605          	ld	a,_e+5
 953  043c 95            	ld	xh,a
 954  043d ada3          	call	_time_to_minutes
 956  043f 1f03          	ldw	(OFST-3,sp),x
 957                     ; 353 	end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
 958  0441 b608          	ld	a,_e+8
 959  0443 97            	ld	xl,a
 960  0444 b607          	ld	a,_e+7
 961  0446 95            	ld	xh,a
 962  0447 ad99          	call	_time_to_minutes
 964  0449 1f05          	ldw	(OFST-1,sp),x
 965                     ; 355 	if (is_time_in_interval(current_minutes, start_minutes, end_minutes)&&e.nBrightEn) {
 966  044b 1e05          	ldw	x,(OFST-1,sp)
 967  044d 89            	pushw	x
 968  044e 1e05          	ldw	x,(OFST-1,sp)
 969  0450 89            	pushw	x
 970  0451 1e05          	ldw	x,(OFST-1,sp)
 971  0453 ada3          	call	_is_time_in_interval
 973  0455 5b04          	addw	sp,#4
 974  0457 4d            	tnz	a
 975  0458 2721          	jreq	L522
 977  045a 3d04          	tnz	_e+4
 978  045c 271d          	jreq	L522
 979                     ; 356 		if (e.rgbAtNightEn){
 980  045e 3d09          	tnz	_e+9
 981  0460 2704          	jreq	L722
 982                     ; 357 			e.rgbAtNightEn = 0;
 983  0462 3f09          	clr	_e+9
 985  0464 2004          	jra	L132
 986  0466               L722:
 987                     ; 359 			e.rgbAtNightEn = 1;
 988  0466 35010009      	mov	_e+9,#1
 989  046a               L132:
 990                     ; 361 		displayRGBset(e.rgbAtNightEn);
 991  046a b609          	ld	a,_e+9
 992  046c cd0000        	call	_displayRGBset
 994                     ; 362 		EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbGlobalEn);
 995  046f 3b000b        	push	_e+11
 996  0472 ae0009        	ldw	x,#9
 997  0475 cd0000        	call	_EEPROM_writeByte
 999  0478 84            	pop	a
1001  0479 201b          	jra	L332
1002  047b               L522:
1003                     ; 365 		if (e.rgbGlobalEn){
1004  047b 3d0b          	tnz	_e+11
1005  047d 2704          	jreq	L532
1006                     ; 366 			e.rgbGlobalEn = 0;
1007  047f 3f0b          	clr	_e+11
1009  0481 2004          	jra	L732
1010  0483               L532:
1011                     ; 368 			e.rgbGlobalEn = 1;
1012  0483 3501000b      	mov	_e+11,#1
1013  0487               L732:
1014                     ; 370 		displayRGBset(e.rgbGlobalEn);
1015  0487 b60b          	ld	a,_e+11
1016  0489 cd0000        	call	_displayRGBset
1018                     ; 371 		EEPROM_writeByte(RGB_EN_ADDR,e.rgbGlobalEn);
1019  048c 3b000b        	push	_e+11
1020  048f ae000f        	ldw	x,#15
1021  0492 cd0000        	call	_EEPROM_writeByte
1023  0495 84            	pop	a
1024  0496               L332:
1025                     ; 373 }
1026  0496 5b06          	addw	sp,#6
1027  0498 81            	ret
1029                     	switch	.ubsct
1030  0003               _i:
1031  0003 000000000000  	ds.b	21
1032                     	xdef	_i
1033                     	xref	_EEPROM_writeByte
1034                     	xref.b	_e
1035                     	xref	_displayRGBset
1036                     	xref	_displayDotPulse
1037                     	xref	_displayDot
1038                     	xref	_displayNixie
1039                     	xref	_displaySetBright
1040                     	xref	_ds3231_read_time
1041                     	xref	_reset_service_timing_mutex
1042                     	xref	_set_service_timing_mutex
1043                     	xref	_keyevents_counters
1044                     	xref	_keyevents_proc
1045                     	xdef	_RGBtoggle
1046                     	xdef	_is_time_in_interval
1047                     	xdef	_time_to_minutes
1048                     	xdef	_decimal_to_bcd
1049                     	xdef	_bcd_to_decimal
1050                     	xdef	_iface_flag05sReset
1051                     	xdef	_iface_10ms_proc_en
1052                     	xdef	_iface_proc
1053                     	xdef	_iface_init
1054                     	xref.b	c_x
1055                     	xref	c_bmulx
1056                     	end
