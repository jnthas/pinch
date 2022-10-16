;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module test_display
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _testReadBytes
	.globl _testReadDeviceId
	.globl _countTo1000
	.globl _loading
	.globl _marquee
	.globl _printNum
	.globl _clearDisplay
	.globl _updateDisplay
	.globl _chipUnselect
	.globl _chipSelect
	.globl _switchOn
	.globl _switchOff
	.globl _DeviceUSBInterrupt
	.globl _USBInterrupt
	.globl _printDigit
	.globl _millis
	.globl _readBytes
	.globl _SPISetup
	.globl _readDeviceId
	.globl _CH554SPIMasterWrite
	.globl _analogRead
	.globl _digitalWrite
	.globl _p3Mode
	.globl _p1Mode
	.globl _printNumbers
	.globl _printText
	.globl _USBInit
	.globl _mDelaymS
	.globl _CfgFsys
	.globl _sprintf
	.globl _DCS
	.globl _LED
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
	.globl _Char
	.globl _lastMillis
	.globl _display_buffer
	.globl _marquee_PARM_4
	.globl _marquee_PARM_2
	.globl _printDigit_PARM_2
	.globl _marquee_PARM_3
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
_LED	=	0x00b0
_DCS	=	0x0094
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_printNum_numchar_65536_162:
	.ds 3
_marquee_PARM_3:
	.ds 3
_marquee_text_65536_167:
	.ds 3
_loading_curpos_65536_170:
	.ds 3
_countTo1000_curpos_65536_174:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

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
__sbuffer:
	.ds 32
_printDigit_PARM_2:
	.ds 1
_printDigit_digit_65536_144:
	.ds 1
_switchOn_pin_65536_152:
	.ds 1
_marquee_PARM_2:
	.ds 1
_marquee_PARM_4:
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_UNIQUEID:
	.ds 8
_display_buffer::
	.ds 3
_lastMillis::
	.ds 4
_Char::
	.ds 48
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
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_DeviceUSBInterrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'millis'
;------------------------------------------------------------
;	App/test_display.c:61: uint32_t millis()
;	-----------------------------------------
;	 function millis
;	-----------------------------------------
_millis:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	App/test_display.c:64: return 0;
	mov	dptr,#(0x00&0x00ff)
	clr	a
	mov	b,a
