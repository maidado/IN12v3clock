   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  44                     ; 15 void service_timing_init (void)
  44                     ; 16 {
  46                     	switch	.text
  47  0000               _service_timing_init:
  51                     ; 18 }
  54  0000 81            	ret
  57                     	bsct
  58  0000               L52_quere10ms:
  59  0000 00            	dc.b	0
  96                     ; 21 void service_timing_10ms_proc (void) 
  96                     ; 22 {
  97                     	switch	.text
  98  0001               _service_timing_10ms_proc:
 102                     ; 25 	if (flag10ms){
 104  0001 3d00          	tnz	_flag10ms
 105  0003 2723          	jreq	L55
 106                     ; 26 		quere10ms++;
 108  0005 3c00          	inc	L52_quere10ms
 109                     ; 28 		switch(quere10ms){
 111  0007 b600          	ld	a,L52_quere10ms
 113                     ; 39 			break;
 114  0009 4a            	dec	a
 115  000a 270c          	jreq	L72
 116  000c 4a            	dec	a
 117  000d 270e          	jreq	L13
 118  000f 4a            	dec	a
 119  0010 2710          	jreq	L33
 120  0012               L53:
 121                     ; 36 			default:
 121                     ; 37 				flag10ms = 0;
 123  0012 3f00          	clr	_flag10ms
 124                     ; 38 				quere10ms = 0;
 126  0014 3f00          	clr	L52_quere10ms
 127                     ; 39 			break;
 129  0016 2010          	jra	L55
 130  0018               L72:
 131                     ; 29 			case 1:	displayDotPulseProc(); 	break;
 133  0018 cd0000        	call	_displayDotPulseProc
 137  001b 200b          	jra	L55
 138  001d               L13:
 139                     ; 30 			case 2: iface_10ms_proc_en();		break;
 141  001d cd0000        	call	_iface_10ms_proc_en
 145  0020 2006          	jra	L55
 146  0022               L33:
 147                     ; 31 			case 3: timer20msProc(); 
 149  0022 ad05          	call	L3_timer20msProc
 151                     ; 32 				flag10ms = 0;
 153  0024 3f00          	clr	_flag10ms
 154                     ; 33 				quere10ms = 0;
 156  0026 3f00          	clr	L52_quere10ms
 157                     ; 34 				break;
 159  0028               L16:
 160  0028               L55:
 161                     ; 43 }
 164  0028 81            	ret
 167                     	switch	.ubsct
 168  0000               L36_counter20ms:
 169  0000 00            	ds.b	1
 202                     ; 45 static void timer20msProc(void)
 202                     ; 46 {
 203                     	switch	.text
 204  0029               L3_timer20msProc:
 208                     ; 48 	if (++counter20ms > (2-1)){
 210  0029 3c00          	inc	L36_counter20ms
 211  002b b600          	ld	a,L36_counter20ms
 212  002d a102          	cp	a,#2
 213  002f 2505          	jrult	L301
 214                     ; 49 		counter20ms = 0;
 216  0031 3f00          	clr	L36_counter20ms
 217                     ; 51 		keyboard_refresh();
 219  0033 cd0000        	call	_keyboard_refresh
 221  0036               L301:
 222                     ; 53 }
 225  0036 81            	ret
 228                     	switch	.ubsct
 229  0001               L701_secondsLast:
 230  0001 00            	ds.b	1
 231  0002               L501_counter50ms:
 232  0002 00            	ds.b	1
 313                     ; 55 static void timer50msProc(void)
 313                     ; 56 {
 314                     	switch	.text
 315  0037               L5_timer50msProc:
 317  0037 5207          	subw	sp,#7
 318       00000007      OFST:	set	7
 321                     ; 62 	if (++counter50ms>(5-1)){
 323  0039 3c02          	inc	L501_counter50ms
 324  003b b602          	ld	a,L501_counter50ms
 325  003d a105          	cp	a,#5
 326  003f 2545          	jrult	L351
 327                     ; 63 		counter50ms = 0;
 329  0041 3f02          	clr	L501_counter50ms
 330                     ; 65 		ds3231_read_time(&seconds,&minutes,&hours);
 332  0043 96            	ldw	x,sp
 333  0044 1c0003        	addw	x,#OFST-4
 334  0047 89            	pushw	x
 335  0048 96            	ldw	x,sp
 336  0049 1c0004        	addw	x,#OFST-3
 337  004c 89            	pushw	x
 338  004d 96            	ldw	x,sp
 339  004e 1c0005        	addw	x,#OFST-2
 340  0051 cd0000        	call	_ds3231_read_time
 342  0054 5b04          	addw	sp,#4
 343                     ; 66 		if (seconds != secondsLast){
 345  0056 7b01          	ld	a,(OFST-6,sp)
 346  0058 b101          	cp	a,L701_secondsLast
 347  005a 2707          	jreq	L551
 348                     ; 67 			secondsLast = seconds;
 350  005c 7b01          	ld	a,(OFST-6,sp)
 351  005e b701          	ld	L701_secondsLast,a
 352                     ; 68 			displayDotPulse();
 354  0060 cd0000        	call	_displayDotPulse
 356  0063               L551:
 357                     ; 70 		d[0] = minutes&0x0F;
 359  0063 7b02          	ld	a,(OFST-5,sp)
 360  0065 a40f          	and	a,#15
 361  0067 6b04          	ld	(OFST-3,sp),a
 363                     ; 71 		d[1] = (minutes&0xF0)>>4;
 365  0069 7b02          	ld	a,(OFST-5,sp)
 366  006b 4e            	swap	a
 367  006c a40f          	and	a,#15
 368  006e 6b05          	ld	(OFST-2,sp),a
 370                     ; 72 		d[2] = hours&0x0F;
 372  0070 7b03          	ld	a,(OFST-4,sp)
 373  0072 a40f          	and	a,#15
 374  0074 6b06          	ld	(OFST-1,sp),a
 376                     ; 73 		d[3] = (hours&bin(00110000))>>4;
 378  0076 7b03          	ld	a,(OFST-4,sp)
 379  0078 4e            	swap	a
 380  0079 a40f          	and	a,#15
 381  007b a403          	and	a,#3
 382  007d 6b07          	ld	(OFST+0,sp),a
 384                     ; 74 		displayNixie(d);
 386  007f 96            	ldw	x,sp
 387  0080 1c0004        	addw	x,#OFST-3
 388  0083 cd0000        	call	_displayNixie
 390  0086               L351:
 391                     ; 76 }
 394  0086 5b07          	addw	sp,#7
 395  0088 81            	ret
 408                     	xref.b	_flag10ms
 409                     	xref	_iface_10ms_proc_en
 410                     	xref	_keyboard_refresh
 411                     	xref	_ds3231_read_time
 412                     	xref	_displayDotPulseProc
 413                     	xref	_displayDotPulse
 414                     	xref	_displayNixie
 415                     	xdef	_service_timing_10ms_proc
 416                     	xdef	_service_timing_init
 435                     	end
