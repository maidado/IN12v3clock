   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  44                     ; 5 void ds3231Init(void)
  44                     ; 6 {
  46                     	switch	.text
  47  0000               _ds3231Init:
  51                     ; 7 	i2c_init();
  53  0000 cd0000        	call	_i2c_init
  55                     ; 8 }
  58  0003 81            	ret
 119                     ; 10 void ds3231_read_time(uint8_t *seconds, uint8_t *minutes, uint8_t *hours)
 119                     ; 11 {
 120                     	switch	.text
 121  0004               _ds3231_read_time:
 123  0004 89            	pushw	x
 124       00000000      OFST:	set	0
 127                     ; 12 	if (i2c_busy_check() == OK){
 129  0005 cd0000        	call	_i2c_busy_check
 131  0008 a101          	cp	a,#1
 132  000a 2656          	jrne	L74
 133                     ; 13 		i2c_start();
 135  000c cd0000        	call	_i2c_start
 137                     ; 14 		i2c_shift(DS3231_ADDRESS);
 139  000f a6d0          	ld	a,#208
 140  0011 cd0000        	call	_i2c_shift
 142                     ; 15 		if (i2c_ack(READ_ANSWER)==ACK)
 144  0014 a601          	ld	a,#1
 145  0016 cd0000        	call	_i2c_ack
 147  0019 4d            	tnz	a
 148  001a 264b          	jrne	L75
 149                     ; 17 			i2c_shift(SECONDS_ADDR);
 151  001c 4f            	clr	a
 152  001d cd0000        	call	_i2c_shift
 154                     ; 18 			if (i2c_ack(READ_ANSWER)==ACK)
 156  0020 a601          	ld	a,#1
 157  0022 cd0000        	call	_i2c_ack
 159  0025 4d            	tnz	a
 160  0026 263f          	jrne	L75
 161                     ; 20 				i2c_start();
 163  0028 cd0000        	call	_i2c_start
 165                     ; 21 				i2c_shift(DS3231_ADDRESS | 0x01);
 167  002b a6d1          	ld	a,#209
 168  002d cd0000        	call	_i2c_shift
 170                     ; 22 				if (i2c_ack(READ_ANSWER)==ACK)
 172  0030 a601          	ld	a,#1
 173  0032 cd0000        	call	_i2c_ack
 175  0035 4d            	tnz	a
 176  0036 262f          	jrne	L75
 177                     ; 24 					*seconds = i2c_shift(0xFF); i2c_ack(SET_ACK);
 179  0038 a6ff          	ld	a,#255
 180  003a cd0000        	call	_i2c_shift
 182  003d 1e01          	ldw	x,(OFST+1,sp)
 183  003f f7            	ld	(x),a
 186  0040 4f            	clr	a
 187  0041 cd0000        	call	_i2c_ack
 189                     ; 25 					*minutes = i2c_shift(0xFF); i2c_ack(SET_ACK);
 191  0044 a6ff          	ld	a,#255
 192  0046 cd0000        	call	_i2c_shift
 194  0049 1e05          	ldw	x,(OFST+5,sp)
 195  004b f7            	ld	(x),a
 198  004c 4f            	clr	a
 199  004d cd0000        	call	_i2c_ack
 201                     ; 26 					*hours = i2c_shift(0xFF); 	i2c_ack(SET_NAK);
 203  0050 a6ff          	ld	a,#255
 204  0052 cd0000        	call	_i2c_shift
 206  0055 1e07          	ldw	x,(OFST+7,sp)
 207  0057 f7            	ld	(x),a
 210  0058 a601          	ld	a,#1
 211  005a cd0000        	call	_i2c_ack
 213                     ; 27 					i2c_stop();
 215  005d cd0000        	call	_i2c_stop
 217                     ; 28 					return;
 219  0060 2003          	jra	L01
 220  0062               L74:
 221                     ; 33 		i2c_slave_unlock();
 223  0062 cd0000        	call	_i2c_slave_unlock
 225                     ; 34 		return;
 226  0065               L01:
 229  0065 85            	popw	x
 230  0066 81            	ret
 231  0067               L75:
 232                     ; 36 	i2c_stop();
 234  0067 cd0000        	call	_i2c_stop
 236                     ; 37 }
 238  006a 20f9          	jra	L01
 299                     ; 39 void ds3231_write_time(uint8_t *seconds, uint8_t *minutes, uint8_t *hours)
 299                     ; 40 {
 300                     	switch	.text
 301  006c               _ds3231_write_time:
 303  006c 89            	pushw	x
 304       00000000      OFST:	set	0
 307                     ; 41 	if (i2c_busy_check() == OK){
 309  006d cd0000        	call	_i2c_busy_check
 311  0070 a101          	cp	a,#1
 312  0072 264b          	jrne	L701
 313                     ; 42 		i2c_start();
 315  0074 cd0000        	call	_i2c_start
 317                     ; 43 		i2c_shift(DS3231_ADDRESS);
 319  0077 a6d0          	ld	a,#208
 320  0079 cd0000        	call	_i2c_shift
 322                     ; 44 		if (i2c_ack(READ_ANSWER)==ACK)
 324  007c a601          	ld	a,#1
 325  007e cd0000        	call	_i2c_ack
 327  0081 4d            	tnz	a
 328  0082 2640          	jrne	L321
 329                     ; 46 			i2c_shift(SECONDS_ADDR);
 331  0084 4f            	clr	a
 332  0085 cd0000        	call	_i2c_shift
 334                     ; 47 			if (i2c_ack(READ_ANSWER)==ACK)
 336  0088 a601          	ld	a,#1
 337  008a cd0000        	call	_i2c_ack
 339  008d 4d            	tnz	a
 340  008e 2634          	jrne	L321
 341                     ; 49 				i2c_shift(*seconds); 
 343  0090 1e01          	ldw	x,(OFST+1,sp)
 344  0092 f6            	ld	a,(x)
 345  0093 cd0000        	call	_i2c_shift
 347                     ; 50 				if (i2c_ack(READ_ANSWER)==ACK)
 349  0096 a601          	ld	a,#1
 350  0098 cd0000        	call	_i2c_ack
 352  009b 4d            	tnz	a
 353  009c 2626          	jrne	L321
 354                     ; 52 					i2c_shift(*minutes); 
 356  009e 1e05          	ldw	x,(OFST+5,sp)
 357  00a0 f6            	ld	a,(x)
 358  00a1 cd0000        	call	_i2c_shift
 360                     ; 53 					if (i2c_ack(READ_ANSWER)==ACK)
 362  00a4 a601          	ld	a,#1
 363  00a6 cd0000        	call	_i2c_ack
 365  00a9 4d            	tnz	a
 366  00aa 2618          	jrne	L321
 367                     ; 55 						i2c_shift(*hours); 
 369  00ac 1e07          	ldw	x,(OFST+7,sp)
 370  00ae f6            	ld	a,(x)
 371  00af cd0000        	call	_i2c_shift
 373                     ; 56 						if (i2c_ack(READ_ANSWER)==ACK)
 375  00b2 a601          	ld	a,#1
 376  00b4 cd0000        	call	_i2c_ack
 378  00b7 4d            	tnz	a
 379  00b8 260a          	jrne	L321
 380                     ; 58 							i2c_stop();
 382  00ba cd0000        	call	_i2c_stop
 384                     ; 59 							return;
 386  00bd 2003          	jra	L41
 387  00bf               L701:
 388                     ; 66 		i2c_slave_unlock();
 390  00bf cd0000        	call	_i2c_slave_unlock
 392                     ; 67 		return;
 393  00c2               L41:
 396  00c2 85            	popw	x
 397  00c3 81            	ret
 398  00c4               L321:
 399                     ; 69 	i2c_stop();
 401  00c4 cd0000        	call	_i2c_stop
 403                     ; 70 }
 405  00c7 20f9          	jra	L41
 418                     	xref	_i2c_stop
 419                     	xref	_i2c_start
 420                     	xref	_i2c_ack
 421                     	xref	_i2c_shift
 422                     	xref	_i2c_slave_unlock
 423                     	xref	_i2c_busy_check
 424                     	xref	_i2c_init
 425                     	xdef	_ds3231_write_time
 426                     	xdef	_ds3231_read_time
 427                     	xdef	_ds3231Init
 446                     	end
