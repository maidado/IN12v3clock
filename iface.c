#include <stdint.h>
#include "iface.h"
#include "keyevents.h"
#include "service_timing.h"
#include "ds3231.h"
#include "display.h"
#include "macro.h"
#include "eeprom.h"

Iface i;

static void timer50msProc(void);
static void timer150msProc(void);
static void iface_display(void);
static void iface_disp2decDigit (uint8_t value, uint8_t *d0, uint8_t *d1);
static void iface_disp2bcdDigit (uint8_t value, uint8_t *d0, uint8_t *d1);
static void iface_disp3decDigit (uint16_t value, uint8_t *d0, uint8_t *d1, uint8_t *d2);

void iface_init( void )
{
	i.display_state = SETUP_NO;
	//ds3231_read_time(&i.seconds,&i.minutes,&i.hours);
	
	//i.display_state = SETUP_ZERO;
	//i.setupValue = e.zeroEn;
	//i.timeSetupCounter = 60*10;
	displayRGBset(0);
}

void iface_proc ( void ) 
{
	static uint8_t proc_fase = 0;
	static uint8_t counter50ms = 0;
	static uint8_t counter100ms = 0;
	static uint8_t localFlag100ms = 0;
	
	keyevents_proc();
	
	if (i.flag10ms) {
		set_service_timing_mutex();
		proc_fase++;
		switch(proc_fase){
			case 1: 
				// counter for time get time from ds3231 and start blinking dot if needed
				if (++counter50ms> 5-1){
					counter50ms = 0;
					timer50msProc();
				}
				break;
			
			case 2:
				if (++counter100ms> 10-1){
					counter100ms = 0;
					localFlag100ms = 1;	//flag for pocess 100ms tasks
					
					//counter for blinking digits while time setup
					if (++i.counter1s > 10-1){
						i.counter1s = 0;
						i.flag05s = 0;
					}
					if (i.counter1s > 4){
						i.flag05s = 1;
					}
					
					//counter for blinking digits while RGB setup
					if (i.flag100ms){
						i.flag100ms = 0;
					} else {
						i.flag100ms = 1;
					}
				}
				break;
			
			case 3:
				if (++i.counter150ms > 10-1){
					i.counter150ms = 0;
					timer150msProc();
				}
				break;
			
			case 4:
				if (localFlag100ms){
					keyevents_counters();
				}
				break;
			
			case 5:
				if (localFlag100ms) {
					iface_display();
					localFlag100ms = 0;
				}
				proc_fase = 0;
				i.flag10ms = 0;
				reset_service_timing_mutex();
				break;
			
			default:
				proc_fase = 0;
				i.flag10ms = 0;
				reset_service_timing_mutex();
				break;
		}
	}
}

void iface_flag05sReset(void)
{
	i.counter1s = 0;
	i.flag05s = 0;
}

void iface_10ms_proc_en (void)
{
	i.flag10ms = 1;
}

static void timer50msProc(void)
{
	static uint8_t secondsLast;
	
	if (i.display_state == SETUP_NO){
		ds3231_read_time(&i.seconds,&i.minutes,&i.hours);
		if (i.seconds != secondsLast){
			secondsLast = i.seconds;
			displayDotPulse();
		}
	}
}

static void timer150msProc(void)
{
	if (i.antipoisoningEn) {
		i.antipoisoningOldDigit--;
		if (i.antipoisoningOldDigit == 255){
			i.antipoisoningOldDigit = 9;
		}
		if (i.antipoisoningOldDigit == i.antipoisoningCurrentDigit){
			i.antipoisoningEn = 0;
		}else{
			iface_disp2bcdDigit(i.minutes, &i.display[0], &i.display[1]);
			iface_disp2bcdDigit(i.hours, &i.display[2], &i.display[3]);
			i.display[0] = i.antipoisoningOldDigit;
			displayNixie(&i.display[0],bin(00000001));
		}
	}
}

