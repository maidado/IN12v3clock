   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
   4                     ; Optimizer V4.6.3 - 22 Aug 2024
  17                     ; 53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  17                     ; 54 {
  18                     	scross	off
  19  0000               _GPIO_DeInit:
  21                     ; 55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
  22  0000 7f            	clr	(x)
  23                     ; 56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
  24  0001 6f02          	clr	(2,x)
  25                     ; 57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
  26  0003 6f03          	clr	(3,x)
  27                     ; 58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
  28  0005 6f04          	clr	(4,x)
  29                     ; 59 }
  30  0007 81            	ret	
  32                     ; 71 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
  32                     ; 72 {
  33  0008               _GPIO_Init:
  34  0008 89            	pushw	x
  35       00000000      OFST:	set	0
  37                     ; 77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
  38                     ; 78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
  39                     ; 81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
  40  0009 7b05          	ld	a,(OFST+5,sp)
  41  000b 43            	cpl	a
  42  000c e404          	and	a,(4,x)
  43  000e e704          	ld	(4,x),a
  44                     ; 87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
  45  0010 7b06          	ld	a,(OFST+6,sp)
  46  0012 2a16          	jrpl	L3
  47                     ; 89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
  48  0014 a510          	bcp	a,#16
  49  0016 2705          	jreq	L5
  50                     ; 91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
  51  0018 f6            	ld	a,(x)
  52  0019 1a05          	or	a,(OFST+5,sp)
  54  001b 2004          	jra	L7
  55  001d               L5:
  56                     ; 95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
  57  001d 7b05          	ld	a,(OFST+5,sp)
  58  001f 43            	cpl	a
  59  0020 f4            	and	a,(x)
  60  0021               L7:
  61  0021 f7            	ld	(x),a
  62                     ; 98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
  63  0022 1e01          	ldw	x,(OFST+1,sp)
  64  0024 e602          	ld	a,(2,x)
  65  0026 1a05          	or	a,(OFST+5,sp)
  67  0028 2005          	jra	L11
  68  002a               L3:
  69                     ; 103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
  70  002a 7b05          	ld	a,(OFST+5,sp)
  71  002c 43            	cpl	a
  72  002d e402          	and	a,(2,x)
  73  002f               L11:
  74  002f e702          	ld	(2,x),a
  75                     ; 110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
  76  0031 7b06          	ld	a,(OFST+6,sp)
  77  0033 a540          	bcp	a,#64
  78  0035 2706          	jreq	L31
  79                     ; 112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
  80  0037 e603          	ld	a,(3,x)
  81  0039 1a05          	or	a,(OFST+5,sp)
  83  003b 2005          	jra	L51
  84  003d               L31:
  85                     ; 116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
  86  003d 7b05          	ld	a,(OFST+5,sp)
  87  003f 43            	cpl	a
  88  0040 e403          	and	a,(3,x)
  89  0042               L51:
  90  0042 e703          	ld	(3,x),a
  91                     ; 123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
  92  0044 7b06          	ld	a,(OFST+6,sp)
  93  0046 a520          	bcp	a,#32
  94  0048 2706          	jreq	L71
  95                     ; 125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
  96  004a e604          	ld	a,(4,x)
  97  004c 1a05          	or	a,(OFST+5,sp)
  99  004e 2005          	jra	L12
 100  0050               L71:
 101                     ; 129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 102  0050 7b05          	ld	a,(OFST+5,sp)
 103  0052 43            	cpl	a
 104  0053 e404          	and	a,(4,x)
 105  0055               L12:
 106  0055 e704          	ld	(4,x),a
 107                     ; 131 }
 108  0057 85            	popw	x
 109  0058 81            	ret	
 111                     ; 141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 111                     ; 142 {
 112  0059               _GPIO_Write:
 113       fffffffe      OFST: set -2
 115                     ; 143   GPIOx->ODR = PortVal;
 116  0059 7b03          	ld	a,(OFST+5,sp)
 117  005b f7            	ld	(x),a
 118                     ; 144 }
 119  005c 81            	ret	
 121                     ; 154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 121                     ; 155 {
 122  005d               _GPIO_WriteHigh:
 123       fffffffe      OFST: set -2
 125                     ; 156   GPIOx->ODR |= (uint8_t)PortPins;
 126  005d f6            	ld	a,(x)
 127  005e 1a03          	or	a,(OFST+5,sp)
 128  0060 f7            	ld	(x),a
 129                     ; 157 }
 130  0061 81            	ret	
 132                     ; 167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 132                     ; 168 {
 133  0062               _GPIO_WriteLow:
 134       fffffffe      OFST: set -2
 136                     ; 169   GPIOx->ODR &= (uint8_t)(~PortPins);
 137  0062 7b03          	ld	a,(OFST+5,sp)
 138  0064 43            	cpl	a
 139  0065 f4            	and	a,(x)
 140  0066 f7            	ld	(x),a
 141                     ; 170 }
 142  0067 81            	ret	
 144                     ; 180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 144                     ; 181 {
 145  0068               _GPIO_WriteReverse:
 146       fffffffe      OFST: set -2
 148                     ; 182   GPIOx->ODR ^= (uint8_t)PortPins;
 149  0068 f6            	ld	a,(x)
 150  0069 1803          	xor	a,(OFST+5,sp)
 151  006b f7            	ld	(x),a
 152                     ; 183 }
 153  006c 81            	ret	
 155                     ; 191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 155                     ; 192 {
 156  006d               _GPIO_ReadOutputData:
 158                     ; 193   return ((uint8_t)GPIOx->ODR);
 159  006d f6            	ld	a,(x)
 161  006e 81            	ret	
 163                     ; 202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 163                     ; 203 {
 164  006f               _GPIO_ReadInputData:
 166                     ; 204   return ((uint8_t)GPIOx->IDR);
 167  006f e601          	ld	a,(1,x)
 169  0071 81            	ret	
 171                     ; 213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 171                     ; 214 {
 172  0072               _GPIO_ReadInputPin:
 173       fffffffe      OFST: set -2
 175                     ; 215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 176  0072 e601          	ld	a,(1,x)
 177  0074 1403          	and	a,(OFST+5,sp)
 179  0076 81            	ret	
 181                     ; 225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 181                     ; 226 {
 182  0077               _GPIO_ExternalPullUpConfig:
 183       fffffffe      OFST: set -2
 185                     ; 228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 186                     ; 229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 187                     ; 231   if (NewState != DISABLE) /* External Pull-Up Set*/
 188  0077 7b04          	ld	a,(OFST+6,sp)
 189  0079 2706          	jreq	L32
 190                     ; 233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 191  007b e603          	ld	a,(3,x)
 192  007d 1a03          	or	a,(OFST+5,sp)
 194  007f 2005          	jra	L52
 195  0081               L32:
 196                     ; 236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 197  0081 7b03          	ld	a,(OFST+5,sp)
 198  0083 43            	cpl	a
 199  0084 e403          	and	a,(3,x)
 200  0086               L52:
 201  0086 e703          	ld	(3,x),a
 202                     ; 238 }
 203  0088 81            	ret	
 205                     	xdef	_GPIO_ExternalPullUpConfig
 206                     	xdef	_GPIO_ReadInputPin
 207                     	xdef	_GPIO_ReadOutputData
 208                     	xdef	_GPIO_ReadInputData
 209                     	xdef	_GPIO_WriteReverse
 210                     	xdef	_GPIO_WriteLow
 211                     	xdef	_GPIO_WriteHigh
 212                     	xdef	_GPIO_Write
 213                     	xdef	_GPIO_Init
 214                     	xdef	_GPIO_DeInit
 215                     	end
