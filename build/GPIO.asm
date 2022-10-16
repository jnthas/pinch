;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module GPIO
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _isPinPWM_PARM_2
	.globl _UIF_BUS_RST
	.globl _UIF_TRANSFER
	.globl _UIF_SUSPEND
	.globl _UIF_FIFO_OV
	.globl _U_SIE_FREE
	.globl _U_TOG_OK
	.globl _U_IS_NAK
	.globl _ADC_CHAN0
	.globl _ADC_CHAN1
	.globl _CMP_CHAN
	.globl _ADC_START
	.globl _ADC_IF
	.globl _CMP_IF
	.globl _CMPO
	.globl _U1RI
	.globl _U1TI
	.globl _U1RB8
	.globl _U1TB8
	.globl _U1REN
	.globl _U1SMOD
	.globl _U1SM0
	.globl _S0_R_FIFO
	.globl _S0_T_FIFO
	.globl _S0_FREE
	.globl _S0_IF_BYTE
	.globl _S0_IF_FIRST
	.globl _S0_IF_OV
	.globl _S0_FST_ACT
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _CAP1F
	.globl _TF2
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _RXD
	.globl _PWM1_
	.globl _TXD
	.globl _PWM2_
	.globl _AIN3
	.globl _VBUS1
	.globl _INT0
	.globl _TXD1_
	.globl _INT1
	.globl _T0
	.globl _RXD1_
	.globl _PWM2
	.globl _T1
	.globl _UDP
	.globl _UDM
	.globl _TIN0
	.globl _CAP1
	.globl _T2
	.globl _AIN0
	.globl _VBUS2
	.globl _TIN1
	.globl _CAP2
	.globl _T2EX
	.globl _RXD_
	.globl _TXD_
	.globl _AIN1
	.globl _UCC1
	.globl _TIN2
	.globl _SCS
	.globl _CAP1_
	.globl _T2_
	.globl _AIN2
	.globl _UCC2
	.globl _TIN3
	.globl _PWM1
	.globl _MOSI
	.globl _TIN4
	.globl _RXD1
	.globl _MISO
	.globl _TIN5
	.globl _TXD1
	.globl _SCK
	.globl _IE_SPI0
	.globl _IE_TKEY
	.globl _IE_USB
	.globl _IE_ADC
	.globl _IE_UART1
	.globl _IE_PWMX
	.globl _IE_GPIO
	.globl _IE_WDOG
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _PL_FLAG
	.globl _PH_FLAG
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _E_DIS
	.globl _EA
	.globl _P
	.globl _F1
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _UEP1_DMA_H
	.globl _UEP1_DMA_L
	.globl _UEP1_DMA
	.globl _UEP0_DMA_H
	.globl _UEP0_DMA_L
	.globl _UEP0_DMA
	.globl _UEP2_3_MOD
	.globl _UEP4_1_MOD
	.globl _UEP3_DMA_H
	.globl _UEP3_DMA_L
	.globl _UEP3_DMA
	.globl _UEP2_DMA_H
	.globl _UEP2_DMA_L
	.globl _UEP2_DMA
	.globl _USB_DEV_AD
	.globl _USB_CTRL
	.globl _USB_INT_EN
	.globl _UEP4_T_LEN
	.globl _UEP4_CTRL
	.globl _UEP0_T_LEN
	.globl _UEP0_CTRL
	.globl _USB_RX_LEN
	.globl _USB_MIS_ST
	.globl _USB_INT_ST
	.globl _USB_INT_FG
	.globl _UEP3_T_LEN
	.globl _UEP3_CTRL
	.globl _UEP2_T_LEN
	.globl _UEP2_CTRL
	.globl _UEP1_T_LEN
	.globl _UEP1_CTRL
	.globl _UDEV_CTRL
	.globl _USB_C_CTRL
	.globl _TKEY_DATH
	.globl _TKEY_DATL
	.globl _TKEY_DAT
	.globl _TKEY_CTRL
	.globl _ADC_DATA
	.globl _ADC_CFG
	.globl _ADC_CTRL
	.globl _SBAUD1
	.globl _SBUF1
	.globl _SCON1
	.globl _SPI0_SETUP
	.globl _SPI0_CK_SE
	.globl _SPI0_CTRL
	.globl _SPI0_DATA
	.globl _SPI0_STAT
	.globl _PWM_CK_SE
	.globl _PWM_CTRL
	.globl _PWM_DATA1
	.globl _PWM_DATA2
	.globl _T2CAP1H
	.globl _T2CAP1L
	.globl _T2CAP1
	.globl _TH2
	.globl _TL2
	.globl _T2COUNT
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _RCAP2
	.globl _T2MOD
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _XBUS_AUX
	.globl _PIN_FUNC
	.globl _P3_DIR_PU
	.globl _P3_MOD_OC
	.globl _P3
	.globl _P2
	.globl _P1_DIR_PU
	.globl _P1_MOD_OC
	.globl _P1
	.globl _ROM_CTRL
	.globl _ROM_DATA_H
	.globl _ROM_DATA_L
	.globl _ROM_DATA
	.globl _ROM_ADDR_H
	.globl _ROM_ADDR_L
	.globl _ROM_ADDR
	.globl _GPIO_IE
	.globl _IP_EX
	.globl _IE_EX
	.globl _IP
	.globl _IE
	.globl _WDOG_COUNT
	.globl _RESET_KEEP
	.globl _WAKE_CTRL
	.globl _CLOCK_CFG
	.globl _PCON
	.globl _GLOBAL_CFG
	.globl _SAFE_MOD
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _analogWrite_PARM_2
	.globl _digitalWrite_PARM_2
	.globl _p3Mode_PARM_2
	.globl _p1Mode_PARM_2
	.globl _p1Mode
	.globl _p3Mode
	.globl _isPinPWM
	.globl _digitalRead
	.globl _digitalWrite
	.globl _analogRead
	.globl _analogWrite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_SAFE_MOD	=	0x00a1
