   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.2 - 04 Jun 2024
   3                     ; Generator (Limited) V4.6.3 - 22 Aug 2024
  43                     ; 9 void i2c_init(void)
  43                     ; 10 {
  45                     	switch	.text
  46  0000               _i2c_init:
  50                     ; 12 	sfr_PORTB.DDR.DDR4 = 1;     // input(=0) or output(=1)
  52  0000 72185007      	bset	20487,#4
  53                     ; 13 	sfr_PORTB.CR1.C14  = 0;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  55  0004 72195008      	bres	20488,#4
  56                     ; 14 	sfr_PORTB.CR2.C24  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  58  0008 72195009      	bres	20489,#4
  59                     ; 15 	sfr_PORTB.ODR.ODR4 = 1;
  61  000c 72185005      	bset	20485,#4
  62                     ; 17 	sfr_PORTB.DDR.DDR5 = 1;     // input(=0) or output(=1)
  64  0010 721a5007      	bset	20487,#5
  65                     ; 18 	sfr_PORTB.CR1.C15  = 0;     // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  67  0014 721b5008      	bres	20488,#5
  68                     ; 19 	sfr_PORTB.CR2.C25  = 0;     // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope
  70  0018 721b5009      	bres	20489,#5
  71                     ; 20 	sfr_PORTB.ODR.ODR5 = 1;
  73  001c 721a5005      	bset	20485,#5
  74                     ; 21 }
  77  0020 81            	ret
 100                     ; 24 uint8_t i2c_busy_check ( void )
 100                     ; 25 {
 101                     	switch	.text
 102  0021               _i2c_busy_check:
 106                     ; 26 	if (SDA_IN_PIN == OK){
 108  0021 c65006        	ld	a,20486
 109  0024 a520          	bcp	a,#32
 110  0026 2703          	jreq	L13
 111                     ; 27 		return OK;
 113  0028 a601          	ld	a,#1
 116  002a 81            	ret
 117  002b               L13:
 118                     ; 29 		return BUSY;
 120  002b 4f            	clr	a
 123  002c 81            	ret
 172                     ; 34 void i2c_slave_unlock ( void )
 172                     ; 35 {
 173                     	switch	.text
 174  002d               _i2c_slave_unlock:
 176  002d 89            	pushw	x
 177       00000002      OFST:	set	2
 180                     ; 38 	if (!SDA_IN_PIN){
 182  002e c65006        	ld	a,20486
 183  0031 a520          	bcp	a,#32
 184  0033 2641          	jrne	L75
 185                     ; 39 		SCL_PIN = 0;
 187  0035 72195005      	bres	20485,#4
 188                     ; 40 		i=0;
 190  0039 0f02          	clr	(OFST+0,sp)
 193  003b 2001          	jra	L56
 194  003d               L16:
 195                     ; 41 		while(i++<1) {NOP();}
 198  003d 9d            nop
 200  003e               L56:
 203  003e 7b02          	ld	a,(OFST+0,sp)
 204  0040 0c02          	inc	(OFST+0,sp)
 206  0042 4d            	tnz	a
 207  0043 27f8          	jreq	L16
 208                     ; 43 		a = 0;
 210  0045 0f01          	clr	(OFST-1,sp)
 212  0047               L17:
 213                     ; 45 			i=0;
 215  0047 0f02          	clr	(OFST+0,sp)
 218  0049 2001          	jra	L301
 219  004b               L77:
 220                     ; 46 			while(i++<1) {NOP();}
 223  004b 9d            nop
 225  004c               L301:
 228  004c 7b02          	ld	a,(OFST+0,sp)
 229  004e 0c02          	inc	(OFST+0,sp)
 231  0050 4d            	tnz	a
 232  0051 27f8          	jreq	L77
 233                     ; 47 			SCL_PIN = 1;
 235  0053 72185005      	bset	20485,#4
 236                     ; 48 			i=0;
 238  0057 0f02          	clr	(OFST+0,sp)
 241  0059 2001          	jra	L311
 242  005b               L701:
 243                     ; 49 			while(i++<1) {NOP();}
 246  005b 9d            nop
 248  005c               L311:
 251  005c 7b02          	ld	a,(OFST+0,sp)
 252  005e 0c02          	inc	(OFST+0,sp)
 254  0060 4d            	tnz	a
 255  0061 27f8          	jreq	L701
 256                     ; 50 			SCL_PIN = 0;
 258  0063 72195005      	bres	20485,#4
 259                     ; 51 			a++;
 261  0067 0c01          	inc	(OFST-1,sp)
 263                     ; 52 		}while((a<9)&&(!SDA_IN_PIN));
 265  0069 7b01          	ld	a,(OFST-1,sp)
 266  006b a109          	cp	a,#9
 267  006d 2407          	jruge	L75
 269  006f c65006        	ld	a,20486
 270  0072 a520          	bcp	a,#32
 271  0074 27d1          	jreq	L17
 272  0076               L75:
 273                     ; 54 	i=0;
 275  0076 0f02          	clr	(OFST+0,sp)
 278  0078 2001          	jra	L521
 279  007a               L121:
 280                     ; 55 	while(i++<1) {NOP();}
 283  007a 9d            nop
 285  007b               L521:
 288  007b 7b02          	ld	a,(OFST+0,sp)
 289  007d 0c02          	inc	(OFST+0,sp)
 291  007f 4d            	tnz	a
 292  0080 27f8          	jreq	L121
 293                     ; 56 	i2c_init();
 295  0082 cd0000        	call	_i2c_init
 297                     ; 57 	i=0;
 299  0085 0f02          	clr	(OFST+0,sp)
 302  0087 2001          	jra	L531
 303  0089               L131:
 304                     ; 58 	while(i++<1) {NOP();}
 307  0089 9d            nop
 309  008a               L531:
 312  008a 7b02          	ld	a,(OFST+0,sp)
 313  008c 0c02          	inc	(OFST+0,sp)
 315  008e 4d            	tnz	a
 316  008f 27f8          	jreq	L131
 317                     ; 59 }
 320  0091 85            	popw	x
 321  0092 81            	ret
 365                     ; 62 uint8_t i2c_shift(uint8_t b)
 365                     ; 63 {
 366                     	switch	.text
 367  0093               _i2c_shift:
 369  0093 88            	push	a
 370  0094 88            	push	a
 371       00000001      OFST:	set	1
 374                     ; 65 	for(i = 0;i < 8; i++)
 376  0095 0f01          	clr	(OFST+0,sp)
 378  0097               L361:
 379                     ; 67 			if(b & 0x80){
 381  0097 7b02          	ld	a,(OFST+1,sp)
 382  0099 a580          	bcp	a,#128
 383  009b 2706          	jreq	L171
 384                     ; 68 		SDA_PIN = 1;
 386  009d 721a5005      	bset	20485,#5
 388  00a1 2004          	jra	L371
 389  00a3               L171:
 390                     ; 70 		SDA_PIN = 0;
 392  00a3 721b5005      	bres	20485,#5
 393  00a7               L371:
 394                     ; 72 	NOP();
 397  00a7 9d            nop
 399                     ; 73 	NOP();
 402  00a8 9d            nop
 404                     ; 74 	NOP();
 407  00a9 9d            nop
 409                     ; 75 	NOP();
 412  00aa 9d            nop
 414                     ; 76 	NOP();
 417  00ab 9d            nop
 419                     ; 77 	NOP();
 422  00ac 9d            nop
 424                     ; 78 	SCL_PIN = 1;
 426  00ad 72185005      	bset	20485,#4
 427                     ; 79 	NOP();
 430  00b1 9d            nop
 432                     ; 80 	NOP();
 435  00b2 9d            nop
 437                     ; 81 	NOP();
 440  00b3 9d            nop
 442                     ; 82 	NOP();
 445  00b4 9d            nop
 447                     ; 83 	NOP();
 450  00b5 9d            nop
 452                     ; 84 	NOP();
 455  00b6 9d            nop
 457                     ; 85 	NOP();
 460  00b7 9d            nop
 462                     ; 86 	b <<= 1;
 464  00b8 0802          	sll	(OFST+1,sp)
 465                     ; 87 	if(SDA_IN_PIN) b |= 1;
 467  00ba c65006        	ld	a,20486
 468  00bd a520          	bcp	a,#32
 469  00bf 2706          	jreq	L571
 472  00c1 7b02          	ld	a,(OFST+1,sp)
 473  00c3 aa01          	or	a,#1
 474  00c5 6b02          	ld	(OFST+1,sp),a
 475  00c7               L571:
 476                     ; 88 	NOP();
 479  00c7 9d            nop
 481                     ; 89 	NOP();
 484  00c8 9d            nop
 486                     ; 90 	NOP();
 489  00c9 9d            nop
 491                     ; 91 	NOP();
 494  00ca 9d            nop
 496                     ; 92 	NOP();
 499  00cb 9d            nop
 501                     ; 93 	NOP();
 504  00cc 9d            nop
 506                     ; 94 	NOP();
 509  00cd 9d            nop
 511                     ; 95 	SCL_PIN = 0;
 513  00ce 72195005      	bres	20485,#4
 514                     ; 65 	for(i = 0;i < 8; i++)
 516  00d2 0c01          	inc	(OFST+0,sp)
 520  00d4 7b01          	ld	a,(OFST+0,sp)
 521  00d6 a108          	cp	a,#8
 522  00d8 25bd          	jrult	L361
 523                     ; 97 	return(b);
 525  00da 7b02          	ld	a,(OFST+1,sp)
 528  00dc 85            	popw	x
 529  00dd 81            	ret
 564                     ; 100 uint8_t i2c_ack(uint8_t b)
 564                     ; 101 {
 565                     	switch	.text
 566  00de               _i2c_ack:
 568  00de 88            	push	a
 569       00000000      OFST:	set	0
 572                     ; 102 	if(b) SDA_PIN = 1;
 574  00df 4d            	tnz	a
 575  00e0 2706          	jreq	L512
 578  00e2 721a5005      	bset	20485,#5
 580  00e6 2004          	jra	L712
 581  00e8               L512:
 582                     ; 103 	else  SDA_PIN = 0;
 584  00e8 721b5005      	bres	20485,#5
 585  00ec               L712:
 586                     ; 104 	NOP();
 589  00ec 9d            nop
 591                     ; 105 	NOP();
 594  00ed 9d            nop
 596                     ; 106 	NOP();
 599  00ee 9d            nop
 601                     ; 107 	SCL_PIN = 1;
 603  00ef 72185005      	bset	20485,#4
 604                     ; 108 	NOP();
 607  00f3 9d            nop
 609                     ; 109 	NOP();
 612  00f4 9d            nop
 614                     ; 110 	NOP();
 617  00f5 9d            nop
 619                     ; 111 	NOP();
 622  00f6 9d            nop
 624                     ; 112 	NOP();
 627  00f7 9d            nop
 629                     ; 113 	NOP();
 632  00f8 9d            nop
 634                     ; 114 	NOP();
 637  00f9 9d            nop
 639                     ; 115 	NOP();
 642  00fa 9d            nop
 644                     ; 116 	NOP();
 647  00fb 9d            nop
 649                     ; 117 	NOP();
 652  00fc 9d            nop
 654                     ; 118 	NOP();
 657  00fd 9d            nop
 659                     ; 119 	NOP();
 662  00fe 9d            nop
 664                     ; 120 	NOP();
 667  00ff 9d            nop
 669                     ; 121 	NOP();
 672  0100 9d            nop
 674                     ; 122 	NOP();
 677  0101 9d            nop
 679                     ; 123 	NOP();
 682  0102 9d            nop
 684                     ; 124 	NOP();
 687  0103 9d            nop
 689                     ; 125 	b = SDA_IN_PIN;
 691  0104 4f            	clr	a
 692                     	btst	20486,#5
 693  010a 49            	rlc	a
 694  010b 6b01          	ld	(OFST+1,sp),a
 695                     ; 126 	NOP();
 698  010d 9d            nop
 700                     ; 127 	NOP();
 703  010e 9d            nop
 705                     ; 128 	NOP();
 708  010f 9d            nop
 710                     ; 129 	NOP();
 713  0110 9d            nop
 715                     ; 130 	NOP();
 718  0111 9d            nop
 720                     ; 131 	NOP();
 723  0112 9d            nop
 725                     ; 132 	NOP();
 728  0113 9d            nop
 730                     ; 133 	NOP();
 733  0114 9d            nop
 735                     ; 134 	NOP();
 738  0115 9d            nop
 740                     ; 135 	NOP();
 743  0116 9d            nop
 745                     ; 136 	NOP();
 748  0117 9d            nop
 750                     ; 137 	NOP();
 753  0118 9d            nop
 755                     ; 138 	NOP();
 758  0119 9d            nop
 760                     ; 139 	NOP();
 763  011a 9d            nop
 765                     ; 140 	NOP();
 768  011b 9d            nop
 770                     ; 141 	SCL_PIN = 0;
 772  011c 72195005      	bres	20485,#4
 773                     ; 142 	NOP();
 776  0120 9d            nop
 778                     ; 143 	NOP();
 781  0121 9d            nop
 783                     ; 144 	SDA_PIN = 1;
 785  0122 721a5005      	bset	20485,#5
 786                     ; 145 	NOP();
 789  0126 9d            nop
 791                     ; 146 	NOP();
 794  0127 9d            nop
 796                     ; 147 	NOP();
 799  0128 9d            nop
 801                     ; 148 	NOP();
 804  0129 9d            nop
 806                     ; 149 	NOP();
 809  012a 9d            nop
 811                     ; 150 	NOP();
 814  012b 9d            nop
 816                     ; 151     return(b);
 818  012c 7b01          	ld	a,(OFST+1,sp)
 821  012e 5b01          	addw	sp,#1
 822  0130 81            	ret
 846                     ; 154 void i2c_start (void)
 846                     ; 155 {
 847                     	switch	.text
 848  0131               _i2c_start:
 852                     ; 156 	NOP();
 855  0131 9d            nop
 857                     ; 157 	NOP();
 860  0132 9d            nop
 862                     ; 158 	NOP();
 865  0133 9d            nop
 867                     ; 159 	NOP();
 870  0134 9d            nop
 872                     ; 160 	SDA_PIN = 1;
 874  0135 721a5005      	bset	20485,#5
 875                     ; 161 	SCL_PIN = 1;
 877  0139 72185005      	bset	20485,#4
 878                     ; 162 	NOP();
 881  013d 9d            nop
 883                     ; 163 	NOP();
 886  013e 9d            nop
 888                     ; 164 	NOP();
 891  013f 9d            nop
 893                     ; 165 	NOP();
 896  0140 9d            nop
 898                     ; 166 	NOP();
 901  0141 9d            nop
 903                     ; 167 	NOP();
 906  0142 9d            nop
 908                     ; 168 	SDA_PIN = 0;
 910  0143 721b5005      	bres	20485,#5
 911                     ; 169 	NOP();
 914  0147 9d            nop
 916                     ; 170 	NOP();
 919  0148 9d            nop
 921                     ; 171 	NOP();
 924  0149 9d            nop
 926                     ; 172 	NOP();
 929  014a 9d            nop
 931                     ; 173 	NOP();
 934  014b 9d            nop
 936                     ; 174 	NOP();
 939  014c 9d            nop
 941                     ; 175 	NOP();
 944  014d 9d            nop
 946                     ; 176 	NOP();
 949  014e 9d            nop
 951                     ; 177 	NOP();
 954  014f 9d            nop
 956                     ; 178 	NOP();
 959  0150 9d            nop
 961                     ; 179 	NOP();
 964  0151 9d            nop
 966                     ; 180 	NOP();
 969  0152 9d            nop
 971                     ; 181 	NOP();
 974  0153 9d            nop
 976                     ; 182 	NOP();
 979  0154 9d            nop
 981                     ; 183 	NOP();
 984  0155 9d            nop
 986                     ; 184 	NOP();
 989  0156 9d            nop
 991                     ; 185 	NOP();
 994  0157 9d            nop
 996                     ; 186 	NOP();
 999  0158 9d            nop
1001                     ; 187 	NOP();
1004  0159 9d            nop
1006                     ; 188 	NOP();
1009  015a 9d            nop
1011                     ; 189 	NOP();
1014  015b 9d            nop
1016                     ; 190 	NOP();
1019  015c 9d            nop
1021                     ; 191 	NOP();
1024  015d 9d            nop
1026                     ; 192 	NOP();
1029  015e 9d            nop
1031                     ; 193 	NOP();
1034  015f 9d            nop
1036                     ; 194 	NOP();
1039  0160 9d            nop
1041                     ; 195 	NOP();
1044  0161 9d            nop
1046                     ; 196 	NOP();
1049  0162 9d            nop
1051                     ; 197 	NOP();
1054  0163 9d            nop
1056                     ; 198 	NOP();
1059  0164 9d            nop
1061                     ; 199 	NOP();
1064  0165 9d            nop
1066                     ; 200 	NOP();
1069  0166 9d            nop
1071                     ; 201 	NOP();
1074  0167 9d            nop
1076                     ; 202 	NOP();
1079  0168 9d            nop
1081                     ; 203 	NOP();
1084  0169 9d            nop
1086                     ; 204 	NOP();
1089  016a 9d            nop
1091                     ; 205 	SCL_PIN = 0;
1093  016b 72195005      	bres	20485,#4
1094                     ; 206 	NOP();
1097  016f 9d            nop
1099                     ; 207 	NOP();
1102  0170 9d            nop
1104                     ; 208 	NOP();
1107  0171 9d            nop
1109                     ; 209 	NOP();
1112  0172 9d            nop
1114                     ; 210 	NOP();
1117  0173 9d            nop
1119                     ; 211 	NOP();
1122  0174 9d            nop
1124                     ; 212 }
1127  0175 81            	ret
1151                     ; 214 void i2c_stop (void)
1151                     ; 215 {
1152                     	switch	.text
1153  0176               _i2c_stop:
1157                     ; 216 	SCL_PIN = 0;
1159  0176 72195005      	bres	20485,#4
1160                     ; 217 	SDA_PIN = 0;
1162  017a 721b5005      	bres	20485,#5
1163                     ; 218 	NOP();
1166  017e 9d            nop
1168                     ; 219 	NOP();
1171  017f 9d            nop
1173                     ; 220 	NOP();
1176  0180 9d            nop
1178                     ; 221 	NOP();
1181  0181 9d            nop
1183                     ; 222 	NOP();
1186  0182 9d            nop
1188                     ; 223 	NOP();
1191  0183 9d            nop
1193                     ; 224 	NOP();
1196  0184 9d            nop
1198                     ; 225 	NOP();
1201  0185 9d            nop
1203                     ; 226 	NOP();
1206  0186 9d            nop
1208                     ; 227 	NOP();
1211  0187 9d            nop
1213                     ; 228 	NOP();
1216  0188 9d            nop
1218                     ; 229 	NOP();
1221  0189 9d            nop
1223                     ; 230 	NOP();
1226  018a 9d            nop
1228                     ; 231 	NOP();
1231  018b 9d            nop
1233                     ; 232 	NOP();
1236  018c 9d            nop
1238                     ; 233 	NOP();
1241  018d 9d            nop
1243                     ; 234 	NOP();
1246  018e 9d            nop
1248                     ; 235 	NOP();
1251  018f 9d            nop
1253                     ; 236 	SCL_PIN = 1;
1255  0190 72185005      	bset	20485,#4
1256                     ; 237 	NOP();
1259  0194 9d            nop
1261                     ; 238 	NOP();
1264  0195 9d            nop
1266                     ; 239 	NOP();
1269  0196 9d            nop
1271                     ; 240 	NOP();
1274  0197 9d            nop
1276                     ; 241 	NOP();
1279  0198 9d            nop
1281                     ; 242 	NOP();
1284  0199 9d            nop
1286                     ; 243 	NOP();
1289  019a 9d            nop
1291                     ; 244 	NOP();
1294  019b 9d            nop
1296                     ; 245 	NOP();
1299  019c 9d            nop
1301                     ; 246 	NOP();
1304  019d 9d            nop
1306                     ; 247 	NOP();
1309  019e 9d            nop
1311                     ; 248 	NOP();
1314  019f 9d            nop
1316                     ; 249 	NOP();
1319  01a0 9d            nop
1321                     ; 250 	NOP();
1324  01a1 9d            nop
1326                     ; 251 	NOP();
1329  01a2 9d            nop
1331                     ; 252 	NOP();
1334  01a3 9d            nop
1336                     ; 253 	NOP();
1339  01a4 9d            nop
1341                     ; 254 	NOP();
1344  01a5 9d            nop
1346                     ; 255 	NOP();
1349  01a6 9d            nop
1351                     ; 256 	NOP();
1354  01a7 9d            nop
1356                     ; 257 	NOP();
1359  01a8 9d            nop
1361                     ; 258 	NOP();
1364  01a9 9d            nop
1366                     ; 259 	NOP();
1369  01aa 9d            nop
1371                     ; 260 	NOP();
1374  01ab 9d            nop
1376                     ; 261 	NOP();
1379  01ac 9d            nop
1381                     ; 262 	NOP();
1384  01ad 9d            nop
1386                     ; 263 	NOP();
1389  01ae 9d            nop
1391                     ; 264 	NOP();
1394  01af 9d            nop
1396                     ; 265 	NOP();
1399  01b0 9d            nop
1401                     ; 266 	NOP();
1404  01b1 9d            nop
1406                     ; 267 	NOP();
1409  01b2 9d            nop
1411                     ; 268 	NOP();
1414  01b3 9d            nop
1416                     ; 269 	NOP();
1419  01b4 9d            nop
1421                     ; 270 	NOP();
1424  01b5 9d            nop
1426                     ; 271 	NOP();
1429  01b6 9d            nop
1431                     ; 272 	NOP();
1434  01b7 9d            nop
1436                     ; 273 	SDA_PIN = 1;
1438  01b8 721a5005      	bset	20485,#5
1439                     ; 274 }
1442  01bc 81            	ret
1455                     	xdef	_i2c_stop
1456                     	xdef	_i2c_start
1457                     	xdef	_i2c_ack
1458                     	xdef	_i2c_shift
1459                     	xdef	_i2c_slave_unlock
1460                     	xdef	_i2c_busy_check
1461                     	xdef	_i2c_init
1480                     	end
