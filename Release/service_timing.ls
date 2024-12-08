   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     	bsct
  16  0000               L3_mutex:
  17  0000 00            	dc.b	0
  18                     ; 15 void service_timing_init (void)
  18                     ; 16 {
  19                     	scross	off
  20                     	switch	.text
  21  0000               _service_timing_init:
  23                     ; 18 }
  24  0000 81            	ret
  26                     ; 20 void set_service_timing_mutex (void)
  26                     ; 21 {
  27  0001               _set_service_timing_mutex:
  29                     ; 22 	mutex = 1;
  30  0001 35010000      	mov	L3_mutex,#1
  31                     ; 23 }
  32  0005 81            	ret
  34                     ; 25 void reset_service_timing_mutex (void)
  34                     ; 26 {
  35  0006               _reset_service_timing_mutex:
  37                     ; 27 	mutex = 0;
  38  0006 3f00          	clr	L3_mutex
  39                     ; 28 }
  40  0008 81            	ret
  42                     	bsct
  43  0001               L7_quere10ms:
  44  0001 00            	dc.b	0
  45                     ; 30 void service_timing_10ms_proc (void) 
  45                     ; 31 {
  46                     	switch	.text
  47  0009               _service_timing_10ms_proc:
  49                     ; 34 	if (flag10ms){
  50  0009 3d00          	tnz	_flag10ms
  51  000b 2727          	jreq	L12
  52                     ; 35 		if(!mutex){
  53  000d 3d00          	tnz	L3_mutex
  54  000f 2623          	jrne	L12
  55                     ; 36 			quere10ms++;
  56  0011 3c01          	inc	L7_quere10ms
  57                     ; 38 			switch(quere10ms){
  58  0013 b601          	ld	a,L7_quere10ms
  60                     ; 49 				break;
  61  0015 4a            	dec	a
  62  0016 270c          	jreq	L11
  63  0018 4a            	dec	a
  64  0019 270e          	jreq	L31
  65  001b 4a            	dec	a
  66  001c 2710          	jreq	L51
  67  001e               L71:
  68                     ; 46 				default:
  68                     ; 47 					flag10ms = 0;
  69  001e 3f00          	clr	_flag10ms
  70                     ; 48 					quere10ms = 0;
  71  0020 3f01          	clr	L7_quere10ms
  72                     ; 49 				break;
  73  0022 2010          	jra	L12
  74  0024               L11:
  75                     ; 39 				case 1:	displayDotPulseProc(); 	break;
  76  0024 cd0000        	call	_displayDotPulseProc
  79  0027 200b          	jra	L12
  80  0029               L31:
  81                     ; 40 				case 2: iface_10ms_proc_en();		break;
  82  0029 cd0000        	call	_iface_10ms_proc_en
  85  002c 2006          	jra	L12
  86  002e               L51:
  87                     ; 41 				case 3: timer20msProc(); 
  88  002e ad05          	call	L5_timer20msProc
  90                     ; 42 					flag10ms = 0;
  91  0030 3f00          	clr	_flag10ms
  92                     ; 43 					quere10ms = 0;
  93  0032 3f01          	clr	L7_quere10ms
  94                     ; 44 					break;
  95  0034               L72:
  96  0034               L12:
  97                     ; 53 }
  98  0034 81            	ret
 100                     	switch	.ubsct
 101  0000               L13_counter20ms:
 102  0000 00            	ds.b	1
 103                     ; 55 static void timer20msProc(void)
 103                     ; 56 {
 104                     	switch	.text
 105  0035               L5_timer20msProc:
 107                     ; 58 	if (++counter20ms > (2-1)){
 108  0035 3c00          	inc	L13_counter20ms
 109  0037 b600          	ld	a,L13_counter20ms
 110  0039 a102          	cp	a,#2
 111  003b 2505          	jrult	L33
 112                     ; 59 		counter20ms = 0;
 113  003d 3f00          	clr	L13_counter20ms
 114                     ; 61 		keyboard_refresh();
 115  003f cd0000        	call	_keyboard_refresh
 117  0042               L33:
 118                     ; 63 }
 119  0042 81            	ret
 121                     	xref.b	_flag10ms
 122                     	xref	_iface_10ms_proc_en
 123                     	xref	_keyboard_refresh
 124                     	xref	_displayDotPulseProc
 125                     	xdef	_reset_service_timing_mutex
 126                     	xdef	_set_service_timing_mutex
 127                     	xdef	_service_timing_10ms_proc
 128                     	xdef	_service_timing_init
 129                     	end
