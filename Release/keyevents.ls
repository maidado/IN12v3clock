   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 27 void keyevents_init ( void )
  15                     ; 28 {
  16                     	scross	off
  17  0000               _keyevents_init:
  19                     ; 30 }
  20  0000 81            	ret
  22                     ; 32 void keyevents_proc ( void )
  22                     ; 33 {
  23  0001               _keyevents_proc:
  25                     ; 34 	ki.keys_mirror = keyboard_get_key();
  26  0001 cd0000        	call	_keyboard_get_key
  28  0004 b700          	ld	_ki,a
  29                     ; 36 	if(ki.keys_mirror != 0xFF){
  30  0006 b600          	ld	a,_ki
  31  0008 a1ff          	cp	a,#255
  32  000a 2749          	jreq	L3
  33                     ; 40 		if (ki.keys_mirror == S1_DOWN)
  34  000c b600          	ld	a,_ki
  35  000e a101          	cp	a,#1
  36  0010 260d          	jrne	L5
  37                     ; 42 			bitmaskset(ki.bf,S1_M);
  38  0012 72100001      	bset	_ki+1,#0
  39                     ; 43 			if (ki.bf == S1_M){
  40  0016 b601          	ld	a,_ki+1
  41  0018 a101          	cp	a,#1
  42  001a 2603          	jrne	L5
  43                     ; 44 				event_single_key1();
  44  001c cd00cd        	call	_event_single_key1
  46  001f               L5:
  47                     ; 50 		if (ki.keys_mirror == S2_DOWN)
  48  001f b600          	ld	a,_ki
  49  0021 a102          	cp	a,#2
  50  0023 260d          	jrne	L11
  51                     ; 52 			bitmaskset(ki.bf,S2_M);
  52  0025 72120001      	bset	_ki+1,#1
  53                     ; 53 			if (ki.bf == S2_M){
  54  0029 b601          	ld	a,_ki+1
  55  002b a102          	cp	a,#2
  56  002d 2603          	jrne	L11
  57                     ; 54 				event_single_key2();
  58  002f cd01a4        	call	_event_single_key2
  60  0032               L11:
  61                     ; 60 		if (ki.keys_mirror == S1_UP)
  62  0032 b600          	ld	a,_ki
  63  0034 a181          	cp	a,#129
  64  0036 260a          	jrne	L51
  65                     ; 62 			if (bitchk(ki.bf,S1)){
  66  0038 b601          	ld	a,_ki+1
  67  003a a501          	bcp	a,#1
  68  003c 2704          	jreq	L51
  69                     ; 63 				bitmaskclr(ki.bf,S1_M);
  70  003e 72110001      	bres	_ki+1,#0
  71  0042               L51:
  72                     ; 69 		if (ki.keys_mirror == S2_UP)
  73  0042 b600          	ld	a,_ki
  74  0044 a182          	cp	a,#130
  75  0046 260d          	jrne	L3
  76                     ; 71 			if (bitchk(ki.bf,S2)){
  77  0048 b601          	ld	a,_ki+1
  78  004a a502          	bcp	a,#2
  79  004c 2707          	jreq	L3
  80                     ; 72 				fastReleaseKey2();
  81  004e cd03e1        	call	_fastReleaseKey2
  83                     ; 73 				bitmaskclr(ki.bf,S2_M);
  84  0051 72130001      	bres	_ki+1,#1
  85  0055               L3:
  86                     ; 77 }
  87  0055 81            	ret
  89                     ; 79 void keyevents_counters ( void )
  89                     ; 80 {
  90  0056               _keyevents_counters:
  91  0056 5203          	subw	sp,#3
  92       00000003      OFST:	set	3
  94                     ; 84 	for(t=0; t<sizeof(ki.lp_counter); t++){
  95  0058 0f03          	clr	(OFST+0,sp)
  96  005a               L52:
  97                     ; 85 		if (bitchk(ki.bf,t)){
  98  005a b601          	ld	a,_ki+1
  99  005c 5f            	clrw	x
 100  005d 97            	ld	xl,a
 101  005e 1f01          	ldw	(OFST-2,sp),x
 102  0060 ae0001        	ldw	x,#1
 103  0063 7b03          	ld	a,(OFST+0,sp)
 104  0065 4d            	tnz	a
 105  0066 2704          	jreq	L01
 106  0068               L21:
 107  0068 58            	sllw	x
 108  0069 4a            	dec	a
 109  006a 26fc          	jrne	L21
 110  006c               L01:
 111  006c 01            	rrwa	x,a
 112  006d 1402          	and	a,(OFST-1,sp)
 113  006f 01            	rrwa	x,a
 114  0070 1401          	and	a,(OFST-2,sp)
 115  0072 01            	rrwa	x,a
 116  0073 a30000        	cpw	x,#0
 117  0076 2722          	jreq	L33
 118                     ; 86 			if (ki.lp_counter[t]<255) ki.lp_counter[t]++;
 119  0078 7b03          	ld	a,(OFST+0,sp)
 120  007a 5f            	clrw	x
 121  007b 97            	ld	xl,a
 122  007c e602          	ld	a,(_ki+2,x)
 123  007e a1ff          	cp	a,#255
 124  0080 2406          	jruge	L53
 126  0082 7b03          	ld	a,(OFST+0,sp)
 127  0084 5f            	clrw	x
 128  0085 97            	ld	xl,a
 129  0086 6c02          	inc	(_ki+2,x)
 130  0088               L53:
 131                     ; 87 			if (ki.kr_counter[t]<255) ki.kr_counter[t]++;
 132  0088 7b03          	ld	a,(OFST+0,sp)
 133  008a 5f            	clrw	x
 134  008b 97            	ld	xl,a
 135  008c e604          	ld	a,(_ki+4,x)
 136  008e a1ff          	cp	a,#255
 137  0090 2414          	jruge	L14
 139  0092 7b03          	ld	a,(OFST+0,sp)
 140  0094 5f            	clrw	x
 141  0095 97            	ld	xl,a
 142  0096 6c04          	inc	(_ki+4,x)
 143  0098 200c          	jra	L14
 144  009a               L33:
 145                     ; 89 			ki.lp_counter[t]=0;
 146  009a 7b03          	ld	a,(OFST+0,sp)
 147  009c 5f            	clrw	x
 148  009d 97            	ld	xl,a
 149  009e 6f02          	clr	(_ki+2,x)
 150                     ; 90 			ki.kr_counter[t]=0;
 151  00a0 7b03          	ld	a,(OFST+0,sp)
 152  00a2 5f            	clrw	x
 153  00a3 97            	ld	xl,a
 154  00a4 6f04          	clr	(_ki+4,x)
 155  00a6               L14:
 156                     ; 84 	for(t=0; t<sizeof(ki.lp_counter); t++){
 157  00a6 0c03          	inc	(OFST+0,sp)
 159  00a8 7b03          	ld	a,(OFST+0,sp)
 160  00aa a102          	cp	a,#2
 161  00ac 25ac          	jrult	L52
 162                     ; 93 	if (i.timeSetupCounter){
 163  00ae be00          	ldw	x,_i
 164  00b0 270f          	jreq	L34
 165                     ; 94 		i.timeSetupCounter--;
 166  00b2 be00          	ldw	x,_i
 167  00b4 1d0001        	subw	x,#1
 168  00b7 bf00          	ldw	_i,x
 169                     ; 95 		if (!i.timeSetupCounter){
 170  00b9 be00          	ldw	x,_i
 171  00bb 2604          	jrne	L34
 172                     ; 96 			i.display_state = SETUP_NO;
 173  00bd 35ff0007      	mov	_i+7,#255
 174  00c1               L34:
 175                     ; 100 	longpress_key1();
 176  00c1 cd0319        	call	_longpress_key1
 178                     ; 101 	longpress_key2();
 179  00c4 cd0372        	call	_longpress_key2
 181                     ; 102 	longpress_key1_2();
 182  00c7 cd03ba        	call	_longpress_key1_2
 184                     ; 103 }
 185  00ca 5b03          	addw	sp,#3
 186  00cc 81            	ret
 188                     .const:	section	.text
 189  0000               L02:
 190  0000 014f          	dc.w	L36
 191  0002 014b          	dc.w	L16
 192  0004 015d          	dc.w	L56
 193  0006 015d          	dc.w	L56
 194  0008 014f          	dc.w	L36
 195  000a 0174          	dc.w	L76
 196  000c 018e          	dc.w	L17
 197  000e 0174          	dc.w	L76
 198  0010 018e          	dc.w	L17
 199  0012 014f          	dc.w	L36
 200  0014 0198          	dc.w	L77
 201  0016 0130          	dc.w	L35
 202  0018 0139          	dc.w	L55
 203  001a 0142          	dc.w	L75
 204  001c 00de          	dc.w	L74
 205  001e 0113          	dc.w	L15
 206                     ; 105 void event_single_key1(void)
 206                     ; 106 {
 207                     	switch	.text
 208  00cd               _event_single_key1:
 210                     ; 107 	switch(i.display_state){
 211  00cd b607          	ld	a,_i+7
 213                     ; 182 		default:
 213                     ; 183 			break;
 214  00cf a110          	cp	a,#16
 215  00d1 2407          	jruge	L61
 216  00d3 5f            	clrw	x
 217  00d4 97            	ld	xl,a
 218  00d5 58            	sllw	x
 219  00d6 de0000        	ldw	x,(L02,x)
 220  00d9 fc            	jp	(x)
 221  00da               L61:
 222  00da ac980198      	jpf	L77
 223  00de               L74:
 224                     ; 108 		case SETUP_HOURS:
 224                     ; 109 			iface_flag05sReset();
 225  00de cd0000        	call	_iface_flag05sReset
 227                     ; 110 			++i.hoursSetupValue;
 228  00e1 3c0d          	inc	_i+13
 229                     ; 111 			if ((i.hoursSetupValue&0x0F) > 0x09){i.hoursSetupValue +=0x06;}
 230  00e3 b60d          	ld	a,_i+13
 231  00e5 a40f          	and	a,#15
 232  00e7 a10a          	cp	a,#10
 233  00e9 2506          	jrult	L101
 235  00eb b60d          	ld	a,_i+13
 236  00ed ab06          	add	a,#6
 237  00ef b70d          	ld	_i+13,a
 238  00f1               L101:
 239                     ; 112 			if(e.f1224){
 240  00f1 3d01          	tnz	_e+1
 241  00f3 270f          	jreq	L301
 242                     ; 113 				if (i.hoursSetupValue > 0x12) 			{i.hoursSetupValue = 0;}
 243  00f5 b60d          	ld	a,_i+13
 244  00f7 a113          	cp	a,#19
 245  00f9 2403          	jruge	L22
 246  00fb cc0198        	jp	L77
 247  00fe               L22:
 249  00fe 3f0d          	clr	_i+13
 250  0100 ac980198      	jpf	L77
 251  0104               L301:
 252                     ; 115 				if (i.hoursSetupValue > 0x23) 			{i.hoursSetupValue = 0;}
 253  0104 b60d          	ld	a,_i+13
 254  0106 a124          	cp	a,#36
 255  0108 2403          	jruge	L42
 256  010a cc0198        	jp	L77
 257  010d               L42:
 259  010d 3f0d          	clr	_i+13
 260  010f ac980198      	jpf	L77
 261  0113               L15:
 262                     ; 119 		case SETUP_MINUTES:
 262                     ; 120 			iface_flag05sReset();
 263  0113 cd0000        	call	_iface_flag05sReset
 265                     ; 121 			++i.minutesSetupValue;
 266  0116 3c0c          	inc	_i+12
 267                     ; 122 			if ((i.minutesSetupValue&0x0F) > 0x09){i.minutesSetupValue +=0x06;}
 268  0118 b60c          	ld	a,_i+12
 269  011a a40f          	and	a,#15
 270  011c a10a          	cp	a,#10
 271  011e 2506          	jrult	L311
 273  0120 b60c          	ld	a,_i+12
 274  0122 ab06          	add	a,#6
 275  0124 b70c          	ld	_i+12,a
 276  0126               L311:
 277                     ; 123 			if (i.minutesSetupValue > 0x59) 			{i.minutesSetupValue = 0;}
 278  0126 b60c          	ld	a,_i+12
 279  0128 a15a          	cp	a,#90
 280  012a 256c          	jrult	L77
 282  012c 3f0c          	clr	_i+12
 283  012e 2068          	jra	L77
 284  0130               L35:
 285                     ; 126 		case SETUP_R:
 285                     ; 127 			++i.setupValue;
 286  0130 3c0b          	inc	_i+11
 287                     ; 128 			displayRset(i.setupValue);
 288  0132 b60b          	ld	a,_i+11
 289  0134 cd0000        	call	_displayRset
 291                     ; 129 			break;
 292  0137 205f          	jra	L77
 293  0139               L55:
 294                     ; 131 		case SETUP_G:
 294                     ; 132 			++i.setupValue;
 295  0139 3c0b          	inc	_i+11
 296                     ; 133 			displayGset(i.setupValue);
 297  013b b60b          	ld	a,_i+11
 298  013d cd0000        	call	_displayGset
 300                     ; 134 			break;
 301  0140 2056          	jra	L77
 302  0142               L75:
 303                     ; 136 		case SETUP_B:
 303                     ; 137 			++i.setupValue;
 304  0142 3c0b          	inc	_i+11
 305                     ; 138 			displayBset(i.setupValue);
 306  0144 b60b          	ld	a,_i+11
 307  0146 cd0000        	call	_displayBset
 309                     ; 139 			break;
 310  0149 204d          	jra	L77
 311  014b               L16:
 312                     ; 141 		case	SETUP_F1224:
 312                     ; 142 			i.setupValue = 0;	//todo disable, 12h time display is not working yet!
 313  014b 3f0b          	clr	_i+11
 314                     ; 143 			break;
 315  014d 2049          	jra	L77
 316  014f               L36:
 317                     ; 145 		case	SETUP_ZERO:
 317                     ; 146 		case  SETUP_NIGHT_BR_EN:
 317                     ; 147 		case	SETUP_NIGHT_RGB_EN:
 317                     ; 148 			if (i.setupValue){
 318  014f 3d0b          	tnz	_i+11
 319  0151 2704          	jreq	L711
 320                     ; 149 				i.setupValue = 0;
 321  0153 3f0b          	clr	_i+11
 323  0155 2041          	jra	L77
 324  0157               L711:
 325                     ; 151 				i.setupValue = 1;
 326  0157 3501000b      	mov	_i+11,#1
 327  015b 203b          	jra	L77
 328  015d               L56:
 329                     ; 155 		case SETUP_BRIGHT:
 329                     ; 156 		case SETUP_NIGHT_BR:
 329                     ; 157 			if(i.setupValue) {
 330  015d 3d0b          	tnz	_i+11
 331  015f 270c          	jreq	L321
 332                     ; 158 				i.setupValue--;
 333  0161 3a0b          	dec	_i+11
 334                     ; 159 				if (i.setupValue < 5){
 335  0163 b60b          	ld	a,_i+11
 336  0165 a105          	cp	a,#5
 337  0167 2404          	jruge	L321
 338                     ; 160 					i.setupValue = 100;
 339  0169 3564000b      	mov	_i+11,#100
 340  016d               L321:
 341                     ; 163 			displaySetBright(i.setupValue);
 342  016d b60b          	ld	a,_i+11
 343  016f cd0000        	call	_displaySetBright
 345                     ; 164 			break;
 346  0172 2024          	jra	L77
 347  0174               L76:
 348                     ; 166 		case SETUP_NIGHT_BR_START_H:
 348                     ; 167 		case SETUP_NIGHT_BR_END_H:
 348                     ; 168 			++i.setupValue;
 349  0174 3c0b          	inc	_i+11
 350                     ; 169 			if(e.f1224){
 351  0176 3d01          	tnz	_e+1
 352  0178 270a          	jreq	L721
 353                     ; 170 				if (i.setupValue > 12)			{i.setupValue=0;}
 354  017a b60b          	ld	a,_i+11
 355  017c a10d          	cp	a,#13
 356  017e 2518          	jrult	L77
 358  0180 3f0b          	clr	_i+11
 359  0182 2014          	jra	L77
 360  0184               L721:
 361                     ; 172 				if (i.setupValue > 23)			{i.setupValue=0;}
 362  0184 b60b          	ld	a,_i+11
 363  0186 a118          	cp	a,#24
 364  0188 250e          	jrult	L77
 366  018a 3f0b          	clr	_i+11
 367  018c 200a          	jra	L77
 368  018e               L17:
 369                     ; 176 		case SETUP_NIGHT_BR_START_M:
 369                     ; 177 		case SETUP_NIGHT_BR_END_M:
 369                     ; 178 			++i.setupValue;
 370  018e 3c0b          	inc	_i+11
 371                     ; 179 			if (i.setupValue > 59) 				{i.setupValue = 0;}
 372  0190 b60b          	ld	a,_i+11
 373  0192 a13c          	cp	a,#60
 374  0194 2502          	jrult	L77
 376  0196 3f0b          	clr	_i+11
 377  0198               L37:
 378                     ; 182 		default:
 378                     ; 183 			break;
 379  0198               L77:
 380                     ; 185 	if (i.display_state!=SETUP_NO){
 381  0198 b607          	ld	a,_i+7
 382  019a a1ff          	cp	a,#255
 383  019c 2705          	jreq	L141
 384                     ; 186 		i.timeSetupCounter = 60*10;
 385  019e ae0258        	ldw	x,#600
 386  01a1 bf00          	ldw	_i,x
 387  01a3               L141:
 388                     ; 188 }
 389  01a3 81            	ret
 391                     	switch	.const
 392  0020               L23:
 393  0020 021f          	dc.w	L551
 394  0022 0233          	dc.w	L751
 395  0024 024e          	dc.w	L161
 396  0026 0269          	dc.w	L361
 397  0028 0283          	dc.w	L561
 398  002a 0298          	dc.w	L761
 399  002c 02ac          	dc.w	L171
 400  002e 02c0          	dc.w	L371
 401  0030 02d4          	dc.w	L571
 402  0032 02e8          	dc.w	L771
 403  0034 02fc          	dc.w	L102
 404  0036 01d9          	dc.w	L741
 405  0038 01f1          	dc.w	L151
 406  003a 0209          	dc.w	L351
 407  003c 01b8          	dc.w	L341
 408  003e 01c0          	dc.w	L541
 409                     ; 191 void event_single_key2(void)
 409                     ; 192 {
 410                     	switch	.text
 411  01a4               _event_single_key2:
 412  01a4 88            	push	a
 413       00000001      OFST:	set	1
 415                     ; 193 	uint8_t seconds = 0;
 416  01a5 0f01          	clr	(OFST+0,sp)
 417                     ; 195 	switch (i.display_state){
 418  01a7 b607          	ld	a,_i+7
 420                     ; 305 			break;
 421  01a9 a110          	cp	a,#16
 422  01ab 2407          	jruge	L03
 423  01ad 5f            	clrw	x
 424  01ae 97            	ld	xl,a
 425  01af 58            	sllw	x
 426  01b0 de0020        	ldw	x,(L23,x)
 427  01b3 fc            	jp	(x)
 428  01b4               L03:
 429  01b4 ac130313      	jpf	L302
 430  01b8               L341:
 431                     ; 196 		case SETUP_HOURS:
 431                     ; 197 			i.display_state = SETUP_MINUTES;
 432  01b8 350f0007      	mov	_i+7,#15
 433                     ; 198 			break;
 434  01bc ac170317      	jpf	L702
 435  01c0               L541:
 436                     ; 200 		case SETUP_MINUTES:
 436                     ; 201 			ds3231_write_time(&seconds,&i.minutesSetupValue,&i.hoursSetupValue);
 437  01c0 ae000d        	ldw	x,#_i+13
 438  01c3 89            	pushw	x
 439  01c4 ae000c        	ldw	x,#_i+12
 440  01c7 89            	pushw	x
 441  01c8 96            	ldw	x,sp
 442  01c9 1c0005        	addw	x,#OFST+4
 443  01cc cd0000        	call	_ds3231_write_time
 445  01cf 5b04          	addw	sp,#4
 446                     ; 202 			i.display_state = SETUP_NO;
 447  01d1 35ff0007      	mov	_i+7,#255
 448                     ; 203 			break;
 449  01d5 ac170317      	jpf	L702
 450  01d9               L741:
 451                     ; 205 		case SETUP_R:
 451                     ; 206 			i.display_state++;
 452  01d9 3c07          	inc	_i+7
 453                     ; 207 			EEPROM_writeByte(R_ADDR,i.setupValue);
 454  01db 3b000b        	push	_i+11
 455  01de ae000b        	ldw	x,#11
 456  01e1 cd0000        	call	_EEPROM_writeByte
 458  01e4 84            	pop	a
 459                     ; 208 			i.setupValue = EEPROM_readByte(G_ADDR);
 460  01e5 ae000c        	ldw	x,#12
 461  01e8 cd0000        	call	_EEPROM_readByte
 463  01eb b70b          	ld	_i+11,a
 464                     ; 209 			break;
 465  01ed ac170317      	jpf	L702
 466  01f1               L151:
 467                     ; 211 		case SETUP_G:
 467                     ; 212 			i.display_state++;
 468  01f1 3c07          	inc	_i+7
 469                     ; 213 			EEPROM_writeByte(G_ADDR,i.setupValue);
 470  01f3 3b000b        	push	_i+11
 471  01f6 ae000c        	ldw	x,#12
 472  01f9 cd0000        	call	_EEPROM_writeByte
 474  01fc 84            	pop	a
 475                     ; 214 			i.setupValue = EEPROM_readByte(B_ADDR);
 476  01fd ae000d        	ldw	x,#13
 477  0200 cd0000        	call	_EEPROM_readByte
 479  0203 b70b          	ld	_i+11,a
 480                     ; 215 			break;
 481  0205 ac170317      	jpf	L702
 482  0209               L351:
 483                     ; 217 		case SETUP_B:
 483                     ; 218 			i.display_state = SETUP_NO;
 484  0209 35ff0007      	mov	_i+7,#255
 485                     ; 219 			EEPROM_writeByte(B_ADDR,i.setupValue);
 486  020d 3b000b        	push	_i+11
 487  0210 ae000d        	ldw	x,#13
 488  0213 cd0000        	call	_EEPROM_writeByte
 490  0216 84            	pop	a
 491                     ; 220 			bitmaskclr(ki.bf,S2_M);	//disable fast release key2 to prevent toggle RGB
 492  0217 72130001      	bres	_ki+1,#1
 493                     ; 221 			break;
 494  021b ac170317      	jpf	L702
 495  021f               L551:
 496                     ; 223 		case SETUP_ZERO:
 496                     ; 224 			e.zeroEn = i.setupValue;
 497  021f 450b00        	mov	_e,_i+11
 498                     ; 225 			EEPROM_writeByte(ZERO_ADDR,e.zeroEn);
 499  0222 3b0000        	push	_e
 500  0225 5f            	clrw	x
 501  0226 cd0000        	call	_EEPROM_writeByte
 503  0229 84            	pop	a
 504                     ; 226 			i.display_state++;
 505  022a 3c07          	inc	_i+7
 506                     ; 227 			i.setupValue = e.f1224;
 507  022c 45010b        	mov	_i+11,_e+1
 508                     ; 228 			break;
 509  022f ac170317      	jpf	L702
 510  0233               L751:
 511                     ; 230 		case SETUP_F1224:
 511                     ; 231 			e.f1224 = i.setupValue;
 512  0233 450b01        	mov	_e+1,_i+11
 513                     ; 232 			EEPROM_writeByte(F1224_ADDR,e.f1224);
 514  0236 3b0001        	push	_e+1
 515  0239 ae0001        	ldw	x,#1
 516  023c cd0000        	call	_EEPROM_writeByte
 518  023f 84            	pop	a
 519                     ; 233 			i.display_state++;
 520  0240 3c07          	inc	_i+7
 521                     ; 234 			i.setupValue = e.bright;
 522  0242 45020b        	mov	_i+11,_e+2
 523                     ; 235 			displaySetBright(i.setupValue);
 524  0245 b60b          	ld	a,_i+11
 525  0247 cd0000        	call	_displaySetBright
 527                     ; 236 			break;
 528  024a ac170317      	jpf	L702
 529  024e               L161:
 530                     ; 238 		case SETUP_BRIGHT:
 530                     ; 239 			i.display_state++;
 531  024e 3c07          	inc	_i+7
 532                     ; 240 			e.bright = i.setupValue;
 533  0250 450b02        	mov	_e+2,_i+11
 534                     ; 241 			EEPROM_writeByte(BRIGHT_ADDR,e.bright);
 535  0253 3b0002        	push	_e+2
 536  0256 ae0002        	ldw	x,#2
 537  0259 cd0000        	call	_EEPROM_writeByte
 539  025c 84            	pop	a
 540                     ; 242 			i.setupValue = e.nBright;
 541  025d 45030b        	mov	_i+11,_e+3
 542                     ; 243 			displaySetBright(i.setupValue);
 543  0260 b60b          	ld	a,_i+11
 544  0262 cd0000        	call	_displaySetBright
 546                     ; 244 			break;
 547  0265 ac170317      	jpf	L702
 548  0269               L361:
 549                     ; 246 		case SETUP_NIGHT_BR:
 549                     ; 247 			e.nBright = i.setupValue;
 550  0269 450b03        	mov	_e+3,_i+11
 551                     ; 248 			EEPROM_writeByte(NIGHT_BR_ADDR,e.nBright);
 552  026c 3b0003        	push	_e+3
 553  026f ae0003        	ldw	x,#3
 554  0272 cd0000        	call	_EEPROM_writeByte
 556  0275 84            	pop	a
 557                     ; 249 			i.display_state++;
 558  0276 3c07          	inc	_i+7
 559                     ; 250 			i.setupValue = e.nBrightEn;
 560  0278 45040b        	mov	_i+11,_e+4
 561                     ; 251 			displaySetBright(100);
 562  027b a664          	ld	a,#100
 563  027d cd0000        	call	_displaySetBright
 565                     ; 252 			break;
 566  0280 cc0317        	jra	L702
 567  0283               L561:
 568                     ; 254 		case SETUP_NIGHT_BR_EN:
 568                     ; 255 			e.nBrightEn = i.setupValue;
 569  0283 450b04        	mov	_e+4,_i+11
 570                     ; 256 			EEPROM_writeByte(NIGHT_BR_EN_ADDR,e.nBrightEn);
 571  0286 3b0004        	push	_e+4
 572  0289 ae0004        	ldw	x,#4
 573  028c cd0000        	call	_EEPROM_writeByte
 575  028f 84            	pop	a
 576                     ; 257 			i.display_state++;
 577  0290 3c07          	inc	_i+7
 578                     ; 258 			i.setupValue = e.nBrightStartH;
 579  0292 45050b        	mov	_i+11,_e+5
 580                     ; 259 			break;
 581  0295 cc0317        	jra	L702
 582  0298               L761:
 583                     ; 261 		case SETUP_NIGHT_BR_START_H:
 583                     ; 262 			e.nBrightStartH = i.setupValue;
 584  0298 450b05        	mov	_e+5,_i+11
 585                     ; 263 			EEPROM_writeByte(NIGHT_BR_START_H_ADDR,e.nBrightStartH);
 586  029b 3b0005        	push	_e+5
 587  029e ae0005        	ldw	x,#5
 588  02a1 cd0000        	call	_EEPROM_writeByte
 590  02a4 84            	pop	a
 591                     ; 264 			i.display_state++;
 592  02a5 3c07          	inc	_i+7
 593                     ; 265 			i.setupValue = e.nBrightStartM;
 594  02a7 45060b        	mov	_i+11,_e+6
 595                     ; 266 			break;
 596  02aa 206b          	jra	L702
 597  02ac               L171:
 598                     ; 268 		case SETUP_NIGHT_BR_START_M:
 598                     ; 269 			e.nBrightStartM = i.setupValue;
 599  02ac 450b06        	mov	_e+6,_i+11
 600                     ; 270 			EEPROM_writeByte(NIGHT_BR_START_M_ADDR,e.nBrightStartM);
 601  02af 3b0006        	push	_e+6
 602  02b2 ae0006        	ldw	x,#6
 603  02b5 cd0000        	call	_EEPROM_writeByte
 605  02b8 84            	pop	a
 606                     ; 271 			i.display_state++;
 607  02b9 3c07          	inc	_i+7
 608                     ; 272 			i.setupValue = e.nBrightEndH;
 609  02bb 45070b        	mov	_i+11,_e+7
 610                     ; 273 			break;
 611  02be 2057          	jra	L702
 612  02c0               L371:
 613                     ; 275 		case SETUP_NIGHT_BR_END_H:
 613                     ; 276 			e.nBrightEndH = i.setupValue;
 614  02c0 450b07        	mov	_e+7,_i+11
 615                     ; 277 			EEPROM_writeByte(NIGHT_BR_STOP_H_ADDR,e.nBrightEndH);
 616  02c3 3b0007        	push	_e+7
 617  02c6 ae0007        	ldw	x,#7
 618  02c9 cd0000        	call	_EEPROM_writeByte
 620  02cc 84            	pop	a
 621                     ; 278 			i.display_state++;
 622  02cd 3c07          	inc	_i+7
 623                     ; 279 			i.setupValue = e.nBrightEndM;
 624  02cf 45080b        	mov	_i+11,_e+8
 625                     ; 280 			break;
 626  02d2 2043          	jra	L702
 627  02d4               L571:
 628                     ; 282 		case SETUP_NIGHT_BR_END_M:
 628                     ; 283 			e.nBrightEndM = i.setupValue;
 629  02d4 450b08        	mov	_e+8,_i+11
 630                     ; 284 			EEPROM_writeByte(NIGHT_BR_STOP_M_ADDR,e.nBrightEndM);
 631  02d7 3b0008        	push	_e+8
 632  02da ae0008        	ldw	x,#8
 633  02dd cd0000        	call	_EEPROM_writeByte
 635  02e0 84            	pop	a
 636                     ; 285 			i.display_state++;
 637  02e1 3c07          	inc	_i+7
 638                     ; 286 			i.setupValue = e.rgbAtNightEn;
 639  02e3 45090b        	mov	_i+11,_e+9
 640                     ; 287 			break;
 641  02e6 202f          	jra	L702
 642  02e8               L771:
 643                     ; 289 		case SETUP_NIGHT_RGB_EN:
 643                     ; 290 			e.rgbAtNightEn = i.setupValue;
 644  02e8 450b09        	mov	_e+9,_i+11
 645                     ; 291 			EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbAtNightEn);
 646  02eb 3b0009        	push	_e+9
 647  02ee ae0009        	ldw	x,#9
 648  02f1 cd0000        	call	_EEPROM_writeByte
 650  02f4 84            	pop	a
 651                     ; 292 			i.display_state++;
 652  02f5 3c07          	inc	_i+7
 653                     ; 293 			i.setupValue = e.antipoisoningAtNihgtOnly;
 654  02f7 450a0b        	mov	_i+11,_e+10
 655                     ; 294 			break;
 656  02fa 201b          	jra	L702
 657  02fc               L102:
 658                     ; 296 		case SETUP_ANTIPOISONING_AT_NIGHT_ONLY:
 658                     ; 297 			e.antipoisoningAtNihgtOnly = i.setupValue;
 659  02fc 450b0a        	mov	_e+10,_i+11
 660                     ; 298 			EEPROM_writeByte(ANTIPOISONING_AT_NIGHT_ONLY_ADDR,e.antipoisoningAtNihgtOnly);
 661  02ff 3b000a        	push	_e+10
 662  0302 ae000a        	ldw	x,#10
 663  0305 cd0000        	call	_EEPROM_writeByte
 665  0308 84            	pop	a
 666                     ; 299 			i.display_state = SETUP_NO;
 667  0309 35ff0007      	mov	_i+7,#255
 668                     ; 300 			bitmaskclr(ki.bf,S2_M);	//disable fast release key2 to prevent toggle RGB
 669  030d 72130001      	bres	_ki+1,#1
 670                     ; 301 			break;
 671  0311 2004          	jra	L702
 672  0313               L302:
 673                     ; 303 		default:
 673                     ; 304 			i.display_state = SETUP_NO;
 674  0313 35ff0007      	mov	_i+7,#255
 675                     ; 305 			break;
 676  0317               L702:
 677                     ; 307 }
 678  0317 84            	pop	a
 679  0318 81            	ret
 681                     ; 309 void longpress_key1(void)
 681                     ; 310 {
 682  0319               _longpress_key1:
 684                     ; 311 	if (ki.bf == S1_M){
 685  0319 b601          	ld	a,_ki+1
 686  031b a101          	cp	a,#1
 687  031d 2652          	jrne	L112
 688                     ; 312 		if (i.display_state == SETUP_NO){
 689  031f b607          	ld	a,_i+7
 690  0321 a1ff          	cp	a,#255
 691  0323 2620          	jrne	L312
 692                     ; 313 			if (ki.lp_counter[S1] >= 2*10){
 693  0325 b602          	ld	a,_ki+2
 694  0327 a114          	cp	a,#20
 695  0329 2546          	jrult	L112
 696                     ; 314 				i.display_state = SETUP_HOURS;
 697  032b 350e0007      	mov	_i+7,#14
 698                     ; 315 				i.timeSetupCounter = 60*10;
 699  032f ae0258        	ldw	x,#600
 700  0332 bf00          	ldw	_i,x
 701                     ; 316 				i.hoursSetupValue = i.hours;
 702  0334 450a0d        	mov	_i+13,_i+10
 703                     ; 317 				i.minutesSetupValue = i.minutes;
 704  0337 45090c        	mov	_i+12,_i+9
 705                     ; 318 				displaySetBright(100);
 706  033a a664          	ld	a,#100
 707  033c cd0000        	call	_displaySetBright
 709                     ; 319 				bitmaskclr(ki.bf,S1_M);
 710  033f 72110001      	bres	_ki+1,#0
 711  0343 202c          	jra	L112
 712  0345               L312:
 713                     ; 321 		}else if (i.display_state > SETUP_ZERO && i.display_state < SETUP_NO){
 714  0345 3d07          	tnz	_i+7
 715  0347 2728          	jreq	L112
 717  0349 b607          	ld	a,_i+7
 718  034b a1ff          	cp	a,#255
 719  034d 2422          	jruge	L112
 720                     ; 322 			if (ki.lp_counter[S1] >= 18){
 721  034f b602          	ld	a,_ki+2
 722  0351 a112          	cp	a,#18
 723  0353 250b          	jrult	L322
 724                     ; 323 				if(ki.kr_counter[S1] >= 1){
 725  0355 3d04          	tnz	_ki+4
 726  0357 2718          	jreq	L112
 727                     ; 324 					ki.kr_counter[S1] = 0;
 728  0359 3f04          	clr	_ki+4
 729                     ; 325 					event_single_key1 ();
 730  035b cd00cd        	call	_event_single_key1
 732  035e 2011          	jra	L112
 733  0360               L322:
 734                     ; 327 			}else if (ki.lp_counter[S1] >= 8){
 735  0360 b602          	ld	a,_ki+2
 736  0362 a108          	cp	a,#8
 737  0364 250b          	jrult	L112
 738                     ; 328 				if(ki.kr_counter[S1] >= 2){
 739  0366 b604          	ld	a,_ki+4
 740  0368 a102          	cp	a,#2
 741  036a 2505          	jrult	L112
 742                     ; 329 					ki.kr_counter[S1] = 0;
 743  036c 3f04          	clr	_ki+4
 744                     ; 330 					event_single_key1 ();
 745  036e cd00cd        	call	_event_single_key1
 747  0371               L112:
 748                     ; 335 }
 749  0371 81            	ret
 751                     ; 337 void longpress_key2(void)
 751                     ; 338 {
 752  0372               _longpress_key2:
 754                     ; 339 	if (ki.bf == S2_M){
 755  0372 b601          	ld	a,_ki+1
 756  0374 a102          	cp	a,#2
 757  0376 2641          	jrne	L532
 758                     ; 340 		if (i.display_state == SETUP_NO){
 759  0378 b607          	ld	a,_i+7
 760  037a a1ff          	cp	a,#255
 761  037c 263b          	jrne	L532
 762                     ; 341 			if (ki.lp_counter[S2] >= 2*10){
 763  037e b603          	ld	a,_ki+3
 764  0380 a114          	cp	a,#20
 765  0382 2535          	jrult	L532
 766                     ; 342 				i.display_state = SETUP_R;
 767  0384 350b0007      	mov	_i+7,#11
 768                     ; 343 				i.setupValue = EEPROM_readByte(R_ADDR);
 769  0388 ae000b        	ldw	x,#11
 770  038b cd0000        	call	_EEPROM_readByte
 772  038e b70b          	ld	_i+11,a
 773                     ; 344 				displayRset(EEPROM_readByte(R_ADDR));
 774  0390 ae000b        	ldw	x,#11
 775  0393 cd0000        	call	_EEPROM_readByte
 777  0396 cd0000        	call	_displayRset
 779                     ; 345 				displayGset(EEPROM_readByte(G_ADDR));
 780  0399 ae000c        	ldw	x,#12
 781  039c cd0000        	call	_EEPROM_readByte
 783  039f cd0000        	call	_displayGset
 785                     ; 346 				displayBset(EEPROM_readByte(B_ADDR));
 786  03a2 ae000d        	ldw	x,#13
 787  03a5 cd0000        	call	_EEPROM_readByte
 789  03a8 cd0000        	call	_displayBset
 791                     ; 347 				i.timeSetupCounter = 60*10;
 792  03ab ae0258        	ldw	x,#600
 793  03ae bf00          	ldw	_i,x
 794                     ; 348 				displaySetBright(100);
 795  03b0 a664          	ld	a,#100
 796  03b2 cd0000        	call	_displaySetBright
 798                     ; 349 				bitmaskclr(ki.bf,S2_M);
 799  03b5 72130001      	bres	_ki+1,#1
 800  03b9               L532:
 801                     ; 353 }
 802  03b9 81            	ret
 804                     ; 355 void longpress_key1_2(void){
 805  03ba               _longpress_key1_2:
 807                     ; 356 	if ((ki.lp_counter[S1] >= 2*10)&&(ki.lp_counter[S2] >= 2*10)){
 808  03ba b602          	ld	a,_ki+2
 809  03bc a114          	cp	a,#20
 810  03be 2520          	jrult	L342
 812  03c0 b603          	ld	a,_ki+3
 813  03c2 a114          	cp	a,#20
 814  03c4 251a          	jrult	L342
 815                     ; 357 		if (i.display_state == SETUP_NO){
 816  03c6 b607          	ld	a,_i+7
 817  03c8 a1ff          	cp	a,#255
 818  03ca 260e          	jrne	L542
 819                     ; 358 			i.display_state = SETUP_ZERO;
 820  03cc 3f07          	clr	_i+7
 821                     ; 359 			i.setupValue = e.zeroEn;
 822  03ce 45000b        	mov	_i+11,_e
 823                     ; 360 			i.timeSetupCounter = 60*10;
 824  03d1 ae0258        	ldw	x,#600
 825  03d4 bf00          	ldw	_i,x
 826                     ; 361 			displayRGBset(0);
 827  03d6 4f            	clr	a
 828  03d7 cd0000        	call	_displayRGBset
 830  03da               L542:
 831                     ; 363 		bitmaskclr(ki.bf,(S1_M+S2_M));
 832  03da b601          	ld	a,_ki+1
 833  03dc a4fc          	and	a,#252
 834  03de b701          	ld	_ki+1,a
 835  03e0               L342:
 836                     ; 365 }
 837  03e0 81            	ret
 839                     ; 368 void fastReleaseKey2(void)
 839                     ; 369 {
 840  03e1               _fastReleaseKey2:
 842                     ; 370 	if (ki.bf == S2_M){
 843  03e1 b601          	ld	a,_ki+1
 844  03e3 a102          	cp	a,#2
 845  03e5 260f          	jrne	L742
 846                     ; 371 		if (ki.lp_counter[S2] < 1*10){
 847  03e7 b603          	ld	a,_ki+3
 848  03e9 a10a          	cp	a,#10
 849  03eb 2409          	jruge	L742
 850                     ; 372 			if (i.display_state == SETUP_NO){
 851  03ed b607          	ld	a,_i+7
 852  03ef a1ff          	cp	a,#255
 853  03f1 2603          	jrne	L742
 854                     ; 373 				RGBtoggle();
 855  03f3 cd0000        	call	_RGBtoggle
 857  03f6               L742:
 858                     ; 377 }
 859  03f6 81            	ret
 861                     	xref.b	_i
 862                     	switch	.ubsct
 863  0000               _ki:
 864  0000 000000000000  	ds.b	6
 865                     	xdef	_ki
 866                     	xdef	_fastReleaseKey2
 867                     	xdef	_longpress_key1_2
 868                     	xdef	_longpress_key2
 869                     	xdef	_longpress_key1
 870                     	xdef	_event_single_key2
 871                     	xdef	_event_single_key1
 872                     	xref	_EEPROM_readByte
 873                     	xref	_EEPROM_writeByte
 874                     	xref.b	_e
 875                     	xref	_ds3231_write_time
 876                     	xref	_RGBtoggle
 877                     	xref	_iface_flag05sReset
 878                     	xref	_displayBset
 879                     	xref	_displayGset
 880                     	xref	_displayRset
 881                     	xref	_displayRGBset
 882                     	xref	_displaySetBright
 883                     	xref	_keyboard_get_key
 884                     	xdef	_keyevents_counters
 885                     	xdef	_keyevents_proc
 886                     	xdef	_keyevents_init
 887                     	end
