   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 118 int main(void) {
  16                     	scross	off
  17  0000               _main:
  19                     ; 120   DISABLE_INTERRUPTS();
  21  0000 9b            sim
  23                     ; 122   sfr_CLK.CKDIVR.byte = 0x00;
  24  0001 725f50c6      	clr	20678
  25                     ; 124 	EEPROM_dataInit();
  26  0005 cd0000        	call	_EEPROM_dataInit
  28                     ; 125 	displayInit();
  29  0008 cd0000        	call	_displayInit
  31                     ; 126 	ds3231Init();
  32  000b cd0000        	call	_ds3231Init
  34                     ; 127 	keyboard_init();
  35  000e cd0000        	call	_keyboard_init
  37                     ; 128 	iface_init();
  38  0011 cd0000        	call	_iface_init
  40                     ; 129 	service_timing_init();
  41  0014 cd0000        	call	_service_timing_init
  43                     ; 131   ENABLE_INTERRUPTS(); 
  45  0017 9a            rim
  47  0018               L3:
  48                     ; 135 		service_timing_10ms_proc();
  49  0018 cd0000        	call	_service_timing_10ms_proc
  51                     ; 136 		iface_proc(); 
  52  001b cd0000        	call	_iface_proc
  55  001e 20f8          	jra	L3
  57                     	xdef	_main
  58                     	xref	_EEPROM_dataInit
  59                     	xref	_iface_proc
  60                     	xref	_iface_init
  61                     	xref	_keyboard_init
  62                     	xref	_service_timing_10ms_proc
  63                     	xref	_service_timing_init
  64                     	xref	_ds3231Init
  65                     	xref	_displayInit
  66                     	end