;	App/test_display.c:66: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'printDigit'
;------------------------------------------------------------
;pos                       Allocated with name '_printDigit_PARM_2'
;digit                     Allocated with name '_printDigit_digit_65536_144'
;b                         Allocated to registers r4 
;------------------------------------------------------------
;	App/test_display.c:69: void printDigit(__xdata char digit, __xdata uint8_t pos) {
;	-----------------------------------------
;	 function printDigit
;	-----------------------------------------
_printDigit:
	mov	a,dpl
	mov	dptr,#_printDigit_digit_65536_144
	movx	@dptr,a
;	App/test_display.c:71: display_buffer[pos] = Char[0][0];
	mov	dptr,#_printDigit_PARM_2
	movx	a,@dptr
	add	a,#_display_buffer
	mov	r6,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	r7,a
	mov	dptr,#_Char
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
;	App/test_display.c:73: for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
	mov	dptr,#_printDigit_digit_65536_144
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
00105$:
	cjne	r4,#0x18,00122$
00122$:
	jnc	00107$
;	App/test_display.c:75: if (Char[b][1] == digit)
	mov	a,r4
	mov	b,#0x02
	mul	ab
	mov	r2,a
	mov	r3,b
	add	a,#_Char
	mov	r0,a
	mov	a,r3
	addc	a,#(_Char >> 8)
	mov	r1,a
	mov	dpl,r0
	mov	dph,r1
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	cjne	a,ar5,00106$
;	App/test_display.c:76: display_buffer[pos] = Char[b][0];
	mov	a,r2
	add	a,#_Char
	mov	dpl,a
	mov	a,r3
	addc	a,#(_Char >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r6
	mov	dph,r7
	movx	@dptr,a
00106$:
;	App/test_display.c:73: for (uint8_t b = 0; b<CHAR_ARR_SIZE; b++) 
	inc	r4
	sjmp	00105$
00107$:
;	App/test_display.c:78: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'DeviceUSBInterrupt'
;------------------------------------------------------------
;	App/test_display.c:84: void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
;	-----------------------------------------
;	 function DeviceUSBInterrupt
;	-----------------------------------------
_DeviceUSBInterrupt:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	App/test_display.c:86: USBInterrupt();
	lcall	_USBInterrupt
;	App/test_display.c:87: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'switchOff'
;------------------------------------------------------------
;	App/test_display.c:91: void switchOff() {
;	-----------------------------------------
;	 function switchOff
;	-----------------------------------------
_switchOff:
;	App/test_display.c:92: digitalWrite(31, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/test_display.c:93: digitalWrite(30, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/test_display.c:94: digitalWrite(34, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
;	App/test_display.c:95: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'switchOn'
;------------------------------------------------------------
;pin                       Allocated with name '_switchOn_pin_65536_152'
;------------------------------------------------------------
;	App/test_display.c:97: void switchOn(__xdata uint8_t pin) {
;	-----------------------------------------
;	 function switchOn
;	-----------------------------------------
_switchOn:
	mov	a,dpl
	mov	dptr,#_switchOn_pin_65536_152
	movx	@dptr,a
;	App/test_display.c:99: if (pin == 30) {
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x1e,00104$
;	App/test_display.c:100: digitalWrite(31, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/test_display.c:101: digitalWrite(30, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/test_display.c:102: digitalWrite(34, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
	sjmp	00105$
00104$:
;	App/test_display.c:103: } else if (pin == 31) {
	cjne	r7,#0x1f,00105$
;	App/test_display.c:104: digitalWrite(31, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/test_display.c:105: digitalWrite(30, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/test_display.c:106: digitalWrite(34, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
00105$:
;	App/test_display.c:108: } if (pin == 34) {
	mov	dptr,#_switchOn_pin_65536_152
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x22,00107$
;	App/test_display.c:109: digitalWrite(31, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1f
	lcall	_digitalWrite
;	App/test_display.c:110: digitalWrite(30, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x1e
	lcall	_digitalWrite
;	App/test_display.c:111: digitalWrite(34, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x22
	lcall	_digitalWrite
00107$:
;	App/test_display.c:114: mDelaymS(1);
	mov	dptr,#0x0001
;	App/test_display.c:115: }
	ljmp	_mDelaymS
;------------------------------------------------------------
;Allocation info for local variables in function 'chipSelect'
;------------------------------------------------------------
;	App/test_display.c:117: void chipSelect()
;	-----------------------------------------
;	 function chipSelect
;	-----------------------------------------
_chipSelect:
;	App/test_display.c:119: digitalWrite(33, LOW);
	mov	dptr,#_digitalWrite_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x21
;	App/test_display.c:120: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'chipUnselect'
;------------------------------------------------------------
;	App/test_display.c:122: void chipUnselect()
;	-----------------------------------------
;	 function chipUnselect
;	-----------------------------------------
_chipUnselect:
;	App/test_display.c:124: digitalWrite(33, HIGH);
	mov	dptr,#_digitalWrite_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x21
;	App/test_display.c:125: }
	ljmp	_digitalWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'updateDisplay'
;------------------------------------------------------------
;	App/test_display.c:127: void updateDisplay() {
;	-----------------------------------------
;	 function updateDisplay
;	-----------------------------------------
_updateDisplay:
;	App/test_display.c:129: switchOff();    
	lcall	_switchOff
;	App/test_display.c:130: chipSelect();
	lcall	_chipSelect
;	App/test_display.c:131: CH554SPIMasterWrite(display_buffer[0]);
	mov	dptr,#_display_buffer
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/test_display.c:132: chipUnselect();    
	lcall	_chipUnselect
;	App/test_display.c:133: switchOn(31);
	mov	dpl,#0x1f
	lcall	_switchOn
;	App/test_display.c:135: switchOff();    
	lcall	_switchOff
;	App/test_display.c:136: chipSelect();
	lcall	_chipSelect
;	App/test_display.c:137: CH554SPIMasterWrite(display_buffer[1]);
	mov	dptr,#(_display_buffer + 0x0001)
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/test_display.c:138: chipUnselect();
	lcall	_chipUnselect
;	App/test_display.c:139: switchOn(30);
	mov	dpl,#0x1e
	lcall	_switchOn
;	App/test_display.c:141: switchOff();    
	lcall	_switchOff
;	App/test_display.c:142: chipSelect();
	lcall	_chipSelect
;	App/test_display.c:143: CH554SPIMasterWrite(display_buffer[2]);
	mov	dptr,#(_display_buffer + 0x0002)
	movx	a,@dptr
	mov	dpl,a
	lcall	_CH554SPIMasterWrite
;	App/test_display.c:144: chipUnselect();
	lcall	_chipUnselect
;	App/test_display.c:145: switchOn(34);   
	mov	dpl,#0x22
;	App/test_display.c:147: }
	ljmp	_switchOn
;------------------------------------------------------------
;Allocation info for local variables in function 'clearDisplay'
;------------------------------------------------------------
;	App/test_display.c:149: void clearDisplay() {
;	-----------------------------------------
;	 function clearDisplay
;	-----------------------------------------
_clearDisplay:
;	App/test_display.c:150: display_buffer[0] = 0;
	mov	dptr,#_display_buffer
	clr	a
	movx	@dptr,a
;	App/test_display.c:151: display_buffer[1] = 0;
	mov	dptr,#(_display_buffer + 0x0001)
	movx	@dptr,a
;	App/test_display.c:152: display_buffer[2] = 0;
	mov	dptr,#(_display_buffer + 0x0002)
	movx	@dptr,a
;	App/test_display.c:153: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'printNum'
;------------------------------------------------------------
;number                    Allocated to registers r6 r7 
;numchar                   Allocated with name '_printNum_numchar_65536_162'
;------------------------------------------------------------
;	App/test_display.c:156: void printNum(int number) {
;	-----------------------------------------
;	 function printNum
;	-----------------------------------------
_printNum:
	mov	r6,dpl
	mov	r7,dph
;	App/test_display.c:160: sprintf(numchar, "%d", number);
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
	mov	a,#_printNum_numchar_65536_162
	push	acc
	mov	a,#(_printNum_numchar_65536_162 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf8
	mov	sp,a
	pop	ar6
	pop	ar7
;	App/test_display.c:162: if (number < 10) {
	clr	c
	mov	a,r6
	subb	a,#0x0a
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00108$
;	App/test_display.c:163: printDigit(number, 2);
	mov	ar5,r6
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,r5
	ljmp	_printDigit
00108$:
;	App/test_display.c:164: } else if (number < 100) {
	clr	c
	mov	a,r6
	subb	a,#0x64
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
;	App/test_display.c:165: printDigit(numchar[1], 2);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,(_printNum_numchar_65536_162 + 0x0001)
	lcall	_printDigit
;	App/test_display.c:166: printDigit(numchar[0], 1);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,_printNum_numchar_65536_162
	ljmp	_printDigit
00105$:
;	App/test_display.c:167: } else if (number < 1000) {
	clr	c
	mov	a,r6
	subb	a,#0xe8
	mov	a,r7
	xrl	a,#0x80
	subb	a,#0x83
	jnc	00102$
;	App/test_display.c:168: printDigit(numchar[2], 2);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,(_printNum_numchar_65536_162 + 0x0002)
	lcall	_printDigit
;	App/test_display.c:169: printDigit(numchar[1], 1);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,(_printNum_numchar_65536_162 + 0x0001)
	lcall	_printDigit
;	App/test_display.c:170: printDigit(numchar[0], 0);
	mov	dptr,#_printDigit_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,_printNum_numchar_65536_162
	ljmp	_printDigit
00102$:
;	App/test_display.c:172: clearDisplay();        
;	App/test_display.c:174: }
	ljmp	_clearDisplay
;------------------------------------------------------------
;Allocation info for local variables in function 'marquee'
;------------------------------------------------------------
;curpos                    Allocated with name '_marquee_PARM_3'
;text                      Allocated with name '_marquee_text_65536_167'
;size                      Allocated with name '_marquee_PARM_2'
;delay                     Allocated with name '_marquee_PARM_4'
;------------------------------------------------------------
;	App/test_display.c:177: void marquee(const char* text, __xdata uint8_t size, uint8_t* curpos, __xdata int delay) 
;	-----------------------------------------
;	 function marquee
;	-----------------------------------------
_marquee:
	mov	_marquee_text_65536_167,dpl
	mov	(_marquee_text_65536_167 + 1),dph
	mov	(_marquee_text_65536_167 + 2),b
;	App/test_display.c:179: if (lastMillis - millis() >= delay)
	lcall	_millis
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	dptr,#_lastMillis
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r0
	clr	c
	subb	a,r1
	mov	r1,a
	mov	a,r5
	subb	a,r2
	mov	r2,a
	mov	a,r6
	subb	a,r3
	mov	r3,a
	mov	a,r7
	subb	a,r4
	mov	r4,a
	mov	dptr,#_marquee_PARM_4
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	ar0,r6
	mov	a,r7
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	r7,a
	clr	c
	mov	a,r1
	subb	a,r0
	mov	a,r2
	subb	a,r5
	mov	a,r3
	subb	a,r6
	mov	a,r4
	subb	a,r7
	jnc	00127$
	ret
00127$:
;	App/test_display.c:181: if ((*curpos) >= size) 
	mov	r5,_marquee_PARM_3
	mov	r6,(_marquee_PARM_3 + 1)
	mov	r7,(_marquee_PARM_3 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	dptr,#_marquee_PARM_2
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r4
	subb	a,r3
	jc	00102$
;	App/test_display.c:182: (*curpos) = 0;
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	clr	a
	lcall	__gptrput
00102$:
;	App/test_display.c:184: printDigit(text[(*curpos)], 0);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	add	a,_marquee_text_65536_167
	mov	r1,a
	clr	a
	addc	a,(_marquee_text_65536_167 + 1)
	mov	r2,a
	mov	r4,(_marquee_text_65536_167 + 2)
	mov	dpl,r1
	mov	dph,r2
	mov	b,r4
	lcall	__gptrget
	mov	r1,a
	mov	dptr,#_printDigit_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,r1
	push	ar7
	push	ar6
	push	ar5
	push	ar3
	lcall	_printDigit
	pop	ar3
	pop	ar5
	pop	ar6
	pop	ar7
;	App/test_display.c:185: printDigit(((*curpos)+1) < size ? text[(*curpos)+1] : ' ', 1);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	r2,#0x00
	inc	r4
	cjne	r4,#0x00,00129$
	inc	r2
00129$:
	mov	ar1,r3
	mov	r3,#0x00
	clr	c
	mov	a,r4
	subb	a,r1
	mov	a,r2
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	00107$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	r2,#0x00
	inc	r4
	cjne	r4,#0x00,00131$
	inc	r2
00131$:
	mov	a,r4
	add	a,_marquee_text_65536_167
	mov	r0,a
	mov	a,r2
	addc	a,(_marquee_text_65536_167 + 1)
	mov	r2,a
	mov	r4,(_marquee_text_65536_167 + 2)
	mov	dpl,r0
	mov	dph,r2
	mov	b,r4
	lcall	__gptrget
	mov	r0,a
	mov	r4,#0x00
	sjmp	00108$
00107$:
	mov	r0,#0x20
	mov	r4,#0x00
00108$:
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,r0
	push	ar7
	push	ar6
	push	ar5
	push	ar3
	push	ar1
	lcall	_printDigit
	pop	ar1
	pop	ar3
	pop	ar5
	pop	ar6
	pop	ar7
;	App/test_display.c:186: printDigit(((*curpos)+2) < size ? text[(*curpos)+2] : ' ', 2);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	r2,#0x00
	mov	a,#0x02
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r2
	mov	r2,a
	clr	c
	mov	a,r4
	subb	a,r1
	mov	a,r2
	xrl	a,#0x80
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	00109$
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	mov	r3,#0x00
	mov	a,#0x02
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r3
	mov	r3,a
	mov	a,r4
	add	a,_marquee_text_65536_167
	mov	r4,a
	mov	a,r3
	addc	a,(_marquee_text_65536_167 + 1)
	mov	r3,a
	mov	r2,(_marquee_text_65536_167 + 2)
	mov	dpl,r4
	mov	dph,r3
	mov	b,r2
	lcall	__gptrget
	mov	r3,a
	mov	r4,#0x00
	sjmp	00110$
00109$:
	mov	r3,#0x20
	mov	r4,#0x00
00110$:
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,r3
	push	ar7
	push	ar6
	push	ar5
	lcall	_printDigit
	pop	ar5
	pop	ar6
	pop	ar7
;	App/test_display.c:188: lastMillis = 0;
	mov	dptr,#_lastMillis
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	App/test_display.c:189: (*curpos)++;
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
;	App/test_display.c:191: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'loading'
;------------------------------------------------------------
;curpos                    Allocated with name '_loading_curpos_65536_170'
;------------------------------------------------------------
;	App/test_display.c:193: void loading(uint8_t* curpos) {
;	-----------------------------------------
;	 function loading
;	-----------------------------------------
_loading:
	mov	_loading_curpos_65536_170,dpl
	mov	(_loading_curpos_65536_170 + 1),dph
	mov	(_loading_curpos_65536_170 + 2),b
;	App/test_display.c:195: if (lastMillis - millis() >= 75)
	lcall	_millis
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	dptr,#_lastMillis
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r0
	clr	c
	subb	a,r1
	mov	r1,a
	mov	a,r5
	subb	a,r2
	mov	r2,a
	mov	a,r6
	subb	a,r3
	mov	r3,a
	mov	a,r7
	subb	a,r4
	mov	r4,a
	clr	c
	mov	a,r1
	subb	a,#0x4b
	mov	a,r2
	subb	a,#0x00
	mov	a,r3
	subb	a,#0x00
	mov	a,r4
	subb	a,#0x00
	jnc	00125$
	ret
00125$:
;	App/test_display.c:197: clearDisplay();
	lcall	_clearDisplay
;	App/test_display.c:199: switch ((*curpos))
	mov	dpl,_loading_curpos_65536_170
	mov	dph,(_loading_curpos_65536_170 + 1)
	mov	b,(_loading_curpos_65536_170 + 2)
	lcall	__gptrget
	mov  r7,a
	add	a,#0xff - 0x09
	jnc	00126$
	ljmp	00111$
00126$:
	mov	a,r7
	add	a,#(00127$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r7
	add	a,#(00128$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00127$:
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
00128$:
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
;	App/test_display.c:203: case 2:
00103$:
;	App/test_display.c:204: display_buffer[(*curpos)] = 0b00000001;
	mov	a,r7
	add	a,#_display_buffer
	mov	dpl,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x01
	movx	@dptr,a
;	App/test_display.c:205: break;
;	App/test_display.c:207: case 4:
	sjmp	00112$
00105$:
;	App/test_display.c:208: display_buffer[2] = (0 | 1 << 1 + ((*curpos)-3));
	mov	ar6,r7
	mov	a,#0xfe
	add	a,r6
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00131$
00129$:
	add	a,acc
00131$:
	djnz	b,00129$
	mov	r6,a
	mov	dptr,#(_display_buffer + 0x0002)
	movx	@dptr,a
;	App/test_display.c:209: break;            
;	App/test_display.c:212: case 7:
	sjmp	00112$
00108$:
;	App/test_display.c:213: display_buffer[(((*curpos)-5)*-1)+2] = 0b00001000;
	mov	ar6,r7
	mov	a,r6
	add	a,#0xfb
	mov	r6,a
	clr	c
	clr	a
	subb	a,r6
	mov	r6,a
	inc	r6
	inc	r6
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r5,a
	mov	a,r6
	add	a,#_display_buffer
	mov	dpl,a
	mov	a,r5
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x08
	movx	@dptr,a
;	App/test_display.c:217: break;
;	App/test_display.c:219: case 9:
	sjmp	00112$
00110$:
;	App/test_display.c:220: display_buffer[0] = (0 | 1 << 4 + ((*curpos)-8));
	mov	a,#0xfc
	add	a,r7
	mov	b,a
	inc	b
	mov	a,#0x01
	sjmp	00134$
00132$:
	add	a,acc
00134$:
	djnz	b,00132$
	mov	r7,a
	mov	dptr,#_display_buffer
	movx	@dptr,a
;	App/test_display.c:221: break;
;	App/test_display.c:222: default:
	sjmp	00112$
00111$:
;	App/test_display.c:223: (*curpos) = 0;
	mov	dpl,_loading_curpos_65536_170
	mov	dph,(_loading_curpos_65536_170 + 1)
	mov	b,(_loading_curpos_65536_170 + 2)
	clr	a
	lcall	__gptrput
;	App/test_display.c:224: display_buffer[(*curpos)] = 0b00000001;
	mov	dpl,_loading_curpos_65536_170
	mov	dph,(_loading_curpos_65536_170 + 1)
	mov	b,(_loading_curpos_65536_170 + 2)
	lcall	__gptrget
	mov	r7,a
	add	a,#_display_buffer
	mov	dpl,a
	clr	a
	addc	a,#(_display_buffer >> 8)
	mov	dph,a
	mov	a,#0x01
	movx	@dptr,a
;	App/test_display.c:226: }
00112$:
;	App/test_display.c:229: lastMillis = 0;
	mov	dptr,#_lastMillis
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	App/test_display.c:230: (*curpos)++;
	mov	dpl,_loading_curpos_65536_170
	mov	dph,(_loading_curpos_65536_170 + 1)
	mov	b,(_loading_curpos_65536_170 + 2)
	lcall	__gptrget
	mov	r7,a
	inc	r7
	mov	dpl,_loading_curpos_65536_170
	mov	dph,(_loading_curpos_65536_170 + 1)
	mov	b,(_loading_curpos_65536_170 + 2)
	mov	a,r7
;	App/test_display.c:233: }
	ljmp	__gptrput
;------------------------------------------------------------
;Allocation info for local variables in function 'countTo1000'
;------------------------------------------------------------
;curpos                    Allocated with name '_countTo1000_curpos_65536_174'
;------------------------------------------------------------
;	App/test_display.c:236: void countTo1000(uint8_t* curpos) {
;	-----------------------------------------
;	 function countTo1000
;	-----------------------------------------
_countTo1000:
	mov	_countTo1000_curpos_65536_174,dpl
	mov	(_countTo1000_curpos_65536_174 + 1),dph
	mov	(_countTo1000_curpos_65536_174 + 2),b
;	App/test_display.c:237: if (lastMillis - millis() >= 50) {
	lcall	_millis
	mov	r1,dpl
	mov	r2,dph
	mov	r3,b
	mov	r4,a
	mov	dptr,#_lastMillis
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	a,r0
	clr	c
	subb	a,r1
	mov	r1,a
	mov	a,r5
	subb	a,r2
	mov	r2,a
	mov	a,r6
	subb	a,r3
	mov	r3,a
	mov	a,r7
	subb	a,r4
	mov	r4,a
	clr	c
	mov	a,r1
	subb	a,#0x32
	mov	a,r2
	subb	a,#0x00
	mov	a,r3
	subb	a,#0x00
	mov	a,r4
	subb	a,#0x00
	jc	00103$
;	App/test_display.c:238: printNum((*curpos)++);
	mov	dpl,_countTo1000_curpos_65536_174
	mov	dph,(_countTo1000_curpos_65536_174 + 1)
	mov	b,(_countTo1000_curpos_65536_174 + 2)
	lcall	__gptrget
	mov	r7,a
	inc	a
	mov	dpl,_countTo1000_curpos_65536_174
	mov	dph,(_countTo1000_curpos_65536_174 + 1)
	mov	b,(_countTo1000_curpos_65536_174 + 2)
	lcall	__gptrput
	mov	r6,#0x00
	mov	dpl,r7
	mov	dph,r6
	lcall	_printNum
;	App/test_display.c:239: lastMillis=0;
	mov	dptr,#_lastMillis
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00103$:
;	App/test_display.c:241: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadDeviceId'
;------------------------------------------------------------
;devId                     Allocated to registers r6 r7 
;------------------------------------------------------------
;	App/test_display.c:244: void testReadDeviceId() {
;	-----------------------------------------
;	 function testReadDeviceId
;	-----------------------------------------
_testReadDeviceId:
;	App/test_display.c:247: printText("Device Id:");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_printText
;	App/test_display.c:248: uint16_t devId = readDeviceId();
	lcall	_readDeviceId
	mov	r6,dpl
	mov	r7,dph
;	App/test_display.c:249: printNumbers(devId, HEX);
	mov	r5,#0x00
	mov	r4,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x10
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r5
	mov	a,r4
	lcall	_printNumbers
;	App/test_display.c:250: printText("\nEnd\n");
	mov	dptr,#___str_2
	mov	b,#0x80
;	App/test_display.c:251: }
	ljmp	_printText
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadBytes'
;------------------------------------------------------------
;j                         Allocated to registers r7 
;z                         Allocated to registers r6 
;------------------------------------------------------------
;	App/test_display.c:256: void testReadBytes() {
;	-----------------------------------------
;	 function testReadBytes
;	-----------------------------------------
_testReadBytes:
;	App/test_display.c:260: printText("Reading to array of bytes...");
	mov	dptr,#___str_3
	mov	b,#0x80
	lcall	_printText
;	App/test_display.c:262: for (uint8_t j=0; j<8; j++) {
	mov	r7,#0x00
00107$:
	cjne	r7,#0x08,00129$
00129$:
	jc	00130$
	ljmp	00102$
00130$:
;	App/test_display.c:264: printText("\nPage: ");    
	mov	dptr,#___str_4
	mov	b,#0x80
	push	ar7
	lcall	_printText
	pop	ar7
;	App/test_display.c:265: printNumbers(j, DEC);
	mov	ar3,r7
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r6
	push	ar7
	lcall	_printNumbers
;	App/test_display.c:266: printText("\n");
	mov	dptr,#___str_5
	mov	b,#0x80
	lcall	_printText
	pop	ar7
;	App/test_display.c:268: readBytes((j*256), _sbuffer, 31);
	mov	ar5,r7
	mov	ar6,r5
	mov	r5,#0x00
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r4,a
	mov	r3,a
	mov	_readBytes_PARM_2,#__sbuffer
	mov	(_readBytes_PARM_2 + 1),#(__sbuffer >> 8)
;	1-genFromRTrack replaced	mov	(_readBytes_PARM_2 + 2),#0x00
	mov	(_readBytes_PARM_2 + 2),r5
	mov	_readBytes_PARM_3,#0x1f
;	1-genFromRTrack replaced	mov	(_readBytes_PARM_3 + 1),#0x00
	mov	(_readBytes_PARM_3 + 1),r5
	mov	dpl,r5
	mov	dph,r6
	mov	b,r4
	mov	a,r3
	push	ar7
	lcall	_readBytes
	pop	ar7
;	App/test_display.c:270: for (uint8_t z=0; z<32; z++) {
	mov	r6,#0x00
00104$:
	cjne	r6,#0x20,00131$
00131$:
	jnc	00108$
;	App/test_display.c:271: printNumbers(_sbuffer[z], HEX);
	mov	a,r6
	add	a,#__sbuffer
	mov	dpl,a
	clr	a
	addc	a,#(__sbuffer >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	mov	r3,#0x00
	mov	r2,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x10
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	mov	b,r3
	mov	a,r2
	push	ar7
	push	ar6
	lcall	_printNumbers
;	App/test_display.c:272: printText(".");    
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_printText
	pop	ar6
	pop	ar7
;	App/test_display.c:270: for (uint8_t z=0; z<32; z++) {
	inc	r6
	sjmp	00104$
00108$:
;	App/test_display.c:262: for (uint8_t j=0; j<8; j++) {
	inc	r7
	ljmp	00107$
00102$:
;	App/test_display.c:275: printText("\n");
	mov	dptr,#___str_5
	mov	b,#0x80
;	App/test_display.c:276: }
	ljmp	_printText
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;m                         Allocated to registers 
;btn1                      Allocated to registers r7 
;btn2                      Allocated to registers r6 
;------------------------------------------------------------
;	App/test_display.c:284: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	App/test_display.c:286: CfgFsys(); 
	lcall	_CfgFsys
;	App/test_display.c:287: mDelaymS(10);
	mov	dptr,#0x000a
	lcall	_mDelaymS
;	App/test_display.c:289: USBInit();
	lcall	_USBInit
;	App/test_display.c:290: USBSerial();
	lcall	_USBSerial
;	App/test_display.c:291: SPISetup();
	lcall	_SPISetup
;	App/test_display.c:296: p3Mode(1, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_p3Mode
;	App/test_display.c:297: p3Mode(0, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x00
	lcall	_p3Mode
;	App/test_display.c:298: p3Mode(4, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x04
	lcall	_p3Mode
;	App/test_display.c:299: p3Mode(3, OUTPUT);
	mov	dptr,#_p3Mode_PARM_2
	mov	a,#0x01
	movx	@dptr,a
	mov	dpl,#0x03
	lcall	_p3Mode
;	App/test_display.c:300: p3Mode(2, INPUT);
	mov	dptr,#_p3Mode_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x02
	lcall	_p3Mode
;	App/test_display.c:303: p1Mode(1, INPUT);
	mov	dptr,#_p1Mode_PARM_2
	clr	a
	movx	@dptr,a
	mov	dpl,#0x01
	lcall	_p1Mode
;	App/test_display.c:306: mDelaymS(100);
	mov	dptr,#0x0064
	lcall	_mDelaymS
;	App/test_display.c:314: while(1) {
00116$:
;	App/test_display.c:320: if (lastMillis - millis() >= 100) {
	lcall	_millis
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	dptr,#_lastMillis
	movx	a,@dptr
	mov	r0,a
	inc	dptr
	movx	a,@dptr
	mov	r1,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,r0
	clr	c
	subb	a,r4
	mov	r4,a
	mov	a,r1
	subb	a,r5
	mov	r5,a
	mov	a,r2
	subb	a,r6
	mov	r6,a
	mov	a,r3
	subb	a,r7
	mov	r7,a
	clr	c
	mov	a,r4
	subb	a,#0x64
	mov	a,r5
	subb	a,#0x00
	mov	a,r6
	subb	a,#0x00
	mov	a,r7
	subb	a,#0x00
	jc	00114$
;	App/test_display.c:321: clearDisplay();
	lcall	_clearDisplay
;	App/test_display.c:323: btn1 = (analogRead(32) > 80);
	mov	dpl,#0x20
	lcall	_analogRead
	mov	r7,dpl
	clr	c
	mov	a,#0x50
	subb	a,r7
	clr	a
	rlc	a
	mov	r7,a
;	App/test_display.c:324: btn2 = (analogRead(11) > 80);
	mov	dpl,#0x0b
	push	ar7
	lcall	_analogRead
	mov	r6,dpl
	pop	ar7
	clr	c
	mov	a,#0x50
	subb	a,r6
	clr	a
	rlc	a
	mov	r6,a
;	App/test_display.c:327: if (btn1 && btn2)
	mov	a,r7
	jz	00110$
	mov	a,r6
	jz	00110$
;	App/test_display.c:328: printDigit('3', 2);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,#0x33
	lcall	_printDigit
	sjmp	00111$
00110$:
;	App/test_display.c:329: else if (!btn1 && btn2)
	mov	a,r7
	jnz	00106$
	mov	a,r6
	jz	00106$
;	App/test_display.c:330: testReadBytes();
	lcall	_testReadBytes
	sjmp	00111$
00106$:
;	App/test_display.c:331: else if (btn1 && !btn2)
	mov	a,r7
	jz	00102$
	mov	a,r6
	jnz	00102$
;	App/test_display.c:332: testReadDeviceId();
	lcall	_testReadDeviceId
	sjmp	00111$
00102$:
;	App/test_display.c:334: printDigit('0', 2);
	mov	dptr,#_printDigit_PARM_2
	mov	a,#0x02
	movx	@dptr,a
	mov	dpl,#0x30
	lcall	_printDigit
00111$:
;	App/test_display.c:337: lastMillis=0;
	mov	dptr,#_lastMillis
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
00114$:
;	App/test_display.c:342: updateDisplay();
	lcall	_updateDisplay
;	App/test_display.c:344: lastMillis+=4;
	mov	dptr,#_lastMillis
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_lastMillis
	mov	a,#0x04
	add	a,r4
	movx	@dptr,a
	clr	a
	addc	a,r5
	inc	dptr
	movx	@dptr,a
	clr	a
	addc	a,r6
	inc	dptr
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	App/test_display.c:349: }
	ljmp	00116$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "%d"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Device Id:"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.db 0x0a
	.ascii "End"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "Reading to array of bytes..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.db 0x0a
	.ascii "Page: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_6:
	.ascii "."
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
__xinit__UNIQUEID:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__display_buffer:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__lastMillis:
	.byte #0x00, #0x00, #0x00, #0x00	; 0
__xinit__Char:
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
	.area CABS    (ABS,CODE)