_GLOBAL_CFG	=	0x00b1
_PCON	=	0x0087
_CLOCK_CFG	=	0x00b9
_WAKE_CTRL	=	0x00a9
_RESET_KEEP	=	0x00fe
_WDOG_COUNT	=	0x00ff
_IE	=	0x00a8
_IP	=	0x00b8
_IE_EX	=	0x00e8
_IP_EX	=	0x00e9
_GPIO_IE	=	0x00c7
_ROM_ADDR	=	0x8584
_ROM_ADDR_L	=	0x0084
_ROM_ADDR_H	=	0x0085
_ROM_DATA	=	0x8f8e
_ROM_DATA_L	=	0x008e
_ROM_DATA_H	=	0x008f
_ROM_CTRL	=	0x0086
_P1	=	0x0090
_P1_MOD_OC	=	0x0092
_P1_DIR_PU	=	0x0093
_P2	=	0x00a0
_P3	=	0x00b0
_P3_MOD_OC	=	0x0096
_P3_DIR_PU	=	0x0097
_PIN_FUNC	=	0x00c6
_XBUS_AUX	=	0x00a2
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2	=	0xcbca
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_T2COUNT	=	0xcdcc
_TL2	=	0x00cc
_TH2	=	0x00cd
_T2CAP1	=	0xcfce
_T2CAP1L	=	0x00ce
_T2CAP1H	=	0x00cf
_PWM_DATA2	=	0x009b
_PWM_DATA1	=	0x009c
_PWM_CTRL	=	0x009d
_PWM_CK_SE	=	0x009e
_SPI0_STAT	=	0x00f8
_SPI0_DATA	=	0x00f9
_SPI0_CTRL	=	0x00fa
_SPI0_CK_SE	=	0x00fb
_SPI0_SETUP	=	0x00fc
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_SBAUD1	=	0x00c2
_ADC_CTRL	=	0x0080
_ADC_CFG	=	0x009a
_ADC_DATA	=	0x009f
_TKEY_CTRL	=	0x00c3
_TKEY_DAT	=	0xc5c4
_TKEY_DATL	=	0x00c4
_TKEY_DATH	=	0x00c5
_USB_C_CTRL	=	0x0091
_UDEV_CTRL	=	0x00d1
_UEP1_CTRL	=	0x00d2
_UEP1_T_LEN	=	0x00d3
_UEP2_CTRL	=	0x00d4
_UEP2_T_LEN	=	0x00d5
_UEP3_CTRL	=	0x00d6
_UEP3_T_LEN	=	0x00d7
_USB_INT_FG	=	0x00d8
_USB_INT_ST	=	0x00d9
_USB_MIS_ST	=	0x00da
_USB_RX_LEN	=	0x00db
_UEP0_CTRL	=	0x00dc
_UEP0_T_LEN	=	0x00dd
_UEP4_CTRL	=	0x00de
_UEP4_T_LEN	=	0x00df
_USB_INT_EN	=	0x00e1
_USB_CTRL	=	0x00e2
_USB_DEV_AD	=	0x00e3
_UEP2_DMA	=	0xe5e4
_UEP2_DMA_L	=	0x00e4
_UEP2_DMA_H	=	0x00e5
_UEP3_DMA	=	0xe7e6
_UEP3_DMA_L	=	0x00e6
_UEP3_DMA_H	=	0x00e7
_UEP4_1_MOD	=	0x00ea
_UEP2_3_MOD	=	0x00eb
_UEP0_DMA	=	0xedec
_UEP0_DMA_L	=	0x00ec
_UEP0_DMA_H	=	0x00ed
_UEP1_DMA	=	0xefee
_UEP1_DMA_L	=	0x00ee
_UEP1_DMA_H	=	0x00ef
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_F1	=	0x00d1
_P	=	0x00d0
_EA	=	0x00af
_E_DIS	=	0x00ae
_ET2	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PH_FLAG	=	0x00bf
_PL_FLAG	=	0x00be
_PT2	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_IE_WDOG	=	0x00ef
_IE_GPIO	=	0x00ee
_IE_PWMX	=	0x00ed
_IE_UART1	=	0x00ec
_IE_ADC	=	0x00eb
_IE_USB	=	0x00ea
_IE_TKEY	=	0x00e9
_IE_SPI0	=	0x00e8
_SCK	=	0x0097
_TXD1	=	0x0097
_TIN5	=	0x0097
_MISO	=	0x0096
_RXD1	=	0x0096
_TIN4	=	0x0096
_MOSI	=	0x0095
_PWM1	=	0x0095
_TIN3	=	0x0095
_UCC2	=	0x0095
_AIN2	=	0x0095
_T2_	=	0x0094
_CAP1_	=	0x0094
_SCS	=	0x0094
_TIN2	=	0x0094
_UCC1	=	0x0094
_AIN1	=	0x0094
_TXD_	=	0x0093
_RXD_	=	0x0092
_T2EX	=	0x0091
_CAP2	=	0x0091
_TIN1	=	0x0091
_VBUS2	=	0x0091
_AIN0	=	0x0091
_T2	=	0x0090
_CAP1	=	0x0090
_TIN0	=	0x0090
_UDM	=	0x00b7
_UDP	=	0x00b6
_T1	=	0x00b5
_PWM2	=	0x00b4
_RXD1_	=	0x00b4
_T0	=	0x00b4
_INT1	=	0x00b3
_TXD1_	=	0x00b2
_INT0	=	0x00b2
_VBUS1	=	0x00b2
_AIN3	=	0x00b2
_PWM2_	=	0x00b1
_TXD	=	0x00b1
_PWM1_	=	0x00b0
_RXD	=	0x00b0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_TF2	=	0x00cf
_CAP1F	=	0x00cf
_EXF2	=	0x00ce
_RCLK	=	0x00cd
_TCLK	=	0x00cc
_EXEN2	=	0x00cb
_TR2	=	0x00ca
_C_T2	=	0x00c9
_CP_RL2	=	0x00c8
_S0_FST_ACT	=	0x00ff
_S0_IF_OV	=	0x00fe
_S0_IF_FIRST	=	0x00fd
_S0_IF_BYTE	=	0x00fc
_S0_FREE	=	0x00fb
_S0_T_FIFO	=	0x00fa
_S0_R_FIFO	=	0x00f8
_U1SM0	=	0x00c7
_U1SMOD	=	0x00c5
_U1REN	=	0x00c4
_U1TB8	=	0x00c3
_U1RB8	=	0x00c2
_U1TI	=	0x00c1
_U1RI	=	0x00c0
_CMPO	=	0x0087
_CMP_IF	=	0x0086
_ADC_IF	=	0x0085
_ADC_START	=	0x0084
_CMP_CHAN	=	0x0083
_ADC_CHAN1	=	0x0081
_ADC_CHAN0	=	0x0080
_U_IS_NAK	=	0x00df
_U_TOG_OK	=	0x00de
_U_SIE_FREE	=	0x00dd
_UIF_FIFO_OV	=	0x00dc
_UIF_SUSPEND	=	0x00da
_UIF_TRANSFER	=	0x00d9
_UIF_BUS_RST	=	0x00d8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_isPinPWM_PARM_2:
	.ds 1
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_p1Mode_PARM_2:
	.ds 1
