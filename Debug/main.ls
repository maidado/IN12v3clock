   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  50                     ; 32 int main(void) {
  52                     	switch	.text
  53  0000               _main:
  57                     ; 34   DISABLE_INTERRUPTS();
  60  0000 9b            sim
  62                     ; 36   sfr_CLK.CKDIVR.byte = 0x00;
  64  0001 725f50c6      	clr	20678
  65                     ; 38 	displayInit();
  67  0005 cd0000        	call	_displayInit
  69                     ; 39 	ds3231Init();
  71  0008 cd0000        	call	_ds3231Init
  73                     ; 40 	keyboard_init();
  75  000b cd0000        	call	_keyboard_init
  77                     ; 41 	iface_init();
  79  000e cd0000        	call	_iface_init
  81                     ; 42 	service_timing_init();
  83  0011 cd0000        	call	_service_timing_init
  85                     ; 45   ENABLE_INTERRUPTS(); 
  88  0014 9a            rim
  90  0015               L12:
  91                     ; 49 		service_timing_10ms_proc();
  93  0015 cd0000        	call	_service_timing_10ms_proc
  95                     ; 50 		iface_proc(); 
  97  0018 cd0000        	call	_iface_proc
 100  001b 20f8          	jra	L12
 113                     	xdef	_main
 114                     	xref	_iface_proc
 115                     	xref	_iface_init
 116                     	xref	_keyboard_init
 117                     	xref	_service_timing_10ms_proc
 118                     	xref	_service_timing_init
 119                     	xref	_ds3231Init
 120                     	xref	_displayInit
 139                     	end
