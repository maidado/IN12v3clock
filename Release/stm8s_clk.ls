   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  32                     ; 72 void CLK_DeInit(void)
  32                     ; 73 {
  33                     	scross	off
  34                     	switch	.text
  35  0000               _CLK_DeInit:
  37                     ; 74   CLK->ICKR = CLK_ICKR_RESET_VALUE;
  38  0000 350150c0      	mov	20672,#1
  39                     ; 75   CLK->ECKR = CLK_ECKR_RESET_VALUE;
  40  0004 725f50c1      	clr	20673
  41                     ; 76   CLK->SWR  = CLK_SWR_RESET_VALUE;
  42  0008 35e150c4      	mov	20676,#225
  43                     ; 77   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  44  000c 725f50c5      	clr	20677
  45                     ; 78   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  46  0010 351850c6      	mov	20678,#24
  47                     ; 79   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  48  0014 35ff50c7      	mov	20679,#255
  49                     ; 80   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  50  0018 35ff50ca      	mov	20682,#255
  51                     ; 81   CLK->CSSR = CLK_CSSR_RESET_VALUE;
  52  001c 725f50c8      	clr	20680
  53                     ; 82   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  54  0020 725f50c9      	clr	20681
  56  0024               L7:
  57                     ; 83   while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  58  0024 720050c9fb    	btjt	20681,#0,L7
  59                     ; 85   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  60  0029 725f50c9      	clr	20681
  61                     ; 86   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  62  002d 725f50cc      	clr	20684
  63                     ; 87   CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
  64  0031 725f50cd      	clr	20685
  65                     ; 88 }
  66  0035 81            	ret	
  68                     ; 99 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
  68                     ; 100 {
  69  0036               _CLK_FastHaltWakeUpCmd:
  71                     ; 102   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  72                     ; 104   if (NewState != DISABLE)
  73  0036 4d            	tnz	a
  74  0037 2705          	jreq	L31
  75                     ; 107     CLK->ICKR |= CLK_ICKR_FHWU;
  76  0039 721450c0      	bset	20672,#2
  78  003d 81            	ret	
  79  003e               L31:
  80                     ; 112     CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
  81  003e 721550c0      	bres	20672,#2
  82                     ; 114 }
  83  0042 81            	ret	
  85                     ; 121 void CLK_HSECmd(FunctionalState NewState)
  85                     ; 122 {
  86  0043               _CLK_HSECmd:
  88                     ; 124   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  89                     ; 126   if (NewState != DISABLE)
  90  0043 4d            	tnz	a
  91  0044 2705          	jreq	L71
  92                     ; 129     CLK->ECKR |= CLK_ECKR_HSEEN;
  93  0046 721050c1      	bset	20673,#0
  95  004a 81            	ret	
  96  004b               L71:
  97                     ; 134     CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
  98  004b 721150c1      	bres	20673,#0
  99                     ; 136 }
 100  004f 81            	ret	
 102                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 102                     ; 144 {
 103  0050               _CLK_HSICmd:
 105                     ; 146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 106                     ; 148   if (NewState != DISABLE)
 107  0050 4d            	tnz	a
 108  0051 2705          	jreq	L32
 109                     ; 151     CLK->ICKR |= CLK_ICKR_HSIEN;
 110  0053 721050c0      	bset	20672,#0
 112  0057 81            	ret	
 113  0058               L32:
 114                     ; 156     CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 115  0058 721150c0      	bres	20672,#0
 116                     ; 158 }
 117  005c 81            	ret	
 119                     ; 166 void CLK_LSICmd(FunctionalState NewState)
 119                     ; 167 {
 120  005d               _CLK_LSICmd:
 122                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 123                     ; 171   if (NewState != DISABLE)
 124  005d 4d            	tnz	a
 125  005e 2705          	jreq	L72
 126                     ; 174     CLK->ICKR |= CLK_ICKR_LSIEN;
 127  0060 721650c0      	bset	20672,#3
 129  0064 81            	ret	
 130  0065               L72:
 131                     ; 179     CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 132  0065 721750c0      	bres	20672,#3
 133                     ; 181 }
 134  0069 81            	ret	
 136                     ; 189 void CLK_CCOCmd(FunctionalState NewState)
 136                     ; 190 {
 137  006a               _CLK_CCOCmd:
 139                     ; 192   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 140                     ; 194   if (NewState != DISABLE)
 141  006a 4d            	tnz	a
 142  006b 2705          	jreq	L33
 143                     ; 197     CLK->CCOR |= CLK_CCOR_CCOEN;
 144  006d 721050c9      	bset	20681,#0
 146  0071 81            	ret	
 147  0072               L33:
 148                     ; 202     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 149  0072 721150c9      	bres	20681,#0
 150                     ; 204 }
 151  0076 81            	ret	
 153                     ; 213 void CLK_ClockSwitchCmd(FunctionalState NewState)
 153                     ; 214 {
 154  0077               _CLK_ClockSwitchCmd:
 156                     ; 216   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 157                     ; 218   if (NewState != DISABLE )
 158  0077 4d            	tnz	a
 159  0078 2705          	jreq	L73
 160                     ; 221     CLK->SWCR |= CLK_SWCR_SWEN;
 161  007a 721250c5      	bset	20677,#1
 163  007e 81            	ret	
 164  007f               L73:
 165                     ; 226     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 166  007f 721350c5      	bres	20677,#1
 167                     ; 228 }
 168  0083 81            	ret	
 170                     ; 238 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 170                     ; 239 {
 171  0084               _CLK_SlowActiveHaltWakeUpCmd:
 173                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 174                     ; 243   if (NewState != DISABLE)
 175  0084 4d            	tnz	a
 176  0085 2705          	jreq	L34
 177                     ; 246     CLK->ICKR |= CLK_ICKR_SWUAH;
 178  0087 721a50c0      	bset	20672,#5
 180  008b 81            	ret	
 181  008c               L34:
 182                     ; 251     CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 183  008c 721b50c0      	bres	20672,#5
 184                     ; 253 }
 185  0090 81            	ret	
 187                     ; 263 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 187                     ; 264 {
 188  0091               _CLK_PeripheralClockConfig:
 189  0091 89            	pushw	x
 190       00000000      OFST:	set	0
 192                     ; 266   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 193                     ; 267   assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 194                     ; 269   if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 195  0092 9e            	ld	a,xh
 196  0093 a510          	bcp	a,#16
 197  0095 2630          	jrne	L74
 198                     ; 271     if (NewState != DISABLE)
 199  0097 7b02          	ld	a,(OFST+2,sp)
 200  0099 2714          	jreq	L15
 201                     ; 274       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 202  009b 7b01          	ld	a,(OFST+1,sp)
 203  009d a40f          	and	a,#15
 204  009f 5f            	clrw	x
 205  00a0 97            	ld	xl,a
 206  00a1 a601          	ld	a,#1
 207  00a3 5d            	tnzw	x
 208  00a4 2704          	jreq	L42
 209  00a6               L62:
 210  00a6 48            	sll	a
 211  00a7 5a            	decw	x
 212  00a8 26fc          	jrne	L62
 213  00aa               L42:
 214  00aa ca50c7        	or	a,20679
 216  00ad 2013          	jp	LC002
 217  00af               L15:
 218                     ; 279       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 219  00af 7b01          	ld	a,(OFST+1,sp)
 220  00b1 a40f          	and	a,#15
 221  00b3 5f            	clrw	x
 222  00b4 97            	ld	xl,a
 223  00b5 a601          	ld	a,#1
 224  00b7 5d            	tnzw	x
 225  00b8 2704          	jreq	L03
 226  00ba               L23:
 227  00ba 48            	sll	a
 228  00bb 5a            	decw	x
 229  00bc 26fc          	jrne	L23
 230  00be               L03:
 231  00be 43            	cpl	a
 232  00bf c450c7        	and	a,20679
 233  00c2               LC002:
 234  00c2 c750c7        	ld	20679,a
 235  00c5 202e          	jra	L55
 236  00c7               L74:
 237                     ; 284     if (NewState != DISABLE)
 238  00c7 7b02          	ld	a,(OFST+2,sp)
 239  00c9 2714          	jreq	L75
 240                     ; 287       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 241  00cb 7b01          	ld	a,(OFST+1,sp)
 242  00cd a40f          	and	a,#15
 243  00cf 5f            	clrw	x
 244  00d0 97            	ld	xl,a
 245  00d1 a601          	ld	a,#1
 246  00d3 5d            	tnzw	x
 247  00d4 2704          	jreq	L43
 248  00d6               L63:
 249  00d6 48            	sll	a
 250  00d7 5a            	decw	x
 251  00d8 26fc          	jrne	L63
 252  00da               L43:
 253  00da ca50ca        	or	a,20682
 255  00dd 2013          	jp	LC001
 256  00df               L75:
 257                     ; 292       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 258  00df 7b01          	ld	a,(OFST+1,sp)
 259  00e1 a40f          	and	a,#15
 260  00e3 5f            	clrw	x
 261  00e4 97            	ld	xl,a
 262  00e5 a601          	ld	a,#1
 263  00e7 5d            	tnzw	x
 264  00e8 2704          	jreq	L04
 265  00ea               L24:
 266  00ea 48            	sll	a
 267  00eb 5a            	decw	x
 268  00ec 26fc          	jrne	L24
 269  00ee               L04:
 270  00ee 43            	cpl	a
 271  00ef c450ca        	and	a,20682
 272  00f2               LC001:
 273  00f2 c750ca        	ld	20682,a
 274  00f5               L55:
 275                     ; 295 }
 276  00f5 85            	popw	x
 277  00f6 81            	ret	
 279                     ; 309 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 279                     ; 310 {
 280  00f7               _CLK_ClockSwitchConfig:
 281  00f7 89            	pushw	x
 282  00f8 5204          	subw	sp,#4
 283       00000004      OFST:	set	4
 285                     ; 312   uint16_t DownCounter = CLK_TIMEOUT;
 286  00fa aeffff        	ldw	x,#65535
 287  00fd 1f03          	ldw	(OFST-1,sp),x
 288                     ; 313   ErrorStatus Swif = ERROR;
 289                     ; 316   assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
 290                     ; 317   assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
 291                     ; 318   assert_param(IS_FUNCTIONALSTATE_OK(ITState));
 292                     ; 319   assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
 293                     ; 322   clock_master = (CLK_Source_TypeDef)CLK->CMSR;
 294  00ff c650c3        	ld	a,20675
 295  0102 6b01          	ld	(OFST-3,sp),a
 296                     ; 325   if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
 297  0104 7b05          	ld	a,(OFST+1,sp)
 298  0106 4a            	dec	a
 299  0107 263d          	jrne	L36
 300                     ; 328     CLK->SWCR |= CLK_SWCR_SWEN;
 301  0109 721250c5      	bset	20677,#1
 302                     ; 331     if (ITState != DISABLE)
 303  010d 7b09          	ld	a,(OFST+5,sp)
 304  010f 2706          	jreq	L56
 305                     ; 333       CLK->SWCR |= CLK_SWCR_SWIEN;
 306  0111 721450c5      	bset	20677,#2
 308  0115 2004          	jra	L76
 309  0117               L56:
 310                     ; 337       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
 311  0117 721550c5      	bres	20677,#2
 312  011b               L76:
 313                     ; 341     CLK->SWR = (uint8_t)CLK_NewClock;
 314  011b 7b06          	ld	a,(OFST+2,sp)
 315  011d c750c4        	ld	20676,a
 317  0120 2003          	jra	L57
 318  0122               L17:
 319                     ; 346       DownCounter--;
 320  0122 5a            	decw	x
 321  0123 1f03          	ldw	(OFST-1,sp),x
 322  0125               L57:
 323                     ; 344     while((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
 324  0125 720150c504    	btjf	20677,#0,L101
 326  012a 1e03          	ldw	x,(OFST-1,sp)
 327  012c 26f4          	jrne	L17
 328  012e               L101:
 329                     ; 349     if(DownCounter != 0)
 330  012e 1e03          	ldw	x,(OFST-1,sp)
 331                     ; 351       Swif = SUCCESS;
 333  0130 263d          	jrne	LC004
 334  0132               L301:
 335                     ; 355       Swif = ERROR;
 336  0132 0f02          	clr	(OFST-2,sp)
 337  0134               L701:
 338                     ; 390   if(Swif != ERROR)
 339  0134 275d          	jreq	L331
 340                     ; 393     if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
 341  0136 7b0a          	ld	a,(OFST+6,sp)
 342  0138 263b          	jrne	L531
 344  013a 7b01          	ld	a,(OFST-3,sp)
 345  013c a1e1          	cp	a,#225
 346  013e 2635          	jrne	L531
 347                     ; 395       CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 348  0140 721150c0      	bres	20672,#0
 350  0144 204d          	jra	L331
 351  0146               L36:
 352                     ; 361     if (ITState != DISABLE)
 353  0146 7b09          	ld	a,(OFST+5,sp)
 354  0148 2706          	jreq	L111
 355                     ; 363       CLK->SWCR |= CLK_SWCR_SWIEN;
 356  014a 721450c5      	bset	20677,#2
 358  014e 2004          	jra	L311
 359  0150               L111:
 360                     ; 367       CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
 361  0150 721550c5      	bres	20677,#2
 362  0154               L311:
 363                     ; 371     CLK->SWR = (uint8_t)CLK_NewClock;
 364  0154 7b06          	ld	a,(OFST+2,sp)
 365  0156 c750c4        	ld	20676,a
 367  0159 2003          	jra	L121
 368  015b               L511:
 369                     ; 376       DownCounter--;
 370  015b 5a            	decw	x
 371  015c 1f03          	ldw	(OFST-1,sp),x
 372  015e               L121:
 373                     ; 374     while((((CLK->SWCR & CLK_SWCR_SWIF) != 0 ) && (DownCounter != 0)))
 374  015e 720750c504    	btjf	20677,#3,L521
 376  0163 1e03          	ldw	x,(OFST-1,sp)
 377  0165 26f4          	jrne	L511
 378  0167               L521:
 379                     ; 379     if(DownCounter != 0)
 380  0167 1e03          	ldw	x,(OFST-1,sp)
 381  0169 27c7          	jreq	L301
 382                     ; 382       CLK->SWCR |= CLK_SWCR_SWEN;
 383  016b 721250c5      	bset	20677,#1
 384                     ; 383       Swif = SUCCESS;
 385  016f               LC004:
 386  016f a601          	ld	a,#1
 387  0171 6b02          	ld	(OFST-2,sp),a
 389  0173 20bf          	jra	L701
 390                     ; 387       Swif = ERROR;
 391  0175               L531:
 392                     ; 397     else if((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
 393  0175 7b0a          	ld	a,(OFST+6,sp)
 394  0177 260c          	jrne	L141
 396  0179 7b01          	ld	a,(OFST-3,sp)
 397  017b a1d2          	cp	a,#210
 398  017d 2606          	jrne	L141
 399                     ; 399       CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 400  017f 721750c0      	bres	20672,#3
 402  0183 200e          	jra	L331
 403  0185               L141:
 404                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
 405  0185 7b0a          	ld	a,(OFST+6,sp)
 406  0187 260a          	jrne	L331
 408  0189 7b01          	ld	a,(OFST-3,sp)
 409  018b a1b4          	cp	a,#180
 410  018d 2604          	jrne	L331
 411                     ; 403       CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 412  018f 721150c1      	bres	20673,#0
 413  0193               L331:
 414                     ; 406   return(Swif);
 415  0193 7b02          	ld	a,(OFST-2,sp)
 417  0195 5b06          	addw	sp,#6
 418  0197 81            	ret	
 420                     ; 415 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
 420                     ; 416 {
 421  0198               _CLK_HSIPrescalerConfig:
 422  0198 88            	push	a
 423       00000000      OFST:	set	0
 425                     ; 418   assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
 426                     ; 421   CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 427  0199 c650c6        	ld	a,20678
 428  019c a4e7          	and	a,#231
 429  019e c750c6        	ld	20678,a
 430                     ; 424   CLK->CKDIVR |= (uint8_t)HSIPrescaler;
 431  01a1 c650c6        	ld	a,20678
 432  01a4 1a01          	or	a,(OFST+1,sp)
 433  01a6 c750c6        	ld	20678,a
 434                     ; 425 }
 435  01a9 84            	pop	a
 436  01aa 81            	ret	
 438                     ; 436 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
 438                     ; 437 {
 439  01ab               _CLK_CCOConfig:
 440  01ab 88            	push	a
 441       00000000      OFST:	set	0
 443                     ; 439   assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
 444                     ; 442   CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
 445  01ac c650c9        	ld	a,20681
 446  01af a4e1          	and	a,#225
 447  01b1 c750c9        	ld	20681,a
 448                     ; 445   CLK->CCOR |= (uint8_t)CLK_CCO;
 449  01b4 c650c9        	ld	a,20681
 450  01b7 1a01          	or	a,(OFST+1,sp)
 451  01b9 c750c9        	ld	20681,a
 452                     ; 448   CLK->CCOR |= CLK_CCOR_CCOEN;
 453  01bc 721050c9      	bset	20681,#0
 454                     ; 449 }
 455  01c0 84            	pop	a
 456  01c1 81            	ret	
 458                     ; 459 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
 458                     ; 460 {
 459  01c2               _CLK_ITConfig:
 460  01c2 89            	pushw	x
 461       00000000      OFST:	set	0
 463                     ; 462   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 464                     ; 463   assert_param(IS_CLK_IT_OK(CLK_IT));
 465                     ; 465   if (NewState != DISABLE)
 466  01c3 9f            	ld	a,xl
 467  01c4 4d            	tnz	a
 468  01c5 2715          	jreq	L361
 469                     ; 467     switch (CLK_IT)
 470  01c7 9e            	ld	a,xh
 472                     ; 475     default:
 472                     ; 476       break;
 473  01c8 a00c          	sub	a,#12
 474  01ca 270a          	jreq	L151
 475  01cc a010          	sub	a,#16
 476  01ce 2620          	jrne	L171
 477                     ; 469     case CLK_IT_SWIF: /* Enable the clock switch interrupt */
 477                     ; 470       CLK->SWCR |= CLK_SWCR_SWIEN;
 478  01d0 721450c5      	bset	20677,#2
 479                     ; 471       break;
 480  01d4 201a          	jra	L171
 481  01d6               L151:
 482                     ; 472     case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
 482                     ; 473       CLK->CSSR |= CLK_CSSR_CSSDIE;
 483  01d6 721450c8      	bset	20680,#2
 484                     ; 474       break;
 485  01da 2014          	jra	L171
 486                     ; 475     default:
 486                     ; 476       break;
 488  01dc               L361:
 489                     ; 481     switch (CLK_IT)
 490  01dc 7b01          	ld	a,(OFST+1,sp)
 492                     ; 489     default:
 492                     ; 490       break;
 493  01de a00c          	sub	a,#12
 494  01e0 270a          	jreq	L751
 495  01e2 a010          	sub	a,#16
 496  01e4 260a          	jrne	L171
 497                     ; 483     case CLK_IT_SWIF: /* Disable the clock switch interrupt */
 497                     ; 484       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
 498  01e6 721550c5      	bres	20677,#2
 499                     ; 485       break;
 500  01ea 2004          	jra	L171
 501  01ec               L751:
 502                     ; 486     case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
 502                     ; 487       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
 503  01ec 721550c8      	bres	20680,#2
 504                     ; 488       break;
 505  01f0               L171:
 506                     ; 493 }
 507  01f0 85            	popw	x
 508  01f1 81            	ret	
 509                     ; 489     default:
 509                     ; 490       break;
 511                     ; 500 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
 511                     ; 501 {
 512  01f2               _CLK_SYSCLKConfig:
 513  01f2 88            	push	a
 514       00000000      OFST:	set	0
 516                     ; 503   assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
 517                     ; 505   if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
 518  01f3 a580          	bcp	a,#128
 519  01f5 260e          	jrne	L771
 520                     ; 507     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
 521  01f7 c650c6        	ld	a,20678
 522  01fa a4e7          	and	a,#231
 523  01fc c750c6        	ld	20678,a
 524                     ; 508     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
 525  01ff 7b01          	ld	a,(OFST+1,sp)
 526  0201 a418          	and	a,#24
 528  0203 200c          	jra	L102
 529  0205               L771:
 530                     ; 512     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
 531  0205 c650c6        	ld	a,20678
 532  0208 a4f8          	and	a,#248
 533  020a c750c6        	ld	20678,a
 534                     ; 513     CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
 535  020d 7b01          	ld	a,(OFST+1,sp)
 536  020f a407          	and	a,#7
 537  0211               L102:
 538  0211 ca50c6        	or	a,20678
 539  0214 c750c6        	ld	20678,a
 540                     ; 515 }
 541  0217 84            	pop	a
 542  0218 81            	ret	
 544                     ; 523 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
 544                     ; 524 {
 545  0219               _CLK_SWIMConfig:
 547                     ; 526   assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
 548                     ; 528   if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
 549  0219 4d            	tnz	a
 550  021a 2705          	jreq	L302
 551                     ; 531     CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
 552  021c 721050cd      	bset	20685,#0
 554  0220 81            	ret	
 555  0221               L302:
 556                     ; 536     CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
 557  0221 721150cd      	bres	20685,#0
 558                     ; 538 }
 559  0225 81            	ret	
 561                     ; 547 void CLK_ClockSecuritySystemEnable(void)
 561                     ; 548 {
 562  0226               _CLK_ClockSecuritySystemEnable:
 564                     ; 550   CLK->CSSR |= CLK_CSSR_CSSEN;
 565  0226 721050c8      	bset	20680,#0
 566                     ; 551 }
 567  022a 81            	ret	
 569                     ; 559 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
 569                     ; 560 {
 570  022b               _CLK_GetSYSCLKSource:
 572                     ; 561   return((CLK_Source_TypeDef)CLK->CMSR);
 573  022b c650c3        	ld	a,20675
 575  022e 81            	ret	
 577                     ; 569 uint32_t CLK_GetClockFreq(void)
 577                     ; 570 {
 578  022f               _CLK_GetClockFreq:
 579  022f 5209          	subw	sp,#9
 580       00000009      OFST:	set	9
 582                     ; 571   uint32_t clockfrequency = 0;
 583                     ; 572   CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
 584                     ; 573   uint8_t tmp = 0, presc = 0;
 586                     ; 576   clocksource = (CLK_Source_TypeDef)CLK->CMSR;
 587  0231 c650c3        	ld	a,20675
 588  0234 6b09          	ld	(OFST+0,sp),a
 589                     ; 578   if (clocksource == CLK_SOURCE_HSI)
 590  0236 a1e1          	cp	a,#225
 591  0238 2634          	jrne	L702
 592                     ; 580     tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
 593  023a c650c6        	ld	a,20678
 594  023d a418          	and	a,#24
 595  023f 44            	srl	a
 596  0240 44            	srl	a
 597  0241 44            	srl	a
 598                     ; 581     tmp = (uint8_t)(tmp >> 3);
 599                     ; 582     presc = HSIDivFactor[tmp];
 600  0242 5f            	clrw	x
 601  0243 97            	ld	xl,a
 602  0244 d60000        	ld	a,(_HSIDivFactor,x)
 603  0247 6b09          	ld	(OFST+0,sp),a
 604                     ; 583     clockfrequency = HSI_VALUE / presc;
 605  0249 b703          	ld	c_lreg+3,a
 606  024b 3f02          	clr	c_lreg+2
 607  024d 3f01          	clr	c_lreg+1
 608  024f 3f00          	clr	c_lreg
 609  0251 96            	ldw	x,sp
 610  0252 5c            	incw	x
 611  0253 cd0000        	call	c_rtol
 613  0256 ae2400        	ldw	x,#9216
 614  0259 bf02          	ldw	c_lreg+2,x
 615  025b ae00f4        	ldw	x,#244
 616  025e bf00          	ldw	c_lreg,x
 617  0260 96            	ldw	x,sp
 618  0261 5c            	incw	x
 619  0262 cd0000        	call	c_ludv
 621  0265 96            	ldw	x,sp
 622  0266 1c0005        	addw	x,#OFST-4
 623  0269 cd0000        	call	c_rtol
 626  026c 2018          	jra	L112
 627  026e               L702:
 628                     ; 585   else if ( clocksource == CLK_SOURCE_LSI)
 629  026e a1d2          	cp	a,#210
 630  0270 260a          	jrne	L312
 631                     ; 587     clockfrequency = LSI_VALUE;
 632  0272 aef400        	ldw	x,#62464
 633  0275 1f07          	ldw	(OFST-2,sp),x
 634  0277 ae0001        	ldw	x,#1
 636  027a 2008          	jp	LC005
 637  027c               L312:
 638                     ; 591     clockfrequency = HSE_VALUE;
 639  027c ae2400        	ldw	x,#9216
 640  027f 1f07          	ldw	(OFST-2,sp),x
 641  0281 ae00f4        	ldw	x,#244
 642  0284               LC005:
 643  0284 1f05          	ldw	(OFST-4,sp),x
 644  0286               L112:
 645                     ; 594   return((uint32_t)clockfrequency);
 646  0286 96            	ldw	x,sp
 647  0287 1c0005        	addw	x,#OFST-4
 648  028a cd0000        	call	c_ltor
 651  028d 5b09          	addw	sp,#9
 652  028f 81            	ret	
 654                     ; 604 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
 654                     ; 605 {
 655  0290               _CLK_AdjustHSICalibrationValue:
 656  0290 88            	push	a
 657       00000000      OFST:	set	0
 659                     ; 607   assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
 660                     ; 610   CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
 661  0291 c650cc        	ld	a,20684
 662  0294 a4f8          	and	a,#248
 663  0296 1a01          	or	a,(OFST+1,sp)
 664  0298 c750cc        	ld	20684,a
 665                     ; 611 }
 666  029b 84            	pop	a
 667  029c 81            	ret	
 669                     ; 622 void CLK_SYSCLKEmergencyClear(void)
 669                     ; 623 {
 670  029d               _CLK_SYSCLKEmergencyClear:
 672                     ; 624   CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
 673  029d 721150c5      	bres	20677,#0
 674                     ; 625 }
 675  02a1 81            	ret	
 677                     ; 634 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
 677                     ; 635 {
 678  02a2               _CLK_GetFlagStatus:
 679  02a2 89            	pushw	x
 680  02a3 5203          	subw	sp,#3
 681       00000003      OFST:	set	3
 683                     ; 636   uint16_t statusreg = 0;
 684                     ; 637   uint8_t tmpreg = 0;
 685                     ; 638   FlagStatus bitstatus = RESET;
 686                     ; 641   assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
 687                     ; 644   statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
 688  02a5 01            	rrwa	x,a
 689  02a6 4f            	clr	a
 690  02a7 02            	rlwa	x,a
 691  02a8 1f01          	ldw	(OFST-2,sp),x
 692                     ; 647   if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
 693  02aa a30100        	cpw	x,#256
 694  02ad 2605          	jrne	L712
 695                     ; 649     tmpreg = CLK->ICKR;
 696  02af c650c0        	ld	a,20672
 698  02b2 2021          	jra	L122
 699  02b4               L712:
 700                     ; 651   else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
 701  02b4 a30200        	cpw	x,#512
 702  02b7 2605          	jrne	L322
 703                     ; 653     tmpreg = CLK->ECKR;
 704  02b9 c650c1        	ld	a,20673
 706  02bc 2017          	jra	L122
 707  02be               L322:
 708                     ; 655   else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
 709  02be a30300        	cpw	x,#768
 710  02c1 2605          	jrne	L722
 711                     ; 657     tmpreg = CLK->SWCR;
 712  02c3 c650c5        	ld	a,20677
 714  02c6 200d          	jra	L122
 715  02c8               L722:
 716                     ; 659   else if (statusreg == 0x0400) /* The flag to check is in CSS register */
 717  02c8 a30400        	cpw	x,#1024
 718  02cb 2605          	jrne	L332
 719                     ; 661     tmpreg = CLK->CSSR;
 720  02cd c650c8        	ld	a,20680
 722  02d0 2003          	jra	L122
 723  02d2               L332:
 724                     ; 665     tmpreg = CLK->CCOR;
 725  02d2 c650c9        	ld	a,20681
 726  02d5               L122:
 727  02d5 6b03          	ld	(OFST+0,sp),a
 728                     ; 668   if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
 729  02d7 7b05          	ld	a,(OFST+2,sp)
 730  02d9 1503          	bcp	a,(OFST+0,sp)
 731  02db 2704          	jreq	L732
 732                     ; 670     bitstatus = SET;
 733  02dd a601          	ld	a,#1
 735  02df 2001          	jra	L142
 736  02e1               L732:
 737                     ; 674     bitstatus = RESET;
 738  02e1 4f            	clr	a
 739  02e2               L142:
 740                     ; 678   return((FlagStatus)bitstatus);
 742  02e2 5b05          	addw	sp,#5
 743  02e4 81            	ret	
 745                     ; 687 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
 745                     ; 688 {
 746  02e5               _CLK_GetITStatus:
 747  02e5 88            	push	a
 748  02e6 88            	push	a
 749       00000001      OFST:	set	1
 751                     ; 689   ITStatus bitstatus = RESET;
 752                     ; 692   assert_param(IS_CLK_IT_OK(CLK_IT));
 753                     ; 694   if (CLK_IT == CLK_IT_SWIF)
 754  02e7 a11c          	cp	a,#28
 755  02e9 2609          	jrne	L342
 756                     ; 697     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 757  02eb c450c5        	and	a,20677
 758  02ee a10c          	cp	a,#12
 759  02f0 260f          	jrne	L352
 760                     ; 699       bitstatus = SET;
 762  02f2 2009          	jp	LC007
 763                     ; 703       bitstatus = RESET;
 764  02f4               L342:
 765                     ; 709     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
 766  02f4 c650c8        	ld	a,20680
 767  02f7 1402          	and	a,(OFST+1,sp)
 768  02f9 a10c          	cp	a,#12
 769  02fb 2604          	jrne	L352
 770                     ; 711       bitstatus = SET;
 771  02fd               LC007:
 772  02fd a601          	ld	a,#1
 774  02ff 2001          	jra	L152
 775  0301               L352:
 776                     ; 715       bitstatus = RESET;
 777  0301 4f            	clr	a
 778  0302               L152:
 779                     ; 720   return bitstatus;
 781  0302 85            	popw	x
 782  0303 81            	ret	
 784                     ; 729 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
 784                     ; 730 {
 785  0304               _CLK_ClearITPendingBit:
 787                     ; 732   assert_param(IS_CLK_IT_OK(CLK_IT));
 788                     ; 734   if (CLK_IT == (uint8_t)CLK_IT_CSSD)
 789  0304 a10c          	cp	a,#12
 790  0306 2605          	jrne	L752
 791                     ; 737     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
 792  0308 721750c8      	bres	20680,#3
 794  030c 81            	ret	
 795  030d               L752:
 796                     ; 742     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
 797  030d 721750c5      	bres	20677,#3
 798                     ; 745 }
 799  0311 81            	ret	
 801                     	xdef	_CLKPrescTable
 802                     	xdef	_HSIDivFactor
 803                     	xdef	_CLK_ClearITPendingBit
 804                     	xdef	_CLK_GetITStatus
 805                     	xdef	_CLK_GetFlagStatus
 806                     	xdef	_CLK_GetSYSCLKSource
 807                     	xdef	_CLK_GetClockFreq
 808                     	xdef	_CLK_AdjustHSICalibrationValue
 809                     	xdef	_CLK_SYSCLKEmergencyClear
 810                     	xdef	_CLK_ClockSecuritySystemEnable
 811                     	xdef	_CLK_SWIMConfig
 812                     	xdef	_CLK_SYSCLKConfig
 813                     	xdef	_CLK_ITConfig
 814                     	xdef	_CLK_CCOConfig
 815                     	xdef	_CLK_HSIPrescalerConfig
 816                     	xdef	_CLK_ClockSwitchConfig
 817                     	xdef	_CLK_PeripheralClockConfig
 818                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
 819                     	xdef	_CLK_FastHaltWakeUpCmd
 820                     	xdef	_CLK_ClockSwitchCmd
 821                     	xdef	_CLK_CCOCmd
 822                     	xdef	_CLK_LSICmd
 823                     	xdef	_CLK_HSICmd
 824                     	xdef	_CLK_HSECmd
 825                     	xdef	_CLK_DeInit
 826                     	xref.b	c_lreg
 827                     	xref.b	c_x
 828                     	xref	c_ltor
 829                     	xref	c_ludv
 830                     	xref	c_rtol
 831                     	end