_p3Mode_PARM_2:
	.ds 1
_digitalWrite_PARM_2:
	.ds 1
_analogWrite_PARM_2:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'p1Mode'
;------------------------------------------------------------
;mode                      Allocated with name '_p1Mode_PARM_2'
;portBit                   Allocated to registers r7 
;------------------------------------------------------------
;	App/core/GPIO.c:4: void p1Mode(uint8_t portBit, __xdata uint8_t mode) 
;	-----------------------------------------
;	 function p1Mode
;	-----------------------------------------
_p1Mode:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	App/core/GPIO.c:7: if (mode == INPUT) {        
	mov	dptr,#_p1Mode_PARM_2
	movx	a,@dptr
	mov	r6,a
	jnz	00110$
;	App/core/GPIO.c:8: P1_MOD_OC &= ~(1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00133$
00131$:
	add	a,acc
00133$:
	djnz	b,00131$
	cpl	a
	mov	r5,a
	mov	r4,_P1_MOD_OC
	anl	a,r4
	mov	_P1_MOD_OC,a
;	App/core/GPIO.c:9: P1_DIR_PU &= ~(1<<portBit);
	mov	r4,_P1_DIR_PU
	mov	a,r5
	anl	a,r4
	mov	_P1_DIR_PU,a
	ret
00110$:
;	App/core/GPIO.c:11: } else if (mode == INPUT_PULLUP) {
	cjne	r6,#0x02,00107$
;	App/core/GPIO.c:12: P1_MOD_OC |= (1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00138$
00136$:
	add	a,acc
00138$:
	djnz	b,00136$
	mov	r5,a
	mov	r4,_P1_MOD_OC
	orl	a,r4
	mov	_P1_MOD_OC,a
;	App/core/GPIO.c:13: P1_DIR_PU |= (1<<portBit);
	mov	r4,_P1_DIR_PU
	mov	a,r5
	orl	a,r4
	mov	_P1_DIR_PU,a
	ret
00107$:
;	App/core/GPIO.c:15: } else if (mode == OUTPUT) {
	cjne	r6,#0x01,00104$
;	App/core/GPIO.c:16: P1_MOD_OC &= ~(1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00143$
00141$:
	add	a,acc
00143$:
	djnz	b,00141$
	mov	r5,a
	cpl	a
	mov	r3,_P1_MOD_OC
	anl	a,r3
	mov	_P1_MOD_OC,a
;	App/core/GPIO.c:17: P1_DIR_PU |= (1<<portBit);
	mov	r4,_P1_DIR_PU
	mov	a,r5
	orl	a,r4
	mov	_P1_DIR_PU,a
	ret
00104$:
;	App/core/GPIO.c:19: } else if (mode == OUTPUT_OD) {
	cjne	r6,#0x03,00112$
;	App/core/GPIO.c:20: P1_MOD_OC |= (1<<portBit);
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00148$
00146$:
	add	a,acc
00148$:
	djnz	b,00146$
	mov	r7,a
	mov	r6,_P1_MOD_OC
	orl	a,r6
	mov	_P1_MOD_OC,a
;	App/core/GPIO.c:21: P1_DIR_PU &= ~(1<<portBit);
	mov	a,r7
	cpl	a
	mov	r7,a
	mov	r6,_P1_DIR_PU
	anl	a,r6
	mov	_P1_DIR_PU,a
00112$:
;	App/core/GPIO.c:24: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'p3Mode'
;------------------------------------------------------------
;mode                      Allocated with name '_p3Mode_PARM_2'
;portBit                   Allocated to registers r7 
;------------------------------------------------------------
;	App/core/GPIO.c:26: void p3Mode(uint8_t portBit, __xdata uint8_t mode) 
;	-----------------------------------------
;	 function p3Mode
;	-----------------------------------------
_p3Mode:
	mov	r7,dpl
;	App/core/GPIO.c:28: if (mode == INPUT) {  
	mov	dptr,#_p3Mode_PARM_2
	movx	a,@dptr
	mov	r6,a
	jnz	00110$
;	App/core/GPIO.c:30: P3_MOD_OC &= ~(1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00133$
00131$:
	add	a,acc
00133$:
	djnz	b,00131$
	cpl	a
	mov	r5,a
	mov	r4,_P3_MOD_OC
	anl	a,r4
	mov	_P3_MOD_OC,a
;	App/core/GPIO.c:31: P3_DIR_PU &= ~(1<<portBit);
	mov	r4,_P3_DIR_PU
	mov	a,r5
	anl	a,r4
	mov	_P3_DIR_PU,a
	ret
00110$:
;	App/core/GPIO.c:33: } else if (mode == INPUT_PULLUP) {
	cjne	r6,#0x02,00107$
;	App/core/GPIO.c:35: P3_MOD_OC |= (1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00138$
00136$:
	add	a,acc
00138$:
	djnz	b,00136$
	mov	r5,a
	mov	r4,_P3_MOD_OC
	orl	a,r4
	mov	_P3_MOD_OC,a
;	App/core/GPIO.c:36: P3_DIR_PU |= (1<<portBit);
	mov	r4,_P3_DIR_PU
	mov	a,r5
	orl	a,r4
	mov	_P3_DIR_PU,a
	ret
00107$:
;	App/core/GPIO.c:38: } else if (mode == OUTPUT) {
	cjne	r6,#0x01,00104$
;	App/core/GPIO.c:40: P3_MOD_OC &= ~(1<<portBit);
	mov	ar5,r7
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00143$
00141$:
	add	a,acc
00143$:
	djnz	b,00141$
	mov	r5,a
	cpl	a
	mov	r3,_P3_MOD_OC
	anl	a,r3
	mov	_P3_MOD_OC,a
;	App/core/GPIO.c:41: P3_DIR_PU |= (1<<portBit);
	mov	r4,_P3_DIR_PU
	mov	a,r5
	orl	a,r4
	mov	_P3_DIR_PU,a
	ret
00104$:
;	App/core/GPIO.c:43: } else if (mode == OUTPUT_OD) {
	cjne	r6,#0x03,00112$
;	App/core/GPIO.c:45: P3_MOD_OC |= (1<<portBit);
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00148$
00146$:
	add	a,acc
00148$:
	djnz	b,00146$
	mov	r7,a
	mov	r6,_P3_MOD_OC
	orl	a,r6
	mov	_P3_MOD_OC,a
;	App/core/GPIO.c:46: P3_DIR_PU &= ~(1<<portBit);
	mov	a,r7
	cpl	a
	mov	r7,a
	mov	r6,_P3_DIR_PU
	anl	a,r6
	mov	_P3_DIR_PU,a
00112$:
;	App/core/GPIO.c:48: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'turnOffPWM'
;------------------------------------------------------------
;pwm                       Allocated to registers r7 
;------------------------------------------------------------
;	App/core/GPIO.c:50: static void turnOffPWM(uint8_t pwm)
;	-----------------------------------------
;	 function turnOffPWM
;	-----------------------------------------
_turnOffPWM:
	mov	r7,dpl
;	App/core/GPIO.c:52: switch (pwm)
	cjne	r7,#0x01,00148$
	sjmp	00101$
00148$:
	cjne	r7,#0x02,00149$
	sjmp	00104$
00149$:
	cjne	r7,#0x03,00150$
	sjmp	00107$
00150$:
;	App/core/GPIO.c:54: case PIN_PWM1:
	cjne	r7,#0x04,00114$
	sjmp	00110$
00101$:
;	App/core/GPIO.c:55: if ((PIN_FUNC & bPWM1_PIN_X) == 0){
	mov	a,_PIN_FUNC
	jb	acc.2,00114$
;	App/core/GPIO.c:56: PWM_CTRL &= ~bPWM1_OUT_EN;
	anl	_PWM_CTRL,#0xfb
;	App/core/GPIO.c:58: break;
;	App/core/GPIO.c:59: case PIN_PWM2:
	ret
00104$:
;	App/core/GPIO.c:60: if ((PIN_FUNC & bPWM2_PIN_X) == 0){
	mov	a,_PIN_FUNC
	jb	acc.3,00114$
;	App/core/GPIO.c:61: PWM_CTRL &= ~bPWM2_OUT_EN;
	anl	_PWM_CTRL,#0xf7
;	App/core/GPIO.c:63: break;
;	App/core/GPIO.c:64: case PIN_PWM1_:
	ret
00107$:
;	App/core/GPIO.c:65: if ((PIN_FUNC & bPWM1_PIN_X) != 0){
	mov	a,_PIN_FUNC
	jnb	acc.2,00114$
;	App/core/GPIO.c:66: PWM_CTRL &= ~bPWM1_OUT_EN;
	anl	_PWM_CTRL,#0xfb
;	App/core/GPIO.c:68: break;
;	App/core/GPIO.c:69: case PIN_PWM2_:
	ret
00110$:
;	App/core/GPIO.c:70: if ((PIN_FUNC & bPWM2_PIN_X) != 0){
	mov	a,_PIN_FUNC
	jnb	acc.3,00114$
;	App/core/GPIO.c:71: PWM_CTRL &= ~bPWM2_OUT_EN;
	anl	_PWM_CTRL,#0xf7
;	App/core/GPIO.c:74: }
00114$:
;	App/core/GPIO.c:75: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'isPinPWM'
;------------------------------------------------------------
;portBit                   Allocated with name '_isPinPWM_PARM_2'
;port                      Allocated to registers r7 
;------------------------------------------------------------
;	App/core/GPIO.c:78: uint8_t isPinPWM(uint8_t port, uint8_t portBit) 
;	-----------------------------------------
;	 function isPinPWM
;	-----------------------------------------
_isPinPWM:
	mov	r7,dpl
;	App/core/GPIO.c:81: if (port == 1 && portBit == 5) {
	cjne	r7,#0x01,00112$
	mov	a,#0x05
	cjne	a,_isPinPWM_PARM_2,00112$
;	App/core/GPIO.c:82: return PIN_PWM1;
	mov	dpl,#0x01
	ret
00112$:
;	App/core/GPIO.c:83: } else if (port == 3) {
	cjne	r7,#0x03,00113$
;	App/core/GPIO.c:84: if (portBit == 0) 
	mov	a,_isPinPWM_PARM_2
	jnz	00107$
;	App/core/GPIO.c:85: return PIN_PWM1_;
	mov	dpl,#0x03
	ret
00107$:
;	App/core/GPIO.c:86: else if (portBit == 1) 
	mov	a,#0x01
	cjne	a,_isPinPWM_PARM_2,00104$
;	App/core/GPIO.c:87: return PIN_PWM2_;
	mov	dpl,#0x04
	ret
00104$:
;	App/core/GPIO.c:88: else if (portBit == 4) 
	mov	a,#0x04
	cjne	a,_isPinPWM_PARM_2,00113$
;	App/core/GPIO.c:89: return PIN_PWM2;
	mov	dpl,#0x02
	ret
00113$:
;	App/core/GPIO.c:92: return NOT_ON_PWM;
	mov	dpl,#0x00
;	App/core/GPIO.c:93: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'digitalRead'
;------------------------------------------------------------
;pin                       Allocated to registers r7 
;portNumber                Allocated to registers r6 
;portBit                   Allocated to registers r4 
;pwm                       Allocated to registers r5 
;portBuf                   Allocated to registers r7 
;------------------------------------------------------------
;	App/core/GPIO.c:95: uint8_t digitalRead(uint8_t pin)
;	-----------------------------------------
;	 function digitalRead
;	-----------------------------------------
_digitalRead:
	mov	r7,dpl
;	App/core/GPIO.c:97: uint8_t portNumber = (pin-(pin % 10))/10;
	mov	r6,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	push	ar7
	push	ar6
	lcall	__modsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	a,r7
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,r6
	subb	a,r5
	mov	dph,a
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	push	ar5
	push	ar4
	lcall	__divsint
	mov	r6,dpl
	pop	ar4
	pop	ar5
;	App/core/GPIO.c:98: uint8_t portBit    = (pin % 10);
;	App/core/GPIO.c:99: uint8_t pwm        = isPinPWM(portNumber, portBit);
	mov	_isPinPWM_PARM_2,r4
	mov	dpl,r6
	push	ar6
	push	ar4
	lcall	_isPinPWM
	mov	r7,dpl
	pop	ar4
	pop	ar6
;	App/core/GPIO.c:104: if (pwm != NOT_ON_PWM) turnOffPWM(pwm);
	mov	a,r7
	mov	r5,a
	jz	00102$
	mov	dpl,r5
	push	ar6
	push	ar4
	lcall	_turnOffPWM
	pop	ar4
	pop	ar6
00102$:
;	App/core/GPIO.c:106: uint8_t portBuf = 0;
	mov	r7,#0x00
;	App/core/GPIO.c:108: switch(portNumber) {
	cjne	r6,#0x01,00133$
	sjmp	00103$
00133$:
	cjne	r6,#0x02,00134$
	sjmp	00104$
00134$:
;	App/core/GPIO.c:109: case 1:
	cjne	r6,#0x03,00107$
	sjmp	00105$
00103$:
;	App/core/GPIO.c:110: portBuf = P1;
	mov	r7,_P1
;	App/core/GPIO.c:111: break;
;	App/core/GPIO.c:112: case 2:
	sjmp	00107$
00104$:
;	App/core/GPIO.c:113: portBuf = P2;
	mov	r7,_P2
;	App/core/GPIO.c:114: break;
;	App/core/GPIO.c:115: case 3:
	sjmp	00107$
00105$:
;	App/core/GPIO.c:116: portBuf = P3;
	mov	r7,_P3
;	App/core/GPIO.c:120: }
00107$:
;	App/core/GPIO.c:122: if (portBuf & portBit) return HIGH;
	mov	a,r4
	anl	a,r7
	jz	00109$
	mov	dpl,#0x01
	ret
00109$:
;	App/core/GPIO.c:123: return LOW;
	mov	dpl,#0x00
;	App/core/GPIO.c:124: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'digitalWrite'
;------------------------------------------------------------
;pin                       Allocated to registers r7 
;portNumber                Allocated to registers r6 
;portBit                   Allocated to registers r4 
;pwm                       Allocated to registers r5 
;interruptOn               Allocated to registers r7 
;val                       Allocated with name '_digitalWrite_PARM_2'
;------------------------------------------------------------
;	App/core/GPIO.c:126: void digitalWrite(uint8_t pin, __xdata uint8_t val)
;	-----------------------------------------
;	 function digitalWrite
;	-----------------------------------------
_digitalWrite:
	mov	r7,dpl
;	App/core/GPIO.c:128: uint8_t portNumber = (pin-(pin % 10))/10;
	mov	r6,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	push	ar7
	push	ar6
	lcall	__modsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	a,r7
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,r6
	subb	a,r5
	mov	dph,a
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	push	ar5
	push	ar4
	lcall	__divsint
	mov	r6,dpl
	pop	ar4
	pop	ar5
;	App/core/GPIO.c:129: uint8_t portBit    = (pin % 10);
;	App/core/GPIO.c:130: uint8_t pwm        = isPinPWM(portNumber, portBit);
	mov	_isPinPWM_PARM_2,r4
	mov	dpl,r6
	push	ar6
	push	ar4
	lcall	_isPinPWM
	mov	r7,dpl
	pop	ar4
	pop	ar6
;	App/core/GPIO.c:135: if (pwm != NOT_ON_PWM) turnOffPWM(pwm);
	mov	a,r7
	mov	r5,a
	jz	00102$
	mov	dpl,r5
	push	ar6
	push	ar4
	lcall	_turnOffPWM
	pop	ar4
	pop	ar6
00102$:
;	App/core/GPIO.c:139: uint8_t interruptOn = EA;
	mov	c,_EA
	clr	a
	rlc	a
	mov	r7,a
;	App/core/GPIO.c:140: EA = 0;
;	assignBit
	clr	_EA
;	App/core/GPIO.c:142: switch(portNumber){
	cjne	r6,#0x01,00154$
	sjmp	00103$
00154$:
	cjne	r6,#0x02,00155$
	sjmp	00107$
00155$:
	cjne	r6,#0x03,00156$
	sjmp	00111$
00156$:
	ljmp	00116$
;	App/core/GPIO.c:143: case 1:
00103$:
;	App/core/GPIO.c:144: if (val == LOW) {
	mov	dptr,#_digitalWrite_PARM_2
	movx	a,@dptr
	jnz	00105$
;	App/core/GPIO.c:145: P1 &= ~(1<<portBit);
	mov	ar6,r4
	mov	b,r6
	inc	b
	mov	a,#0x01
	sjmp	00160$
00158$:
	add	a,acc
00160$:
	djnz	b,00158$
	cpl	a
	mov	r6,a
	mov	r5,_P1
	anl	a,r5
	mov	_P1,a
	ljmp	00116$
00105$:
;	App/core/GPIO.c:147: P1 |= (1<<portBit);
	mov	ar6,r4
	mov	b,r6
	inc	b
	mov	a,#0x01
	sjmp	00163$
00161$:
	add	a,acc
00163$:
	djnz	b,00161$
	mov	r6,a
	mov	r5,_P1
	orl	a,r5
	mov	_P1,a
;	App/core/GPIO.c:149: break;
;	App/core/GPIO.c:150: case 2:
	sjmp	00116$
00107$:
;	App/core/GPIO.c:151: if (val == LOW) {
	mov	dptr,#_digitalWrite_PARM_2
	movx	a,@dptr
	jnz	00109$
;	App/core/GPIO.c:152: P2 &= ~(1<<portBit);
	mov	ar6,r4
	mov	b,r6
	inc	b
	mov	a,#0x01
	sjmp	00167$
00165$:
	add	a,acc
00167$:
	djnz	b,00165$
	cpl	a
	mov	r6,a
	mov	r5,_P2
	anl	a,r5
	mov	_P2,a
	sjmp	00116$
00109$:
;	App/core/GPIO.c:154: P2 |= (1<<portBit);
	mov	ar6,r4
	mov	b,r6
	inc	b
	mov	a,#0x01
	sjmp	00170$
00168$:
	add	a,acc
00170$:
	djnz	b,00168$
	mov	r6,a
	mov	r5,_P2
	orl	a,r5
	mov	_P2,a
;	App/core/GPIO.c:156: break;
;	App/core/GPIO.c:157: case 3:
	sjmp	00116$
00111$:
;	App/core/GPIO.c:158: if (val == LOW) {
	mov	dptr,#_digitalWrite_PARM_2
	movx	a,@dptr
	jnz	00113$
;	App/core/GPIO.c:159: P3 &= ~(1<<portBit);
	mov	ar6,r4
	mov	b,r6
	inc	b
	mov	a,#0x01
	sjmp	00174$
00172$:
	add	a,acc
00174$:
	djnz	b,00172$
	cpl	a
	mov	r6,a
	mov	r5,_P3
	anl	a,r5
	mov	_P3,a
	sjmp	00116$
00113$:
;	App/core/GPIO.c:161: P3 |= (1<<portBit);
	mov	b,r4
	inc	b
	mov	a,#0x01
	sjmp	00177$
00175$:
	add	a,acc
00177$:
	djnz	b,00175$
	mov	r4,a
	mov	r6,_P3
	orl	a,r6
	mov	_P3,a
;	App/core/GPIO.c:167: }
00116$:
;	App/core/GPIO.c:169: if (interruptOn) EA = 1;
	mov	a,r7
	jz	00119$
;	assignBit
	setb	_EA
00119$:
;	App/core/GPIO.c:170: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'analogRead'
;------------------------------------------------------------
;pin                       Allocated to registers r7 
;pinNum                    Allocated to registers r6 
;------------------------------------------------------------
;	App/core/GPIO.c:173: uint8_t analogRead(uint8_t pin)
;	-----------------------------------------
;	 function analogRead
;	-----------------------------------------
_analogRead:
	mov	r7,dpl
;	App/core/GPIO.c:183: if (pin == 11)
	cjne	r7,#0x0b,00111$
;	App/core/GPIO.c:184: pinNum = 0;
	mov	r6,#0x00
	sjmp	00112$
00111$:
;	App/core/GPIO.c:185: else if (pin == 14) 
	cjne	r7,#0x0e,00108$
;	App/core/GPIO.c:186: pinNum = 1;
	mov	r6,#0x01
	sjmp	00112$
00108$:
;	App/core/GPIO.c:187: else if (pin == 15)
	cjne	r7,#0x0f,00105$
;	App/core/GPIO.c:188: pinNum = 2;
	mov	r6,#0x02
	sjmp	00112$
00105$:
;	App/core/GPIO.c:189: else if (pin == 32)
	cjne	r7,#0x20,00102$
;	App/core/GPIO.c:190: pinNum = 3;
	mov	r6,#0x03
	sjmp	00112$
00102$:
;	App/core/GPIO.c:192: return 0;
	mov	dpl,#0x00
	ret
00112$:
;	App/core/GPIO.c:194: ADC_CFG = bADC_EN | bADC_CLK;
	mov	_ADC_CFG,#0x09
;	App/core/GPIO.c:196: ADC_CTRL = (ADC_CTRL & ~(0x03)) | (0x03&pinNum);
	mov	a,#0xfc
	anl	a,_ADC_CTRL
	mov	r7,a
	mov	a,#0x03
	anl	a,r6
	orl	a,r7
	mov	_ADC_CTRL,a
;	App/core/GPIO.c:198: ADC_START = 1;
;	assignBit
	setb	_ADC_START
;	App/core/GPIO.c:200: while(ADC_START);
00113$:
	jb	_ADC_START,00113$
;	App/core/GPIO.c:202: return ADC_DATA;
	mov	dpl,_ADC_DATA
;	App/core/GPIO.c:203: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'analogWrite'
;------------------------------------------------------------
;pin                       Allocated to registers r7 
;portNumber                Allocated to registers r5 
;portBit                   Allocated to registers r3 
;val                       Allocated with name '_analogWrite_PARM_2'
;------------------------------------------------------------
;	App/core/GPIO.c:210: void analogWrite(uint8_t pin, __xdata uint16_t val)
;	-----------------------------------------
;	 function analogWrite
;	-----------------------------------------
_analogWrite:
	mov	r7,dpl
;	App/core/GPIO.c:218: uint8_t portNumber = (pin-(pin % 10))/10;
	mov	ar5,r7
	mov	r6,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	mov	dpl,r5
	mov	dph,r6
	push	ar7
	push	ar6
	push	ar5
	lcall	__modsint
	mov	r3,dpl
	mov	r4,dph
	pop	ar5
	pop	ar6
	mov	a,r5
	clr	c
	subb	a,r3
	mov	dpl,a
	mov	a,r6
	subb	a,r4
	mov	dph,a
	mov	__divsint_PARM_2,#0x0a
	mov	(__divsint_PARM_2 + 1),#0x00
	push	ar4
	push	ar3
	lcall	__divsint
	mov	r5,dpl
	pop	ar3
	pop	ar4
	pop	ar7
;	App/core/GPIO.c:219: uint8_t portBit    = (pin % 10);
;	App/core/GPIO.c:222: if (val == 0)
	mov	dptr,#_analogWrite_PARM_2
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	orl	a,r4
	jnz	00115$
;	App/core/GPIO.c:224: digitalWrite(pin, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r7
	ljmp	_digitalWrite
00115$:
;	App/core/GPIO.c:226: else if (val >= 256)
	mov	ar1,r4
	mov	ar2,r6
	mov	a,#0x100 - 0x01
	add	a,r2
	jnc	00112$
;	App/core/GPIO.c:228: digitalWrite(pin, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,r7
	ljmp	_digitalWrite
00112$:
;	App/core/GPIO.c:232: switch(isPinPWM(portNumber, portBit))
	mov	_isPinPWM_PARM_2,r3
	mov	dpl,r5
	push	ar7
	push	ar6
	push	ar4
	push	ar2
	push	ar1
	lcall	_isPinPWM
	mov	r5,dpl
	pop	ar1
	pop	ar2
	pop	ar4
	pop	ar6
	pop	ar7
	mov	a,r5
	add	a,#0xff - 0x04
	jc	00106$
	mov	a,r5
	add	a,r5
;	App/core/GPIO.c:234: case PIN_PWM1:
	mov	dptr,#00138$
	jmp	@a+dptr
00138$:
	sjmp	00106$
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
00101$:
;	App/core/GPIO.c:235: PIN_FUNC &= ~(bPWM1_PIN_X);
	anl	_PIN_FUNC,#0xfb
;	App/core/GPIO.c:236: PWM_CTRL |= bPWM1_OUT_EN;
	orl	_PWM_CTRL,#0x04
;	App/core/GPIO.c:237: PWM_DATA1 = val;
	mov	_PWM_DATA1,r4
;	App/core/GPIO.c:238: break;
;	App/core/GPIO.c:239: case PIN_PWM2:
	ret
00102$:
;	App/core/GPIO.c:240: PIN_FUNC &= ~(bPWM2_PIN_X);
	anl	_PIN_FUNC,#0xf7
;	App/core/GPIO.c:241: PWM_CTRL |= bPWM2_OUT_EN;
	orl	_PWM_CTRL,#0x08
;	App/core/GPIO.c:242: PWM_DATA2 = val;
	mov	_PWM_DATA2,r4
;	App/core/GPIO.c:243: break;
;	App/core/GPIO.c:244: case PIN_PWM1_:
	ret
00103$:
;	App/core/GPIO.c:245: PIN_FUNC |= (bPWM1_PIN_X);
	orl	_PIN_FUNC,#0x04
;	App/core/GPIO.c:246: PWM_CTRL |= bPWM1_OUT_EN;
	orl	_PWM_CTRL,#0x04
;	App/core/GPIO.c:247: PWM_DATA1 = val;
	mov	_PWM_DATA1,r4
;	App/core/GPIO.c:248: break;
;	App/core/GPIO.c:249: case PIN_PWM2_:
	ret
00104$:
;	App/core/GPIO.c:250: PIN_FUNC |= (bPWM2_PIN_X);
	orl	_PIN_FUNC,#0x08
;	App/core/GPIO.c:251: PWM_CTRL |= bPWM2_OUT_EN;
	orl	_PWM_CTRL,#0x08
;	App/core/GPIO.c:252: PWM_DATA2 = val;
	mov	_PWM_DATA2,r4
;	App/core/GPIO.c:253: break;
;	App/core/GPIO.c:255: default:
	ret
00106$:
;	App/core/GPIO.c:256: if (val < 128) {
	clr	c
	mov	a,r1
	subb	a,#0x80
	mov	a,r2
	subb	a,#0x00
	jnc	00108$
;	App/core/GPIO.c:257: digitalWrite(pin, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r7
	ljmp	_digitalWrite
00108$:
;	App/core/GPIO.c:259: digitalWrite(pin, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,r7
;	App/core/GPIO.c:261: }
;	App/core/GPIO.c:263: }
	ljmp	_digitalWrite
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
