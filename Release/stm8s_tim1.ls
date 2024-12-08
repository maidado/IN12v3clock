   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  17                     ; 58 void TIM1_DeInit(void)
  17                     ; 59 {
  18                     	scross	off
  19  0000               _TIM1_DeInit:
  21                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  22  0000 725f5250      	clr	21072
  23                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  24  0004 725f5251      	clr	21073
  25                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  26  0008 725f5252      	clr	21074
  27                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  28  000c 725f5253      	clr	21075
  29                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  30  0010 725f5254      	clr	21076
  31                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  32  0014 725f5256      	clr	21078
  33                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  34  0018 725f525c      	clr	21084
  35                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  36  001c 725f525d      	clr	21085
  37                     ; 70   TIM1->CCMR1 = 0x01;
  38  0020 35015258      	mov	21080,#1
  39                     ; 71   TIM1->CCMR2 = 0x01;
  40  0024 35015259      	mov	21081,#1
  41                     ; 72   TIM1->CCMR3 = 0x01;
  42  0028 3501525a      	mov	21082,#1
  43                     ; 73   TIM1->CCMR4 = 0x01;
  44  002c 3501525b      	mov	21083,#1
  45                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  46  0030 725f525c      	clr	21084
  47                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  48  0034 725f525d      	clr	21085
  49                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  50  0038 725f5258      	clr	21080
  51                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  52  003c 725f5259      	clr	21081
  53                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  54  0040 725f525a      	clr	21082
  55                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  56  0044 725f525b      	clr	21083
  57                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  58  0048 725f525e      	clr	21086
  59                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  60  004c 725f525f      	clr	21087
  61                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  62  0050 725f5260      	clr	21088
  63                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
  64  0054 725f5261      	clr	21089
  65                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
  66  0058 35ff5262      	mov	21090,#255
  67                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
  68  005c 35ff5263      	mov	21091,#255
  69                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
  70  0060 725f5265      	clr	21093
  71                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
  72  0064 725f5266      	clr	21094
  73                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
  74  0068 725f5267      	clr	21095
  75                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
  76  006c 725f5268      	clr	21096
  77                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
  78  0070 725f5269      	clr	21097
  79                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
  80  0074 725f526a      	clr	21098
  81                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
  82  0078 725f526b      	clr	21099
  83                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
  84  007c 725f526c      	clr	21100
  85                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
  86  0080 725f526f      	clr	21103
  87                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
  88  0084 35015257      	mov	21079,#1
  89                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
  90  0088 725f526e      	clr	21102
  91                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
  92  008c 725f526d      	clr	21101
  93                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
  94  0090 725f5264      	clr	21092
  95                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
  96  0094 725f5255      	clr	21077
  97                     ; 101 }
  98  0098 81            	ret	
 100                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 100                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 100                     ; 113                        uint16_t TIM1_Period,
 100                     ; 114                        uint8_t TIM1_RepetitionCounter)
 100                     ; 115 {
 101  0099               _TIM1_TimeBaseInit:
 102       fffffffe      OFST: set -2
 104                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 105                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 106  0099 7b04          	ld	a,(OFST+6,sp)
 107  009b c75262        	ld	21090,a
 108                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 109  009e 7b05          	ld	a,(OFST+7,sp)
 110  00a0 c75263        	ld	21091,a
 111                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 112  00a3 9e            	ld	a,xh
 113  00a4 c75260        	ld	21088,a
 114                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 115  00a7 9f            	ld	a,xl
 116  00a8 c75261        	ld	21089,a
 117                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 117                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 118  00ab c65250        	ld	a,21072
 119  00ae a48f          	and	a,#143
 120  00b0 1a03          	or	a,(OFST+5,sp)
 121  00b2 c75250        	ld	21072,a
 122                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 123  00b5 7b06          	ld	a,(OFST+8,sp)
 124  00b7 c75264        	ld	21092,a
 125                     ; 133 }
 126  00ba 81            	ret	
 128                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 128                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 128                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 128                     ; 157                   uint16_t TIM1_Pulse,
 128                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 128                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 128                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 128                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 128                     ; 162 {
 129  00bb               _TIM1_OC1Init:
 130  00bb 89            	pushw	x
 131  00bc 5203          	subw	sp,#3
 132       00000003      OFST:	set	3
 134                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 135                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 136                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 137                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 138                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 139                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 140                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 141                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 141                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 142  00be c6525c        	ld	a,21084
 143  00c1 a4f0          	and	a,#240
 144  00c3 c7525c        	ld	21084,a
 145                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 145                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 145                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 145                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 146  00c6 7b0c          	ld	a,(OFST+9,sp)
 147  00c8 a408          	and	a,#8
 148  00ca 6b03          	ld	(OFST+0,sp),a
 149  00cc 7b0b          	ld	a,(OFST+8,sp)
 150  00ce a402          	and	a,#2
 151  00d0 1a03          	or	a,(OFST+0,sp)
 152  00d2 6b02          	ld	(OFST-1,sp),a
 153  00d4 7b08          	ld	a,(OFST+5,sp)
 154  00d6 a404          	and	a,#4
 155  00d8 6b01          	ld	(OFST-2,sp),a
 156  00da 9f            	ld	a,xl
 157  00db a401          	and	a,#1
 158  00dd 1a01          	or	a,(OFST-2,sp)
 159  00df 1a02          	or	a,(OFST-1,sp)
 160  00e1 ca525c        	or	a,21084
 161  00e4 c7525c        	ld	21084,a
 162                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 162                     ; 185                           (uint8_t)TIM1_OCMode);
 163  00e7 c65258        	ld	a,21080
 164  00ea a48f          	and	a,#143
 165  00ec 1a04          	or	a,(OFST+1,sp)
 166  00ee c75258        	ld	21080,a
 167                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 168  00f1 c6526f        	ld	a,21103
 169  00f4 a4fc          	and	a,#252
 170  00f6 c7526f        	ld	21103,a
 171                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 171                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 172  00f9 7b0e          	ld	a,(OFST+11,sp)
 173  00fb a402          	and	a,#2
 174  00fd 6b03          	ld	(OFST+0,sp),a
 175  00ff 7b0d          	ld	a,(OFST+10,sp)
 176  0101 a401          	and	a,#1
 177  0103 1a03          	or	a,(OFST+0,sp)
 178  0105 ca526f        	or	a,21103
 179  0108 c7526f        	ld	21103,a
 180                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 181  010b 7b09          	ld	a,(OFST+6,sp)
 182  010d c75265        	ld	21093,a
 183                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 184  0110 7b0a          	ld	a,(OFST+7,sp)
 185  0112 c75266        	ld	21094,a
 186                     ; 196 }
 187  0115 5b05          	addw	sp,#5
 188  0117 81            	ret	
 190                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 190                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 190                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 190                     ; 220                   uint16_t TIM1_Pulse,
 190                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 190                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 190                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 190                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 190                     ; 225 {
 191  0118               _TIM1_OC2Init:
 192  0118 89            	pushw	x
 193  0119 5203          	subw	sp,#3
 194       00000003      OFST:	set	3
 196                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 197                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 198                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 199                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 200                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 201                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 202                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 203                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 203                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 204  011b c6525c        	ld	a,21084
 205  011e a40f          	and	a,#15
 206  0120 c7525c        	ld	21084,a
 207                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 207                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 207                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 207                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 208  0123 7b0c          	ld	a,(OFST+9,sp)
 209  0125 a480          	and	a,#128
 210  0127 6b03          	ld	(OFST+0,sp),a
 211  0129 7b0b          	ld	a,(OFST+8,sp)
 212  012b a420          	and	a,#32
 213  012d 1a03          	or	a,(OFST+0,sp)
 214  012f 6b02          	ld	(OFST-1,sp),a
 215  0131 7b08          	ld	a,(OFST+5,sp)
 216  0133 a440          	and	a,#64
 217  0135 6b01          	ld	(OFST-2,sp),a
 218  0137 9f            	ld	a,xl
 219  0138 a410          	and	a,#16
 220  013a 1a01          	or	a,(OFST-2,sp)
 221  013c 1a02          	or	a,(OFST-1,sp)
 222  013e ca525c        	or	a,21084
 223  0141 c7525c        	ld	21084,a
 224                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 224                     ; 249                           (uint8_t)TIM1_OCMode);
 225  0144 c65259        	ld	a,21081
 226  0147 a48f          	and	a,#143
 227  0149 1a04          	or	a,(OFST+1,sp)
 228  014b c75259        	ld	21081,a
 229                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 230  014e c6526f        	ld	a,21103
 231  0151 a4f3          	and	a,#243
 232  0153 c7526f        	ld	21103,a
 233                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 233                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 234  0156 7b0e          	ld	a,(OFST+11,sp)
 235  0158 a408          	and	a,#8
 236  015a 6b03          	ld	(OFST+0,sp),a
 237  015c 7b0d          	ld	a,(OFST+10,sp)
 238  015e a404          	and	a,#4
 239  0160 1a03          	or	a,(OFST+0,sp)
 240  0162 ca526f        	or	a,21103
 241  0165 c7526f        	ld	21103,a
 242                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 243  0168 7b09          	ld	a,(OFST+6,sp)
 244  016a c75267        	ld	21095,a
 245                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 246  016d 7b0a          	ld	a,(OFST+7,sp)
 247  016f c75268        	ld	21096,a
 248                     ; 260 }
 249  0172 5b05          	addw	sp,#5
 250  0174 81            	ret	
 252                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 252                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 252                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 252                     ; 284                   uint16_t TIM1_Pulse,
 252                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 252                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 252                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 252                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 252                     ; 289 {
 253  0175               _TIM1_OC3Init:
 254  0175 89            	pushw	x
 255  0176 5203          	subw	sp,#3
 256       00000003      OFST:	set	3
 258                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 259                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 260                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 261                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 262                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 263                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 264                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 265                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 265                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 266  0178 c6525d        	ld	a,21085
 267  017b a4f0          	and	a,#240
 268  017d c7525d        	ld	21085,a
 269                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 269                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 269                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 269                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 270  0180 7b0c          	ld	a,(OFST+9,sp)
 271  0182 a408          	and	a,#8
 272  0184 6b03          	ld	(OFST+0,sp),a
 273  0186 7b0b          	ld	a,(OFST+8,sp)
 274  0188 a402          	and	a,#2
 275  018a 1a03          	or	a,(OFST+0,sp)
 276  018c 6b02          	ld	(OFST-1,sp),a
 277  018e 7b08          	ld	a,(OFST+5,sp)
 278  0190 a404          	and	a,#4
 279  0192 6b01          	ld	(OFST-2,sp),a
 280  0194 9f            	ld	a,xl
 281  0195 a401          	and	a,#1
 282  0197 1a01          	or	a,(OFST-2,sp)
 283  0199 1a02          	or	a,(OFST-1,sp)
 284  019b ca525d        	or	a,21085
 285  019e c7525d        	ld	21085,a
 286                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 286                     ; 312                           (uint8_t)TIM1_OCMode);
 287  01a1 c6525a        	ld	a,21082
 288  01a4 a48f          	and	a,#143
 289  01a6 1a04          	or	a,(OFST+1,sp)
 290  01a8 c7525a        	ld	21082,a
 291                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
 292  01ab c6526f        	ld	a,21103
 293  01ae a4cf          	and	a,#207
 294  01b0 c7526f        	ld	21103,a
 295                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
 295                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
 296  01b3 7b0e          	ld	a,(OFST+11,sp)
 297  01b5 a420          	and	a,#32
 298  01b7 6b03          	ld	(OFST+0,sp),a
 299  01b9 7b0d          	ld	a,(OFST+10,sp)
 300  01bb a410          	and	a,#16
 301  01bd 1a03          	or	a,(OFST+0,sp)
 302  01bf ca526f        	or	a,21103
 303  01c2 c7526f        	ld	21103,a
 304                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
 305  01c5 7b09          	ld	a,(OFST+6,sp)
 306  01c7 c75269        	ld	21097,a
 307                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
 308  01ca 7b0a          	ld	a,(OFST+7,sp)
 309  01cc c7526a        	ld	21098,a
 310                     ; 323 }
 311  01cf 5b05          	addw	sp,#5
 312  01d1 81            	ret	
 314                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 314                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
 314                     ; 340                   uint16_t TIM1_Pulse,
 314                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 314                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
 314                     ; 343 {
 315  01d2               _TIM1_OC4Init:
 316  01d2 89            	pushw	x
 317  01d3 88            	push	a
 318       00000001      OFST:	set	1
 320                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 321                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 322                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 323                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 324                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
 325  01d4 c6525d        	ld	a,21085
 326  01d7 a4cf          	and	a,#207
 327  01d9 c7525d        	ld	21085,a
 328                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
 328                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
 329  01dc 7b08          	ld	a,(OFST+7,sp)
 330  01de a420          	and	a,#32
 331  01e0 6b01          	ld	(OFST+0,sp),a
 332  01e2 9f            	ld	a,xl
 333  01e3 a410          	and	a,#16
 334  01e5 1a01          	or	a,(OFST+0,sp)
 335  01e7 ca525d        	or	a,21085
 336  01ea c7525d        	ld	21085,a
 337                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 337                     ; 358                           TIM1_OCMode);
 338  01ed c6525b        	ld	a,21083
 339  01f0 a48f          	and	a,#143
 340  01f2 1a02          	or	a,(OFST+1,sp)
 341  01f4 c7525b        	ld	21083,a
 342                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
 343  01f7 7b09          	ld	a,(OFST+8,sp)
 344  01f9 270a          	jreq	L31
 345                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
 346  01fb c6526f        	ld	a,21103
 347  01fe aadf          	or	a,#223
 348  0200 c7526f        	ld	21103,a
 350  0203 2004          	jra	L51
 351  0205               L31:
 352                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
 353  0205 721d526f      	bres	21103,#6
 354  0209               L51:
 355                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
 356  0209 7b06          	ld	a,(OFST+5,sp)
 357  020b c7526b        	ld	21099,a
 358                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
 359  020e 7b07          	ld	a,(OFST+6,sp)
 360  0210 c7526c        	ld	21100,a
 361                     ; 373 }
 362  0213 5b03          	addw	sp,#3
 363  0215 81            	ret	
 365                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
 365                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
 365                     ; 390                      uint8_t TIM1_DeadTime,
 365                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
 365                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
 365                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
 365                     ; 394 {
 366  0216               _TIM1_BDTRConfig:
 367  0216 89            	pushw	x
 368  0217 88            	push	a
 369       00000001      OFST:	set	1
 371                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
 372                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
 373                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
 374                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
 375                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
 376                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
 377  0218 7b06          	ld	a,(OFST+5,sp)
 378  021a c7526e        	ld	21102,a
 379                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
 379                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
 379                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
 380  021d 7b07          	ld	a,(OFST+6,sp)
 381  021f 1a08          	or	a,(OFST+7,sp)
 382  0221 1a09          	or	a,(OFST+8,sp)
 383  0223 6b01          	ld	(OFST+0,sp),a
 384  0225 9f            	ld	a,xl
 385  0226 1a02          	or	a,(OFST+1,sp)
 386  0228 1a01          	or	a,(OFST+0,sp)
 387  022a c7526d        	ld	21101,a
 388                     ; 409 }
 389  022d 5b03          	addw	sp,#3
 390  022f 81            	ret	
 392                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
 392                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
 392                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
 392                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
 392                     ; 427                  uint8_t TIM1_ICFilter)
 392                     ; 428 {
 393  0230               _TIM1_ICInit:
 394  0230 89            	pushw	x
 395       00000000      OFST:	set	0
 397                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
 398                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
 399                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
 400                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
 401                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
 402                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
 403  0231 9e            	ld	a,xh
 404  0232 4d            	tnz	a
 405  0233 2614          	jrne	L71
 406                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
 406                     ; 440                (uint8_t)TIM1_ICSelection,
 406                     ; 441                (uint8_t)TIM1_ICFilter);
 407  0235 7b07          	ld	a,(OFST+7,sp)
 408  0237 88            	push	a
 409  0238 7b06          	ld	a,(OFST+6,sp)
 410  023a 97            	ld	xl,a
 411  023b 7b03          	ld	a,(OFST+3,sp)
 412  023d 95            	ld	xh,a
 413  023e cd07a3        	call	L3_TI1_Config
 415  0241 84            	pop	a
 416                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
 417  0242 7b06          	ld	a,(OFST+6,sp)
 418  0244 cd0680        	call	_TIM1_SetIC1Prescaler
 421  0247 2044          	jra	L12
 422  0249               L71:
 423                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
 424  0249 7b01          	ld	a,(OFST+1,sp)
 425  024b a101          	cp	a,#1
 426  024d 2614          	jrne	L32
 427                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
 427                     ; 449                (uint8_t)TIM1_ICSelection,
 427                     ; 450                (uint8_t)TIM1_ICFilter);
 428  024f 7b07          	ld	a,(OFST+7,sp)
 429  0251 88            	push	a
 430  0252 7b06          	ld	a,(OFST+6,sp)
 431  0254 97            	ld	xl,a
 432  0255 7b03          	ld	a,(OFST+3,sp)
 433  0257 95            	ld	xh,a
 434  0258 cd07d3        	call	L5_TI2_Config
 436  025b 84            	pop	a
 437                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
 438  025c 7b06          	ld	a,(OFST+6,sp)
 439  025e cd068d        	call	_TIM1_SetIC2Prescaler
 442  0261 202a          	jra	L12
 443  0263               L32:
 444                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
 445  0263 a102          	cp	a,#2
 446  0265 2614          	jrne	L72
 447                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
 447                     ; 458                (uint8_t)TIM1_ICSelection,
 447                     ; 459                (uint8_t)TIM1_ICFilter);
 448  0267 7b07          	ld	a,(OFST+7,sp)
 449  0269 88            	push	a
 450  026a 7b06          	ld	a,(OFST+6,sp)
 451  026c 97            	ld	xl,a
 452  026d 7b03          	ld	a,(OFST+3,sp)
 453  026f 95            	ld	xh,a
 454  0270 cd0803        	call	L7_TI3_Config
 456  0273 84            	pop	a
 457                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
 458  0274 7b06          	ld	a,(OFST+6,sp)
 459  0276 cd069a        	call	_TIM1_SetIC3Prescaler
 462  0279 2012          	jra	L12
 463  027b               L72:
 464                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
 464                     ; 467                (uint8_t)TIM1_ICSelection,
 464                     ; 468                (uint8_t)TIM1_ICFilter);
 465  027b 7b07          	ld	a,(OFST+7,sp)
 466  027d 88            	push	a
 467  027e 7b06          	ld	a,(OFST+6,sp)
 468  0280 97            	ld	xl,a
 469  0281 7b03          	ld	a,(OFST+3,sp)
 470  0283 95            	ld	xh,a
 471  0284 cd0833        	call	L11_TI4_Config
 473  0287 84            	pop	a
 474                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
 475  0288 7b06          	ld	a,(OFST+6,sp)
 476  028a cd06a7        	call	_TIM1_SetIC4Prescaler
 478  028d               L12:
 479                     ; 472 }
 480  028d 85            	popw	x
 481  028e 81            	ret	
 483                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
 483                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
 483                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
 483                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
 483                     ; 492                      uint8_t TIM1_ICFilter)
 483                     ; 493 {
 484  028f               _TIM1_PWMIConfig:
 485  028f 89            	pushw	x
 486  0290 89            	pushw	x
 487       00000002      OFST:	set	2
 489                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
 490                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
 491                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
 492                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
 493                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
 494                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
 495                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
 496  0291 9f            	ld	a,xl
 497  0292 4a            	dec	a
 498  0293 2702          	jreq	L33
 499                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
 500  0295 a601          	ld	a,#1
 502  0297               L33:
 503                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
 504  0297 6b01          	ld	(OFST-1,sp),a
 505                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
 506  0299 7b07          	ld	a,(OFST+5,sp)
 507  029b 4a            	dec	a
 508  029c 2604          	jrne	L73
 509                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
 510  029e a602          	ld	a,#2
 512  02a0 2002          	jra	L14
 513  02a2               L73:
 514                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
 515  02a2 a601          	ld	a,#1
 516  02a4               L14:
 517  02a4 6b02          	ld	(OFST+0,sp),a
 518                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
 519  02a6 7b03          	ld	a,(OFST+1,sp)
 520  02a8 2626          	jrne	L34
 521                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
 521                     ; 527                (uint8_t)TIM1_ICFilter);
 522  02aa 7b09          	ld	a,(OFST+7,sp)
 523  02ac 88            	push	a
 524  02ad 7b08          	ld	a,(OFST+6,sp)
 525  02af 97            	ld	xl,a
 526  02b0 7b05          	ld	a,(OFST+3,sp)
 527  02b2 95            	ld	xh,a
 528  02b3 cd07a3        	call	L3_TI1_Config
 530  02b6 84            	pop	a
 531                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
 532  02b7 7b08          	ld	a,(OFST+6,sp)
 533  02b9 cd0680        	call	_TIM1_SetIC1Prescaler
 535                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
 536  02bc 7b09          	ld	a,(OFST+7,sp)
 537  02be 88            	push	a
 538  02bf 7b03          	ld	a,(OFST+1,sp)
 539  02c1 97            	ld	xl,a
 540  02c2 7b02          	ld	a,(OFST+0,sp)
 541  02c4 95            	ld	xh,a
 542  02c5 cd07d3        	call	L5_TI2_Config
 544  02c8 84            	pop	a
 545                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
 546  02c9 7b08          	ld	a,(OFST+6,sp)
 547  02cb cd068d        	call	_TIM1_SetIC2Prescaler
 550  02ce 2024          	jra	L54
 551  02d0               L34:
 552                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
 552                     ; 542                (uint8_t)TIM1_ICFilter);
 553  02d0 7b09          	ld	a,(OFST+7,sp)
 554  02d2 88            	push	a
 555  02d3 7b08          	ld	a,(OFST+6,sp)
 556  02d5 97            	ld	xl,a
 557  02d6 7b05          	ld	a,(OFST+3,sp)
 558  02d8 95            	ld	xh,a
 559  02d9 cd07d3        	call	L5_TI2_Config
 561  02dc 84            	pop	a
 562                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
 563  02dd 7b08          	ld	a,(OFST+6,sp)
 564  02df cd068d        	call	_TIM1_SetIC2Prescaler
 566                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
 567  02e2 7b09          	ld	a,(OFST+7,sp)
 568  02e4 88            	push	a
 569  02e5 7b03          	ld	a,(OFST+1,sp)
 570  02e7 97            	ld	xl,a
 571  02e8 7b02          	ld	a,(OFST+0,sp)
 572  02ea 95            	ld	xh,a
 573  02eb cd07a3        	call	L3_TI1_Config
 575  02ee 84            	pop	a
 576                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
 577  02ef 7b08          	ld	a,(OFST+6,sp)
 578  02f1 cd0680        	call	_TIM1_SetIC1Prescaler
 580  02f4               L54:
 581                     ; 553 }
 582  02f4 5b04          	addw	sp,#4
 583  02f6 81            	ret	
 585                     ; 561 void TIM1_Cmd(FunctionalState NewState)
 585                     ; 562 {
 586  02f7               _TIM1_Cmd:
 588                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 589                     ; 567   if (NewState != DISABLE)
 590  02f7 4d            	tnz	a
 591  02f8 2705          	jreq	L74
 592                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
 593  02fa 72105250      	bset	21072,#0
 595  02fe 81            	ret	
 596  02ff               L74:
 597                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
 598  02ff 72115250      	bres	21072,#0
 599                     ; 575 }
 600  0303 81            	ret	
 602                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
 602                     ; 584 {
 603  0304               _TIM1_CtrlPWMOutputs:
 605                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 606                     ; 590   if (NewState != DISABLE)
 607  0304 4d            	tnz	a
 608  0305 2705          	jreq	L35
 609                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
 610  0307 721e526d      	bset	21101,#7
 612  030b 81            	ret	
 613  030c               L35:
 614                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
 615  030c 721f526d      	bres	21101,#7
 616                     ; 598 }
 617  0310 81            	ret	
 619                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
 619                     ; 618 {
 620  0311               _TIM1_ITConfig:
 621  0311 89            	pushw	x
 622       00000000      OFST:	set	0
 624                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
 625                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 626                     ; 623   if (NewState != DISABLE)
 627  0312 9f            	ld	a,xl
 628  0313 4d            	tnz	a
 629  0314 2706          	jreq	L75
 630                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
 631  0316 9e            	ld	a,xh
 632  0317 ca5254        	or	a,21076
 634  031a 2006          	jra	L16
 635  031c               L75:
 636                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
 637  031c 7b01          	ld	a,(OFST+1,sp)
 638  031e 43            	cpl	a
 639  031f c45254        	and	a,21076
 640  0322               L16:
 641  0322 c75254        	ld	21076,a
 642                     ; 633 }
 643  0325 85            	popw	x
 644  0326 81            	ret	
 646                     ; 640 void TIM1_InternalClockConfig(void)
 646                     ; 641 {
 647  0327               _TIM1_InternalClockConfig:
 649                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
 650  0327 c65252        	ld	a,21074
 651  032a a4f8          	and	a,#248
 652  032c c75252        	ld	21074,a
 653                     ; 644 }
 654  032f 81            	ret	
 656                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
 656                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
 656                     ; 664                               uint8_t ExtTRGFilter)
 656                     ; 665 {
 657  0330               _TIM1_ETRClockMode1Config:
 658  0330 89            	pushw	x
 659       00000000      OFST:	set	0
 661                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
 662                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
 663                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
 664  0331 7b05          	ld	a,(OFST+5,sp)
 665  0333 88            	push	a
 666  0334 7b02          	ld	a,(OFST+2,sp)
 667  0336 95            	ld	xh,a
 668  0337 ad1b          	call	_TIM1_ETRConfig
 670  0339 84            	pop	a
 671                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
 671                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
 672  033a c65252        	ld	a,21074
 673  033d aa77          	or	a,#119
 674  033f c75252        	ld	21074,a
 675                     ; 676 }
 676  0342 85            	popw	x
 677  0343 81            	ret	
 679                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
 679                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
 679                     ; 696                               uint8_t ExtTRGFilter)
 679                     ; 697 {
 680  0344               _TIM1_ETRClockMode2Config:
 681  0344 89            	pushw	x
 682       00000000      OFST:	set	0
 684                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
 685                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
 686                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
 687  0345 7b05          	ld	a,(OFST+5,sp)
 688  0347 88            	push	a
 689  0348 7b02          	ld	a,(OFST+2,sp)
 690  034a 95            	ld	xh,a
 691  034b ad07          	call	_TIM1_ETRConfig
 693  034d 721c5253      	bset	21075,#6
 694                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
 695                     ; 707 }
 696  0351 5b03          	addw	sp,#3
 697  0353 81            	ret	
 699                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
 699                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
 699                     ; 727                     uint8_t ExtTRGFilter)
 699                     ; 728 {
 700  0354               _TIM1_ETRConfig:
 701  0354 89            	pushw	x
 702       00000000      OFST:	set	0
 704                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
 705                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
 705                     ; 733                          (uint8_t)ExtTRGFilter );
 706  0355 9f            	ld	a,xl
 707  0356 1a01          	or	a,(OFST+1,sp)
 708  0358 1a05          	or	a,(OFST+5,sp)
 709  035a ca5253        	or	a,21075
 710  035d c75253        	ld	21075,a
 711                     ; 734 }
 712  0360 85            	popw	x
 713  0361 81            	ret	
 715                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
 715                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
 715                     ; 753                                  uint8_t ICFilter)
 715                     ; 754 {
 716  0362               _TIM1_TIxExternalClockConfig:
 717  0362 89            	pushw	x
 718       00000000      OFST:	set	0
 720                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
 721                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
 722                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
 723                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
 724  0363 9e            	ld	a,xh
 725  0364 a160          	cp	a,#96
 726  0366 260d          	jrne	L36
 727                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
 728  0368 7b05          	ld	a,(OFST+5,sp)
 729  036a 88            	push	a
 730  036b 9f            	ld	a,xl
 731  036c ae0001        	ldw	x,#1
 732  036f 95            	ld	xh,a
 733  0370 cd07d3        	call	L5_TI2_Config
 736  0373 200c          	jra	L56
 737  0375               L36:
 738                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
 739  0375 7b05          	ld	a,(OFST+5,sp)
 740  0377 88            	push	a
 741  0378 7b03          	ld	a,(OFST+3,sp)
 742  037a ae0001        	ldw	x,#1
 743  037d 95            	ld	xh,a
 744  037e cd07a3        	call	L3_TI1_Config
 746  0381               L56:
 747  0381 84            	pop	a
 748                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
 749  0382 7b01          	ld	a,(OFST+1,sp)
 750  0384 ad0a          	call	_TIM1_SelectInputTrigger
 752                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
 753  0386 c65252        	ld	a,21074
 754  0389 aa07          	or	a,#7
 755  038b c75252        	ld	21074,a
 756                     ; 775 }
 757  038e 85            	popw	x
 758  038f 81            	ret	
 760                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
 760                     ; 788 {
 761  0390               _TIM1_SelectInputTrigger:
 762  0390 88            	push	a
 763       00000000      OFST:	set	0
 765                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
 766                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
 767  0391 c65252        	ld	a,21074
 768  0394 a48f          	and	a,#143
 769  0396 1a01          	or	a,(OFST+1,sp)
 770  0398 c75252        	ld	21074,a
 771                     ; 794 }
 772  039b 84            	pop	a
 773  039c 81            	ret	
 775                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 775                     ; 804 {
 776  039d               _TIM1_UpdateDisableConfig:
 778                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 779                     ; 809   if (NewState != DISABLE)
 780  039d 4d            	tnz	a
 781  039e 2705          	jreq	L76
 782                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
 783  03a0 72125250      	bset	21072,#1
 785  03a4 81            	ret	
 786  03a5               L76:
 787                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 788  03a5 72135250      	bres	21072,#1
 789                     ; 817 }
 790  03a9 81            	ret	
 792                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 792                     ; 828 {
 793  03aa               _TIM1_UpdateRequestConfig:
 795                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
 796                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
 797  03aa 4d            	tnz	a
 798  03ab 2705          	jreq	L37
 799                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
 800  03ad 72145250      	bset	21072,#2
 802  03b1 81            	ret	
 803  03b2               L37:
 804                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 805  03b2 72155250      	bres	21072,#2
 806                     ; 841 }
 807  03b6 81            	ret	
 809                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
 809                     ; 850 {
 810  03b7               _TIM1_SelectHallSensor:
 812                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 813                     ; 855   if (NewState != DISABLE)
 814  03b7 4d            	tnz	a
 815  03b8 2705          	jreq	L77
 816                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
 817  03ba 721e5251      	bset	21073,#7
 819  03be 81            	ret	
 820  03bf               L77:
 821                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
 822  03bf 721f5251      	bres	21073,#7
 823                     ; 863 }
 824  03c3 81            	ret	
 826                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 826                     ; 874 {
 827  03c4               _TIM1_SelectOnePulseMode:
 829                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
 830                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
 831  03c4 4d            	tnz	a
 832  03c5 2705          	jreq	L301
 833                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
 834  03c7 72165250      	bset	21072,#3
 836  03cb 81            	ret	
 837  03cc               L301:
 838                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
 839  03cc 72175250      	bres	21072,#3
 840                     ; 888 }
 841  03d0 81            	ret	
 843                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
 843                     ; 904 {
 844  03d1               _TIM1_SelectOutputTrigger:
 845  03d1 88            	push	a
 846       00000000      OFST:	set	0
 848                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
 849                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
 849                     ; 910                         (uint8_t) TIM1_TRGOSource);
 850  03d2 c65251        	ld	a,21073
 851  03d5 a48f          	and	a,#143
 852  03d7 1a01          	or	a,(OFST+1,sp)
 853  03d9 c75251        	ld	21073,a
 854                     ; 911 }
 855  03dc 84            	pop	a
 856  03dd 81            	ret	
 858                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
 858                     ; 924 {
 859  03de               _TIM1_SelectSlaveMode:
 860  03de 88            	push	a
 861       00000000      OFST:	set	0
 863                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
 864                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
 864                     ; 930                          (uint8_t)TIM1_SlaveMode);
 865  03df c65252        	ld	a,21074
 866  03e2 a4f8          	and	a,#248
 867  03e4 1a01          	or	a,(OFST+1,sp)
 868  03e6 c75252        	ld	21074,a
 869                     ; 931 }
 870  03e9 84            	pop	a
 871  03ea 81            	ret	
 873                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
 873                     ; 940 {
 874  03eb               _TIM1_SelectMasterSlaveMode:
 876                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 877                     ; 945   if (NewState != DISABLE)
 878  03eb 4d            	tnz	a
 879  03ec 2705          	jreq	L701
 880                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
 881  03ee 721e5252      	bset	21074,#7
 883  03f2 81            	ret	
 884  03f3               L701:
 885                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
 886  03f3 721f5252      	bres	21074,#7
 887                     ; 953 }
 888  03f7 81            	ret	
 890                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
 890                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
 890                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
 890                     ; 978 {
 891  03f8               _TIM1_EncoderInterfaceConfig:
 892  03f8 89            	pushw	x
 893       00000000      OFST:	set	0
 895                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
 896                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
 897                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
 898                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
 899  03f9 9f            	ld	a,xl
 900  03fa 4d            	tnz	a
 901  03fb 2706          	jreq	L311
 902                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
 903  03fd 7212525c      	bset	21084,#1
 905  0401 2004          	jra	L511
 906  0403               L311:
 907                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
 908  0403 7213525c      	bres	21084,#1
 909  0407               L511:
 910                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
 911  0407 7b05          	ld	a,(OFST+5,sp)
 912  0409 2706          	jreq	L711
 913                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
 914  040b 721a525c      	bset	21084,#5
 916  040f 2004          	jra	L121
 917  0411               L711:
 918                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
 919  0411 721b525c      	bres	21084,#5
 920  0415               L121:
 921                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
 921                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
 922  0415 c65252        	ld	a,21074
 923  0418 a4f0          	and	a,#240
 924  041a 1a01          	or	a,(OFST+1,sp)
 925  041c c75252        	ld	21074,a
 926                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
 926                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
 927  041f c65258        	ld	a,21080
 928  0422 a4fc          	and	a,#252
 929  0424 aa01          	or	a,#1
 930  0426 c75258        	ld	21080,a
 931                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
 931                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
 932  0429 c65259        	ld	a,21081
 933  042c a4fc          	and	a,#252
 934  042e aa01          	or	a,#1
 935  0430 c75259        	ld	21081,a
 936                     ; 1011 }
 937  0433 85            	popw	x
 938  0434 81            	ret	
 940                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
 940                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 940                     ; 1025 {
 941  0435               _TIM1_PrescalerConfig:
 942       fffffffe      OFST: set -2
 944                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
 945                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 946  0435 9e            	ld	a,xh
 947  0436 c75260        	ld	21088,a
 948                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
 949  0439 9f            	ld	a,xl
 950  043a c75261        	ld	21089,a
 951                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 952  043d 7b03          	ld	a,(OFST+5,sp)
 953  043f c75257        	ld	21079,a
 954                     ; 1035 }
 955  0442 81            	ret	
 957                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 957                     ; 1049 {
 958  0443               _TIM1_CounterModeConfig:
 959  0443 88            	push	a
 960       00000000      OFST:	set	0
 962                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 963                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 963                     ; 1056                         | (uint8_t)TIM1_CounterMode);
 964  0444 c65250        	ld	a,21072
 965  0447 a48f          	and	a,#143
 966  0449 1a01          	or	a,(OFST+1,sp)
 967  044b c75250        	ld	21072,a
 968                     ; 1057 }
 969  044e 84            	pop	a
 970  044f 81            	ret	
 972                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 972                     ; 1068 {
 973  0450               _TIM1_ForcedOC1Config:
 974  0450 88            	push	a
 975       00000000      OFST:	set	0
 977                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
 978                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
 978                     ; 1074                            (uint8_t)TIM1_ForcedAction);
 979  0451 c65258        	ld	a,21080
 980  0454 a48f          	and	a,#143
 981  0456 1a01          	or	a,(OFST+1,sp)
 982  0458 c75258        	ld	21080,a
 983                     ; 1075 }
 984  045b 84            	pop	a
 985  045c 81            	ret	
 987                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
 987                     ; 1086 {
 988  045d               _TIM1_ForcedOC2Config:
 989  045d 88            	push	a
 990       00000000      OFST:	set	0
 992                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
 993                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
 993                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
 994  045e c65259        	ld	a,21081
 995  0461 a48f          	and	a,#143
 996  0463 1a01          	or	a,(OFST+1,sp)
 997  0465 c75259        	ld	21081,a
 998                     ; 1093 }
 999  0468 84            	pop	a
