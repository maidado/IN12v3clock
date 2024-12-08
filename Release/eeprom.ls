   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 6 void EEPROM_dataInit(void)
  15                     ; 7 {
  16                     	scross	off
  17  0000               _EEPROM_dataInit:
  19                     ; 8 	e.rgbGlobalEn = EEPROM_readByte(RGB_EN_ADDR);
  20  0000 ae000f        	ldw	x,#15
  21  0003 cd01a7        	call	_EEPROM_readByte
  23  0006 b70b          	ld	_e+11,a
  24                     ; 9 	if (e.rgbGlobalEn > 1) {
  25  0008 b60b          	ld	a,_e+11
  26  000a a102          	cp	a,#2
  27  000c 250b          	jrult	L3
  28                     ; 10 		e.rgbGlobalEn = 0;
  29  000e 3f0b          	clr	_e+11
  30                     ; 11 		EEPROM_writeByte(RGB_EN_ADDR,e.rgbGlobalEn);
  31  0010 4b00          	push	#0
  32  0012 ae000f        	ldw	x,#15
  33  0015 cd015d        	call	_EEPROM_writeByte
  35  0018 84            	pop	a
  36  0019               L3:
  37                     ; 14 	e.zeroEn = EEPROM_readByte(ZERO_ADDR);
  38  0019 5f            	clrw	x
  39  001a cd01a7        	call	_EEPROM_readByte
  41  001d b700          	ld	_e,a
  42                     ; 15 	if (e.zeroEn > 1) {
  43  001f b600          	ld	a,_e
  44  0021 a102          	cp	a,#2
  45  0023 2509          	jrult	L5
  46                     ; 16 		e.zeroEn = 0;
  47  0025 3f00          	clr	_e
  48                     ; 17 		EEPROM_writeByte(ZERO_ADDR,e.zeroEn);
  49  0027 4b00          	push	#0
  50  0029 5f            	clrw	x
  51  002a cd015d        	call	_EEPROM_writeByte
  53  002d 84            	pop	a
  54  002e               L5:
  55                     ; 20 	e.f1224 = EEPROM_readByte(F1224_ADDR);
  56  002e ae0001        	ldw	x,#1
  57  0031 cd01a7        	call	_EEPROM_readByte
  59  0034 b701          	ld	_e+1,a
  60                     ; 21 	if (e.f1224) {														//disable, 12h time display is not working yet!
  61  0036 3d01          	tnz	_e+1
  62  0038 270b          	jreq	L7
  63                     ; 23 		e.f1224 = 0;
  64  003a 3f01          	clr	_e+1
  65                     ; 24 		EEPROM_writeByte(F1224_ADDR,e.f1224);
  66  003c 4b00          	push	#0
  67  003e ae0001        	ldw	x,#1
  68  0041 cd015d        	call	_EEPROM_writeByte
  70  0044 84            	pop	a
  71  0045               L7:
  72                     ; 27 	e.bright = EEPROM_readByte(BRIGHT_ADDR);
  73  0045 ae0002        	ldw	x,#2
  74  0048 cd01a7        	call	_EEPROM_readByte
  76  004b b702          	ld	_e+2,a
  77                     ; 28 	if ((e.bright > 100)||(e.bright < 5)) {
  78  004d b602          	ld	a,_e+2
  79  004f a165          	cp	a,#101
  80  0051 2406          	jruge	L31
  82  0053 b602          	ld	a,_e+2
  83  0055 a105          	cp	a,#5
  84  0057 240d          	jruge	L11
  85  0059               L31:
  86                     ; 29 		e.bright = 100;
  87  0059 35640002      	mov	_e+2,#100
  88                     ; 30 		EEPROM_writeByte(BRIGHT_ADDR,e.bright);
  89  005d 4b64          	push	#100
  90  005f ae0002        	ldw	x,#2
  91  0062 cd015d        	call	_EEPROM_writeByte
  93  0065 84            	pop	a
  94  0066               L11:
  95                     ; 33 	e.nBright = EEPROM_readByte(NIGHT_BR_ADDR);
  96  0066 ae0003        	ldw	x,#3
  97  0069 cd01a7        	call	_EEPROM_readByte
  99  006c b703          	ld	_e+3,a
 100                     ; 34 	if ((e.nBright > 100)||(e.nBright < 5)) {
 101  006e b603          	ld	a,_e+3
 102  0070 a165          	cp	a,#101
 103  0072 2406          	jruge	L71
 105  0074 b603          	ld	a,_e+3
 106  0076 a105          	cp	a,#5
 107  0078 240d          	jruge	L51
 108  007a               L71:
 109                     ; 35 		e.nBright = 100;
 110  007a 35640003      	mov	_e+3,#100
 111                     ; 36 		EEPROM_writeByte(NIGHT_BR_ADDR,e.nBright);
 112  007e 4b64          	push	#100
 113  0080 ae0003        	ldw	x,#3
 114  0083 cd015d        	call	_EEPROM_writeByte
 116  0086 84            	pop	a
 117  0087               L51:
 118                     ; 39 	e.nBrightEn = EEPROM_readByte(NIGHT_BR_EN_ADDR);
 119  0087 ae0004        	ldw	x,#4
 120  008a cd01a7        	call	_EEPROM_readByte
 122  008d b704          	ld	_e+4,a
 123                     ; 40 	if (e.nBrightEn > 1) {
 124  008f b604          	ld	a,_e+4
 125  0091 a102          	cp	a,#2
 126  0093 250b          	jrult	L12
 127                     ; 41 		e.nBrightEn = 0;
 128  0095 3f04          	clr	_e+4
 129                     ; 42 		EEPROM_writeByte(NIGHT_BR_EN_ADDR,e.nBrightEn);
 130  0097 4b00          	push	#0
 131  0099 ae0004        	ldw	x,#4
 132  009c cd015d        	call	_EEPROM_writeByte
 134  009f 84            	pop	a
 135  00a0               L12:
 136                     ; 45 	e.nBrightStartH = EEPROM_readByte(NIGHT_BR_START_H_ADDR);
 137  00a0 ae0005        	ldw	x,#5
 138  00a3 cd01a7        	call	_EEPROM_readByte
 140  00a6 b705          	ld	_e+5,a
 141                     ; 46 	if (e.f1224){
 142  00a8 3d01          	tnz	_e+1
 143  00aa 2713          	jreq	L32
 144                     ; 47 		if (e.nBrightStartH > 12) {
 145  00ac b605          	ld	a,_e+5
 146  00ae a10d          	cp	a,#13
 147  00b0 251e          	jrult	L72
 148                     ; 48 			e.nBrightStartH = 0;
 149  00b2 3f05          	clr	_e+5
 150                     ; 49 			EEPROM_writeByte(NIGHT_BR_START_H_ADDR,e.nBrightStartH);
 151  00b4 4b00          	push	#0
 152  00b6 ae0005        	ldw	x,#5
 153  00b9 cd015d        	call	_EEPROM_writeByte
 155  00bc 84            	pop	a
 156  00bd 2011          	jra	L72
 157  00bf               L32:
 158                     ; 52 		if (e.nBrightStartH > 23) {
 159  00bf b605          	ld	a,_e+5
 160  00c1 a118          	cp	a,#24
 161  00c3 250b          	jrult	L72
 162                     ; 53 			e.nBrightStartH = 0;
 163  00c5 3f05          	clr	_e+5
 164                     ; 54 			EEPROM_writeByte(NIGHT_BR_START_H_ADDR,e.nBrightStartH);
 165  00c7 4b00          	push	#0
 166  00c9 ae0005        	ldw	x,#5
 167  00cc cd015d        	call	_EEPROM_writeByte
 169  00cf 84            	pop	a
 170  00d0               L72:
 171                     ; 58 	e.nBrightStartM = EEPROM_readByte(NIGHT_BR_START_M_ADDR);
 172  00d0 ae0006        	ldw	x,#6
 173  00d3 cd01a7        	call	_EEPROM_readByte
 175  00d6 b706          	ld	_e+6,a
 176                     ; 59 	if (e.nBrightStartM > 59) {
 177  00d8 b606          	ld	a,_e+6
 178  00da a13c          	cp	a,#60
 179  00dc 250a          	jrult	L33
 180                     ; 60 		e.nBrightStartM = 0;
 181  00de 3f06          	clr	_e+6
 182                     ; 61 		EEPROM_writeByte(NIGHT_BR_START_M_ADDR,e.nBrightStartM);
 183  00e0 4b00          	push	#0
 184  00e2 ae0006        	ldw	x,#6
 185  00e5 ad76          	call	_EEPROM_writeByte
 187  00e7 84            	pop	a
 188  00e8               L33:
 189                     ; 64 	e.nBrightEndH = EEPROM_readByte(NIGHT_BR_STOP_H_ADDR);
 190  00e8 ae0007        	ldw	x,#7
 191  00eb cd01a7        	call	_EEPROM_readByte
 193  00ee b707          	ld	_e+7,a
 194                     ; 65 	if (e.f1224){
 195  00f0 3d01          	tnz	_e+1
 196  00f2 2712          	jreq	L53
 197                     ; 66 		if (e.nBrightEndH > 12) {
 198  00f4 b607          	ld	a,_e+7
 199  00f6 a10d          	cp	a,#13
 200  00f8 251c          	jrult	L14
 201                     ; 67 			e.nBrightEndH = 0;
 202  00fa 3f07          	clr	_e+7
 203                     ; 68 			EEPROM_writeByte(NIGHT_BR_STOP_H_ADDR,e.nBrightEndH);
 204  00fc 4b00          	push	#0
 205  00fe ae0007        	ldw	x,#7
 206  0101 ad5a          	call	_EEPROM_writeByte
 208  0103 84            	pop	a
 209  0104 2010          	jra	L14
 210  0106               L53:
 211                     ; 71 		if (e.nBrightEndH > 23) {
 212  0106 b607          	ld	a,_e+7
 213  0108 a118          	cp	a,#24
 214  010a 250a          	jrult	L14
 215                     ; 72 			e.nBrightEndH = 0;
 216  010c 3f07          	clr	_e+7
 217                     ; 73 			EEPROM_writeByte(NIGHT_BR_STOP_H_ADDR,e.nBrightEndH);
 218  010e 4b00          	push	#0
 219  0110 ae0007        	ldw	x,#7
 220  0113 ad48          	call	_EEPROM_writeByte
 222  0115 84            	pop	a
 223  0116               L14:
 224                     ; 77 	e.nBrightEndM = EEPROM_readByte(NIGHT_BR_STOP_M_ADDR);
 225  0116 ae0008        	ldw	x,#8
 226  0119 cd01a7        	call	_EEPROM_readByte
 228  011c b708          	ld	_e+8,a
 229                     ; 78 	if (e.nBrightEndM > 59) {
 230  011e b608          	ld	a,_e+8
 231  0120 a13c          	cp	a,#60
 232  0122 250a          	jrult	L54
 233                     ; 79 		e.nBrightEndM = 0;
 234  0124 3f08          	clr	_e+8
 235                     ; 80 		EEPROM_writeByte(NIGHT_BR_STOP_M_ADDR,e.nBrightEndM);
 236  0126 4b00          	push	#0
 237  0128 ae0008        	ldw	x,#8
 238  012b ad30          	call	_EEPROM_writeByte
 240  012d 84            	pop	a
 241  012e               L54:
 242                     ; 83 	e.rgbAtNightEn = EEPROM_readByte(NIGHT_RGB_EN_ADDR);
 243  012e ae0009        	ldw	x,#9
 244  0131 ad74          	call	_EEPROM_readByte
 246  0133 b709          	ld	_e+9,a
 247                     ; 84 	if (e.rgbAtNightEn > 1){
 248  0135 b609          	ld	a,_e+9
 249  0137 a102          	cp	a,#2
 250  0139 250a          	jrult	L74
 251                     ; 85 		e.rgbAtNightEn = 0;
 252  013b 3f09          	clr	_e+9
 253                     ; 86 		EEPROM_writeByte(NIGHT_RGB_EN_ADDR,e.rgbAtNightEn);
 254  013d 4b00          	push	#0
 255  013f ae0009        	ldw	x,#9
 256  0142 ad19          	call	_EEPROM_writeByte
 258  0144 84            	pop	a
 259  0145               L74:
 260                     ; 89 	e.antipoisoningAtNihgtOnly = EEPROM_readByte(ANTIPOISONING_AT_NIGHT_ONLY_ADDR);
 261  0145 ae000a        	ldw	x,#10
 262  0148 ad5d          	call	_EEPROM_readByte
 264  014a b70a          	ld	_e+10,a
 265                     ; 90 	if (e.antipoisoningAtNihgtOnly > 1){
 266  014c b60a          	ld	a,_e+10
 267  014e a102          	cp	a,#2
 268  0150 250a          	jrult	L15
 269                     ; 91 		e.antipoisoningAtNihgtOnly = 0;
 270  0152 3f0a          	clr	_e+10
 271                     ; 92 		EEPROM_writeByte(ANTIPOISONING_AT_NIGHT_ONLY_ADDR,e.antipoisoningAtNihgtOnly);
 272  0154 4b00          	push	#0
 273  0156 ae000a        	ldw	x,#10
 274  0159 ad02          	call	_EEPROM_writeByte
 276  015b 84            	pop	a
 277  015c               L15:
 278                     ; 94 }
 279  015c 81            	ret
 281                     ; 108 uint8_t EEPROM_writeByte(uint16_t logAddr, uint8_t data) {
 282  015d               _EEPROM_writeByte:
 283  015d 89            	pushw	x
 284  015e 5203          	subw	sp,#3
 285       00000003      OFST:	set	3
 287                     ; 110   uint16_t   addr = EEPROM_ADDR_START + logAddr;  // physical address 
 288  0160 1c4000        	addw	x,#16384
 289  0163 1f01          	ldw	(OFST-2,sp),x
 290                     ; 114   if (logAddr > EEPROM_SIZE)
 291  0165 1e04          	ldw	x,(OFST+1,sp)
 292  0167 a30081        	cpw	x,#129
 293  016a 2503          	jrult	L35
 294                     ; 115     return(0);
 295  016c 4f            	clr	a
 297  016d 2035          	jra	L21
 298  016f               L35:
 299                     ; 118   DISABLE_INTERRUPTS();
 301  016f 9b            sim
 303                     ; 121   sfr_FLASH.DUKR.byte = 0xAE;
 304  0170 35ae5064      	mov	20580,#174
 305                     ; 122   sfr_FLASH.DUKR.byte = 0x56;
 306  0174 35565064      	mov	20580,#86
 308  0178               L16:
 309                     ; 125   while(!sfr_FLASH.IAPSR.DUL);
 310  0178 c6505f        	ld	a,20575
 311  017b a508          	bcp	a,#8
 312  017d 27f9          	jreq	L16
 313                     ; 128   *((uint8_t*) addr) = data;
 314  017f 7b08          	ld	a,(OFST+5,sp)
 315  0181 1e01          	ldw	x,(OFST-2,sp)
 316  0183 f7            	ld	(x),a
 317                     ; 131   countTimeout = 100;                                // ~0.95us/inc -> ~0.1ms
 318  0184 a664          	ld	a,#100
 319  0186 6b03          	ld	(OFST+0,sp),a
 321  0188               L17:
 322                     ; 132   while ((!sfr_FLASH.IAPSR.EOP) && (countTimeout--));
 323  0188 c6505f        	ld	a,20575
 324  018b a504          	bcp	a,#4
 325  018d 2607          	jrne	L57
 327  018f 7b03          	ld	a,(OFST+0,sp)
 328  0191 0a03          	dec	(OFST+0,sp)
 329  0193 4d            	tnz	a
 330  0194 26f2          	jrne	L17
 331  0196               L57:
 332                     ; 135   sfr_FLASH.IAPSR.DUL = 0;
 333  0196 7217505f      	bres	20575,#3
 334                     ; 138   ENABLE_INTERRUPTS();
 336  019a 9a            rim
 338                     ; 141   return(countTimeout != 0);
 339  019b 0d03          	tnz	(OFST+0,sp)
 340  019d 2704          	jreq	L6
 341  019f a601          	ld	a,#1
 342  01a1 2001          	jra	L01
 343  01a3               L6:
 344  01a3 4f            	clr	a
 345  01a4               L01:
 347  01a4               L21:
 348  01a4 5b05          	addw	sp,#5
 349  01a6 81            	ret
 351                     ; 157 uint8_t EEPROM_readByte(uint16_t logAddr) {
 352  01a7               _EEPROM_readByte:
 353  01a7 89            	pushw	x
 354  01a8 89            	pushw	x
 355       00000002      OFST:	set	2
 357                     ; 159   uint16_t   addr = EEPROM_ADDR_START + logAddr;  // physical address 
 358  01a9 1c4000        	addw	x,#16384
 359  01ac 1f01          	ldw	(OFST-1,sp),x
 360                     ; 162   if (logAddr > EEPROM_SIZE)
 361  01ae 1e03          	ldw	x,(OFST+1,sp)
 362  01b0 a30081        	cpw	x,#129
 363  01b3 2504          	jrult	L77
 364                     ; 163     return(0xFF);
 365  01b5 a6ff          	ld	a,#255
 367  01b7 2003          	jra	L61
 368  01b9               L77:
 369                     ; 166   return(*((uint8_t*) addr));
 370  01b9 1e01          	ldw	x,(OFST-1,sp)
 371  01bb f6            	ld	a,(x)
 373  01bc               L61:
 374  01bc 5b04          	addw	sp,#4
 375  01be 81            	ret
 377                     	xdef	_EEPROM_readByte
 378                     	xdef	_EEPROM_writeByte
 379                     	xdef	_EEPROM_dataInit
 380                     	switch	.ubsct
 381  0000               _e:
 382  0000 000000000000  	ds.b	12
 383                     	xdef	_e
 384                     	end
