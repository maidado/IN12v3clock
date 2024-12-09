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
  58  002f cd01c2        	call	_event_single_key2
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
  81  004e cd0404        	call	_fastReleaseKey2
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
 176  00c1 cd0337        	call	_longpress_key1
 178                     ; 101 	longpress_key2();
 179  00c4 cd0390        	call	_longpress_key2
 181                     ; 102 	longpress_key1_2();
 182  00c7 cd03d8        	call	_longpress_key1_2
 184                     ; 103 }
 185  00ca 5b03          	addw	sp,#3
 186  00cc 81            	ret
 188                     .const:	section	.text
 189  0000               L02:
 190  0000 016d          	dc.w	L56
 191  0002 0169          	dc.w	L36
 192  0004 017b          	dc.w	L76
 193  0006 017b          	dc.w	L76
 194  0008 016d          	dc.w	L56
 195  000a 0192          	dc.w	L17
 196  000c 01ac          	dc.w	L37
 197  000e 0192          	dc.w	L17
 198  0010 01ac          	dc.w	L37
 199  0012 016d          	dc.w	L56
 200  0014 01b6          	dc.w	L101
 201  0016 014e          	dc.w	L55
 202  0018 0157          	dc.w	L75
 203  001a 0160          	dc.w	L16
 204  001c 00fc          	dc.w	L15
 205  001e 0131          	dc.w	L35
 206                     ; 105 void event_single_key1(void)
 206                     ; 106 {
 207                     	switch	.text
 208  00cd               _event_single_key1:
 210                     ; 107 	switch(i.display_state){
 211  00cd b607          	ld	a,_i+7
 213                     ; 190 		default:
 213                     ; 191 			break;
 214  00cf a110          	cp	a,#16
 215  00d1 2407          	jruge	L61
 216  00d3 5f            	clrw	x
 217  00d4 97            	ld	xl,a
 218  00d5 58            	sllw	x
 219  00d6 de0000        	ldw	x,(L02,x)
 220  00d9 fc            	jp	(x)
 221  00da               L61:
 222  00da 4c            	inc	a
 223  00db 2703          	jreq	L22
 224  00dd cc01b6        	jp	L101
 225  00e0               L22:
 226                     ; 108 		case SETUP_NO:
 226                     ; 109 				i.antipoisoningCurrentDigit = i.minutes&0x0F;
 227  00e0 b609          	ld	a,_i+9
 228  00e2 a40f          	and	a,#15
 229  00e4 b714          	ld	_i+20,a
 230                     ; 110 				if (--i.antipoisoningCurrentDigit  == 0xFF){
 231  00e6 3a14          	dec	_i+20
 232  00e8 b614          	ld	a,_i+20
 233  00ea a1ff          	cp	a,#255
 234  00ec 2604          	jrne	L301
 235                     ; 111 					i.antipoisoningCurrentDigit = 9;
 236  00ee 35090014      	mov	_i+20,#9
 237  00f2               L301:
 238                     ; 113 				i.antipoisoningEn = 1; 
 239  00f2 35010012      	mov	_i+18,#1
 240                     ; 114 				i.counter150ms = 0;
 241  00f6 3f11          	clr	_i+17
 242                     ; 115 			break;
 243  00f8 acb601b6      	jpf	L101
 244  00fc               L15:
 245                     ; 116 		case SETUP_HOURS:
 245                     ; 117 			iface_flag05sReset();
 246  00fc cd0000        	call	_iface_flag05sReset
 248                     ; 118 			++i.hoursSetupValue;
 249  00ff 3c0d          	inc	_i+13
 250                     ; 119 			if ((i.hoursSetupValue&0x0F) > 0x09){i.hoursSetupValue +=0x06;}
 251  0101 b60d          	ld	a,_i+13
 252  0103 a40f          	and	a,#15
 253  0105 a10a          	cp	a,#10
 254  0107 2506          	jrult	L501
 256  0109 b60d          	ld	a,_i+13
 257  010b ab06          	add	a,#6
 258  010d b70d          	ld	_i+13,a
 259  010f               L501:
 260                     ; 120 			if(e.f1224){
 261  010f 3d01          	tnz	_e+1
 262  0111 270f          	jreq	L701
 263                     ; 121 				if (i.hoursSetupValue > 0x12) 			{i.hoursSetupValue = 0;}
 264  0113 b60d          	ld	a,_i+13
 265  0115 a113          	cp	a,#19
 266  0117 2403          	jruge	L42
 267  0119 cc01b6        	jp	L101
 268  011c               L42:
 270  011c 3f0d          	clr	_i+13
 271  011e acb601b6      	jpf	L101
 272  0122               L701:
 273                     ; 123 				if (i.hoursSetupValue > 0x23) 			{i.hoursSetupValue = 0;}
 274  0122 b60d          	ld	a,_i+13
 275  0124 a124          	cp	a,#36
 276  0126 2403          	jruge	L62
 277  0128 cc01b6        	jp	L101
 278  012b               L62:
 280  012b 3f0d          	clr	_i+13
 281  012d acb601b6      	jpf	L101
 282  0131               L35:
 283                     ; 127 		case SETUP_MINUTES:
 283                     ; 128 			iface_flag05sReset();
 284  0131 cd0000        	call	_iface_flag05sReset
 286                     ; 129 			++i.minutesSetupValue;
 287  0134 3c0c          	inc	_i+12
 288                     ; 130 			if ((i.minutesSetupValue&0x0F) > 0x09){i.minutesSetupValue +=0x06;}
 289  0136 b60c          	ld	a,_i+12
 290  0138 a40f          	and	a,#15
 291  013a a10a          	cp	a,#10
 292  013c 2506          	jrult	L711
 294  013e b60c          	ld	a,_i+12
 295  0140 ab06          	add	a,#6
 296  0142 b70c          	ld	_i+12,a
 297  0144               L711:
 298                     ; 131 			if (i.minutesSetupValue > 0x59) 			{i.minutesSetupValue = 0;}
 299  0144 b60c          	ld	a,_i+12
 300  0146 a15a          	cp	a,#90
 301  0148 256c          	jrult	L101
 303  014a 3f0c          	clr	_i+12
 304  014c 2068          	jra	L101
 305  014e               L55:
 306                     ; 134 		case SETUP_R:
 306                     ; 135 			++i.setupValue;
 307  014e 3c0b          	inc	_i+11
 308                     ; 136 			displayRset(i.setupValue);
 309  0150 b60b          	ld	a,_i+11
 310  0152 cd0000        	call	_displayRset
 312                     ; 137 			break;
 313  0155 205f          	jra	L101
 314  0157               L75:
 315                     ; 139 		case SETUP_G:
 315                     ; 140 			++i.setupValue;
 316  0157 3c0b          	inc	_i+11
 317                     ; 141 			displayGset(i.setupValue);
 318  0159 b60b          	ld	a,_i+11
 319  015b cd0000        	call	_displayGset
 321                     ; 142 			break;
 322  015e 2056          	jra	L101
 323  0160               L16:
 324                     ; 144 		case SETUP_B:
 324                     ; 145 			++i.setupValue;
 325  0160 3c0b          	inc	_i+11
 326                     ; 146 			displayBset(i.setupValue);
 327  0162 b60b          	ld	a,_i+11
 328  0164 cd0000        	call	_displayBset
 330                     ; 147 			break;
 331  0167 204d          	jra	L101
 332  0169               L36:
 333                     ; 149 		case	SETUP_F1224:
 333                     ; 150 			i.setupValue = 0;	//todo disable, 12h time display is not working yet!
 334  0169 3f0b          	clr	_i+11
 335                     ; 151 			break;
 336  016b 2049          	jra	L101
 337  016d               L56:
 338                     ; 153 		case	SETUP_ZERO:
 338                     ; 154 		case  SETUP_NIGHT_BR_EN:
 338                     ; 155 		case	SETUP_NIGHT_RGB_EN:
 338                     ; 156 			if (i.setupValue){
 339  016d 3d0b          	tnz	_i+11
 340  016f 2704          	jreq	L321
 341                     ; 157 				i.setupValue = 0;
 342  0171 3f0b          	clr	_i+11
 344  0173 2041          	jra	L101
 345  0175               L321:
 346                     ; 159 				i.setupValue = 1;
 347  0175 3501000b      	mov	_i+11,#1
 348  0179 203b          	jra	L101
 349  017b               L76:
 350                     ; 163 		case SETUP_BRIGHT:
 350                     ; 164 		case SETUP_NIGHT_BR:
 350                     ; 165 			if(i.setupValue) {
 351  017b 3d0b          	tnz	_i+11
 352  017d 270c          	jreq	L721
 353                     ; 166 				i.setupValue--;
 354  017f 3a0b          	dec	_i+11
 355                     ; 167 				if (i.setupValue < 5){
 356  0181 b60b          	ld	a,_i+11
 357  0183 a105          	cp	a,#5
 358  0185 2404          	jruge	L721
 359                     ; 168 					i.setupValue = 100;
 360  0187 3564000b      	mov	_i+11,#100
 361  018b               L721:
 362                     ; 171 			displaySetBright(i.setupValue);
 363  018b b60b          	ld	a,_i+11
 364  018d cd0000        	call	_displaySetBright
 366                     ; 172 			break;
 367  0190 2024          	jra	L101
 368  0192               L17:
 369                     ; 174 		case SETUP_NIGHT_BR_START_H:
 369                     ; 175 		case SETUP_NIGHT_BR_END_H:
 369                     ; 176 			++i.setupValue;
 370  0192 3c0b          	inc	_i+11
 371                     ; 177 			if(e.f1224){
 372  0194 3d01          	tnz	_e+1
 373  0196 270a          	jreq	L331
 374                     ; 178 				if (i.setupValue > 12)			{i.setupValue=0;}
 375  0198 b60b          	ld	a,_i+11
 376  019a a10d          	cp	a,#13
 377  019c 2518          	jrult	L101
 379  019e 3f0b          	clr	_i+11
 380  01a0 2014          	jra	L101
 381  01a2               L331:
 382                     ; 180 				if (i.setupValue > 23)			{i.setupValue=0;}
 383  01a2 b60b          	ld	a,_i+11
 384  01a4 a118          	cp	a,#24
 385  01a6 250e          	jrult	L101
 387  01a8 3f0b          	clr	_i+11
 388  01aa 200a          	jra	L101
 389  01ac               L37:
 390                     ; 184 		case SETUP_NIGHT_BR_START_M:
 390                     ; 185 		case SETUP_NIGHT_BR_END_M:
 390                     ; 186 			++i.setupValue;
 391  01ac 3c0b          	inc	_i+11
 392                     ; 187 			if (i.setupValue > 59) 				{i.setupValue = 0;}
 393  01ae b60b          	ld	a,_i+11
 394  01b0 a13c          	cp	a,#60
 395  01b2 2502          	jrult	L101
 397  01b4 3f0b          	clr	_i+11
 398  01b6               L57:
 399                     ; 190 		default:
 399                     ; 191 			break;
 400  01b6               L101:
 401                     ; 193 	if (i.display_state!=SETUP_NO){
 402  01b6 b607          	ld	a,_i+7
 403  01b8 a1ff          	cp	a,#255
 404  01ba 2705          	jreq	L541
 405                     ; 194 		i.timeSetupCounter = 60*10;
 406  01bc ae0258        	ldw	x,#600
 407  01bf bf00          	ldw	_i,x
 408  01c1               L541:
 409                     ; 196 }
 410  01c1 81            	ret
 412                     	switch	.const
 413  0020               L43:
 414  0020 023d          	dc.w	L161
 415  0022 0251          	dc.w	L361
 416  0024 026c          	dc.w	L561
 417  0026 0287          	dc.w	L761
 418  0028 02a1          	dc.w	L171
 419  002a 02b6          	dc.w	L371
 420  002c 02ca          	dc.w	L571
 421  002e 02de          	dc.w	L771
 422  0030 02f2          	dc.w	L102
 423  0032 0306          	dc.w	L302
 424  0034 031a          	dc.w	L502
 425  0036 01f7          	dc.w	L351
 426  0038 020f          	dc.w	L551
 427  003a 0227          	dc.w	L751
 428  003c 01d6          	dc.w	L741
 429  003e 01de          	dc.w	L151
 430                     ; 199 void event_single_key2(void)
 430                     ; 200 {
 431                     	switch	.text
 432  01c2               _event_single_key2:
 433  01c2 88            	push	a
 434       00000001      OFST:	set	1
 436                     ; 201 	uint8_t seconds = 0;
 437  01c3 0f01          	clr	(OFST+0,sp)
 438                     ; 203 	switch (i.display_state){
 439  01c5 b607          	ld	a,_i+7
 441                     ; 313 			break;
 442  01c7 a110          	cp	a,#16
 443  01c9 2407          	jruge	L23
 444  01cb 5f            	clrw	x
 445  01cc 97            	ld	xl,a
 446  01cd 58            	sllw	x
 447  01ce de0020        	ldw	x,(L43,x)
 448  01d1 fc            	jp	(x)
 449  01d2               L23:
 450  01d2 ac310331      	jpf	L702
 451  01d6               L741:
 452                     ; 204 		case SETUP_HOURS:
 452                     ; 205 			i.display_state = SETUP_MINUTES;
 453  01d6 350f0007      	mov	_i+7,#15
 454                     ; 206 			break;
 455  01da ac350335      	jpf	L312
 456  01de               L151:
 457                     ; 208 		case SETUP_MINUTES:
 457                     ; 209 			ds3231_write_time(&seconds,&i.minutesSetupValue,&i.hoursSetupValue);
 458  01de ae000d        	ldw	x,#_i+13
 459  01e1 89            	pushw	x
 460  01e2 ae000c        	ldw	x,#_i+12
 461  01e5 89            	pushw	x
 462  01e6 96            	ldw	x,sp
 463  01e7 1c0005        	addw	x,#OFST+4
 464  01ea cd0000        	call	_ds3231_write_time
 466  01ed 5b04          	addw	sp,#4
 467                     ; 210 			i.display_state = SETUP_NO;
 468  01ef 35ff0007      	mov	_i+7,#255
 469                     ; 211 			break;
 470  01f3 ac350335      	jpf	L312
 471  01f7               L351:
 472                     ; 213 		case SETUP_R:
 472                     ; 214 			i.display_state++;
 473  01f7 3c07          	inc	_i+7
 474                     ; 215 			EEPROM_writeByte(R_ADDR,i.setupValue);
 475  01f9 3b000b        	push	_i+11
 476  01fc ae000b        	ldw	x,#11
 477  01ff cd0000        	call	_EEPROM_writeByte
 479  0202 84            	pop	a
 480                     ; 216 			i.setupValue = EEPROM_readByte(G_ADDR);
 481  0203 ae000c        	ldw	x,#12
 482  0206 cd0000        	call	_EEPROM_readByte
 484  0209 b70b          	ld	_i+11,a
 485                     ; 217 			break;
 486  020b ac350335      	jpf	L312
 487  020f               L551:
 488                     ; 219 		case SETUP_G:
 488                     ; 220 			i.display_state++;
 489  020f 3c07          	inc	_i+7
 490                     ; 221 			EEPROM_writeByte(G_ADDR,i.setupValue);
 491  0211 3b000b        	push	_i+11
 492  0214 ae000c        	ldw	x,#12
 493  0217 cd0000        	call	_EEPROM_writeByte
 495  021a 84            	pop	a
 496                     ; 222 			i.setupValue = EEPROM_readByte(B_ADDR);
 497  021b ae000d        	ldw	x,#13
 498  021e cd0000        	call	_EEPROM_readByte
 500  0221 b70b          	ld	_i+11,a
 501                     ; 223 			break;
 502  0223 ac350335      	jpf	L312
 503  0227               L751:
 504                     ; 225 		case SETUP_B:
 504                     ; 226 			i.display_state = SETUP_NO;
 505  0227 35ff0007      	mov	_i+7,#255
 506                     ; 227 			EEPROM_writeByte(B_ADDR,i.setupValue);
 507  022b 3b000b        	push	_i+11
 508  022e ae000d        	ldw	x,#13
 509  0231 cd0000        	call	_EEPROM_writeByte
 511  0234 84            	pop	a
 512                     ; 228 			bitmaskclr(ki.bf,S2_M);	//disable fast release key2 to prevent toggle RGB
 513  0235 72130001      	bres	_ki+1,#1
 514                     ; 229 			break;
 515  0239 ac350335      	jpf	L312
 516  023d               L161:
 517                     ; 231 		case SETUP_ZERO:
 517                     ; 232 			e.zeroEn = i.setupValue;
 518  023d 450b00        	mov	_e,_i+11
 519                     ; 233 			EEPROM_writeByte(ZERO_ADDR,e.zeroEn);
 520  0240 3b0000        	push	_e
 521  0243 5f            	clrw	x
 522  0244 cd0000        	call	_EEPROM_writeByte
 524  0247 84            	pop	a
 525                     ; 234 			i.display_state++;
 526  0248 3c07          	inc	_i+7
 527                     ; 235 			i.setupValue = e.f1224;
 528  024a 45010b        	mov	_i+11,_e+1
 529                     ; 236 			break;
 530  024d ac350335      	jpf	L312
 531  0251               L361:
 532                     ; 238 		case SETUP_F1224:
 532                     ; 239 			e.f1224 = i.setupValue;
 533  0251 450b01        	mov	_e+1,_i+11
 534                     ; 240 			EEPROM_writeByte(F1224_ADDR,e.f1224);
 535  0254 3b0001        	push	_e+1
 536  0257 ae0001        	ldw	x,#1
 537  025a cd0000        	call	_EEPROM_writeByte
 539  025d 84            	pop	a
 540                     ; 241 			i.display_state++;
 541  025e 3c07          	inc	_i+7
 542                     ; 242 			i.setupValue = e.bright;
 543  0260 45020b        	mov	_i+11,_e+2
 544                     ; 243 			displaySetBright(i.setupValue);
 545  0263 b60b          	ld	a,_i+11
 546  0265 cd0000        	call	_displaySetBright
 548                     ; 244 			break;
 549  0268 ac350335      	jpf	L312
 550  026c               L561:
 551                     ; 246 		case SETUP_BRIGHT:
 551                     ; 247 			i.display_state++;
 552  026c 3c07          	inc	_i+7
 553                     ; 248 			e.bright = i.setupValue;
 554  026e 450b02        	mov	_e+2,_i+11
 555                     ; 249 			EEPROM_writeByte(BRIGHT_ADDR,e.bright);
 556  0271 3b0002        	push	_e+2
 557  0274 ae0002        	ldw	x,#2
 558  0277 cd0000        	call	_EEPROM_writeByte
 560  027a 84            	pop	a
 561                     ; 250 			i.setupValue = e.nBright;
 562  027b 45030b        	mov	_i+11,_e+3
 563                     ; 251 			displaySetBright(i.setupValue);
 564  027e b60b          	ld	a,_i+11
 565  0280 cd0000        	call	_displaySetBright
 567                     ; 252 			break;
 568  0283 ac350335      	jpf	L312
 569  0287               L761:
 570                     ; 254 		case SETUP_NIGHT_BR:
 570                     ; 255 			e.nBright = i.setupValue;
 571  0287 450b03        	mov	_e+3,_i+11
 572                     ; 256 			EEPROM_writeByte(NIGHT_BR_ADDR,e.nBright);
 573  028a 3b0003        	push	_e+3
 574  028d ae0003        	ldw	x,#3
 575  0290 cd0000        	call	_EEPROM_writeByte
 577  0293 84            	pop	a
 578                     ; 257 			i.display_state++;
 579  0294 3c07          	inc	_i+7
 580                     ; 258 			i.setupValue = e.nBrightEn;
 581  0296 45040b        	mov	_i+11,_e+4
 582                     ; 259 			displaySetBright(100);
 583  0299 a664          	ld	a,#100
 584  029b cd0000        	call	_displaySetBright
 586                     ; 260 			break;
 587  029e cc0335        	jra	L312
 588  02a1               L171:
 589                     ; 262 		case SETUP_NIGHT_BR_EN:
 589                     ; 263 			e.nBrightEn = i.setupValue;
 590  02a1 450b04        	mov	_e+4,_i+11
 591                     ; 264 			EEPROM_writeByte(NIGHT_BR_EN_ADDR,e.nBrightEn);
 592  02a4 3b0004        	push	_e+4
 593  02a7 ae0004        	ldw	x,#4
 594  02aa cd0000        	call	_EEPROM_writeByte
 596  02ad 84            	pop	a
 597                     ; 265 			i.display_state++;
 598  02ae 3c07          	inc	_i+7
 599                     ; 266 			i.setupValue = e.nBrightStartH;
 600  02b0 45050b        	mov	_i+11,_e+5
 601                     ; 267 			break;
 602  02b3 cc0335        	jra	L312
 603  02b6               L371:
 604                     ; 269 		case SETUP_NIGHT_BR_START_H:
 604                     ; 270 			e.nBrightStartH = i.setupValue;
 605  02b6 450b05        	mov	_e+5,_i+11
 606                     ; 271 			EEPROM_writeByte(NIGHT_BR_START_H_ADDR,e.nBrightStartH);
 607  02b9 3b0005        	push	_e+5
 608  02bc ae0005        	ldw	x,#5
 609  02bf cd0000        	call	_EEPROM_writeByte
 611  02c2 84            	pop	a
 612                     ; 272 			i.display_state++;
 613  02c3 3c07          	inc	_i+7
 614                     ; 273 			i.setupValue = e.nBrightStartM;
 615  02c5 45060b        	mov	_i+11,_e+6
 616                     ; 274 			break;
 617  02c8 206b          	jra	L312
 618  02ca               L571:
 619                     ; 276 		case SETUP_NIGHT_BR_START_M:
 619                     ; 277 			e.nBrightStartM = i.setupValue;
 620  02ca 450b06        	mov	_e+6,_i+11
 621                     ; 278 			EEPROM_writeByte(NIGHT_BR_START_M_ADDR,e.nBrightStartM);
 622  02cd 3b0006        	push	_e+6
 623  02d0 ae0006        	ldw	x,#6
 624  02d3 cd0000        	call	_EEPROM_writeByte
 626  02d6 84            	pop	a
 627                     ; 279 			i.display_state++;
 628  02d7 3c07          	inc	_i+7
 629                     ; 280 			i.setupValue = e.nBrightEndH;
 630  02d9 45070b        	mov	_i+11,_e+7
 631                     ; 281 			break;
 632  02dc 2057          	jra	L312
 633  02de               L771:
 634                     ; 283 		case SETUP_NIGHT_BR_END_H:
 634                     ; 284 			e.nBrightEndH = i.setupValue;
 635  02de 450b07        	mov	_e+7,_i+11
 636                     ; 285 			EEPROM_writeByte(NIGHT_BR_STOP_H_ADDR,e.nBrightEndH);
 637  02e1 3b0007        	push	_e+7
 638  02e4 ae0007        	ldw	x,#7
 639  02e7 cd0000        	call	_EEPROM_writeByte
 641  02ea 84            	pop	a
 642                     ; 286 			i.display_state++;
 643  02eb 3c07          	inc	_i+7
 644                     ; 287 			i.setupValue = e.nBrightEndM;
 645  02ed 45080b        	mov	_i+11,_e+8
 646                     ; 288 			break;
 647  02f0 2043          	jra	L312
 648  02f2               L102:
 649                     ; 290 		case SETUP_NIGHT_BR_END_M:
 649                     ; 291 			e.nBrightEndM = i.setupValue;
 650  02f2 450b08        	mov	_e+8,_i+11
 651                     ; 292 			EEPROM_writeByte(NIGHT_BR_STOP_M_ADDR,e.nBrightEndM);
 652  02f5 3b0008        	push	_e+8
 653  02f8 ae0008        	ldw	x,#8
 654  02fb cd0000        	call	_EEPROM_writeByte
 656  02fe 84            	pop	a
 657                     ; 293 			i.display_state++;
 658  02ff 3c07          	inc	_i+7
 659                     ; 294 			i.setupValue = e.rgbAtNightEn;
 660  0301 45090b        	mov	_i+11,_e+9
 661                     ; 295 			break;
 662  0304 202f          	jra	L312
 663  0306               L302:
 664                     ; 297 		case SETUP_NIGHT_RGB_EN:
 664                     ; 298 			e.rgbAtNightEn = i.setupValue;
 665  0306 450b09        	mov	_e+9,_i+11
 666                     ; 299 			EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbAtNightEn);
 667  0309 3b0009        	push	_e+9
 668  030c ae0009        	ldw	x,#9
 669  030f cd0000        	call	_EEPROM_writeByte
 671  0312 84            	pop	a
 672                     ; 300 			i.display_state++;
 673  0313 3c07          	inc	_i+7
 674                     ; 301 			i.setupValue = e.antipoisoningAtNihgtOnly;
 675  0315 450a0b        	mov	_i+11,_e+10
 676                     ; 302 			break;
 677  0318 201b          	jra	L312
 678  031a               L502:
 679                     ; 304 		case SETUP_ANTIPOISONING_AT_NIGHT_ONLY:
 679                     ; 305 			e.antipoisoningAtNihgtOnly = i.setupValue;
 680  031a 450b0a        	mov	_e+10,_i+11
 681                     ; 306 			EEPROM_writeByte(ANTIPOISONING_AT_NIGHT_ONLY_ADDR,e.antipoisoningAtNihgtOnly);
 682  031d 3b000a        	push	_e+10
 683  0320 ae000a        	ldw	x,#10
 684  0323 cd0000        	call	_EEPROM_writeByte
 686  0326 84            	pop	a
 687                     ; 307 			i.display_state = SETUP_NO;
 688  0327 35ff0007      	mov	_i+7,#255
 689                     ; 308 			bitmaskclr(ki.bf,S2_M);	//disable fast release key2 to prevent toggle RGB
 690  032b 72130001      	bres	_ki+1,#1
 691                     ; 309 			break;
 692  032f 2004          	jra	L312
 693  0331               L702:
 694                     ; 311 		default:
 694                     ; 312 			i.display_state = SETUP_NO;
 695  0331 35ff0007      	mov	_i+7,#255
 696                     ; 313 			break;
 697  0335               L312:
 698                     ; 315 }
 699  0335 84            	pop	a
 700  0336 81            	ret
 702                     ; 317 void longpress_key1(void)
 702                     ; 318 {
 703  0337               _longpress_key1:
 705                     ; 319 	if (ki.bf == S1_M){
 706  0337 b601          	ld	a,_ki+1
 707  0339 a101          	cp	a,#1
 708  033b 2652          	jrne	L512
 709                     ; 320 		if (i.display_state == SETUP_NO){
 710  033d b607          	ld	a,_i+7
 711  033f a1ff          	cp	a,#255
 712  0341 2620          	jrne	L712
 713                     ; 321 			if (ki.lp_counter[S1] >= 2*10){
 714  0343 b602          	ld	a,_ki+2
 715  0345 a114          	cp	a,#20
 716  0347 2546          	jrult	L512
 717                     ; 322 				i.display_state = SETUP_HOURS;
 718  0349 350e0007      	mov	_i+7,#14
 719                     ; 323 				i.timeSetupCounter = 60*10;
 720  034d ae0258        	ldw	x,#600
 721  0350 bf00          	ldw	_i,x
 722                     ; 324 				i.hoursSetupValue = i.hours;
 723  0352 450a0d        	mov	_i+13,_i+10
 724                     ; 325 				i.minutesSetupValue = i.minutes;
 725  0355 45090c        	mov	_i+12,_i+9
 726                     ; 326 				displaySetBright(100);
 727  0358 a664          	ld	a,#100
 728  035a cd0000        	call	_displaySetBright
 730                     ; 327 				bitmaskclr(ki.bf,S1_M);
 731  035d 72110001      	bres	_ki+1,#0
 732  0361 202c          	jra	L512
 733  0363               L712:
 734                     ; 329 		}else if (i.display_state > SETUP_ZERO && i.display_state < SETUP_NO){
 735  0363 3d07          	tnz	_i+7
 736  0365 2728          	jreq	L512
 738  0367 b607          	ld	a,_i+7
 739  0369 a1ff          	cp	a,#255
 740  036b 2422          	jruge	L512
 741                     ; 330 			if (ki.lp_counter[S1] >= 18){
 742  036d b602          	ld	a,_ki+2
 743  036f a112          	cp	a,#18
 744  0371 250b          	jrult	L722
 745                     ; 331 				if(ki.kr_counter[S1] >= 1){
 746  0373 3d04          	tnz	_ki+4
 747  0375 2718          	jreq	L512
 748                     ; 332 					ki.kr_counter[S1] = 0;
 749  0377 3f04          	clr	_ki+4
 750                     ; 333 					event_single_key1 ();
 751  0379 cd00cd        	call	_event_single_key1
 753  037c 2011          	jra	L512
 754  037e               L722:
 755                     ; 335 			}else if (ki.lp_counter[S1] >= 8){
 756  037e b602          	ld	a,_ki+2
 757  0380 a108          	cp	a,#8
 758  0382 250b          	jrult	L512
 759                     ; 336 				if(ki.kr_counter[S1] >= 2){
 760  0384 b604          	ld	a,_ki+4
 761  0386 a102          	cp	a,#2
 762  0388 2505          	jrult	L512
 763                     ; 337 					ki.kr_counter[S1] = 0;
 764  038a 3f04          	clr	_ki+4
 765                     ; 338 					event_single_key1 ();
 766  038c cd00cd        	call	_event_single_key1
 768  038f               L512:
 769                     ; 343 }
 770  038f 81            	ret
 772                     ; 345 void longpress_key2(void)
 772                     ; 346 {
 773  0390               _longpress_key2:
 775                     ; 347 	if (ki.bf == S2_M){
 776  0390 b601          	ld	a,_ki+1
 777  0392 a102          	cp	a,#2
 778  0394 2641          	jrne	L142
 779                     ; 348 		if (i.display_state == SETUP_NO){
 780  0396 b607          	ld	a,_i+7
 781  0398 a1ff          	cp	a,#255
 782  039a 263b          	jrne	L142
 783                     ; 349 			if (ki.lp_counter[S2] >= 2*10){
 784  039c b603          	ld	a,_ki+3
 785  039e a114          	cp	a,#20
 786  03a0 2535          	jrult	L142
 787                     ; 350 				i.display_state = SETUP_R;
 788  03a2 350b0007      	mov	_i+7,#11
 789                     ; 351 				i.setupValue = EEPROM_readByte(R_ADDR);
 790  03a6 ae000b        	ldw	x,#11
 791  03a9 cd0000        	call	_EEPROM_readByte
 793  03ac b70b          	ld	_i+11,a
 794                     ; 352 				displayRset(EEPROM_readByte(R_ADDR));
 795  03ae ae000b        	ldw	x,#11
 796  03b1 cd0000        	call	_EEPROM_readByte
 798  03b4 cd0000        	call	_displayRset
 800                     ; 353 				displayGset(EEPROM_readByte(G_ADDR));
 801  03b7 ae000c        	ldw	x,#12
 802  03ba cd0000        	call	_EEPROM_readByte
 804  03bd cd0000        	call	_displayGset
 806                     ; 354 				displayBset(EEPROM_readByte(B_ADDR));
 807  03c0 ae000d        	ldw	x,#13
 808  03c3 cd0000        	call	_EEPROM_readByte
 810  03c6 cd0000        	call	_displayBset
 812                     ; 355 				i.timeSetupCounter = 60*10;
 813  03c9 ae0258        	ldw	x,#600
 814  03cc bf00          	ldw	_i,x
 815                     ; 356 				displaySetBright(100);
 816  03ce a664          	ld	a,#100
 817  03d0 cd0000        	call	_displaySetBright
 819                     ; 357 				bitmaskclr(ki.bf,S2_M);
 820  03d3 72130001      	bres	_ki+1,#1
 821  03d7               L142:
 822                     ; 361 }
 823  03d7 81            	ret
 825                     ; 363 void longpress_key1_2(void){
 826  03d8               _longpress_key1_2:
 828                     ; 364 	if ((ki.lp_counter[S1] >= 2*10)&&(ki.lp_counter[S2] >= 2*10)){
 829  03d8 b602          	ld	a,_ki+2
 830  03da a114          	cp	a,#20
 831  03dc 2525          	jrult	L742
 833  03de b603          	ld	a,_ki+3
 834  03e0 a114          	cp	a,#20
 835  03e2 251f          	jrult	L742
 836                     ; 365 		if (i.display_state == SETUP_NO){
 837  03e4 b607          	ld	a,_i+7
 838  03e6 a1ff          	cp	a,#255
 839  03e8 2613          	jrne	L152
 840                     ; 366 			i.display_state = SETUP_ZERO;
 841  03ea 3f07          	clr	_i+7
 842                     ; 367 			i.setupValue = e.zeroEn;
 843  03ec 45000b        	mov	_i+11,_e
 844                     ; 368 			i.timeSetupCounter = 60*10;
 845  03ef ae0258        	ldw	x,#600
 846  03f2 bf00          	ldw	_i,x
 847                     ; 369 			displayRGBset(0);
 848  03f4 4f            	clr	a
 849  03f5 cd0000        	call	_displayRGBset
 851                     ; 370 			displaySetBright(100);
 852  03f8 a664          	ld	a,#100
 853  03fa cd0000        	call	_displaySetBright
 855  03fd               L152:
 856                     ; 372 		bitmaskclr(ki.bf,(S1_M+S2_M));
 857  03fd b601          	ld	a,_ki+1
 858  03ff a4fc          	and	a,#252
 859  0401 b701          	ld	_ki+1,a
 860  0403               L742:
 861                     ; 374 }
 862  0403 81            	ret
 864                     ; 377 void fastReleaseKey2(void)
 864                     ; 378 {
 865  0404               _fastReleaseKey2:
 867                     ; 379 	if (ki.bf == S2_M){
 868  0404 b601          	ld	a,_ki+1
 869  0406 a102          	cp	a,#2
 870  0408 260f          	jrne	L352
 871                     ; 380 		if (ki.lp_counter[S2] < 1*10){
 872  040a b603          	ld	a,_ki+3
 873  040c a10a          	cp	a,#10
 874  040e 2409          	jruge	L352
 875                     ; 381 			if (i.display_state == SETUP_NO){
 876  0410 b607          	ld	a,_i+7
 877  0412 a1ff          	cp	a,#255
 878  0414 2603          	jrne	L352
 879                     ; 382 				RGBtoggle();
 880  0416 cd0000        	call	_RGBtoggle
 882  0419               L352:
 883                     ; 386 }
 884  0419 81            	ret
 886                     	xref.b	_i
 887                     	switch	.ubsct
 888  0000               _ki:
 889  0000 000000000000  	ds.b	6
 890                     	xdef	_ki
 891                     	xdef	_fastReleaseKey2
 892                     	xdef	_longpress_key1_2
 893                     	xdef	_longpress_key2
 894                     	xdef	_longpress_key1
 895                     	xdef	_event_single_key2
 896                     	xdef	_event_single_key1
 897                     	xref	_EEPROM_readByte
 898                     	xref	_EEPROM_writeByte
 899                     	xref.b	_e
 900                     	xref	_ds3231_write_time
 901                     	xref	_RGBtoggle
 902                     	xref	_iface_flag05sReset
 903                     	xref	_displayBset
 904                     	xref	_displayGset
 905                     	xref	_displayRset
 906                     	xref	_displayRGBset
 907                     	xref	_displaySetBright
 908                     	xref	_keyboard_get_key
 909                     	xdef	_keyevents_counters
 910                     	xdef	_keyevents_proc
 911                     	xdef	_keyevents_init
 912                     	end
