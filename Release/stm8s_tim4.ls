   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  17                     ; 49 void TIM4_DeInit(void)
  17                     ; 50 {
  18                     	scross	off
  19  0000               _TIM4_DeInit:
  21                     ; 51   TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  22  0000 725f5340      	clr	21312
  23                     ; 52   TIM4->IER = TIM4_IER_RESET_VALUE;
  24  0004 725f5343      	clr	21315
  25                     ; 53   TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  26  0008 725f5346      	clr	21318
  27                     ; 54   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  28  000c 725f5347      	clr	21319
  29                     ; 55   TIM4->ARR = TIM4_ARR_RESET_VALUE;
  30  0010 35ff5348      	mov	21320,#255
  31                     ; 56   TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  32  0014 725f5344      	clr	21316
  33                     ; 57 }
  34  0018 81            	ret	
  36                     ; 65 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
  36                     ; 66 {
  37  0019               _TIM4_TimeBaseInit:
  39                     ; 68   assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
  40                     ; 70   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
  41  0019 9e            	ld	a,xh
  42  001a c75347        	ld	21319,a
  43                     ; 72   TIM4->ARR = (uint8_t)(TIM4_Period);
  44  001d 9f            	ld	a,xl
  45  001e c75348        	ld	21320,a
  46                     ; 73 }
  47  0021 81            	ret	
  49                     ; 81 void TIM4_Cmd(FunctionalState NewState)
  49                     ; 82 {
  50  0022               _TIM4_Cmd:
  52                     ; 84   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  53                     ; 87   if (NewState != DISABLE)
  54  0022 4d            	tnz	a
  55  0023 2705          	jreq	L3
  56                     ; 89     TIM4->CR1 |= TIM4_CR1_CEN;
  57  0025 72105340      	bset	21312,#0
  59  0029 81            	ret	
  60  002a               L3:
  61                     ; 93     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
  62  002a 72115340      	bres	21312,#0
  63                     ; 95 }
  64  002e 81            	ret	
  66                     ; 107 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
  66                     ; 108 {
  67  002f               _TIM4_ITConfig:
  68  002f 89            	pushw	x
  69       00000000      OFST:	set	0
  71                     ; 110   assert_param(IS_TIM4_IT_OK(TIM4_IT));
  72                     ; 111   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  73                     ; 113   if (NewState != DISABLE)
  74  0030 9f            	ld	a,xl
  75  0031 4d            	tnz	a
  76  0032 2706          	jreq	L7
  77                     ; 116     TIM4->IER |= (uint8_t)TIM4_IT;
  78  0034 9e            	ld	a,xh
  79  0035 ca5343        	or	a,21315
  81  0038 2006          	jra	L11
  82  003a               L7:
  83                     ; 121     TIM4->IER &= (uint8_t)(~TIM4_IT);
  84  003a 7b01          	ld	a,(OFST+1,sp)
  85  003c 43            	cpl	a
  86  003d c45343        	and	a,21315
  87  0040               L11:
  88  0040 c75343        	ld	21315,a
  89                     ; 123 }
  90  0043 85            	popw	x
  91  0044 81            	ret	
  93                     ; 131 void TIM4_UpdateDisableConfig(FunctionalState NewState)
  93                     ; 132 {
  94  0045               _TIM4_UpdateDisableConfig:
  96                     ; 134   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  97                     ; 137   if (NewState != DISABLE)
  98  0045 4d            	tnz	a
  99  0046 2705          	jreq	L31
 100                     ; 139     TIM4->CR1 |= TIM4_CR1_UDIS;
 101  0048 72125340      	bset	21312,#1
 103  004c 81            	ret	
 104  004d               L31:
 105                     ; 143     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 106  004d 72135340      	bres	21312,#1
 107                     ; 145 }
 108  0051 81            	ret	
 110                     ; 155 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 110                     ; 156 {
 111  0052               _TIM4_UpdateRequestConfig:
 113                     ; 158   assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 114                     ; 161   if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 115  0052 4d            	tnz	a
 116  0053 2705          	jreq	L71
 117                     ; 163     TIM4->CR1 |= TIM4_CR1_URS;
 118  0055 72145340      	bset	21312,#2
 120  0059 81            	ret	
 121  005a               L71:
 122                     ; 167     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 123  005a 72155340      	bres	21312,#2
 124                     ; 169 }
 125  005e 81            	ret	
 127                     ; 179 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 127                     ; 180 {
 128  005f               _TIM4_SelectOnePulseMode:
 130                     ; 182   assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 131                     ; 185   if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 132  005f 4d            	tnz	a
 133  0060 2705          	jreq	L32
 134                     ; 187     TIM4->CR1 |= TIM4_CR1_OPM;
 135  0062 72165340      	bset	21312,#3
 137  0066 81            	ret	
 138  0067               L32:
 139                     ; 191     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 140  0067 72175340      	bres	21312,#3
 141                     ; 193 }
 142  006b 81            	ret	
 144                     ; 215 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 144                     ; 216 {
 145  006c               _TIM4_PrescalerConfig:
 147                     ; 218   assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 148                     ; 219   assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 149                     ; 222   TIM4->PSCR = (uint8_t)Prescaler;
 150  006c 9e            	ld	a,xh
 151  006d c75347        	ld	21319,a
 152                     ; 225   TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 153  0070 9f            	ld	a,xl
 154  0071 c75345        	ld	21317,a
 155                     ; 226 }
 156  0074 81            	ret	
 158                     ; 234 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 158                     ; 235 {
 159  0075               _TIM4_ARRPreloadConfig:
 161                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 162                     ; 240   if (NewState != DISABLE)
 163  0075 4d            	tnz	a
 164  0076 2705          	jreq	L72
 165                     ; 242     TIM4->CR1 |= TIM4_CR1_ARPE;
 166  0078 721e5340      	bset	21312,#7
 168  007c 81            	ret	
 169  007d               L72:
 170                     ; 246     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 171  007d 721f5340      	bres	21312,#7
 172                     ; 248 }
 173  0081 81            	ret	
 175                     ; 257 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 175                     ; 258 {
 176  0082               _TIM4_GenerateEvent:
 178                     ; 260   assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 179                     ; 263   TIM4->EGR = (uint8_t)(TIM4_EventSource);
 180  0082 c75345        	ld	21317,a
 181                     ; 264 }
 182  0085 81            	ret	
 184                     ; 272 void TIM4_SetCounter(uint8_t Counter)
 184                     ; 273 {
 185  0086               _TIM4_SetCounter:
 187                     ; 275   TIM4->CNTR = (uint8_t)(Counter);
 188  0086 c75346        	ld	21318,a
 189                     ; 276 }
 190  0089 81            	ret	
 192                     ; 284 void TIM4_SetAutoreload(uint8_t Autoreload)
 192                     ; 285 {
 193  008a               _TIM4_SetAutoreload:
 195                     ; 287   TIM4->ARR = (uint8_t)(Autoreload);
 196  008a c75348        	ld	21320,a
 197                     ; 288 }
 198  008d 81            	ret	
 200                     ; 295 uint8_t TIM4_GetCounter(void)
 200                     ; 296 {
 201  008e               _TIM4_GetCounter:
 203                     ; 298   return (uint8_t)(TIM4->CNTR);
 204  008e c65346        	ld	a,21318
 206  0091 81            	ret	
 208                     ; 306 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 208                     ; 307 {
 209  0092               _TIM4_GetPrescaler:
 211                     ; 309   return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 212  0092 c65347        	ld	a,21319
 214  0095 81            	ret	
 216                     ; 319 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
 216                     ; 320 {
 217  0096               _TIM4_GetFlagStatus:
 218       00000001      OFST:	set	1
 220                     ; 321   FlagStatus bitstatus = RESET;
 221                     ; 324   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
 222                     ; 326   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
 223  0096 c45344        	and	a,21316
 224  0099 2702          	jreq	L33
 225                     ; 328     bitstatus = SET;
 226  009b a601          	ld	a,#1
 228  009d               L33:
 229                     ; 332     bitstatus = RESET;
 230                     ; 334   return ((FlagStatus)bitstatus);
 232  009d 81            	ret	
 234                     ; 344 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
 234                     ; 345 {
 235  009e               _TIM4_ClearFlag:
 237                     ; 347   assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
 238                     ; 350   TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
 239  009e 43            	cpl	a
 240  009f c75344        	ld	21316,a
 241                     ; 351 }
 242  00a2 81            	ret	
 244                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
 244                     ; 361 {
 245  00a3               _TIM4_GetITStatus:
 246  00a3 88            	push	a
 247  00a4 89            	pushw	x
 248       00000002      OFST:	set	2
 250                     ; 362   ITStatus bitstatus = RESET;
 251                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
 253                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 254                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
 255  00a5 c45344        	and	a,21316
 256  00a8 6b01          	ld	(OFST-1,sp),a
 257                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
 258  00aa c65343        	ld	a,21315
 259  00ad 1403          	and	a,(OFST+1,sp)
 260  00af 6b02          	ld	(OFST+0,sp),a
 261                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
 262  00b1 7b01          	ld	a,(OFST-1,sp)
 263  00b3 2708          	jreq	L73
 265  00b5 7b02          	ld	a,(OFST+0,sp)
 266  00b7 2704          	jreq	L73
 267                     ; 375     bitstatus = (ITStatus)SET;
 268  00b9 a601          	ld	a,#1
 270  00bb 2001          	jra	L14
 271  00bd               L73:
 272                     ; 379     bitstatus = (ITStatus)RESET;
 273  00bd 4f            	clr	a
 274  00be               L14:
 275                     ; 381   return ((ITStatus)bitstatus);
 277  00be 5b03          	addw	sp,#3
 278  00c0 81            	ret	
 280                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
 280                     ; 392 {
 281  00c1               _TIM4_ClearITPendingBit:
 283                     ; 394   assert_param(IS_TIM4_IT_OK(TIM4_IT));
 284                     ; 397   TIM4->SR1 = (uint8_t)(~TIM4_IT);
 285  00c1 43            	cpl	a
 286  00c2 c75344        	ld	21316,a
 287                     ; 398 }
 288  00c5 81            	ret	
 290                     	xdef	_TIM4_ClearITPendingBit
 291                     	xdef	_TIM4_GetITStatus
 292                     	xdef	_TIM4_ClearFlag
 293                     	xdef	_TIM4_GetFlagStatus
 294                     	xdef	_TIM4_GetPrescaler
 295                     	xdef	_TIM4_GetCounter
 296                     	xdef	_TIM4_SetAutoreload
 297                     	xdef	_TIM4_SetCounter
 298                     	xdef	_TIM4_GenerateEvent
 299                     	xdef	_TIM4_ARRPreloadConfig
 300                     	xdef	_TIM4_PrescalerConfig
 301                     	xdef	_TIM4_SelectOnePulseMode
 302                     	xdef	_TIM4_UpdateRequestConfig
 303                     	xdef	_TIM4_UpdateDisableConfig
 304                     	xdef	_TIM4_ITConfig
 305                     	xdef	_TIM4_Cmd
 306                     	xdef	_TIM4_TimeBaseInit
 307                     	xdef	_TIM4_DeInit
 308                     	end
