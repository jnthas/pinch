;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module test_w25qxx
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _testChipErase
	.globl _testReadStatus
	.globl _testReadBytes
	.globl _testReadByte
	.globl _testReadUniqueId
	.globl _testReadDeviceId
	.globl _blink
	.globl _DeviceUSBInterrupt
	.globl _USBInterrupt
	.globl _chipErase
	.globl _readStatus
	.globl _readBytes
	.globl _readUniqueId
	.globl _SPISetup
	.globl _readDeviceId
	.globl _readByte
	.globl _printNumbers
	.globl _printText
	.globl _USBInit
	.globl _mDelaymS
	.globl _CfgFsys
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
_testReadByte_p_131072_149:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
;Allocation info for local variables in function 'DeviceUSBInterrupt'
;------------------------------------------------------------
;	App/test_w25qxx.c:19: void DeviceUSBInterrupt(void) __interrupt (INT_NO_USB)                       //USB interrupt service
;	-----------------------------------------
;	 function DeviceUSBInterrupt
;	-----------------------------------------
_DeviceUSBInterrupt:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
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
;	App/test_w25qxx.c:21: USBInterrupt();
	lcall	_USBInterrupt
;	App/test_w25qxx.c:22: }
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
;Allocation info for local variables in function 'blink'
;------------------------------------------------------------
;times                     Allocated to registers r7 
;i                         Allocated to registers r6 
;------------------------------------------------------------
;	App/test_w25qxx.c:24: void blink(uint8_t times) {
;	-----------------------------------------
;	 function blink
;	-----------------------------------------
_blink:
	mov	r7,dpl
;	App/test_w25qxx.c:26: for (uint8_t i = 0; i<times; i++) {
	mov	r6,#0x00
00103$:
	clr	c
	mov	a,r6
	subb	a,r7
	jnc	00101$
;	App/test_w25qxx.c:27: LED = 1;
;	assignBit
	setb	_LED
;	App/test_w25qxx.c:28: mDelaymS(250);
	mov	dptr,#0x00fa
	push	ar7
	push	ar6
	lcall	_mDelaymS
;	App/test_w25qxx.c:29: LED = 0;
;	assignBit
	clr	_LED
;	App/test_w25qxx.c:30: mDelaymS(250);
	mov	dptr,#0x00fa
	lcall	_mDelaymS
	pop	ar6
	pop	ar7
;	App/test_w25qxx.c:26: for (uint8_t i = 0; i<times; i++) {
	inc	r6
	sjmp	00103$
00101$:
;	App/test_w25qxx.c:33: mDelaymS(1000);
	mov	dptr,#0x03e8
;	App/test_w25qxx.c:34: }
	ljmp	_mDelaymS
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadDeviceId'
;------------------------------------------------------------
;devId                     Allocated to registers r6 r7 
;------------------------------------------------------------
;	App/test_w25qxx.c:37: void testReadDeviceId() {
;	-----------------------------------------
;	 function testReadDeviceId
;	-----------------------------------------
_testReadDeviceId:
;	App/test_w25qxx.c:40: printText("Device Id:");
	mov	dptr,#___str_0
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:41: uint16_t devId = readDeviceId();
	lcall	_readDeviceId
	mov	r6,dpl
	mov	r7,dph
;	App/test_w25qxx.c:42: printNumbers(devId, HEX);
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
;	App/test_w25qxx.c:43: printText("\nEnd\n");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:45: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:46: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:48: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadUniqueId'
;------------------------------------------------------------
;mac                       Allocated to registers r5 r6 r7 
;j                         Allocated to registers r4 
;------------------------------------------------------------
;	App/test_w25qxx.c:50: void testReadUniqueId() {
;	-----------------------------------------
;	 function testReadUniqueId
;	-----------------------------------------
_testReadUniqueId:
;	App/test_w25qxx.c:52: printText("Unique Id:\n");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:53: uint8_t *mac = readUniqueId();
	lcall	_readUniqueId
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	App/test_w25qxx.c:55: for (uint8_t j=0; j<8; j++) {
	mov	r4,#0x00
00103$:
	cjne	r4,#0x08,00116$
00116$:
	jnc	00101$
;	App/test_w25qxx.c:56: printNumbers(mac[j], HEX); 
	mov	a,r4
	add	a,r5
	mov	r1,a
	clr	a
	addc	a,r6
	mov	r2,a
	mov	ar3,r7
	mov	dpl,r1
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r0,a
	mov	r1,#0x00
	mov	r2,#0x00
	mov	r3,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x10
	movx	@dptr,a
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_printNumbers
;	App/test_w25qxx.c:57: printText("."); 
	mov	dptr,#___str_3
	mov	b,#0x80
	lcall	_printText
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/test_w25qxx.c:55: for (uint8_t j=0; j<8; j++) {
	inc	r4
	sjmp	00103$
00101$:
;	App/test_w25qxx.c:59: printText("\nEnd\n");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:61: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:62: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:64: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadByte'
;------------------------------------------------------------
;p                         Allocated with name '_testReadByte_p_131072_149'
;i                         Allocated to registers r3 r4 r5 r6 
;------------------------------------------------------------
;	App/test_w25qxx.c:66: void testReadByte() {
;	-----------------------------------------
;	 function testReadByte
;	-----------------------------------------
_testReadByte:
;	App/test_w25qxx.c:69: printText("Reading byte...");
	mov	dptr,#___str_4
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:72: for (uint8_t p=0; p<8; p++) {
	mov	_testReadByte_p_131072_149,#0x00
00107$:
	mov	a,#0x100 - 0x08
	add	a,_testReadByte_p_131072_149
	jnc	00129$
	ljmp	00102$
00129$:
;	App/test_w25qxx.c:73: printText("\nPage: ");
	mov	dptr,#___str_5
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:74: printNumbers(p, DEC);
	mov	r3,_testReadByte_p_131072_149
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
	lcall	_printNumbers
;	App/test_w25qxx.c:75: printText("\n");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:77: for (uint32_t i=0; i<32; i++) {  
	mov	r3,#0x00
	mov	r4,#0x00
	mov	r5,#0x00
	mov	r6,#0x00
00104$:
	clr	c
	mov	a,r3
	subb	a,#0x20
	mov	a,r4
	subb	a,#0x00
	mov	a,r5
	subb	a,#0x00
	mov	a,r6
	subb	a,#0x00
	jnc	00108$
;	App/test_w25qxx.c:78: printNumbers(readByte((p*256)+i), HEX);
	mov	r2,_testReadByte_p_131072_149
	mov	r1,#0x00
	mov	a,r2
	mov	r0,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	r7,a
	mov	a,r3
	add	a,r1
	mov	r1,a
	mov	a,r4
	addc	a,r0
	mov	r0,a
	mov	a,r5
	addc	a,r2
	mov	r2,a
	mov	a,r6
	addc	a,r7
	mov	dpl,r1
	mov	dph,r0
	mov	b,r2
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_readByte
	mov	r7,dpl
	mov	ar0,r7
	mov	r1,#0x00
	mov	r2,#0x00
	mov	r7,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x10
	movx	@dptr,a
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,r7
	lcall	_printNumbers
;	App/test_w25qxx.c:79: printText(".");
	mov	dptr,#___str_3
	mov	b,#0x80
	lcall	_printText
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
;	App/test_w25qxx.c:77: for (uint32_t i=0; i<32; i++) {  
	inc	r3
	cjne	r3,#0x00,00131$
	inc	r4
	cjne	r4,#0x00,00131$
	inc	r5
	cjne	r5,#0x00,00104$
	inc	r6
00131$:
	sjmp	00104$
00108$:
;	App/test_w25qxx.c:72: for (uint8_t p=0; p<8; p++) {
	inc	_testReadByte_p_131072_149
	ljmp	00107$
00102$:
;	App/test_w25qxx.c:83: printText("\nEnd\n");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:85: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:86: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:88: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadBytes'
;------------------------------------------------------------
;j                         Allocated to registers r7 
;z                         Allocated to registers r6 
;------------------------------------------------------------
;	App/test_w25qxx.c:90: void testReadBytes() {
;	-----------------------------------------
;	 function testReadBytes
;	-----------------------------------------
_testReadBytes:
;	App/test_w25qxx.c:94: printText("Reading to array of bytes...");
	mov	dptr,#___str_7
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:96: for (uint8_t j=0; j<8; j++) {
	mov	r7,#0x00
00107$:
	cjne	r7,#0x08,00129$
00129$:
	jc	00130$
	ljmp	00102$
00130$:
;	App/test_w25qxx.c:98: printText("\nPage: ");    
	mov	dptr,#___str_5
	mov	b,#0x80
	push	ar7
	lcall	_printText
	pop	ar7
;	App/test_w25qxx.c:99: printNumbers(j, DEC);
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
;	App/test_w25qxx.c:100: printText("\n");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_printText
	pop	ar7
;	App/test_w25qxx.c:102: readBytes((j*256), _sbuffer, 31);
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
;	App/test_w25qxx.c:104: for (uint8_t z=0; z<32; z++) {
	mov	r6,#0x00
00104$:
	cjne	r6,#0x20,00131$
00131$:
	jnc	00108$
;	App/test_w25qxx.c:105: printNumbers(_sbuffer[z], HEX);
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
;	App/test_w25qxx.c:106: printText(".");    
	mov	dptr,#___str_3
	mov	b,#0x80
	lcall	_printText
	pop	ar6
	pop	ar7
;	App/test_w25qxx.c:104: for (uint8_t z=0; z<32; z++) {
	inc	r6
	sjmp	00104$
00108$:
;	App/test_w25qxx.c:96: for (uint8_t j=0; j<8; j++) {
	inc	r7
	ljmp	00107$
00102$:
;	App/test_w25qxx.c:109: printText("\n");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:111: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:112: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:113: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'testReadStatus'
;------------------------------------------------------------
;	App/test_w25qxx.c:115: void testReadStatus() {
;	-----------------------------------------
;	 function testReadStatus
;	-----------------------------------------
_testReadStatus:
;	App/test_w25qxx.c:116: printText("Status: ");
	mov	dptr,#___str_8
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:117: printNumbers(readStatus(), DEC);
	lcall	_readStatus
	mov	r7,dpl
	mov	r6,#0x00
	mov	r5,#0x00
	mov	r4,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x0a
	movx	@dptr,a
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	a,r4
	lcall	_printNumbers
;	App/test_w25qxx.c:118: printText("\n");
	mov	dptr,#___str_6
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:120: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:121: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:122: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'testChipErase'
;------------------------------------------------------------
;	App/test_w25qxx.c:125: void testChipErase() {
;	-----------------------------------------
;	 function testChipErase
;	-----------------------------------------
_testChipErase:
;	App/test_w25qxx.c:126: printText("Erasing chip... ");
	mov	dptr,#___str_9
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:127: chipErase();
	lcall	_chipErase
;	App/test_w25qxx.c:128: printText("Done! \n");
	mov	dptr,#___str_10
	mov	b,#0x80
	lcall	_printText
;	App/test_w25qxx.c:130: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:131: blink(2);
	mov	dpl,#0x02
;	App/test_w25qxx.c:133: }
	ljmp	_blink
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	App/test_w25qxx.c:136: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	App/test_w25qxx.c:138: CfgFsys(); 
	lcall	_CfgFsys
;	App/test_w25qxx.c:139: mDelaymS(10);
	mov	dptr,#0x000a
	lcall	_mDelaymS
;	App/test_w25qxx.c:141: USBInit();
	lcall	_USBInit
;	App/test_w25qxx.c:142: USBSerial();
	lcall	_USBSerial
;	App/test_w25qxx.c:143: SPISetup();
	lcall	_SPISetup
;	App/test_w25qxx.c:146: blink(3);
	mov	dpl,#0x03
	lcall	_blink
;	App/test_w25qxx.c:148: mDelaymS(1000);
	mov	dptr,#0x03e8
	lcall	_mDelaymS
;	App/test_w25qxx.c:150: while(1) {
00102$:
;	App/test_w25qxx.c:160: testReadBytes();
	lcall	_testReadBytes
;	App/test_w25qxx.c:161: testChipErase();
	lcall	_testChipErase
;	App/test_w25qxx.c:162: testReadBytes();
	lcall	_testReadBytes
;	App/test_w25qxx.c:166: mDelaymS(2000);
	mov	dptr,#0x07d0
	lcall	_mDelaymS
;	App/test_w25qxx.c:173: }
	sjmp	00102$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Device Id:"
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.db 0x0a
	.ascii "End"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "Unique Id:"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_3:
	.ascii "."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_4:
	.ascii "Reading byte..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_5:
	.db 0x0a
	.ascii "Page: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_6:
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_7:
	.ascii "Reading to array of bytes..."
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_8:
	.ascii "Status: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_9:
	.ascii "Erasing chip... "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_10:
	.ascii "Done! "
	.db 0x0a
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
	.area CABS    (ABS,CODE)
