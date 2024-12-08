   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  44                     ; 7 void iface_init( void )
  44                     ; 8 {
  46                     	switch	.text
  47  0000               _iface_init:
  51                     ; 9 	i.display_state = DISP_TIME;
  53  0000 3f05          	clr	_i+5
  54                     ; 10 }
  57  0002 81            	ret
  83                     ; 12 void iface_proc ( void ) 
  83                     ; 13 {
  84                     	switch	.text
  85  0003               _iface_proc:
  89                     ; 14 	keyevents_proc();
  91  0003 cd0000        	call	_keyevents_proc
  93                     ; 16 	if (i.flag10ms) {
  95  0006 3d04          	tnz	_i+4
  96  0008 2705          	jreq	L13
  97                     ; 17 		i.flag10ms = 0;
  99  000a 3f04          	clr	_i+4
 100                     ; 19 		keyevents_counters();
 102  000c cd0000        	call	_keyevents_counters
 104  000f               L13:
 105                     ; 21 }
 108  000f 81            	ret
 132                     ; 23 void iface_10ms_proc_en (void)
 132                     ; 24 {
 133                     	switch	.text
 134  0010               _iface_10ms_proc_en:
 138                     ; 25 	i.flag10ms = 1;
 140  0010 35010004      	mov	_i+4,#1
 141                     ; 26 }
 144  0014 81            	ret
 200                     	switch	.ubsct
 201  0000               _i:
 202  0000 000000000000  	ds.b	6
 203                     	xdef	_i
 204                     	xref	_keyevents_counters
 205                     	xref	_keyevents_proc
 206                     	xdef	_iface_10ms_proc_en
 207                     	xdef	_iface_proc
 208                     	xdef	_iface_init
 228                     	end
