   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  17                     ; 87 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  17                     ; 88 {
  18                     	scross	off
  19  0000               _FLASH_Unlock:
  21                     ; 90   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  22                     ; 93   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
  23  0000 a1fd          	cp	a,#253
  24  0002 2609          	jrne	L3
  25                     ; 95     FLASH->PUKR = FLASH_RASS_KEY1;
  26  0004 35565062      	mov	20578,#86
  27                     ; 96     FLASH->PUKR = FLASH_RASS_KEY2;
  28  0008 35ae5062      	mov	20578,#174
  30  000c 81            	ret	
  31  000d               L3:
  32                     ; 101     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  33  000d 35ae5064      	mov	20580,#174
  34                     ; 102     FLASH->DUKR = FLASH_RASS_KEY1;
  35  0011 35565064      	mov	20580,#86
  36                     ; 104 }
  37  0015 81            	ret	
  39                     ; 112 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
  39                     ; 113 {
  40  0016               _FLASH_Lock:
  42                     ; 115   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  43                     ; 118   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
  44  0016 c4505f        	and	a,20575
  45  0019 c7505f        	ld	20575,a
  46                     ; 119 }
  47  001c 81            	ret	
  49                     ; 126 void FLASH_DeInit(void)
  49                     ; 127 {
  50  001d               _FLASH_DeInit:
  52                     ; 128   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
  53  001d 725f505a      	clr	20570
  54                     ; 129   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
  55  0021 725f505b      	clr	20571
  56                     ; 130   FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
  57  0025 35ff505c      	mov	20572,#255
  58                     ; 131   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
  59  0029 7217505f      	bres	20575,#3
  60                     ; 132   FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
  61  002d 7213505f      	bres	20575,#1
  62                     ; 133   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
  63  0031 c6505f        	ld	a,20575
  64                     ; 134 }
  65  0034 81            	ret	
  67                     ; 142 void FLASH_ITConfig(FunctionalState NewState)
  67                     ; 143 {
  68  0035               _FLASH_ITConfig:
  70                     ; 145   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  71                     ; 147   if(NewState != DISABLE)
  72  0035 4d            	tnz	a
  73  0036 2705          	jreq	L7
  74                     ; 149     FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
  75  0038 7212505a      	bset	20570,#1
  77  003c 81            	ret	
  78  003d               L7:
  79                     ; 153     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
  80  003d 7213505a      	bres	20570,#1
  81                     ; 155 }
  82  0041 81            	ret	
  84                     ; 164 void FLASH_EraseByte(uint32_t Address)
  84                     ; 165 {
  85  0042               _FLASH_EraseByte:
  86       00000000      OFST:	set	0
  88                     ; 167   assert_param(IS_FLASH_ADDRESS_OK(Address));
  89                     ; 170   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; 
  90  0042 1e05          	ldw	x,(OFST+5,sp)
  91  0044 7f            	clr	(x)
  92                     ; 171 }
  93  0045 81            	ret	
  95                     ; 181 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
  95                     ; 182 {
  96  0046               _FLASH_ProgramByte:
  97       00000000      OFST:	set	0
  99                     ; 184   assert_param(IS_FLASH_ADDRESS_OK(Address));
 100                     ; 185   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 101  0046 1e05          	ldw	x,(OFST+5,sp)
 102  0048 7b07          	ld	a,(OFST+7,sp)
 103  004a f7            	ld	(x),a
 104                     ; 186 }
 105  004b 81            	ret	
 107                     ; 195 uint8_t FLASH_ReadByte(uint32_t Address)
 107                     ; 196 {
 108  004c               _FLASH_ReadByte:
 109       00000000      OFST:	set	0
 111                     ; 198   assert_param(IS_FLASH_ADDRESS_OK(Address));
 112                     ; 201   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address); 
 113  004c 1e05          	ldw	x,(OFST+5,sp)
 114  004e f6            	ld	a,(x)
 116  004f 81            	ret	
 118                     ; 212 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 118                     ; 213 {
 119  0050               _FLASH_ProgramWord:
 120       00000000      OFST:	set	0
 122                     ; 215   assert_param(IS_FLASH_ADDRESS_OK(Address));
 123                     ; 218   FLASH->CR2 |= FLASH_CR2_WPRG;
 124  0050 721c505b      	bset	20571,#6
 125                     ; 219   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 126  0054 721d505c      	bres	20572,#6
 127                     ; 222   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));
 128  0058 1e05          	ldw	x,(OFST+5,sp)
 129  005a 7b07          	ld	a,(OFST+7,sp)
 130  005c f7            	ld	(x),a
 131                     ; 224   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data)+1); 
 132  005d 7b08          	ld	a,(OFST+8,sp)
 133  005f e701          	ld	(1,x),a
 134                     ; 226   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data)+2); 
 135  0061 7b09          	ld	a,(OFST+9,sp)
 136  0063 e702          	ld	(2,x),a
 137                     ; 228   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data)+3); 
 138  0065 7b0a          	ld	a,(OFST+10,sp)
 139  0067 e703          	ld	(3,x),a
 140                     ; 229 }
 141  0069 81            	ret	
 143                     ; 237 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 143                     ; 238 {
 144  006a               _FLASH_ProgramOptionByte:
 145  006a 89            	pushw	x
 146       00000000      OFST:	set	0
 148                     ; 240   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 149                     ; 243   FLASH->CR2 |= FLASH_CR2_OPT;
 150  006b 721e505b      	bset	20571,#7
 151                     ; 244   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 152  006f 721f505c      	bres	20572,#7
 153                     ; 247   if(Address == 0x4800)
 154  0073 a34800        	cpw	x,#18432
 155  0076 2605          	jrne	L31
 156                     ; 250     *((NEAR uint8_t*)Address) = Data;
 157  0078 7b05          	ld	a,(OFST+5,sp)
 158  007a f7            	ld	(x),a
 160  007b 2006          	jra	L51
 161  007d               L31:
 162                     ; 255     *((NEAR uint8_t*)Address) = Data;
 163  007d 7b05          	ld	a,(OFST+5,sp)
 164  007f f7            	ld	(x),a
 165                     ; 256     *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 166  0080 43            	cpl	a
 167  0081 e701          	ld	(1,x),a
 168  0083               L51:
 169                     ; 258   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 170  0083 a6fd          	ld	a,#253
 171  0085 cd014a        	call	_FLASH_WaitForLastOperation
 173                     ; 261   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 174  0088 721f505b      	bres	20571,#7
 175                     ; 262   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 176  008c 721e505c      	bset	20572,#7
 177                     ; 263 }
 178  0090 85            	popw	x
 179  0091 81            	ret	
 181                     ; 270 void FLASH_EraseOptionByte(uint16_t Address)
 181                     ; 271 {
 182  0092               _FLASH_EraseOptionByte:
 183  0092 89            	pushw	x
 184       00000000      OFST:	set	0
 186                     ; 273   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 187                     ; 276   FLASH->CR2 |= FLASH_CR2_OPT;
 188  0093 721e505b      	bset	20571,#7
 189                     ; 277   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 190  0097 721f505c      	bres	20572,#7
 191                     ; 280   if(Address == 0x4800)
 192  009b a34800        	cpw	x,#18432
 193  009e 2603          	jrne	L71
 194                     ; 283     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 195  00a0 7f            	clr	(x)
 197  00a1 2005          	jra	L12
 198  00a3               L71:
 199                     ; 288     *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 200  00a3 7f            	clr	(x)
 201                     ; 289     *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 202  00a4 a6ff          	ld	a,#255
 203  00a6 e701          	ld	(1,x),a
 204  00a8               L12:
 205                     ; 291   FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 206  00a8 a6fd          	ld	a,#253
 207  00aa cd014a        	call	_FLASH_WaitForLastOperation
 209                     ; 294   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 210  00ad 721f505b      	bres	20571,#7
 211                     ; 295   FLASH->NCR2 |= FLASH_NCR2_NOPT;
 212  00b1 721e505c      	bset	20572,#7
 213                     ; 296 }
 214  00b5 85            	popw	x
 215  00b6 81            	ret	
 217                     ; 303 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 217                     ; 304 {
 218  00b7               _FLASH_ReadOptionByte:
 219  00b7 5204          	subw	sp,#4
 220       00000004      OFST:	set	4
 222                     ; 305   uint8_t value_optbyte, value_optbyte_complement = 0;
 223                     ; 306   uint16_t res_value = 0;
 224                     ; 309   assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 225                     ; 311   value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 226  00b9 f6            	ld	a,(x)
 227  00ba 6b01          	ld	(OFST-3,sp),a
 228                     ; 312   value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 229  00bc e601          	ld	a,(1,x)
 230  00be 6b02          	ld	(OFST-2,sp),a
 231                     ; 315   if(Address == 0x4800)	 
 232  00c0 a34800        	cpw	x,#18432
 233  00c3 2606          	jrne	L32
 234                     ; 317     res_value =	 value_optbyte;
 235  00c5 7b01          	ld	a,(OFST-3,sp)
 236  00c7 5f            	clrw	x
 237  00c8 97            	ld	xl,a
 239  00c9 201c          	jra	L52
 240  00cb               L32:
 241                     ; 321     if(value_optbyte == (uint8_t)(~value_optbyte_complement))
 242  00cb 43            	cpl	a
 243  00cc 1101          	cp	a,(OFST-3,sp)
 244  00ce 2614          	jrne	L72
 245                     ; 323       res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 246  00d0 7b01          	ld	a,(OFST-3,sp)
 247  00d2 97            	ld	xl,a
 248  00d3 4f            	clr	a
 249  00d4 02            	rlwa	x,a
 250  00d5 1f03          	ldw	(OFST-1,sp),x
 251                     ; 324       res_value = res_value | (uint16_t)value_optbyte_complement;
 252  00d7 5f            	clrw	x
 253  00d8 7b02          	ld	a,(OFST-2,sp)
 254  00da 97            	ld	xl,a
 255  00db 01            	rrwa	x,a
 256  00dc 1a04          	or	a,(OFST+0,sp)
 257  00de 01            	rrwa	x,a
 258  00df 1a03          	or	a,(OFST-1,sp)
 259  00e1 01            	rrwa	x,a
 261  00e2 2003          	jra	L52
 262  00e4               L72:
 263                     ; 328       res_value = FLASH_OPTIONBYTE_ERROR;
 264  00e4 ae5555        	ldw	x,#21845
 265  00e7               L52:
 266                     ; 331   return(res_value);
 268  00e7 5b04          	addw	sp,#4
 269  00e9 81            	ret	
 271                     ; 340 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 271                     ; 341 {
 272  00ea               _FLASH_SetLowPowerMode:
 273  00ea 88            	push	a
 274       00000000      OFST:	set	0
 276                     ; 343   assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 277                     ; 346   FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 278  00eb c6505a        	ld	a,20570
 279  00ee a4f3          	and	a,#243
 280  00f0 c7505a        	ld	20570,a
 281                     ; 349   FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 282  00f3 c6505a        	ld	a,20570
 283  00f6 1a01          	or	a,(OFST+1,sp)
 284  00f8 c7505a        	ld	20570,a
 285                     ; 350 }
 286  00fb 84            	pop	a
 287  00fc 81            	ret	
 289                     ; 358 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 289                     ; 359 {
 290  00fd               _FLASH_SetProgrammingTime:
 292                     ; 361   assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 293                     ; 363   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 294  00fd 7211505a      	bres	20570,#0
 295                     ; 364   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 296  0101 ca505a        	or	a,20570
 297  0104 c7505a        	ld	20570,a
 298                     ; 365 }
 299  0107 81            	ret	
 301                     ; 372 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
 301                     ; 373 {
 302  0108               _FLASH_GetLowPowerMode:
 304                     ; 374   return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
 305  0108 c6505a        	ld	a,20570
 306  010b a40c          	and	a,#12
 308  010d 81            	ret	
 310                     ; 382 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 310                     ; 383 {
 311  010e               _FLASH_GetProgrammingTime:
 313                     ; 384   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 314  010e c6505a        	ld	a,20570
 315  0111 a401          	and	a,#1
 317  0113 81            	ret	
 319                     ; 392 uint32_t FLASH_GetBootSize(void)
 319                     ; 393 {
 320  0114               _FLASH_GetBootSize:
 321  0114 5204          	subw	sp,#4
 322       00000004      OFST:	set	4
 324                     ; 394   uint32_t temp = 0;
 325                     ; 397   temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
 326  0116 c6505d        	ld	a,20573
 327  0119 5f            	clrw	x
 328  011a 97            	ld	xl,a
 329  011b 90ae0200      	ldw	y,#512
 330  011f cd0000        	call	c_umul
 332  0122 96            	ldw	x,sp
 333  0123 5c            	incw	x
 334  0124 cd0000        	call	c_rtol
 336                     ; 400   if(FLASH->FPR == 0xFF)
 337  0127 c6505d        	ld	a,20573
 338  012a 4c            	inc	a
 339  012b 260d          	jrne	L33
 340                     ; 402     temp += 512;
 341  012d ae0200        	ldw	x,#512
 342  0130 bf02          	ldw	c_lreg+2,x
 343  0132 5f            	clrw	x
 344  0133 bf00          	ldw	c_lreg,x
 345  0135 96            	ldw	x,sp
 346  0136 5c            	incw	x
 347  0137 cd0000        	call	c_lgadd
 349  013a               L33:
 350                     ; 406   return(temp);
 351  013a 96            	ldw	x,sp
 352  013b 5c            	incw	x
 353  013c cd0000        	call	c_ltor
 356  013f 5b04          	addw	sp,#4
 357  0141 81            	ret	
 359                     ; 417 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
 359                     ; 418 {
 360  0142               _FLASH_GetFlagStatus:
 361       00000001      OFST:	set	1
 363                     ; 419   FlagStatus status = RESET;
 364                     ; 421   assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
 365                     ; 424   if((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
 366  0142 c4505f        	and	a,20575
 367  0145 2702          	jreq	L53
 368                     ; 426     status = SET; /* FLASH_FLAG is set */
 369  0147 a601          	ld	a,#1
 371  0149               L53:
 372                     ; 430     status = RESET; /* FLASH_FLAG is reset*/
 373                     ; 434   return status;
 375  0149 81            	ret	
 377                     ; 549 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
 377                     ; 550 {
 378  014a               _FLASH_WaitForLastOperation:
 379  014a 5203          	subw	sp,#3
 380       00000003      OFST:	set	3
 382                     ; 551   uint8_t flagstatus = 0x00;
 383  014c 0f03          	clr	(OFST+0,sp)
 384                     ; 552   uint16_t timeout = OPERATION_TIMEOUT;
 385  014e aeffff        	ldw	x,#65535
 386                     ; 576   UNUSED(FLASH_MemType);
 388  0151 2008          	jra	L34
 389  0153               L14:
 390                     ; 579     flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
 391  0153 c6505f        	ld	a,20575
 392  0156 a405          	and	a,#5
 393  0158 6b03          	ld	(OFST+0,sp),a
 394                     ; 580     timeout--;
 395  015a 5a            	decw	x
 396  015b               L34:
 397  015b 1f01          	ldw	(OFST-2,sp),x
 398                     ; 577   while((flagstatus == 0x00) && (timeout != 0x00))
 399  015d 7b03          	ld	a,(OFST+0,sp)
 400  015f 2603          	jrne	L74
 402  0161 5d            	tnzw	x
 403  0162 26ef          	jrne	L14
 404  0164               L74:
 405                     ; 584   if(timeout == 0x00 )
 406  0164 1e01          	ldw	x,(OFST-2,sp)
 407  0166 2602          	jrne	L15
 408                     ; 586     flagstatus = FLASH_STATUS_TIMEOUT;
 409  0168 a602          	ld	a,#2
 410  016a               L15:
 411                     ; 589   return((FLASH_Status_TypeDef)flagstatus);
 413  016a 5b03          	addw	sp,#3
 414  016c 81            	ret	
 416                     ; 599 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
 416                     ; 600 {
 417  016d               _FLASH_EraseBlock:
 418  016d 89            	pushw	x
 419  016e 5206          	subw	sp,#6
 420       00000006      OFST:	set	6
 422                     ; 601   uint32_t startaddress = 0;
 423                     ; 611   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 424                     ; 612   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 425  0170 7b0b          	ld	a,(OFST+5,sp)
 426  0172 a1fd          	cp	a,#253
 427  0174 2605          	jrne	L35
 428                     ; 614     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 429                     ; 615     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 430  0176 ae8000        	ldw	x,#32768
 432  0179 2003          	jra	L55
 433  017b               L35:
 434                     ; 619     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 435                     ; 620     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 436  017b ae4000        	ldw	x,#16384
 437  017e               L55:
 438  017e 1f05          	ldw	(OFST-1,sp),x
 439  0180 5f            	clrw	x
 440  0181 1f03          	ldw	(OFST-3,sp),x
 441                     ; 628     pwFlash = (PointerAttr uint32_t *)(MemoryAddressCast)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
 442  0183 a640          	ld	a,#64
 443  0185 1e07          	ldw	x,(OFST+1,sp)
 444  0187 cd0000        	call	c_cmulx
 446  018a 96            	ldw	x,sp
 447  018b 1c0003        	addw	x,#OFST-3
 448  018e cd0000        	call	c_ladd
 450  0191 be02          	ldw	x,c_lreg+2
 451  0193 1f01          	ldw	(OFST-5,sp),x
 452                     ; 632   FLASH->CR2 |= FLASH_CR2_ERASE;
 453  0195 721a505b      	bset	20571,#5
 454                     ; 633   FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
 455  0199 721b505c      	bres	20572,#5
 456                     ; 637     *pwFlash = (uint32_t)0;
 457  019d 4f            	clr	a
 458  019e e703          	ld	(3,x),a
 459  01a0 e702          	ld	(2,x),a
 460  01a2 e701          	ld	(1,x),a
 461  01a4 f7            	ld	(x),a
 462                     ; 645 }
 463  01a5 5b08          	addw	sp,#8
 464  01a7 81            	ret	
 466                     ; 656 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
 466                     ; 657                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
 466                     ; 658 {
 467  01a8               _FLASH_ProgramBlock:
 468  01a8 89            	pushw	x
 469  01a9 5206          	subw	sp,#6
 470       00000006      OFST:	set	6
 472                     ; 659   uint16_t Count = 0;
 473                     ; 660   uint32_t startaddress = 0;
 474                     ; 663   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 475                     ; 664   assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
 476                     ; 665   if(FLASH_MemType == FLASH_MEMTYPE_PROG)
 477  01ab 7b0b          	ld	a,(OFST+5,sp)
 478  01ad a1fd          	cp	a,#253
 479  01af 2605          	jrne	L75
 480                     ; 667     assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
 481                     ; 668     startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
 482  01b1 ae8000        	ldw	x,#32768
 484  01b4 2003          	jra	L16
 485  01b6               L75:
 486                     ; 672     assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
 487                     ; 673     startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
 488  01b6 ae4000        	ldw	x,#16384
 489  01b9               L16:
 490  01b9 1f03          	ldw	(OFST-3,sp),x
 491  01bb 5f            	clrw	x
 492  01bc 1f01          	ldw	(OFST-5,sp),x
 493                     ; 677   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
 494  01be a640          	ld	a,#64
 495  01c0 1e07          	ldw	x,(OFST+1,sp)
 496  01c2 cd0000        	call	c_cmulx
 498  01c5 96            	ldw	x,sp
 499  01c6 5c            	incw	x
 500  01c7 cd0000        	call	c_lgadd
 502                     ; 680   if(FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
 503  01ca 7b0c          	ld	a,(OFST+6,sp)
 504  01cc 260a          	jrne	L36
 505                     ; 683     FLASH->CR2 |= FLASH_CR2_PRG;
 506  01ce 7210505b      	bset	20571,#0
 507                     ; 684     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
 508  01d2 7211505c      	bres	20572,#0
 510  01d6 2008          	jra	L56
 511  01d8               L36:
 512                     ; 689     FLASH->CR2 |= FLASH_CR2_FPRG;
 513  01d8 7218505b      	bset	20571,#4
 514                     ; 690     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
 515  01dc 7219505c      	bres	20572,#4
 516  01e0               L56:
 517                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 518  01e0 5f            	clrw	x
 519  01e1 1f05          	ldw	(OFST-1,sp),x
 520  01e3               L76:
 521                     ; 696     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
 522  01e3 1e0d          	ldw	x,(OFST+7,sp)
 523  01e5 72fb05        	addw	x,(OFST-1,sp)
 524  01e8 f6            	ld	a,(x)
 525  01e9 1e03          	ldw	x,(OFST-3,sp)
 526  01eb 72fb05        	addw	x,(OFST-1,sp)
 527  01ee f7            	ld	(x),a
 528                     ; 694   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
 529  01ef 1e05          	ldw	x,(OFST-1,sp)
 530  01f1 5c            	incw	x
 531  01f2 1f05          	ldw	(OFST-1,sp),x
 533  01f4 a30040        	cpw	x,#64
 534  01f7 25ea          	jrult	L76
 535                     ; 698 }
 536  01f9 5b08          	addw	sp,#8
 537  01fb 81            	ret	
 539                     	xdef	_FLASH_WaitForLastOperation
 540                     	xdef	_FLASH_ProgramBlock
 541                     	xdef	_FLASH_EraseBlock
 542                     	xdef	_FLASH_GetFlagStatus
 543                     	xdef	_FLASH_GetBootSize
 544                     	xdef	_FLASH_GetProgrammingTime
 545                     	xdef	_FLASH_GetLowPowerMode
 546                     	xdef	_FLASH_SetProgrammingTime
 547                     	xdef	_FLASH_SetLowPowerMode
 548                     	xdef	_FLASH_EraseOptionByte
 549                     	xdef	_FLASH_ProgramOptionByte
 550                     	xdef	_FLASH_ReadOptionByte
 551                     	xdef	_FLASH_ProgramWord
 552                     	xdef	_FLASH_ReadByte
 553                     	xdef	_FLASH_ProgramByte
 554                     	xdef	_FLASH_EraseByte
 555                     	xdef	_FLASH_ITConfig
 556                     	xdef	_FLASH_DeInit
 557                     	xdef	_FLASH_Lock
 558                     	xdef	_FLASH_Unlock
 559                     	xref.b	c_lreg
 560                     	xref.b	c_x
 561                     	xref.b	c_y
 562                     	xref	c_ladd
 563                     	xref	c_cmulx
 564                     	xref	c_ltor
 565                     	xref	c_lgadd
 566                     	xref	c_rtol
 567                     	xref	c_umul
 568                     	end
