;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module sevenSegmentDisplay
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _digitalWrite
	.globl _p3Mode
	.globl _CH554SPIMasterWrite
	.globl _mDelaymS
	.globl _sprintf
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
	.globl _DisplayChars
	.globl _display_buffer
	.globl _Display_marquee_PARM_2
	.globl _Display_setDigit_PARM_2
	.globl _Display_marquee_PARM_3
	.globl _ledState
	.globl _Display_setup
	.globl _Display_setDigit
	.globl _Display_toggleOff
	.globl _Display_toggleOn
	.globl _Display_select
	.globl _Display_unselect
	.globl _Display_update
	.globl _Display_clear
	.globl _Display_printNumber
	.globl _Display_marquee
	.globl _Display_loading
	.globl _Display_toggleLed
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
_ledState::
	.ds 1
_Display_printNumber_numchar_65536_123:
	.ds 3
_Display_marquee_PARM_3:
	.ds 3
_Display_marquee_text_65536_128:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
_Display_setDigit_PARM_2:
	.ds 1
_Display_setDigit_digit_65536_108:
	.ds 1
_Display_toggleOn_pin_65536_113:
	.ds 1
_Display_marquee_PARM_2:
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_display_buffer::
	.ds 3
_DisplayChars::
	.ds 50
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
;	App/components/sevenSegmentDisplay.c:43: bool ledState = false;
	mov	_ledState,#0x00
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
;Allocation info for local variables in function 'Display_setup'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:45: void Display_setup() 
;	-----------------------------------------
;	 function Display_setup
;	-----------------------------------------
_Display_setup:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	App/components/sevenSegmentDisplay.c:47: p3Mode(0, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x00
	lcall	_p3Mode
;	App/components/sevenSegmentDisplay.c:48: p3Mode(1, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_p3Mode
;	App/components/sevenSegmentDisplay.c:49: p3Mode(3, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x03
	lcall	_p3Mode
;	App/components/sevenSegmentDisplay.c:50: p3Mode(4, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x04
;	App/components/sevenSegmentDisplay.c:51: }
	ljmp	_p3Mode
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_setDigit'
;------------------------------------------------------------
;pos                       Allocated with name '_Display_setDigit_PARM_2'
;digit                     Allocated with name '_Display_setDigit_digit_65536_108'
;b                         Allocated to registers r4 
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:54: void Display_setDigit(__xdata char digit, __xdata uint8_t pos) {
;	-----------------------------------------
;	 function Display_setDigit
;	-----------------------------------------
_Display_setDigit:
	mov	a,dpl
	mov	dptr,#_Display_setDigit_digit_65536_108
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:56: display_buffer[pos] = DisplayChars[0][0];
	mov	dptr,#_Display_setDigit_PARM_2
	movx	a,@dptr
	add	a,#_display_buffer
	mov	r6,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	r7,a
	mov	dptr,#_DisplayChars
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:58: for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
	mov	dptr,#_Display_setDigit_digit_65536_108
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
00105$:
	cjne	r4,#0x19,00122$
00122$:
	jnc	00107$
;	App/components/sevenSegmentDisplay.c:60: if (DisplayChars[b][1] == digit)
	mov	a,r4
	mov	b,#0x02
	mul	ab
	mov	r2,a
	mov	r3,b
	add	a,#_DisplayChars
	mov	r0,a
	mov	a,r3
	addc	a,#(_DisplayChars >> 8)
	mov	r1,a
	mov	dpl,r0
	mov	dph,r1
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	cjne	a,ar5,00106$
;	App/components/sevenSegmentDisplay.c:61: display_buffer[pos] = DisplayChars[b][0];
	mov	a,r2
	add	a,#_DisplayChars
	mov	dpl,a
	mov	a,r3
	addc	a,#(_DisplayChars >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
00106$:
;	App/components/sevenSegmentDisplay.c:58: for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
	inc	r4
	sjmp	00105$
00107$:
;	App/components/sevenSegmentDisplay.c:63: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_toggleOff'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:65: void Display_toggleOff() {
;	-----------------------------------------
;	 function Display_toggleOff
;	-----------------------------------------
_Display_toggleOff:
;	App/components/sevenSegmentDisplay.c:66: digitalWrite(DIGIT_1_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:67: digitalWrite(DIGIT_2_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:68: digitalWrite(DIGIT_3_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
;	App/components/sevenSegmentDisplay.c:69: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_toggleOn'
;------------------------------------------------------------
;pin                       Allocated with name '_Display_toggleOn_pin_65536_113'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:71: void Display_toggleOn(__xdata uint8_t pin) {
;	-----------------------------------------
;	 function Display_toggleOn
;	-----------------------------------------
_Display_toggleOn:
	mov	a,dpl
	mov	dptr,#_Display_toggleOn_pin_65536_113
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:73: if (pin == DIGIT_2_PIN) {
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x1e,00104$
;	App/components/sevenSegmentDisplay.c:74: digitalWrite(DIGIT_1_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:75: digitalWrite(DIGIT_2_PIN, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:76: digitalWrite(DIGIT_3_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
	sjmp	00105$
00104$:
;	App/components/sevenSegmentDisplay.c:78: } else if (pin == DIGIT_1_PIN) {
	cjne	r7,#0x1f,00105$
;	App/components/sevenSegmentDisplay.c:79: digitalWrite(DIGIT_1_PIN, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:80: digitalWrite(DIGIT_2_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:81: digitalWrite(DIGIT_3_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
00105$:
;	App/components/sevenSegmentDisplay.c:83: } if (pin == DIGIT_3_PIN) {
	mov	dptr,#_Display_toggleOn_pin_65536_113
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x22,00107$
;	App/components/sevenSegmentDisplay.c:84: digitalWrite(DIGIT_1_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:85: digitalWrite(DIGIT_2_PIN, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/components/sevenSegmentDisplay.c:86: digitalWrite(DIGIT_3_PIN, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
00107$:
;	App/components/sevenSegmentDisplay.c:89: mDelaymS(1);
	mov	dptr,#0x0001
;	App/components/sevenSegmentDisplay.c:90: }
	ljmp	_mDelaymS
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_select'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:92: void Display_select()
;	-----------------------------------------
;	 function Display_select
;	-----------------------------------------
_Display_select:
;	App/components/sevenSegmentDisplay.c:94: digitalWrite(DISPLAY_CS, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x21
;	App/components/sevenSegmentDisplay.c:95: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_unselect'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:97: void Display_unselect()
;	-----------------------------------------
;	 function Display_unselect
;	-----------------------------------------
_Display_unselect:
;	App/components/sevenSegmentDisplay.c:99: digitalWrite(DISPLAY_CS, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x21
;	App/components/sevenSegmentDisplay.c:100: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_update'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:102: void Display_update() {
;	-----------------------------------------
;	 function Display_update
;	-----------------------------------------
_Display_update:
;	App/components/sevenSegmentDisplay.c:104: Display_toggleOff();    
	lcall	_Display_toggleOff
;	App/components/sevenSegmentDisplay.c:105: Display_select();
	lcall	_Display_select
;	App/components/sevenSegmentDisplay.c:106: CH554SPIMasterWrite(display_buffer[0]);
	mov	dptr,#_display_buffer
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/components/sevenSegmentDisplay.c:107: Display_unselect();    
	lcall	_Display_unselect
;	App/components/sevenSegmentDisplay.c:108: Display_toggleOn(DIGIT_1_PIN);
	mov	dpl,#0x1f
	lcall	_Display_toggleOn
;	App/components/sevenSegmentDisplay.c:110: Display_toggleOff();    
	lcall	_Display_toggleOff
;	App/components/sevenSegmentDisplay.c:111: Display_select();
	lcall	_Display_select
;	App/components/sevenSegmentDisplay.c:112: CH554SPIMasterWrite(display_buffer[1]);
	mov	dptr,#(_display_buffer + 0x0001)
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/components/sevenSegmentDisplay.c:113: Display_unselect();
	lcall	_Display_unselect
;	App/components/sevenSegmentDisplay.c:114: Display_toggleOn(DIGIT_2_PIN);
	mov	dpl,#0x1e
	lcall	_Display_toggleOn
;	App/components/sevenSegmentDisplay.c:116: Display_toggleOff();
	lcall	_Display_toggleOff
;	App/components/sevenSegmentDisplay.c:118: display_buffer[2] |= ledState << 7;
	mov	dptr,#(_display_buffer + 0x0002)
	movx	a,@dptr
	mov	r7,a
	mov	a,_ledState
	rr	a
	anl	a,#0x80
	mov	r6,a
	mov	a,r7
	orl	ar6,a
	mov	dptr,#(_display_buffer + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:119: Display_select();
	lcall	_Display_select
;	App/components/sevenSegmentDisplay.c:120: CH554SPIMasterWrite(display_buffer[2]);
	mov	dptr,#(_display_buffer + 0x0002)
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/components/sevenSegmentDisplay.c:121: Display_unselect();
	lcall	_Display_unselect
;	App/components/sevenSegmentDisplay.c:124: Display_toggleOn(DIGIT_3_PIN);
	mov	dpl,#0x22
;	App/components/sevenSegmentDisplay.c:128: }
	ljmp	_Display_toggleOn
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_clear'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:130: void Display_clear() {
;	-----------------------------------------
;	 function Display_clear
;	-----------------------------------------
_Display_clear:
;	App/components/sevenSegmentDisplay.c:131: display_buffer[0] = 0;
	mov	dptr,#_display_buffer
	clr	a
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:132: display_buffer[1] = 0;
	mov	dptr,#(_display_buffer + 0x0001)
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:133: display_buffer[2] = 0;
	mov	dptr,#(_display_buffer + 0x0002)
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:134: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_printNumber'
;------------------------------------------------------------
;number                    Allocated to registers r6 r7 
;numchar                   Allocated with name '_Display_printNumber_numchar_65536_123'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:136: void Display_printNumber(int number) {
;	-----------------------------------------
;	 function Display_printNumber
;	-----------------------------------------
_Display_printNumber:
	mov	r6,dpl
	mov	r7,dph
;	App/components/sevenSegmentDisplay.c:139: sprintf(numchar, "%d", number);
	push	ar7
	push	ar6
	push	ar6
	push	ar7
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_Display_printNumber_numchar_65536_123
	push	acc
	mov	a,#(_Display_printNumber_numchar_65536_123 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	pop	ar6
	pop	ar7
;	App/components/sevenSegmentDisplay.c:141: if (number < 10) {
	clr	c
	mov	a,r6
	subb	a,#0x0a
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00108$
;	App/components/sevenSegmentDisplay.c:142: Display_setDigit(number, 2);
	mov	ar5,r6
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,r5
	ljmp	_Display_setDigit
00108$:
;	App/components/sevenSegmentDisplay.c:143: } else if (number < 100) {
	clr	c
	mov	a,r6
	subb	a,#0x64
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
;	App/components/sevenSegmentDisplay.c:144: Display_setDigit(numchar[1], 2);
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,(_Display_printNumber_numchar_65536_123 + 0x0001)
	lcall	_Display_setDigit
;	App/components/sevenSegmentDisplay.c:145: Display_setDigit(numchar[0], 1);
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,_Display_printNumber_numchar_65536_123
	ljmp	_Display_setDigit
00105$:
;	App/components/sevenSegmentDisplay.c:146: } else if (number < 1000) {
	clr	c
	mov	a,r6
	subb	a,#0xe8
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x83
	jnc	00102$
;	App/components/sevenSegmentDisplay.c:147: Display_setDigit(numchar[2], 2);
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,(_Display_printNumber_numchar_65536_123 + 0x0002)
	lcall	_Display_setDigit
;	App/components/sevenSegmentDisplay.c:148: Display_setDigit(numchar[1], 1);
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,(_Display_printNumber_numchar_65536_123 + 0x0001)
	lcall	_Display_setDigit
;	App/components/sevenSegmentDisplay.c:149: Display_setDigit(numchar[0], 0);
	mov	dptr,#_Display_setDigit_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,_Display_printNumber_numchar_65536_123
	ljmp	_Display_setDigit
00102$:
;	App/components/sevenSegmentDisplay.c:151: Display_clear();
;	App/components/sevenSegmentDisplay.c:153: }
	ljmp	_Display_clear
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_marquee'
;------------------------------------------------------------
;currentPos                Allocated with name '_Display_marquee_PARM_3'
;text                      Allocated with name '_Display_marquee_text_65536_128'
;size                      Allocated with name '_Display_marquee_PARM_2'
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:156: void Display_marquee(const char* text, __xdata uint8_t size, uint8_t* currentPos)
;	-----------------------------------------
;	 function Display_marquee
;	-----------------------------------------
_Display_marquee:
	mov	_Display_marquee_text_65536_128,dpl
	mov	(_Display_marquee_text_65536_128 + 1),dph
	mov	(_Display_marquee_text_65536_128 + 2),b
;	App/components/sevenSegmentDisplay.c:158: if ((*currentPos) >= size)
	mov	r2,_Display_marquee_PARM_3
	mov	r3,(_Display_marquee_PARM_3 + 1)
	mov	r4,(_Display_marquee_PARM_3 + 2)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	mov	dptr,#_Display_marquee_PARM_2
	movx	a,@dptr
	mov	r0,a
	clr	c
	mov	a,r1
	subb	a,r0
	jc	00102$
;	App/components/sevenSegmentDisplay.c:159: (*currentPos) = 0;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	clr	a
	lcall	__gptrput
00102$:
;	App/components/sevenSegmentDisplay.c:161: Display_setDigit(text[(*currentPos)], 0);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	add	a,_Display_marquee_text_65536_128
	mov	r1,a
	clr	a
	addc	a,(_Display_marquee_text_65536_128 + 1)
	mov	r6,a
	mov	r7,(_Display_marquee_text_65536_128 + 2)
	mov	dpl,r1
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	dptr,#_Display_setDigit_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r1
	push	ar4
	push	ar3
	push	ar2
	push	ar0
	lcall	_Display_setDigit
	pop	ar0
	pop	ar2
	pop	ar3
	pop	ar4
;	App/components/sevenSegmentDisplay.c:162: Display_setDigit(((*currentPos)+1) < size ? text[(*currentPos)+1] : ' ', 1);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	mov	r6,#0x00
	inc	r7
	cjne	r7,#0x00,00122$
	inc	r6
00122$:
	mov	r5,#0x00
	clr	c
	mov	a,r7
	subb	a,r0
	mov	a,r6
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	00105$
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	mov	r6,#0x00
	inc	r7
	cjne	r7,#0x00,00124$
	inc	r6
00124$:
	mov	a,r7
	add	a,_Display_marquee_text_65536_128
	mov	r1,a
	mov	a,r6
	addc	a,(_Display_marquee_text_65536_128 + 1)
	mov	r6,a
	mov	r7,(_Display_marquee_text_65536_128 + 2)
	mov	dpl,r1
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r1,a
	mov	r7,#0x00
	sjmp	00106$
00105$:
	mov	r1,#0x20
	mov	r7,#0x00
00106$:
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,r1
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar0
	lcall	_Display_setDigit
	pop	ar0
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
;	App/components/sevenSegmentDisplay.c:163: Display_setDigit(((*currentPos)+2) < size ? text[(*currentPos)+2] : ' ', 2);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x02
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	clr	c
	mov	a,r7
	subb	a,r0
	mov	a,r6
	xrl	a,#0x80
	mov	b,r5
	xrl	b,#0x80
	subb	a,b
	jnc	00107$
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	mov	r6,#0x00
	mov	a,#0x02
	add	a,r7
	mov	r7,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	a,r7
	add	a,_Display_marquee_text_65536_128
	mov	r7,a
	mov	a,r6
	addc	a,(_Display_marquee_text_65536_128 + 1)
	mov	r6,a
	mov	r5,(_Display_marquee_text_65536_128 + 2)
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	lcall	__gptrget
	mov	r6,a
	mov	r7,#0x00
	sjmp	00108$
00107$:
	mov	r6,#0x20
	mov	r7,#0x00
00108$:
	mov	dptr,#_Display_setDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,r6
	push	ar4
	push	ar3
	push	ar2
	lcall	_Display_setDigit
	pop	ar2
	pop	ar3
	pop	ar4
;	App/components/sevenSegmentDisplay.c:165: (*currentPos)++;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r7,a
	inc	r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r7
;	App/components/sevenSegmentDisplay.c:167: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_loading'
;------------------------------------------------------------
;currentPos                Allocated to registers r5 r6 r7 
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:169: void Display_loading(uint8_t* currentPos) {
;	-----------------------------------------
;	 function Display_loading
;	-----------------------------------------
_Display_loading:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	App/components/sevenSegmentDisplay.c:171: Display_clear();
	push	ar7
	push	ar6
	push	ar5
	lcall	_Display_clear
	pop	ar5
	pop	ar6
	pop	ar7
;	App/components/sevenSegmentDisplay.c:173: switch ((*currentPos))
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov  r4,a
	add	a,#0xff - 0x09
	jnc	00119$
	ljmp	00111$
00119$:
	mov	a,r4
	add	a,#(00120$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r4
	add	a,#(00121$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00120$:
	.db	00103$
	.db	00103$
	.db	00103$
	.db	00105$
	.db	00105$
	.db	00108$
	.db	00108$
	.db	00108$
	.db	00110$
	.db	00110$
00121$:
	.db	00103$>>8
	.db	00103$>>8
	.db	00103$>>8
	.db	00105$>>8
	.db	00105$>>8
	.db	00108$>>8
	.db	00108$>>8
	.db	00108$>>8
	.db	00110$>>8
	.db	00110$>>8
;	App/components/sevenSegmentDisplay.c:177: case 2:
00103$:
;	App/components/sevenSegmentDisplay.c:178: display_buffer[(*currentPos)] = 0b00000001;
	mov	a,r4
	add	a,#_display_buffer
	mov	dpl,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x01
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:179: break;
;	App/components/sevenSegmentDisplay.c:181: case 4:
	sjmp	00112$
00105$:
;	App/components/sevenSegmentDisplay.c:182: display_buffer[2] = (0 | 1 << 1 + ((*currentPos)-3));
	mov	ar3,r4
	mov	a,#0xfe
	add	a,r3
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00124$
00122$:
	add	a,acc
00124$:
	djnz	b,00122$
	mov	r3,a
	mov	dptr,#(_display_buffer + 0x0002)
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:183: break;            
;	App/components/sevenSegmentDisplay.c:186: case 7:
	sjmp	00112$
00108$:
;	App/components/sevenSegmentDisplay.c:187: display_buffer[(((*currentPos)-5)*-1)+2] = 0b00001000;
	mov	ar3,r4
	mov	a,r3
	add	a,#0xfb
	mov	r3,a
	clr	c
	clr	a
	subb	a,r3
	mov	r3,a
	inc	r3
	inc	r3
	mov	a,r3
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r3
	add	a,#_display_buffer
	mov	dpl,a
	mov	a,r2
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x08
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:191: break;
;	App/components/sevenSegmentDisplay.c:193: case 9:
	sjmp	00112$
00110$:
;	App/components/sevenSegmentDisplay.c:194: display_buffer[0] = (0 | 1 << 4 + ((*currentPos)-8));
	mov	a,#0xfc
	add	a,r4
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00127$
00125$:
	add	a,acc
00127$:
	djnz	b,00125$
	mov	r4,a
	mov	dptr,#_display_buffer
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:195: break;
;	App/components/sevenSegmentDisplay.c:196: default:
	sjmp	00112$
00111$:
;	App/components/sevenSegmentDisplay.c:197: (*currentPos) = 0;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
;	App/components/sevenSegmentDisplay.c:198: display_buffer[(*currentPos)] = 0b00000001;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	add	a,#_display_buffer
	mov	dpl,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x01
	movx	@dptr,a
;	App/components/sevenSegmentDisplay.c:200: }
00112$:
;	App/components/sevenSegmentDisplay.c:203: (*currentPos)++;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	r4
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	mov	a,r4
;	App/components/sevenSegmentDisplay.c:204: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'Display_toggleLed'
;------------------------------------------------------------
;state                     Allocated to registers 
;------------------------------------------------------------
;	App/components/sevenSegmentDisplay.c:207: void Display_toggleLed(bool state)
;	-----------------------------------------
;	 function Display_toggleLed
;	-----------------------------------------
_Display_toggleLed:
	mov	_ledState,dpl
;	App/components/sevenSegmentDisplay.c:209: ledState = state;
;	App/components/sevenSegmentDisplay.c:210: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "%d"
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
__xinit__display_buffer:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__DisplayChars:
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x31	; 49	'1'
	.db #0x5b	; 91
	.db #0x32	; 50	'2'
	.db #0x4f	; 79	'O'
	.db #0x33	; 51	'3'
	.db #0x66	; 102	'f'
	.db #0x34	; 52	'4'
	.db #0x6d	; 109	'm'
	.db #0x35	; 53	'5'
	.db #0x7d	; 125
	.db #0x36	; 54	'6'
	.db #0x07	; 7
	.db #0x37	; 55	'7'
	.db #0x7f	; 127
	.db #0x38	; 56	'8'
	.db #0x6f	; 111	'o'
	.db #0x39	; 57	'9'
	.db #0x77	; 119	'w'
	.db #0x41	; 65	'A'
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x39	; 57	'9'
	.db #0x43	; 67	'C'
	.db #0x5e	; 94
	.db #0x44	; 68	'D'
	.db #0x79	; 121	'y'
	.db #0x45	; 69	'E'
	.db #0x71	; 113	'q'
	.db #0x46	; 70	'F'
	.db #0x73	; 115	's'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x69	; 105	'i'
	.db #0x54	; 84	'T'
	.db #0x6e	; 110	'n'
	.db #0x58	; 88	'X'
	.db #0x63	; 99	'c'
	.db #0x74	; 116	't'
	.db #0x68	; 104	'h'
	.db #0x40	; 64
	.db #0x2d	; 45
	.db #0x01	; 1
	.db #0x5e	; 94
	.db #0x08	; 8
	.db #0x5f	; 95
	.area CABS    (ABS,CODE)
