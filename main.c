#include "STM8S003F3.h"
#include "display.h"
#include "ds3231.h"
#include "macro.h"
#include "service_timing.h"
#include "keyboard.h"
#include "iface.h"
#include "eeprom.h"

/* 
 ������ ������ ������ �������
 ������ ������ ��������/��������� RGB ���������
 
 todo �������� 12/24 ���� �� ������� ��� ����� �������
 todo ������� ����� �� ���� �� ��������� ������ 2
 todo ��� ������ �� ���� ���������� RGB, ���������.
 todo ���� ����� ����� �������� ������� ��� ����� �����������
*/

int main(void) {
	
  DISABLE_INTERRUPTS();
	// switch to 16MHz (default is 2MHz)
  sfr_CLK.CKDIVR.byte = 0x00;
	
	EEPROM_dataInit();
	displayInit();
	ds3231Init();
	keyboard_init();
	iface_init();
	service_timing_init();

  ENABLE_INTERRUPTS(); 

	
	while (1) {
		service_timing_10ms_proc();
		iface_proc(); 
	}
}