1000  0469 81            	ret	
1002                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1002                     ; 1105 {
1003  046a               _TIM1_ForcedOC3Config:
1004  046a 88            	push	a
1005       00000000      OFST:	set	0
1007                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1008                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
1008                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
1009  046b c6525a        	ld	a,21082
1010  046e a48f          	and	a,#143
1011  0470 1a01          	or	a,(OFST+1,sp)
1012  0472 c7525a        	ld	21082,a
1013                     ; 1112 }
1014  0475 84            	pop	a
1015  0476 81            	ret	
1017                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
1017                     ; 1124 {
1018  0477               _TIM1_ForcedOC4Config:
1019  0477 88            	push	a
1020       00000000      OFST:	set	0
1022                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
1023                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
1023                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
1024  0478 c6525b        	ld	a,21083
1025  047b a48f          	and	a,#143
1026  047d 1a01          	or	a,(OFST+1,sp)
1027  047f c7525b        	ld	21083,a
1028                     ; 1131 }
1029  0482 84            	pop	a
1030  0483 81            	ret	
1032                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
1032                     ; 1140 {
1033  0484               _TIM1_ARRPreloadConfig:
1035                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036                     ; 1145   if (NewState != DISABLE)
1037  0484 4d            	tnz	a
1038  0485 2705          	jreq	L321
1039                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
1040  0487 721e5250      	bset	21072,#7
1042  048b 81            	ret	
1043  048c               L321:
1044                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
1045  048c 721f5250      	bres	21072,#7
1046                     ; 1153 }
1047  0490 81            	ret	
1049                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
1049                     ; 1162 {
1050  0491               _TIM1_SelectCOM:
1052                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1053                     ; 1167   if (NewState != DISABLE)
1054  0491 4d            	tnz	a
1055  0492 2705          	jreq	L721
1056                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
1057  0494 72145251      	bset	21073,#2
1059  0498 81            	ret	
1060  0499               L721:
1061                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
1062  0499 72155251      	bres	21073,#2
1063                     ; 1175 }
1064  049d 81            	ret	
1066                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
1066                     ; 1184 {
1067  049e               _TIM1_CCPreloadControl:
1069                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1070                     ; 1189   if (NewState != DISABLE)
1071  049e 4d            	tnz	a
1072  049f 2705          	jreq	L331
1073                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
1074  04a1 72105251      	bset	21073,#0
1076  04a5 81            	ret	
1077  04a6               L331:
1078                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
1079  04a6 72115251      	bres	21073,#0
1080                     ; 1197 }
1081  04aa 81            	ret	
1083                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
1083                     ; 1206 {
1084  04ab               _TIM1_OC1PreloadConfig:
1086                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1087                     ; 1211   if (NewState != DISABLE)
1088  04ab 4d            	tnz	a
1089  04ac 2705          	jreq	L731
1090                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
1091  04ae 72165258      	bset	21080,#3
1093  04b2 81            	ret	
1094  04b3               L731:
1095                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
1096  04b3 72175258      	bres	21080,#3
1097                     ; 1219 }
1098  04b7 81            	ret	
1100                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
1100                     ; 1228 {
1101  04b8               _TIM1_OC2PreloadConfig:
1103                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1104                     ; 1233   if (NewState != DISABLE)
1105  04b8 4d            	tnz	a
1106  04b9 2705          	jreq	L341
1107                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
1108  04bb 72165259      	bset	21081,#3
1110  04bf 81            	ret	
1111  04c0               L341:
1112                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
1113  04c0 72175259      	bres	21081,#3
1114                     ; 1241 }
1115  04c4 81            	ret	
1117                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
1117                     ; 1250 {
1118  04c5               _TIM1_OC3PreloadConfig:
1120                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1121                     ; 1255   if (NewState != DISABLE)
1122  04c5 4d            	tnz	a
1123  04c6 2705          	jreq	L741
1124                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
1125  04c8 7216525a      	bset	21082,#3
1127  04cc 81            	ret	
1128  04cd               L741:
1129                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
1130  04cd 7217525a      	bres	21082,#3
1131                     ; 1263 }
1132  04d1 81            	ret	
1134                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
1134                     ; 1272 {
1135  04d2               _TIM1_OC4PreloadConfig:
1137                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1138                     ; 1277   if (NewState != DISABLE)
1139  04d2 4d            	tnz	a
1140  04d3 2705          	jreq	L351
1141                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
1142  04d5 7216525b      	bset	21083,#3
1144  04d9 81            	ret	
1145  04da               L351:
1146                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
1147  04da 7217525b      	bres	21083,#3
1148                     ; 1285 }
1149  04de 81            	ret	
1151                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
1151                     ; 1294 {
1152  04df               _TIM1_OC1FastConfig:
1154                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1155                     ; 1299   if (NewState != DISABLE)
1156  04df 4d            	tnz	a
1157  04e0 2705          	jreq	L751
1158                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
1159  04e2 72145258      	bset	21080,#2
1161  04e6 81            	ret	
1162  04e7               L751:
1163                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
1164  04e7 72155258      	bres	21080,#2
1165                     ; 1307 }
1166  04eb 81            	ret	
1168                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
1168                     ; 1316 {
1169  04ec               _TIM1_OC2FastConfig:
1171                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1172                     ; 1321   if (NewState != DISABLE)
1173  04ec 4d            	tnz	a
1174  04ed 2705          	jreq	L361
1175                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
1176  04ef 72145259      	bset	21081,#2
1178  04f3 81            	ret	
1179  04f4               L361:
1180                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
1181  04f4 72155259      	bres	21081,#2
1182                     ; 1329 }
1183  04f8 81            	ret	
1185                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
1185                     ; 1338 {
1186  04f9               _TIM1_OC3FastConfig:
1188                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1189                     ; 1343   if (NewState != DISABLE)
1190  04f9 4d            	tnz	a
1191  04fa 2705          	jreq	L761
1192                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
1193  04fc 7214525a      	bset	21082,#2
1195  0500 81            	ret	
1196  0501               L761:
1197                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
1198  0501 7215525a      	bres	21082,#2
1199                     ; 1351 }
1200  0505 81            	ret	
1202                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
1202                     ; 1360 {
1203  0506               _TIM1_OC4FastConfig:
1205                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1206                     ; 1365   if (NewState != DISABLE)
1207  0506 4d            	tnz	a
1208  0507 2705          	jreq	L371
1209                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
1210  0509 7214525b      	bset	21083,#2
1212  050d 81            	ret	
1213  050e               L371:
1214                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
1215  050e 7215525b      	bres	21083,#2
1216                     ; 1373 }
1217  0512 81            	ret	
1219                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
1219                     ; 1390 {
1220  0513               _TIM1_GenerateEvent:
1222                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
1223                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
1224  0513 c75257        	ld	21079,a
1225                     ; 1396 }
1226  0516 81            	ret	
1228                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
1228                     ; 1407 {
1229  0517               _TIM1_OC1PolarityConfig:
1231                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1232                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
1233  0517 4d            	tnz	a
1234  0518 2705          	jreq	L771
1235                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1236  051a 7212525c      	bset	21084,#1
1238  051e 81            	ret	
1239  051f               L771:
1240                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1241  051f 7213525c      	bres	21084,#1
1242                     ; 1420 }
1243  0523 81            	ret	
1245                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
1245                     ; 1431 {
1246  0524               _TIM1_OC1NPolarityConfig:
1248                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1249                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
1250  0524 4d            	tnz	a
1251  0525 2705          	jreq	L302
1252                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
1253  0527 7216525c      	bset	21084,#3
1255  052b 81            	ret	
1256  052c               L302:
1257                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
1258  052c 7217525c      	bres	21084,#3
1259                     ; 1444 }
1260  0530 81            	ret	
1262                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
1262                     ; 1455 {
1263  0531               _TIM1_OC2PolarityConfig:
1265                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1266                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
1267  0531 4d            	tnz	a
1268  0532 2705          	jreq	L702
1269                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
1270  0534 721a525c      	bset	21084,#5
1272  0538 81            	ret	
1273  0539               L702:
1274                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
1275  0539 721b525c      	bres	21084,#5
1276                     ; 1468 }
1277  053d 81            	ret	
1279                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
1279                     ; 1479 {
1280  053e               _TIM1_OC2NPolarityConfig:
1282                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1283                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
1284  053e 4d            	tnz	a
1285  053f 2705          	jreq	L312
1286                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
1287  0541 721e525c      	bset	21084,#7
1289  0545 81            	ret	
1290  0546               L312:
1291                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
1292  0546 721f525c      	bres	21084,#7
1293                     ; 1492 }
1294  054a 81            	ret	
1296                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
1296                     ; 1503 {
1297  054b               _TIM1_OC3PolarityConfig:
1299                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1300                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
1301  054b 4d            	tnz	a
1302  054c 2705          	jreq	L712
1303                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
1304  054e 7212525d      	bset	21085,#1
1306  0552 81            	ret	
1307  0553               L712:
1308                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
1309  0553 7213525d      	bres	21085,#1
1310                     ; 1516 }
1311  0557 81            	ret	
1313                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
1313                     ; 1528 {
1314  0558               _TIM1_OC3NPolarityConfig:
1316                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1317                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
1318  0558 4d            	tnz	a
1319  0559 2705          	jreq	L322
1320                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
1321  055b 7216525d      	bset	21085,#3
1323  055f 81            	ret	
1324  0560               L322:
1325                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
1326  0560 7217525d      	bres	21085,#3
1327                     ; 1541 }
1328  0564 81            	ret	
1330                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
1330                     ; 1552 {
1331  0565               _TIM1_OC4PolarityConfig:
1333                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1334                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
1335  0565 4d            	tnz	a
1336  0566 2705          	jreq	L722
1337                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
1338  0568 721a525d      	bset	21085,#5
1340  056c 81            	ret	
1341  056d               L722:
1342                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
1343  056d 721b525d      	bres	21085,#5
1344                     ; 1565 }
1345  0571 81            	ret	
1347                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1347                     ; 1580 {
1348  0572               _TIM1_CCxCmd:
1349  0572 89            	pushw	x
1350       00000000      OFST:	set	0
1352                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1353                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1354                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
1355  0573 9e            	ld	a,xh
1356  0574 4d            	tnz	a
1357  0575 2610          	jrne	L332
1358                     ; 1588     if (NewState != DISABLE)
1359  0577 9f            	ld	a,xl
1360  0578 4d            	tnz	a
1361  0579 2706          	jreq	L532
1362                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
1363  057b 7210525c      	bset	21084,#0
1365  057f 203e          	jra	L142
1366  0581               L532:
1367                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1368  0581 7211525c      	bres	21084,#0
1369  0585 2038          	jra	L142
1370  0587               L332:
1371                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
1372  0587 7b01          	ld	a,(OFST+1,sp)
1373  0589 a101          	cp	a,#1
1374  058b 2610          	jrne	L342
1375                     ; 1601     if (NewState != DISABLE)
1376  058d 7b02          	ld	a,(OFST+2,sp)
1377  058f 2706          	jreq	L542
1378                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
1379  0591 7218525c      	bset	21084,#4
1381  0595 2028          	jra	L142
1382  0597               L542:
1383                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
1384  0597 7219525c      	bres	21084,#4
1385  059b 2022          	jra	L142
1386  059d               L342:
1387                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
1388  059d a102          	cp	a,#2
1389  059f 2610          	jrne	L352
1390                     ; 1613     if (NewState != DISABLE)
1391  05a1 7b02          	ld	a,(OFST+2,sp)
1392  05a3 2706          	jreq	L552
1393                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
1394  05a5 7210525d      	bset	21085,#0
1396  05a9 2014          	jra	L142
1397  05ab               L552:
1398                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
1399  05ab 7211525d      	bres	21085,#0
1400  05af 200e          	jra	L142
1401  05b1               L352:
1402                     ; 1625     if (NewState != DISABLE)
1403  05b1 7b02          	ld	a,(OFST+2,sp)
1404  05b3 2706          	jreq	L362
1405                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
1406  05b5 7218525d      	bset	21085,#4
1408  05b9 2004          	jra	L142
1409  05bb               L362:
1410                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
1411  05bb 7219525d      	bres	21085,#4
1412  05bf               L142:
1413                     ; 1634 }
1414  05bf 85            	popw	x
1415  05c0 81            	ret	
1417                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
1417                     ; 1648 {
1418  05c1               _TIM1_CCxNCmd:
1419  05c1 89            	pushw	x
1420       00000000      OFST:	set	0
1422                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
1423                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1424                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
1425  05c2 9e            	ld	a,xh
1426  05c3 4d            	tnz	a
1427  05c4 2610          	jrne	L762
1428                     ; 1656     if (NewState != DISABLE)
1429  05c6 9f            	ld	a,xl
1430  05c7 4d            	tnz	a
1431  05c8 2706          	jreq	L172
1432                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
1433  05ca 7214525c      	bset	21084,#2
1435  05ce 2029          	jra	L572
1436  05d0               L172:
1437                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
1438  05d0 7215525c      	bres	21084,#2
1439  05d4 2023          	jra	L572
1440  05d6               L762:
1441                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
1442  05d6 7b01          	ld	a,(OFST+1,sp)
1443  05d8 4a            	dec	a
1444  05d9 2610          	jrne	L772
1445                     ; 1668     if (NewState != DISABLE)
1446  05db 7b02          	ld	a,(OFST+2,sp)
1447  05dd 2706          	jreq	L103
1448                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
1449  05df 721c525c      	bset	21084,#6
1451  05e3 2014          	jra	L572
1452  05e5               L103:
1453                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
1454  05e5 721d525c      	bres	21084,#6
1455  05e9 200e          	jra	L572
1456  05eb               L772:
1457                     ; 1680     if (NewState != DISABLE)
1458  05eb 7b02          	ld	a,(OFST+2,sp)
1459  05ed 2706          	jreq	L703
1460                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
1461  05ef 7214525d      	bset	21085,#2
1463  05f3 2004          	jra	L572
1464  05f5               L703:
1465                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
1466  05f5 7215525d      	bres	21085,#2
1467  05f9               L572:
1468                     ; 1689 }
1469  05f9 85            	popw	x
1470  05fa 81            	ret	
1472                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
1472                     ; 1713 {
1473  05fb               _TIM1_SelectOCxM:
1474  05fb 89            	pushw	x
1475       00000000      OFST:	set	0
1477                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1478                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
1479                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
1480  05fc 9e            	ld	a,xh
1481  05fd 4d            	tnz	a
1482  05fe 2610          	jrne	L313
1483                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1484  0600 7211525c      	bres	21084,#0
1485                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
1485                     ; 1725                             | (uint8_t)TIM1_OCMode);
1486  0604 c65258        	ld	a,21080
1487  0607 a48f          	and	a,#143
1488  0609 1a02          	or	a,(OFST+2,sp)
1489  060b c75258        	ld	21080,a
1491  060e 2038          	jra	L513
1492  0610               L313:
1493                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
1494  0610 7b01          	ld	a,(OFST+1,sp)
1495  0612 a101          	cp	a,#1
1496  0614 2610          	jrne	L713
1497                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
1498  0616 7219525c      	bres	21084,#4
1499                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
1499                     ; 1734                             | (uint8_t)TIM1_OCMode);
1500  061a c65259        	ld	a,21081
1501  061d a48f          	and	a,#143
1502  061f 1a02          	or	a,(OFST+2,sp)
1503  0621 c75259        	ld	21081,a
1505  0624 2022          	jra	L513
1506  0626               L713:
1507                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
1508  0626 a102          	cp	a,#2
1509  0628 2610          	jrne	L323
1510                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
1511  062a 7211525d      	bres	21085,#0
1512                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
1512                     ; 1743                             | (uint8_t)TIM1_OCMode);
1513  062e c6525a        	ld	a,21082
1514  0631 a48f          	and	a,#143
1515  0633 1a02          	or	a,(OFST+2,sp)
1516  0635 c7525a        	ld	21082,a
1518  0638 200e          	jra	L513
1519  063a               L323:
1520                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
1521  063a 7219525d      	bres	21085,#4
1522                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
1522                     ; 1752                             | (uint8_t)TIM1_OCMode);
1523  063e c6525b        	ld	a,21083
1524  0641 a48f          	and	a,#143
1525  0643 1a02          	or	a,(OFST+2,sp)
1526  0645 c7525b        	ld	21083,a
1527  0648               L513:
1528                     ; 1754 }
1529  0648 85            	popw	x
1530  0649 81            	ret	
1532                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
1532                     ; 1763 {
1533  064a               _TIM1_SetCounter:
1535                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
1536  064a 9e            	ld	a,xh
1537  064b c7525e        	ld	21086,a
1538                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
1539  064e 9f            	ld	a,xl
1540  064f c7525f        	ld	21087,a
1541                     ; 1767 }
1542  0652 81            	ret	
1544                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
1544                     ; 1776 {
1545  0653               _TIM1_SetAutoreload:
1547                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
1548  0653 9e            	ld	a,xh
1549  0654 c75262        	ld	21090,a
1550                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
1551  0657 9f            	ld	a,xl
1552  0658 c75263        	ld	21091,a
1553                     ; 1780  }
1554  065b 81            	ret	
1556                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
1556                     ; 1789 {
1557  065c               _TIM1_SetCompare1:
1559                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
1560  065c 9e            	ld	a,xh
1561  065d c75265        	ld	21093,a
1562                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
1563  0660 9f            	ld	a,xl
1564  0661 c75266        	ld	21094,a
1565                     ; 1793 }
1566  0664 81            	ret	
1568                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
1568                     ; 1802 {
1569  0665               _TIM1_SetCompare2:
1571                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
1572  0665 9e            	ld	a,xh
1573  0666 c75267        	ld	21095,a
1574                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
1575  0669 9f            	ld	a,xl
1576  066a c75268        	ld	21096,a
1577                     ; 1806 }
1578  066d 81            	ret	
1580                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
1580                     ; 1815 {
1581  066e               _TIM1_SetCompare3:
1583                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
1584  066e 9e            	ld	a,xh
1585  066f c75269        	ld	21097,a
1586                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
1587  0672 9f            	ld	a,xl
1588  0673 c7526a        	ld	21098,a
1589                     ; 1819 }
1590  0676 81            	ret	
1592                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
1592                     ; 1828 {
1593  0677               _TIM1_SetCompare4:
1595                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
1596  0677 9e            	ld	a,xh
1597  0678 c7526b        	ld	21099,a
1598                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
1599  067b 9f            	ld	a,xl
1600  067c c7526c        	ld	21100,a
1601                     ; 1832 }
1602  067f 81            	ret	
1604                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
1604                     ; 1845 {
1605  0680               _TIM1_SetIC1Prescaler:
1606  0680 88            	push	a
1607       00000000      OFST:	set	0
1609                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
1610                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
1610                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
1611  0681 c65258        	ld	a,21080
1612  0684 a4f3          	and	a,#243
1613  0686 1a01          	or	a,(OFST+1,sp)
1614  0688 c75258        	ld	21080,a
1615                     ; 1852 }
1616  068b 84            	pop	a
1617  068c 81            	ret	
1619                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
1619                     ; 1865 {
1620  068d               _TIM1_SetIC2Prescaler:
1621  068d 88            	push	a
1622       00000000      OFST:	set	0
1624                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
1625                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
1625                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
1626  068e c65259        	ld	a,21081
1627  0691 a4f3          	and	a,#243
1628  0693 1a01          	or	a,(OFST+1,sp)
1629  0695 c75259        	ld	21081,a
1630                     ; 1873 }
1631  0698 84            	pop	a
1632  0699 81            	ret	
1634                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
1634                     ; 1886 {
1635  069a               _TIM1_SetIC3Prescaler:
1636  069a 88            	push	a
1637       00000000      OFST:	set	0
1639                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
1640                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
1640                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
1641  069b c6525a        	ld	a,21082
1642  069e a4f3          	and	a,#243
1643  06a0 1a01          	or	a,(OFST+1,sp)
1644  06a2 c7525a        	ld	21082,a
1645                     ; 1894 }
1646  06a5 84            	pop	a
1647  06a6 81            	ret	
1649                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
1649                     ; 1907 {
1650  06a7               _TIM1_SetIC4Prescaler:
1651  06a7 88            	push	a
1652       00000000      OFST:	set	0
1654                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
1655                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
1655                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
1656  06a8 c6525b        	ld	a,21083
1657  06ab a4f3          	and	a,#243
1658  06ad 1a01          	or	a,(OFST+1,sp)
1659  06af c7525b        	ld	21083,a
1660                     ; 1915 }
1661  06b2 84            	pop	a
1662  06b3 81            	ret	
1664                     ; 1922 uint16_t TIM1_GetCapture1(void)
1664                     ; 1923 {
1665  06b4               _TIM1_GetCapture1:
1666  06b4 5204          	subw	sp,#4
1667       00000004      OFST:	set	4
1669                     ; 1926   uint16_t tmpccr1 = 0;
1670                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
1672                     ; 1929   tmpccr1h = TIM1->CCR1H;
1673  06b6 c65265        	ld	a,21093
1674  06b9 6b02          	ld	(OFST-2,sp),a
1675                     ; 1930   tmpccr1l = TIM1->CCR1L;
1676  06bb c65266        	ld	a,21094
1677  06be 6b01          	ld	(OFST-3,sp),a
1678                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
1679  06c0 5f            	clrw	x
1680  06c1 97            	ld	xl,a
1681  06c2 1f03          	ldw	(OFST-1,sp),x
1682                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
1683  06c4 5f            	clrw	x
1684  06c5 7b02          	ld	a,(OFST-2,sp)
1685  06c7 97            	ld	xl,a
1686  06c8 7b04          	ld	a,(OFST+0,sp)
1687  06ca 01            	rrwa	x,a
1688  06cb 1a03          	or	a,(OFST-1,sp)
1689  06cd 01            	rrwa	x,a
1690                     ; 1935   return (uint16_t)tmpccr1;
1692  06ce 5b04          	addw	sp,#4
1693  06d0 81            	ret	
1695                     ; 1943 uint16_t TIM1_GetCapture2(void)
1695                     ; 1944 {
1696  06d1               _TIM1_GetCapture2:
1697  06d1 5204          	subw	sp,#4
1698       00000004      OFST:	set	4
1700                     ; 1947   uint16_t tmpccr2 = 0;
1701                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
1703                     ; 1950   tmpccr2h = TIM1->CCR2H;
1704  06d3 c65267        	ld	a,21095
1705  06d6 6b02          	ld	(OFST-2,sp),a
1706                     ; 1951   tmpccr2l = TIM1->CCR2L;
1707  06d8 c65268        	ld	a,21096
1708  06db 6b01          	ld	(OFST-3,sp),a
1709                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
1710  06dd 5f            	clrw	x
1711  06de 97            	ld	xl,a
1712  06df 1f03          	ldw	(OFST-1,sp),x
1713                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
1714  06e1 5f            	clrw	x
1715  06e2 7b02          	ld	a,(OFST-2,sp)
1716  06e4 97            	ld	xl,a
1717  06e5 7b04          	ld	a,(OFST+0,sp)
1718  06e7 01            	rrwa	x,a
1719  06e8 1a03          	or	a,(OFST-1,sp)
1720  06ea 01            	rrwa	x,a
1721                     ; 1956   return (uint16_t)tmpccr2;
1723  06eb 5b04          	addw	sp,#4
1724  06ed 81            	ret	
1726                     ; 1964 uint16_t TIM1_GetCapture3(void)
1726                     ; 1965 {
1727  06ee               _TIM1_GetCapture3:
1728  06ee 5204          	subw	sp,#4
1729       00000004      OFST:	set	4
1731                     ; 1967   uint16_t tmpccr3 = 0;
1732                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
1734                     ; 1970   tmpccr3h = TIM1->CCR3H;
1735  06f0 c65269        	ld	a,21097
1736  06f3 6b02          	ld	(OFST-2,sp),a
1737                     ; 1971   tmpccr3l = TIM1->CCR3L;
1738  06f5 c6526a        	ld	a,21098
1739  06f8 6b01          	ld	(OFST-3,sp),a
1740                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
1741  06fa 5f            	clrw	x
1742  06fb 97            	ld	xl,a
1743  06fc 1f03          	ldw	(OFST-1,sp),x
1744                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
1745  06fe 5f            	clrw	x
1746  06ff 7b02          	ld	a,(OFST-2,sp)
1747  0701 97            	ld	xl,a
1748  0702 7b04          	ld	a,(OFST+0,sp)
1749  0704 01            	rrwa	x,a
1750  0705 1a03          	or	a,(OFST-1,sp)
1751  0707 01            	rrwa	x,a
1752                     ; 1976   return (uint16_t)tmpccr3;
1754  0708 5b04          	addw	sp,#4
1755  070a 81            	ret	
1757                     ; 1984 uint16_t TIM1_GetCapture4(void)
1757                     ; 1985 {
1758  070b               _TIM1_GetCapture4:
1759  070b 5204          	subw	sp,#4
1760       00000004      OFST:	set	4
1762                     ; 1987   uint16_t tmpccr4 = 0;
1763                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
1765                     ; 1990   tmpccr4h = TIM1->CCR4H;
1766  070d c6526b        	ld	a,21099
1767  0710 6b02          	ld	(OFST-2,sp),a
1768                     ; 1991   tmpccr4l = TIM1->CCR4L;
1769  0712 c6526c        	ld	a,21100
1770  0715 6b01          	ld	(OFST-3,sp),a
1771                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
1772  0717 5f            	clrw	x
1773  0718 97            	ld	xl,a
1774  0719 1f03          	ldw	(OFST-1,sp),x
1775                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
1776  071b 5f            	clrw	x
1777  071c 7b02          	ld	a,(OFST-2,sp)
1778  071e 97            	ld	xl,a
1779  071f 7b04          	ld	a,(OFST+0,sp)
1780  0721 01            	rrwa	x,a
1781  0722 1a03          	or	a,(OFST-1,sp)
1782  0724 01            	rrwa	x,a
1783                     ; 1996   return (uint16_t)tmpccr4;
1785  0725 5b04          	addw	sp,#4
1786  0727 81            	ret	
1788                     ; 2004 uint16_t TIM1_GetCounter(void)
1788                     ; 2005 {
1789  0728               _TIM1_GetCounter:
1790  0728 89            	pushw	x
1791       00000002      OFST:	set	2
1793                     ; 2006   uint16_t tmpcntr = 0;
1794                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
1795  0729 c6525e        	ld	a,21086
1796  072c 97            	ld	xl,a
1797  072d 4f            	clr	a
1798  072e 02            	rlwa	x,a
1799  072f 1f01          	ldw	(OFST-1,sp),x
1800                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
1801  0731 c6525f        	ld	a,21087
1802  0734 5f            	clrw	x
1803  0735 97            	ld	xl,a
1804  0736 01            	rrwa	x,a
1805  0737 1a02          	or	a,(OFST+0,sp)
1806  0739 01            	rrwa	x,a
1807  073a 1a01          	or	a,(OFST-1,sp)
1808  073c 01            	rrwa	x,a
1810  073d 5b02          	addw	sp,#2
1811  073f 81            	ret	
1813                     ; 2019 uint16_t TIM1_GetPrescaler(void)
1813                     ; 2020 {
1814  0740               _TIM1_GetPrescaler:
1815  0740 89            	pushw	x
1816       00000002      OFST:	set	2
1818                     ; 2021   uint16_t temp = 0;
1819                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
1820  0741 c65260        	ld	a,21088
1821  0744 97            	ld	xl,a
1822  0745 4f            	clr	a
1823  0746 02            	rlwa	x,a
1824  0747 1f01          	ldw	(OFST-1,sp),x
1825                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
1826  0749 c65261        	ld	a,21089
1827  074c 5f            	clrw	x
1828  074d 97            	ld	xl,a
1829  074e 01            	rrwa	x,a
1830  074f 1a02          	or	a,(OFST+0,sp)
1831  0751 01            	rrwa	x,a
1832  0752 1a01          	or	a,(OFST-1,sp)
1833  0754 01            	rrwa	x,a
1835  0755 5b02          	addw	sp,#2
1836  0757 81            	ret	
1838                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
1838                     ; 2048 {
1839  0758               _TIM1_GetFlagStatus:
1840  0758 89            	pushw	x
1841  0759 89            	pushw	x
1842       00000002      OFST:	set	2
1844                     ; 2049   FlagStatus bitstatus = RESET;
1845                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
1847                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
1848                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
1849  075a 9f            	ld	a,xl
1850  075b c45255        	and	a,21077
1851  075e 6b01          	ld	(OFST-1,sp),a
1852                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
1853  0760 7b03          	ld	a,(OFST+1,sp)
1854  0762 6b02          	ld	(OFST+0,sp),a
1855                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
1856  0764 c45256        	and	a,21078
1857  0767 1a01          	or	a,(OFST-1,sp)
1858  0769 2702          	jreq	L723
1859                     ; 2060     bitstatus = SET;
1860  076b a601          	ld	a,#1
1862  076d               L723:
1863                     ; 2064     bitstatus = RESET;
1864                     ; 2066   return (FlagStatus)(bitstatus);
1866  076d 5b04          	addw	sp,#4
1867  076f 81            	ret	
1869                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
1869                     ; 2088 {
1870  0770               _TIM1_ClearFlag:
1871  0770 89            	pushw	x
1872       00000000      OFST:	set	0
1874                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
1875                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
1876  0771 9f            	ld	a,xl
1877  0772 43            	cpl	a
1878  0773 c75255        	ld	21077,a
1879                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
1879                     ; 2095                         (uint8_t)0x1E);
1880  0776 7b01          	ld	a,(OFST+1,sp)
1881  0778 43            	cpl	a
1882  0779 a41e          	and	a,#30
1883  077b c75256        	ld	21078,a
1884                     ; 2096 }
1885  077e 85            	popw	x
1886  077f 81            	ret	
1888                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
1888                     ; 2113 {
1889  0780               _TIM1_GetITStatus:
1890  0780 88            	push	a
1891  0781 89            	pushw	x
1892       00000002      OFST:	set	2
1894                     ; 2114   ITStatus bitstatus = RESET;
1895                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
1897                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
1898                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
1899  0782 c45255        	and	a,21077
1900  0785 6b01          	ld	(OFST-1,sp),a
1901                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
1902  0787 c65254        	ld	a,21076
1903  078a 1403          	and	a,(OFST+1,sp)
1904  078c 6b02          	ld	(OFST+0,sp),a
1905                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
1906  078e 7b01          	ld	a,(OFST-1,sp)
1907  0790 2708          	jreq	L333
1909  0792 7b02          	ld	a,(OFST+0,sp)
1910  0794 2704          	jreq	L333
1911                     ; 2126     bitstatus = SET;
1912  0796 a601          	ld	a,#1
1914  0798 2001          	jra	L533
1915  079a               L333:
1916                     ; 2130     bitstatus = RESET;
1917  079a 4f            	clr	a
1918  079b               L533:
1919                     ; 2132   return (ITStatus)(bitstatus);
1921  079b 5b03          	addw	sp,#3
1922  079d 81            	ret	
1924                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
1924                     ; 2150 {
1925  079e               _TIM1_ClearITPendingBit:
1927                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
1928                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
1929  079e 43            	cpl	a
1930  079f c75255        	ld	21077,a
1931                     ; 2156 }
1932  07a2 81            	ret	
1934                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
1934                     ; 2175                        uint8_t TIM1_ICSelection,
1934                     ; 2176                        uint8_t TIM1_ICFilter)
1934                     ; 2177 {
1935  07a3               L3_TI1_Config:
1936  07a3 89            	pushw	x
1937  07a4 88            	push	a
1938       00000001      OFST:	set	1
1940                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
1941  07a5 7211525c      	bres	21084,#0
1942                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
1942                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
1943  07a9 7b06          	ld	a,(OFST+5,sp)
1944  07ab 97            	ld	xl,a
1945  07ac a610          	ld	a,#16
1946  07ae 42            	mul	x,a
1947  07af 9f            	ld	a,xl
1948  07b0 1a03          	or	a,(OFST+2,sp)
1949  07b2 6b01          	ld	(OFST+0,sp),a
1950  07b4 c65258        	ld	a,21080
1951  07b7 a40c          	and	a,#12
1952  07b9 1a01          	or	a,(OFST+0,sp)
1953  07bb c75258        	ld	21080,a
1954                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
1955  07be 7b02          	ld	a,(OFST+1,sp)
1956  07c0 2706          	jreq	L733
1957                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
1958  07c2 7212525c      	bset	21084,#1
1960  07c6 2004          	jra	L143
1961  07c8               L733:
1962                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
1963  07c8 7213525c      	bres	21084,#1
1964  07cc               L143:
1965                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
1966  07cc 7210525c      	bset	21084,#0
1967                     ; 2197 }
1968  07d0 5b03          	addw	sp,#3
1969  07d2 81            	ret	
1971                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
1971                     ; 2216                        uint8_t TIM1_ICSelection,
1971                     ; 2217                        uint8_t TIM1_ICFilter)
1971                     ; 2218 {
1972  07d3               L5_TI2_Config:
1973  07d3 89            	pushw	x
1974  07d4 88            	push	a
1975       00000001      OFST:	set	1
1977                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
1978  07d5 7219525c      	bres	21084,#4
1979                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
1979                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
1980  07d9 7b06          	ld	a,(OFST+5,sp)
1981  07db 97            	ld	xl,a
1982  07dc a610          	ld	a,#16
1983  07de 42            	mul	x,a
1984  07df 9f            	ld	a,xl
1985  07e0 1a03          	or	a,(OFST+2,sp)
1986  07e2 6b01          	ld	(OFST+0,sp),a
1987  07e4 c65259        	ld	a,21081
1988  07e7 a40c          	and	a,#12
1989  07e9 1a01          	or	a,(OFST+0,sp)
1990  07eb c75259        	ld	21081,a
1991                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
1992  07ee 7b02          	ld	a,(OFST+1,sp)
1993  07f0 2706          	jreq	L343
1994                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
1995  07f2 721a525c      	bset	21084,#5
1997  07f6 2004          	jra	L543
1998  07f8               L343:
1999                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
2000  07f8 721b525c      	bres	21084,#5
2001  07fc               L543:
2002                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
2003  07fc 7218525c      	bset	21084,#4
2004                     ; 2236 }
2005  0800 5b03          	addw	sp,#3
2006  0802 81            	ret	
2008                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
2008                     ; 2255                        uint8_t TIM1_ICSelection,
2008                     ; 2256                        uint8_t TIM1_ICFilter)
2008                     ; 2257 {
2009  0803               L7_TI3_Config:
2010  0803 89            	pushw	x
2011  0804 88            	push	a
2012       00000001      OFST:	set	1
2014                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
2015  0805 7211525d      	bres	21085,#0
2016                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
2016                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2017  0809 7b06          	ld	a,(OFST+5,sp)
2018  080b 97            	ld	xl,a
2019  080c a610          	ld	a,#16
2020  080e 42            	mul	x,a
2021  080f 9f            	ld	a,xl
2022  0810 1a03          	or	a,(OFST+2,sp)
2023  0812 6b01          	ld	(OFST+0,sp),a
2024  0814 c6525a        	ld	a,21082
2025  0817 a40c          	and	a,#12
2026  0819 1a01          	or	a,(OFST+0,sp)
2027  081b c7525a        	ld	21082,a
2028                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
2029  081e 7b02          	ld	a,(OFST+1,sp)
2030  0820 2706          	jreq	L743
2031                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
2032  0822 7212525d      	bset	21085,#1
2034  0826 2004          	jra	L153
2035  0828               L743:
2036                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
2037  0828 7213525d      	bres	21085,#1
2038  082c               L153:
2039                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
2040  082c 7210525d      	bset	21085,#0
2041                     ; 2276 }
2042  0830 5b03          	addw	sp,#3
2043  0832 81            	ret	
2045                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
2045                     ; 2295                        uint8_t TIM1_ICSelection,
2045                     ; 2296                        uint8_t TIM1_ICFilter)
2045                     ; 2297 {
2046  0833               L11_TI4_Config:
2047  0833 89            	pushw	x
2048  0834 88            	push	a
2049       00000001      OFST:	set	1
2051                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
2052  0835 7219525d      	bres	21085,#4
2053                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
2053                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
2054  0839 7b06          	ld	a,(OFST+5,sp)
2055  083b 97            	ld	xl,a
2056  083c a610          	ld	a,#16
2057  083e 42            	mul	x,a
2058  083f 9f            	ld	a,xl
2059  0840 1a03          	or	a,(OFST+2,sp)
2060  0842 6b01          	ld	(OFST+0,sp),a
2061  0844 c6525b        	ld	a,21083
2062  0847 a40c          	and	a,#12
2063  0849 1a01          	or	a,(OFST+0,sp)
2064  084b c7525b        	ld	21083,a
2065                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
2066  084e 7b02          	ld	a,(OFST+1,sp)
2067  0850 2706          	jreq	L353
2068                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
2069  0852 721a525d      	bset	21085,#5
2071  0856 2004          	jra	L553
2072  0858               L353:
2073                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
2074  0858 721b525d      	bres	21085,#5
2075  085c               L553:
2076                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
2077  085c 7218525d      	bset	21085,#4
2078                     ; 2317 }
2079  0860 5b03          	addw	sp,#3
2080  0862 81            	ret	
2082                     	xdef	_TIM1_ClearITPendingBit
2083                     	xdef	_TIM1_GetITStatus
2084                     	xdef	_TIM1_ClearFlag
2085                     	xdef	_TIM1_GetFlagStatus
2086                     	xdef	_TIM1_GetPrescaler
2087                     	xdef	_TIM1_GetCounter
2088                     	xdef	_TIM1_GetCapture4
2089                     	xdef	_TIM1_GetCapture3
2090                     	xdef	_TIM1_GetCapture2
2091                     	xdef	_TIM1_GetCapture1
2092                     	xdef	_TIM1_SetIC4Prescaler
2093                     	xdef	_TIM1_SetIC3Prescaler
2094                     	xdef	_TIM1_SetIC2Prescaler
2095                     	xdef	_TIM1_SetIC1Prescaler
2096                     	xdef	_TIM1_SetCompare4
2097                     	xdef	_TIM1_SetCompare3
2098                     	xdef	_TIM1_SetCompare2
2099                     	xdef	_TIM1_SetCompare1
2100                     	xdef	_TIM1_SetAutoreload
2101                     	xdef	_TIM1_SetCounter
2102                     	xdef	_TIM1_SelectOCxM
2103                     	xdef	_TIM1_CCxNCmd
2104                     	xdef	_TIM1_CCxCmd
2105                     	xdef	_TIM1_OC4PolarityConfig
2106                     	xdef	_TIM1_OC3NPolarityConfig
2107                     	xdef	_TIM1_OC3PolarityConfig
2108                     	xdef	_TIM1_OC2NPolarityConfig
2109                     	xdef	_TIM1_OC2PolarityConfig
2110                     	xdef	_TIM1_OC1NPolarityConfig
2111                     	xdef	_TIM1_OC1PolarityConfig
2112                     	xdef	_TIM1_GenerateEvent
2113                     	xdef	_TIM1_OC4FastConfig
2114                     	xdef	_TIM1_OC3FastConfig
2115                     	xdef	_TIM1_OC2FastConfig
2116                     	xdef	_TIM1_OC1FastConfig
2117                     	xdef	_TIM1_OC4PreloadConfig
2118                     	xdef	_TIM1_OC3PreloadConfig
2119                     	xdef	_TIM1_OC2PreloadConfig
2120                     	xdef	_TIM1_OC1PreloadConfig
2121                     	xdef	_TIM1_CCPreloadControl
2122                     	xdef	_TIM1_SelectCOM
2123                     	xdef	_TIM1_ARRPreloadConfig
2124                     	xdef	_TIM1_ForcedOC4Config
2125                     	xdef	_TIM1_ForcedOC3Config
2126                     	xdef	_TIM1_ForcedOC2Config
2127                     	xdef	_TIM1_ForcedOC1Config
2128                     	xdef	_TIM1_CounterModeConfig
2129                     	xdef	_TIM1_PrescalerConfig
2130                     	xdef	_TIM1_EncoderInterfaceConfig
2131                     	xdef	_TIM1_SelectMasterSlaveMode
2132                     	xdef	_TIM1_SelectSlaveMode
2133                     	xdef	_TIM1_SelectOutputTrigger
2134                     	xdef	_TIM1_SelectOnePulseMode
2135                     	xdef	_TIM1_SelectHallSensor
2136                     	xdef	_TIM1_UpdateRequestConfig
2137                     	xdef	_TIM1_UpdateDisableConfig
2138                     	xdef	_TIM1_SelectInputTrigger
2139                     	xdef	_TIM1_TIxExternalClockConfig
2140                     	xdef	_TIM1_ETRConfig
2141                     	xdef	_TIM1_ETRClockMode2Config
2142                     	xdef	_TIM1_ETRClockMode1Config
2143                     	xdef	_TIM1_InternalClockConfig
2144                     	xdef	_TIM1_ITConfig
2145                     	xdef	_TIM1_CtrlPWMOutputs
2146                     	xdef	_TIM1_Cmd
2147                     	xdef	_TIM1_PWMIConfig
2148                     	xdef	_TIM1_ICInit
2149                     	xdef	_TIM1_BDTRConfig
2150                     	xdef	_TIM1_OC4Init
2151                     	xdef	_TIM1_OC3Init
2152                     	xdef	_TIM1_OC2Init
2153                     	xdef	_TIM1_OC1Init
2154                     	xdef	_TIM1_TimeBaseInit
2155                     	xdef	_TIM1_DeInit
2156                     	end
