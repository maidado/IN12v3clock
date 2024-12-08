   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 5 void ds3231Init(void)
  15                     ; 6 {
  16                     	scross	off
  17  0000               _ds3231Init:
  19                     ; 7 	i2c_init();
  20  0000 cd0000        	call	_i2c_init
  22                     ; 9 }
  23  0003 81            	ret
  25                     ; 11 void ds3231_read_time(uint8_t *seconds, uint8_t *minutes, uint8_t *hours)
  25                     ; 12 {
  26  0004               _ds3231_read_time:
  27  0004 89            	pushw	x
  28       00000000      OFST:	set	0
  30                     ; 13 	if (i2c_busy_check() == OK){
  31  0005 cd0000        	call	_i2c_busy_check
  33  0008 a101          	cp	a,#1
  34  000a 2656          	jrne	L3
  35                     ; 14 		i2c_start();
  36  000c cd0000        	call	_i2c_start
  38                     ; 15 		i2c_shift(DS3231_ADDRESS);
  39  000f a6d0          	ld	a,#208
  40  0011 cd0000        	call	_i2c_shift
  42                     ; 16 		if (i2c_ack(READ_ANSWER)==ACK)
  43  0014 a601          	ld	a,#1
  44  0016 cd0000        	call	_i2c_ack
  46  0019 4d            	tnz	a
  47  001a 264b          	jrne	L31
  48                     ; 18 			i2c_shift(SECONDS_ADDR);
  49  001c 4f            	clr	a
  50  001d cd0000        	call	_i2c_shift
  52                     ; 19 			if (i2c_ack(READ_ANSWER)==ACK)
  53  0020 a601          	ld	a,#1
  54  0022 cd0000        	call	_i2c_ack
  56  0025 4d            	tnz	a
  57  0026 263f          	jrne	L31
  58                     ; 21 				i2c_start();
  59  0028 cd0000        	call	_i2c_start
  61                     ; 22 				i2c_shift(DS3231_ADDRESS | 0x01);
  62  002b a6d1          	ld	a,#209
  63  002d cd0000        	call	_i2c_shift
  65                     ; 23 				if (i2c_ack(READ_ANSWER)==ACK)
  66  0030 a601          	ld	a,#1
  67  0032 cd0000        	call	_i2c_ack
  69  0035 4d            	tnz	a
  70  0036 262f          	jrne	L31
  71                     ; 25 					*seconds = i2c_shift(0xFF); i2c_ack(SET_ACK);
  72  0038 a6ff          	ld	a,#255
  73  003a cd0000        	call	_i2c_shift
  75  003d 1e01          	ldw	x,(OFST+1,sp)
  76  003f f7            	ld	(x),a
  78  0040 4f            	clr	a
  79  0041 cd0000        	call	_i2c_ack
  81                     ; 26 					*minutes = i2c_shift(0xFF); i2c_ack(SET_ACK);
  82  0044 a6ff          	ld	a,#255
  83  0046 cd0000        	call	_i2c_shift
  85  0049 1e05          	ldw	x,(OFST+5,sp)
  86  004b f7            	ld	(x),a
  88  004c 4f            	clr	a
  89  004d cd0000        	call	_i2c_ack
  91                     ; 27 					*hours = i2c_shift(0xFF); 	i2c_ack(SET_NAK);
  92  0050 a6ff          	ld	a,#255
  93  0052 cd0000        	call	_i2c_shift
  95  0055 1e07          	ldw	x,(OFST+7,sp)
  96  0057 f7            	ld	(x),a
  98  0058 a601          	ld	a,#1
  99  005a cd0000        	call	_i2c_ack
 101                     ; 28 					i2c_stop();
 102  005d cd0000        	call	_i2c_stop
 104                     ; 29 					return;
 105  0060 2003          	jra	L6
 106  0062               L3:
 107                     ; 34 		i2c_slave_unlock();
 108  0062 cd0000        	call	_i2c_slave_unlock
 110                     ; 35 		return;
 111  0065               L6:
 112  0065 85            	popw	x
 113  0066 81            	ret
 114  0067               L31:
 115                     ; 37 	i2c_stop();
 116  0067 cd0000        	call	_i2c_stop
 118                     ; 38 }
 119  006a 20f9          	jra	L6
 121                     ; 40 void ds3231_write_time(uint8_t *seconds, uint8_t *minutes, uint8_t *hours)
 121                     ; 41 {
 122  006c               _ds3231_write_time:
 123  006c 89            	pushw	x
 124       00000000      OFST:	set	0
 126                     ; 42 	if (i2c_busy_check() == OK){
 127  006d cd0000        	call	_i2c_busy_check
 129  0070 a101          	cp	a,#1
 130  0072 264b          	jrne	L51
 131                     ; 43 		i2c_start();
 132  0074 cd0000        	call	_i2c_start
 134                     ; 44 		i2c_shift(DS3231_ADDRESS);
 135  0077 a6d0          	ld	a,#208
 136  0079 cd0000        	call	_i2c_shift
 138                     ; 45 		if (i2c_ack(READ_ANSWER)==ACK)
 139  007c a601          	ld	a,#1
 140  007e cd0000        	call	_i2c_ack
 142  0081 4d            	tnz	a
 143  0082 2640          	jrne	L13
 144                     ; 47 			i2c_shift(SECONDS_ADDR);
 145  0084 4f            	clr	a
 146  0085 cd0000        	call	_i2c_shift
 148                     ; 48 			if (i2c_ack(READ_ANSWER)==ACK)
 149  0088 a601          	ld	a,#1
 150  008a cd0000        	call	_i2c_ack
 152  008d 4d            	tnz	a
 153  008e 2634          	jrne	L13
 154                     ; 50 				i2c_shift(*seconds); 
 155  0090 1e01          	ldw	x,(OFST+1,sp)
 156  0092 f6            	ld	a,(x)
 157  0093 cd0000        	call	_i2c_shift
 159                     ; 51 				if (i2c_ack(READ_ANSWER)==ACK)
 160  0096 a601          	ld	a,#1
 161  0098 cd0000        	call	_i2c_ack
 163  009b 4d            	tnz	a
 164  009c 2626          	jrne	L13
 165                     ; 53 					i2c_shift(*minutes); 
 166  009e 1e05          	ldw	x,(OFST+5,sp)
 167  00a0 f6            	ld	a,(x)
 168  00a1 cd0000        	call	_i2c_shift
 170                     ; 54 					if (i2c_ack(READ_ANSWER)==ACK)
 171  00a4 a601          	ld	a,#1
 172  00a6 cd0000        	call	_i2c_ack
 174  00a9 4d            	tnz	a
 175  00aa 2618          	jrne	L13
 176                     ; 56 						i2c_shift(*hours); 
 177  00ac 1e07          	ldw	x,(OFST+7,sp)
 178  00ae f6            	ld	a,(x)
 179  00af cd0000        	call	_i2c_shift
 181                     ; 57 						if (i2c_ack(READ_ANSWER)==ACK)
 182  00b2 a601          	ld	a,#1
 183  00b4 cd0000        	call	_i2c_ack
 185  00b7 4d            	tnz	a
 186  00b8 260a          	jrne	L13
 187                     ; 59 							i2c_stop();
 188  00ba cd0000        	call	_i2c_stop
 190                     ; 60 							return;
 191  00bd 2003          	jra	L21
 192  00bf               L51:
 193                     ; 67 		i2c_slave_unlock();
 194  00bf cd0000        	call	_i2c_slave_unlock
 196                     ; 68 		return;
 197  00c2               L21:
 198  00c2 85            	popw	x
 199  00c3 81            	ret
 200  00c4               L13:
 201                     ; 70 	i2c_stop();
 202  00c4 cd0000        	call	_i2c_stop
 204                     ; 71 }
 205  00c7 20f9          	jra	L21
 207                     	xref	_i2c_stop
 208                     	xref	_i2c_start
 209                     	xref	_i2c_ack
 210                     	xref	_i2c_shift
 211                     	xref	_i2c_slave_unlock
 212                     	xref	_i2c_busy_check
 213                     	xref	_i2c_init
 214                     	xdef	_ds3231_write_time
 215                     	xdef	_ds3231_read_time
 216                     	xdef	_ds3231Init
 217                     	end