static void iface_display(void)
{
	static uint8_t secondsLast;
	static uint8_t minutesLast;
	uint16_t current_minutes;
	uint16_t start_minutes;
	uint16_t end_minutes;
	
	switch(i.display_state){
		case SETUP_NO:
			if (i.minutes != minutesLast){
				minutesLast = i.minutes;
				i.antipoisoningCurrentDigit = i.minutes&0x0F;
				i.antipoisoningOldDigit = i.antipoisoningCurrentDigit;
				
				if (--i.antipoisoningOldDigit  == 0xFF){
					i.antipoisoningOldDigit = 9;
				}
				i.antipoisoningEn = 1; 
				i.counter150ms = 0;
			}
			
			if (!i.antipoisoningEn) {
				iface_disp2bcdDigit(i.minutes, &i.display[0], &i.display[1]);
				iface_disp2bcdDigit(i.hours, &i.display[2], &i.display[3]);
				if (!e.zeroEn){
					if ((i.hours&0xF0)==0){
						i.display[3] = NIXIE_OFF;
					}
				}
				displayNixie(&i.display[0],0);
			
			
				if (i.seconds != secondsLast){
					secondsLast = i.seconds;
					
					if (e.nBrightEn){
						current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
						start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
						end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
						
						if (is_time_in_interval(current_minutes, start_minutes, end_minutes)) {
							displaySetBright(e.nBright);
							if (e.rgbGlobalEn){
								if (e.rgbAtNightEn){
									displayRGBset(1);
								}else{
									displayRGBset(0);
								}
							}
						} else {
							displaySetBright(e.bright);
							if (e.rgbGlobalEn){
								displayRGBset(1);
							}
						}
					} else {
						displaySetBright(e.bright);
						if (e.rgbGlobalEn){
							displayRGBset(1);
						}
					}
				}
			}
			break;
		
		case SETUP_HOURS:
			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
			if(i.flag05s){
				i.display[2] = NIXIE_OFF;
				i.display[3] = NIXIE_OFF;
			}
			displayNixie(&i.display[0],0);
			displayDot(1);
			break;
		
		case SETUP_MINUTES:
			iface_disp2bcdDigit(i.minutesSetupValue, &i.display[0], &i.display[1]);
			iface_disp2bcdDigit(i.hoursSetupValue, &i.display[2], &i.display[3]);
			if(i.flag05s){
				i.display[0] = NIXIE_OFF;
				i.display[1] = NIXIE_OFF;
			}
			displayNixie(&i.display[0],0);
			displayDot(1);
			break;
		
		case SETUP_R:
		case SETUP_G:
		case SETUP_B:
			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
			if (i.flag100ms){
				i.display[3] = NIXIE_OFF;
			}else{
				i.display[3] = i.display_state-11;
			}
			displayNixie(&i.display[0],0);
			displayDot(0);
			break;
		
		case SETUP_BRIGHT:
		case SETUP_NIGHT_BR:
			i.display[3] = i.display_state;
			iface_disp3decDigit (i.setupValue, &i.display[0], &i.display[1], &i.display[2]);
			displayNixie(&i.display[0],bin(00001000));
			displayDot(0);
		break;
		
		case SETUP_ZERO:
		case SETUP_F1224:
		case SETUP_NIGHT_BR_EN:
		case SETUP_NIGHT_RGB_EN:
		case SETUP_ANTIPOISONING_AT_NIGHT_ONLY:
			if (i.display_state > 9){
				iface_disp2decDigit(i.display_state,&i.display[2],&i.display[3]);
			}else{
				i.display[3] = i.display_state;
				i.display[2] = NIXIE_OFF;	
			}
			i.display[1] = NIXIE_OFF;
			i.display[0] = i.setupValue;
			displayNixie(&i.display[0],0);
			displayDot(0);
			break;
		
		case SETUP_NIGHT_BR_START_H:
		case SETUP_NIGHT_BR_START_M:
		case SETUP_NIGHT_BR_END_H:
		case SETUP_NIGHT_BR_END_M:
			iface_disp2decDigit(i.setupValue, &i.display[0], &i.display[1]);
			i.display[2] = NIXIE_OFF;
			i.display[3] = i.display_state;
			displayNixie(&i.display[0],0);
			displayDot(0);
			break;
		
		default:
			break;
	}
	
	
}

static void iface_disp2decDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
{
	if (value > 99) {value = 99;}
	*d0 = value%10;
	*d1 = value/10;
}

static void iface_disp3decDigit (uint16_t value, uint8_t *d0, uint8_t *d1, uint8_t *d2)
{
	if (value > 999) {value = 999;}
	*d0 = value%10;
	*d1 = (value/10)%10;
	*d2 = value/100;
}

static void iface_disp2bcdDigit (uint8_t value, uint8_t *d0, uint8_t *d1)
{
	if (value > 0x99) {value = 0x99;}
	*d0 = value&0x0F;
	*d1 = (value&0xF0)>>4;
}

uint8_t bcd_to_decimal(uint8_t bcd)
{
	return ((bcd >> 4) * 10) + (bcd & 0x0F);
}

uint8_t decimal_to_bcd(uint8_t decimal) 
{
	return ((decimal / 10) << 4) | (decimal % 10);
}

uint16_t time_to_minutes(uint8_t hours, uint8_t minutes) 
{
	return (uint16_t)hours * 60 + (uint16_t)minutes;
}

uint8_t is_time_in_interval(uint16_t current_minutes, uint16_t start_minutes, uint16_t end_minutes) 
{
	if (start_minutes <= end_minutes) {
			// Interval without crossing midnight
			return current_minutes >= start_minutes && current_minutes < end_minutes;
	} else {
			// Interval with crossing midnight
			return current_minutes >= start_minutes || current_minutes < end_minutes;
	}
}

/*
switch state of rgb
if time is in night interval - control nigt rgb enable flag
if time in in normal interval - control global rgb enable flag
*/
void RGBtoggle ( void )
{
	uint16_t current_minutes;
	uint16_t start_minutes;
	uint16_t end_minutes;
	
	current_minutes = time_to_minutes(bcd_to_decimal(i.hours), bcd_to_decimal(i.minutes));
	start_minutes 	=	time_to_minutes(e.nBrightStartH, e.nBrightStartM);
	end_minutes 		= time_to_minutes(e.nBrightEndH, e.nBrightEndM);
		
	if (is_time_in_interval(current_minutes, start_minutes, end_minutes)&&e.nBrightEn) {
		if (e.rgbAtNightEn){
			e.rgbAtNightEn = 0;
		} else {
			e.rgbAtNightEn = 1;
		}
		displayRGBset(e.rgbAtNightEn);
		EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbGlobalEn);
	} 
	else {
		if (e.rgbGlobalEn){
			e.rgbGlobalEn = 0;
		} else {
			e.rgbGlobalEn = 1;
		}
		displayRGBset(e.rgbGlobalEn);
		EEPROM_writeByte(RGB_EN_ADDR,e.rgbGlobalEn);
	}
}