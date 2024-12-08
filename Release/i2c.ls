   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  15                     ; 9 void i2c_init(void)
  15                     ; 10 {
  16                     	scross	off
  17  0000               _i2c_init:
  19                     ; 12 	sfr_PORTB.DDR.DDR4 = 1;     // input(=0) or output(=1)
  20  0000 72185007      	bset	20487,#4
  21                     ; 13 	sfr_PORTB.CR1.C14  = 0;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  22  0004 72195008      	bres	20488,#4
  23                     ; 14 	sfr_PORTB.CR2.C24  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  24  0008 72195009      	bres	20489,#4
  25                     ; 15 	sfr_PORTB.ODR.ODR4 = 1;
  26  000c 72185005      	bset	20485,#4
  27                     ; 17 	sfr_PORTB.DDR.DDR5 = 1;     // input(=0) or output(=1)
  28  0010 721a5007      	bset	20487,#5
  29                     ; 18 	sfr_PORTB.CR1.C15  = 0;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  30  0014 721b5008      	bres	20488,#5
  31                     ; 19 	sfr_PORTB.CR2.C25  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  32  0018 721b5009      	bres	20489,#5
  33                     ; 20 	sfr_PORTB.ODR.ODR5 = 1;
  34  001c 721a5005      	bset	20485,#5
  35                     ; 21 }
  36  0020 81            	ret
  38                     ; 24 uint8_t i2c_busy_check ( void )
  38                     ; 25 {
  39  0021               _i2c_busy_check:
  41                     ; 26 	if (SDA_IN_PIN == OK){
  42  0021 c65006        	ld	a,20486
  43  0024 a520          	bcp	a,#32
  44  0026 2703          	jreq	L3
  45                     ; 27 		return OK;
  46  0028 a601          	ld	a,#1
  48  002a 81            	ret
  49  002b               L3:
  50                     ; 29 		return BUSY;
  51  002b 4f            	clr	a
  53  002c 81            	ret
  55                     ; 34 void i2c_slave_unlock ( void )
  55                     ; 35 {
  56  002d               _i2c_slave_unlock:
  57  002d 89            	pushw	x
  58       00000002      OFST:	set	2
  60                     ; 38 	if (!SDA_IN_PIN){
  61  002e c65006        	ld	a,20486
  62  0031 a520          	bcp	a,#32
  63  0033 2641          	jrne	L7
  64                     ; 39 		SCL_PIN = 0;
  65  0035 72195005      	bres	20485,#4
  66                     ; 40 		i=0;
  67  0039 0f02          	clr	(OFST+0,sp)
  69  003b 2001          	jra	L51
  70  003d               L11:
  71                     ; 41 		while(i++<1) {NOP();}
  73  003d 9d            nop
  75  003e               L51:
  77  003e 7b02          	ld	a,(OFST+0,sp)
  78  0040 0c02          	inc	(OFST+0,sp)
  79  0042 4d            	tnz	a
  80  0043 27f8          	jreq	L11
  81                     ; 43 		a = 0;
  82  0045 0f01          	clr	(OFST-1,sp)
  83  0047               L12:
  84                     ; 45 			i=0;
  85  0047 0f02          	clr	(OFST+0,sp)
  87  0049 2001          	jra	L33
  88  004b               L72:
  89                     ; 46 			while(i++<1) {NOP();}
  91  004b 9d            nop
  93  004c               L33:
  95  004c 7b02          	ld	a,(OFST+0,sp)
  96  004e 0c02          	inc	(OFST+0,sp)
  97  0050 4d            	tnz	a
  98  0051 27f8          	jreq	L72
  99                     ; 47 			SCL_PIN = 1;
 100  0053 72185005      	bset	20485,#4
 101                     ; 48 			i=0;
 102  0057 0f02          	clr	(OFST+0,sp)
 104  0059 2001          	jra	L34
 105  005b               L73:
 106                     ; 49 			while(i++<1) {NOP();}
 108  005b 9d            nop
 110  005c               L34:
 112  005c 7b02          	ld	a,(OFST+0,sp)
 113  005e 0c02          	inc	(OFST+0,sp)
 114  0060 4d            	tnz	a
 115  0061 27f8          	jreq	L73
 116                     ; 50 			SCL_PIN = 0;
 117  0063 72195005      	bres	20485,#4
 118                     ; 51 			a++;
 119  0067 0c01          	inc	(OFST-1,sp)
 120                     ; 52 		}while((a<9)&&(!SDA_IN_PIN));
 121  0069 7b01          	ld	a,(OFST-1,sp)
 122  006b a109          	cp	a,#9
 123  006d 2407          	jruge	L7
 125  006f c65006        	ld	a,20486
 126  0072 a520          	bcp	a,#32
 127  0074 27d1          	jreq	L12
 128  0076               L7:
 129                     ; 54 	i=0;
 130  0076 0f02          	clr	(OFST+0,sp)
 132  0078 2001          	jra	L55
 133  007a               L15:
 134                     ; 55 	while(i++<1) {NOP();}
 136  007a 9d            nop
 138  007b               L55:
 140  007b 7b02          	ld	a,(OFST+0,sp)
 141  007d 0c02          	inc	(OFST+0,sp)
 142  007f 4d            	tnz	a
 143  0080 27f8          	jreq	L15
 144                     ; 56 	i2c_init();
 145  0082 cd0000        	call	_i2c_init
 147                     ; 57 	i=0;
 148  0085 0f02          	clr	(OFST+0,sp)
 150  0087 2001          	jra	L56
 151  0089               L16:
 152                     ; 58 	while(i++<1) {NOP();}
 154  0089 9d            nop
 156  008a               L56:
 158  008a 7b02          	ld	a,(OFST+0,sp)
 159  008c 0c02          	inc	(OFST+0,sp)
 160  008e 4d            	tnz	a
 161  008f 27f8          	jreq	L16
 162                     ; 59 }
 163  0091 85            	popw	x
 164  0092 81            	ret
 166                     ; 62 uint8_t i2c_shift(uint8_t b)
 166                     ; 63 {
 167  0093               _i2c_shift:
 168  0093 88            	push	a
 169  0094 88            	push	a
 170       00000001      OFST:	set	1
 172                     ; 65 	for(i = 0;i < 8; i++)
 173  0095 0f01          	clr	(OFST+0,sp)
 174  0097               L17:
 175                     ; 67 			if(b & 0x80){
 176  0097 7b02          	ld	a,(OFST+1,sp)
 177  0099 a580          	bcp	a,#128
 178  009b 2706          	jreq	L77
 179                     ; 68 		SDA_PIN = 1;
 180  009d 721a5005      	bset	20485,#5
 182  00a1 2004          	jra	L101
 183  00a3               L77:
 184                     ; 70 		SDA_PIN = 0;
 185  00a3 721b5005      	bres	20485,#5
 186  00a7               L101:
 187                     ; 72 	NOP();
 189  00a7 9d            nop
 191                     ; 73 	NOP();
 193  00a8 9d            nop
 195                     ; 74 	NOP();
 197  00a9 9d            nop
 199                     ; 75 	NOP();
 201  00aa 9d            nop
 203                     ; 76 	NOP();
 205  00ab 9d            nop
 207                     ; 77 	NOP();
 209  00ac 9d            nop
 211                     ; 78 	SCL_PIN = 1;
 212  00ad 72185005      	bset	20485,#4
 213                     ; 79 	NOP();
 215  00b1 9d            nop
 217                     ; 80 	NOP();
 219  00b2 9d            nop
 221                     ; 81 	NOP();
 223  00b3 9d            nop
 225                     ; 82 	NOP();
 227  00b4 9d            nop
 229                     ; 83 	NOP();
 231  00b5 9d            nop
 233                     ; 84 	NOP();
 235  00b6 9d            nop
 237                     ; 85 	NOP();
 239  00b7 9d            nop
 241                     ; 86 	b <<= 1;
 242  00b8 0802          	sll	(OFST+1,sp)
 243                     ; 87 	if(SDA_IN_PIN) b |= 1;
 244  00ba c65006        	ld	a,20486
 245  00bd a520          	bcp	a,#32
 246  00bf 2706          	jreq	L301
 248  00c1 7b02          	ld	a,(OFST+1,sp)
 249  00c3 aa01          	or	a,#1
 250  00c5 6b02          	ld	(OFST+1,sp),a
 251  00c7               L301:
 252                     ; 88 	NOP();
 254  00c7 9d            nop
 256                     ; 89 	NOP();
 258  00c8 9d            nop
 260                     ; 90 	NOP();
 262  00c9 9d            nop
 264                     ; 91 	NOP();
 266  00ca 9d            nop
 268                     ; 92 	NOP();
 270  00cb 9d            nop
 272                     ; 93 	NOP();
 274  00cc 9d            nop
 276                     ; 94 	NOP();
 278  00cd 9d            nop
 280                     ; 95 	SCL_PIN = 0;
 281  00ce 72195005      	bres	20485,#4
 282                     ; 65 	for(i = 0;i < 8; i++)
 283  00d2 0c01          	inc	(OFST+0,sp)
 285  00d4 7b01          	ld	a,(OFST+0,sp)
 286  00d6 a108          	cp	a,#8
 287  00d8 25bd          	jrult	L17
 288                     ; 97 	return(b);
 289  00da 7b02          	ld	a,(OFST+1,sp)
 291  00dc 85            	popw	x
 292  00dd 81            	ret
 294                     ; 100 uint8_t i2c_ack(uint8_t b)
 294                     ; 101 {
 295  00de               _i2c_ack:
 296  00de 88            	push	a
 297       00000000      OFST:	set	0
 299                     ; 102 	if(b) SDA_PIN = 1;
 300  00df 4d            	tnz	a
 301  00e0 2706          	jreq	L501
 303  00e2 721a5005      	bset	20485,#5
 305  00e6 2004          	jra	L701
 306  00e8               L501:
 307                     ; 103 	else  SDA_PIN = 0;
 308  00e8 721b5005      	bres	20485,#5
 309  00ec               L701:
 310                     ; 104 	NOP();
 312  00ec 9d            nop
 314                     ; 105 	NOP();
 316  00ed 9d            nop
 318                     ; 106 	NOP();
 320  00ee 9d            nop
 322                     ; 107 	SCL_PIN = 1;
 323  00ef 72185005      	bset	20485,#4
 324                     ; 108 	NOP();
 326  00f3 9d            nop
 328                     ; 109 	NOP();
 330  00f4 9d            nop
 332                     ; 110 	NOP();
 334  00f5 9d            nop
 336                     ; 111 	NOP();
 338  00f6 9d            nop
 340                     ; 112 	NOP();
 342  00f7 9d            nop
 344                     ; 113 	NOP();
 346  00f8 9d            nop
 348                     ; 114 	NOP();
 350  00f9 9d            nop
 352                     ; 115 	NOP();
 354  00fa 9d            nop
 356                     ; 116 	NOP();
 358  00fb 9d            nop
 360                     ; 117 	NOP();
 362  00fc 9d            nop
 364                     ; 118 	NOP();
 366  00fd 9d            nop
 368                     ; 119 	NOP();
 370  00fe 9d            nop
 372                     ; 120 	NOP();
 374  00ff 9d            nop
 376                     ; 121 	NOP();
 378  0100 9d            nop
 380                     ; 122 	NOP();
 382  0101 9d            nop
 384                     ; 123 	NOP();
 386  0102 9d            nop
 388                     ; 124 	NOP();
 390  0103 9d            nop
 392                     ; 125 	b = SDA_IN_PIN;
 393  0104 4f            	clr	a
 394                     	btst	20486,#5
 395  010a 49            	rlc	a
 396  010b 6b01          	ld	(OFST+1,sp),a
 397                     ; 126 	NOP();
 399  010d 9d            nop
 401                     ; 127 	NOP();
 403  010e 9d            nop
 405                     ; 128 	NOP();
 407  010f 9d            nop
 409                     ; 129 	NOP();
 411  0110 9d            nop
 413                     ; 130 	NOP();
 415  0111 9d            nop
 417                     ; 131 	NOP();
 419  0112 9d            nop
 421                     ; 132 	NOP();
 423  0113 9d            nop
 425                     ; 133 	NOP();
 427  0114 9d            nop
 429                     ; 134 	NOP();
 431  0115 9d            nop
 433                     ; 135 	NOP();
 435  0116 9d            nop
 437                     ; 136 	NOP();
 439  0117 9d            nop
 441                     ; 137 	NOP();
 443  0118 9d            nop
 445                     ; 138 	NOP();
 447  0119 9d            nop
 449                     ; 139 	NOP();
 451  011a 9d            nop
 453                     ; 140 	NOP();
 455  011b 9d            nop
 457                     ; 141 	SCL_PIN = 0;
 458  011c 72195005      	bres	20485,#4
 459                     ; 142 	NOP();
 461  0120 9d            nop
 463                     ; 143 	NOP();
 465  0121 9d            nop
 467                     ; 144 	SDA_PIN = 1;
 468  0122 721a5005      	bset	20485,#5
 469                     ; 145 	NOP();
 471  0126 9d            nop
 473                     ; 146 	NOP();
 475  0127 9d            nop
 477                     ; 147 	NOP();
 479  0128 9d            nop
 481                     ; 148 	NOP();
 483  0129 9d            nop
 485                     ; 149 	NOP();
 487  012a 9d            nop
 489                     ; 150 	NOP();
 491  012b 9d            nop
 493                     ; 151     return(b);
 494  012c 7b01          	ld	a,(OFST+1,sp)
 496  012e 5b01          	addw	sp,#1
 497  0130 81            	ret
 499                     ; 154 void i2c_start (void)
 499                     ; 155 {
 500  0131               _i2c_start:
 502                     ; 156 	NOP();
 504  0131 9d            nop
 506                     ; 157 	NOP();
 508  0132 9d            nop
 510                     ; 158 	NOP();
 512  0133 9d            nop
 514                     ; 159 	NOP();
 516  0134 9d            nop
 518                     ; 160 	SDA_PIN = 1;
 519  0135 721a5005      	bset	20485,#5
 520                     ; 161 	SCL_PIN = 1;
 521  0139 72185005      	bset	20485,#4
 522                     ; 162 	NOP();
 524  013d 9d            nop
 526                     ; 163 	NOP();
 528  013e 9d            nop
 530                     ; 164 	NOP();
 532  013f 9d            nop
 534                     ; 165 	NOP();
 536  0140 9d            nop
 538                     ; 166 	NOP();
 540  0141 9d            nop
 542                     ; 167 	NOP();
 544  0142 9d            nop
 546                     ; 168 	SDA_PIN = 0;
 547  0143 721b5005      	bres	20485,#5
 548                     ; 169 	NOP();
 550  0147 9d            nop
 552                     ; 170 	NOP();
 554  0148 9d            nop
 556                     ; 171 	NOP();
 558  0149 9d            nop
 560                     ; 172 	NOP();
 562  014a 9d            nop
 564                     ; 173 	NOP();
 566  014b 9d            nop
 568                     ; 174 	NOP();
 570  014c 9d            nop
 572                     ; 175 	NOP();
 574  014d 9d            nop
 576                     ; 176 	NOP();
 578  014e 9d            nop
 580                     ; 177 	NOP();
 582  014f 9d            nop
 584                     ; 178 	NOP();
 586  0150 9d            nop
 588                     ; 179 	NOP();
 590  0151 9d            nop
 592                     ; 180 	NOP();
 594  0152 9d            nop
 596                     ; 181 	NOP();
 598  0153 9d            nop
 600                     ; 182 	NOP();
 602  0154 9d            nop
 604                     ; 183 	NOP();
 606  0155 9d            nop
 608                     ; 184 	NOP();
 610  0156 9d            nop
 612                     ; 185 	NOP();
 614  0157 9d            nop
 616                     ; 186 	NOP();
 618  0158 9d            nop
 620                     ; 187 	NOP();
 622  0159 9d            nop
 624                     ; 188 	NOP();
 626  015a 9d            nop
 628                     ; 189 	NOP();
 630  015b 9d            nop
 632                     ; 190 	NOP();
 634  015c 9d            nop
 636                     ; 191 	NOP();
 638  015d 9d            nop
 640                     ; 192 	NOP();
 642  015e 9d            nop
 644                     ; 193 	NOP();
 646  015f 9d            nop
 648                     ; 194 	NOP();
 650  0160 9d            nop
 652                     ; 195 	NOP();
 654  0161 9d            nop
 656                     ; 196 	NOP();
 658  0162 9d            nop
 660                     ; 197 	NOP();
 662  0163 9d            nop
 664                     ; 198 	NOP();
 666  0164 9d            nop
 668                     ; 199 	NOP();
 670  0165 9d            nop
 672                     ; 200 	NOP();
 674  0166 9d            nop
 676                     ; 201 	NOP();
 678  0167 9d            nop
 680                     ; 202 	NOP();
 682  0168 9d            nop
 684                     ; 203 	NOP();
 686  0169 9d            nop
 688                     ; 204 	NOP();
 690  016a 9d            nop
 692                     ; 205 	SCL_PIN = 0;
 693  016b 72195005      	bres	20485,#4
 694                     ; 206 	NOP();
 696  016f 9d            nop
 698                     ; 207 	NOP();
 700  0170 9d            nop
 702                     ; 208 	NOP();
 704  0171 9d            nop
 706                     ; 209 	NOP();
 708  0172 9d            nop
 710                     ; 210 	NOP();
 712  0173 9d            nop
 714                     ; 211 	NOP();
 716  0174 9d            nop
 718                     ; 212 }
 719  0175 81            	ret
 721                     ; 214 void i2c_stop (void)
 721                     ; 215 {
 722  0176               _i2c_stop:
 724                     ; 216 	SCL_PIN = 0;
 725  0176 72195005      	bres	20485,#4
 726                     ; 217 	SDA_PIN = 0;
 727  017a 721b5005      	bres	20485,#5
 728                     ; 218 	NOP();
 730  017e 9d            nop
 732                     ; 219 	NOP();
 734  017f 9d            nop
 736                     ; 220 	NOP();
 738  0180 9d            nop
 740                     ; 221 	NOP();
 742  0181 9d            nop
 744                     ; 222 	NOP();
 746  0182 9d            nop
 748                     ; 223 	NOP();
 750  0183 9d            nop
 752                     ; 224 	NOP();
 754  0184 9d            nop
 756                     ; 225 	NOP();
 758  0185 9d            nop
 760                     ; 226 	NOP();
 762  0186 9d            nop
 764                     ; 227 	NOP();
 766  0187 9d            nop
 768                     ; 228 	NOP();
 770  0188 9d            nop
 772                     ; 229 	NOP();
 774  0189 9d            nop
 776                     ; 230 	NOP();
 778  018a 9d            nop
 780                     ; 231 	NOP();
 782  018b 9d            nop
 784                     ; 232 	NOP();
 786  018c 9d            nop
 788                     ; 233 	NOP();
 790  018d 9d            nop
 792                     ; 234 	NOP();
 794  018e 9d            nop
 796                     ; 235 	NOP();
 798  018f 9d            nop
 800                     ; 236 	SCL_PIN = 1;
 801  0190 72185005      	bset	20485,#4
 802                     ; 237 	NOP();
 804  0194 9d            nop
 806                     ; 238 	NOP();
 808  0195 9d            nop
 810                     ; 239 	NOP();
 812  0196 9d            nop
 814                     ; 240 	NOP();
 816  0197 9d            nop
 818                     ; 241 	NOP();
 820  0198 9d            nop
 822                     ; 242 	NOP();
 824  0199 9d            nop
 826                     ; 243 	NOP();
 828  019a 9d            nop
 830                     ; 244 	NOP();
 832  019b 9d            nop
 834                     ; 245 	NOP();
 836  019c 9d            nop
 838                     ; 246 	NOP();
 840  019d 9d            nop
 842                     ; 247 	NOP();
 844  019e 9d            nop
 846                     ; 248 	NOP();
 848  019f 9d            nop
 850                     ; 249 	NOP();
 852  01a0 9d            nop
 854                     ; 250 	NOP();
 856  01a1 9d            nop
 858                     ; 251 	NOP();
 860  01a2 9d            nop
 862                     ; 252 	NOP();
 864  01a3 9d            nop
 866                     ; 253 	NOP();
 868  01a4 9d            nop
 870                     ; 254 	NOP();
 872  01a5 9d            nop
 874                     ; 255 	NOP();
 876  01a6 9d            nop
 878                     ; 256 	NOP();
 880  01a7 9d            nop
 882                     ; 257 	NOP();
 884  01a8 9d            nop
 886                     ; 258 	NOP();
 888  01a9 9d            nop
 890                     ; 259 	NOP();
 892  01aa 9d            nop
 894                     ; 260 	NOP();
 896  01ab 9d            nop
 898                     ; 261 	NOP();
 900  01ac 9d            nop
 902                     ; 262 	NOP();
 904  01ad 9d            nop
 906                     ; 263 	NOP();
 908  01ae 9d            nop
 910                     ; 264 	NOP();
 912  01af 9d            nop
 914                     ; 265 	NOP();
 916  01b0 9d            nop
 918                     ; 266 	NOP();
 920  01b1 9d            nop
 922                     ; 267 	NOP();
 924  01b2 9d            nop
 926                     ; 268 	NOP();
 928  01b3 9d            nop
 930                     ; 269 	NOP();
 932  01b4 9d            nop
 934                     ; 270 	NOP();
 936  01b5 9d            nop
 938                     ; 271 	NOP();
 940  01b6 9d            nop
 942                     ; 272 	NOP();
 944  01b7 9d            nop
 946                     ; 273 	SDA_PIN = 1;
 947  01b8 721a5005      	bset	20485,#5
 948                     ; 274 }
 949  01bc 81            	ret
 951                     	xdef	_i2c_stop
 952                     	xdef	_i2c_start
 953                     	xdef	_i2c_ack
 954                     	xdef	_i2c_shift
 955                     	xdef	_i2c_slave_unlock
 956                     	xdef	_i2c_busy_check
 957                     	xdef	_i2c_init
 958                     	end
