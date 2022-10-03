;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loop
	.globl _setup
	.globl _operationHandler
	.globl _loadData
	.globl _storePayload
	.globl _getMemAddress
	.globl _blink
	.globl _DeviceUSBInterrupt
	.globl _USBInterrupt
	.globl _SPISetup
	.globl _printLineBreak
	.globl _printNumbers
	.globl _printText
	.globl _USBSerial_flush
	.globl _USBSerial_available
	.globl _USBSerial_read
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
	.globl _getMemAddress_PARM_3
	.globl _getMemAddress_PARM_2
	.globl _byteCount
	.globl _lastCmdByte
	.globl _cmdByte
	.globl __currentBlock
	.globl _protocol
	.globl _current_state
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
_current_state::
	.ds 1
_protocol::
	.ds 4
__currentBlock::
	.ds 1
_cmdByte::
	.ds 1
_lastCmdByte::
	.ds 1
_byteCount::
	.ds 4
_getMemAddress_PARM_2:
	.ds 1
_getMemAddress_PARM_3:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
;	App/main.c:56: uint8_t _currentBlock = 0;
	mov	__currentBlock,#0x00
;	App/main.c:60: long byteCount = 0;
	clr	a
	mov	_byteCount,a
	mov	(_byteCount + 1),a
	mov	(_byteCount + 2),a
	mov	(_byteCount + 3),a
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
;	App/main.c:28: void DeviceUSBInterrupt(void) __interrupt(INT_NO_USB) // USB interrupt service
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
;	App/main.c:30: USBInterrupt();
	lcall	_USBInterrupt
;	App/main.c:31: }
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
;	App/main.c:63: void blink(uint8_t times)
;	-----------------------------------------
;	 function blink
;	-----------------------------------------
_blink:
	mov	r7,dpl
;	App/main.c:66: for (uint8_t i = 0; i < times; i++)
	mov	r6,#0x00
00103$:
	clr	c
	mov	a,r6
	subb	a,r7
	jnc	00105$
;	App/main.c:68: LED = 1;
;	assignBit
	setb	_LED
;	App/main.c:69: mDelaymS(250);
	mov	dptr,#0x00fa
	push	ar7
	push	ar6
	lcall	_mDelaymS
;	App/main.c:70: LED = 0;
;	assignBit
	clr	_LED
;	App/main.c:71: mDelaymS(250);
	mov	dptr,#0x00fa
	lcall	_mDelaymS
	pop	ar6
	pop	ar7
;	App/main.c:66: for (uint8_t i = 0; i < times; i++)
	inc	r6
	sjmp	00103$
00105$:
;	App/main.c:74: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getMemAddress'
;------------------------------------------------------------
;sector_num                Allocated with name '_getMemAddress_PARM_2'
;page_num                  Allocated with name '_getMemAddress_PARM_3'
;slot                      Allocated to registers r7 
;block                     Allocated to registers r4 r5 r3 r2 
;sector                    Allocated to registers r0 r1 r6 r7 
;------------------------------------------------------------
;	App/main.c:76: uint32_t getMemAddress(uint8_t slot, uint8_t sector_num, uint8_t page_num) {
;	-----------------------------------------
;	 function getMemAddress
;	-----------------------------------------
_getMemAddress:
	mov	r7,dpl
;	App/main.c:78: uint32_t block = (uint32_t)(slot/16)<<16;
	mov	r6,#0x00
	mov	__divsint_PARM_2,#0x10
;	1-genFromRTrack replaced	mov	(__divsint_PARM_2 + 1),#0x00
	mov	(__divsint_PARM_2 + 1),r6
	mov	dpl,r7
	mov	dph,r6
	push	ar7
	push	ar6
	lcall	__divsint
	mov	r4,dpl
	mov	r5,dph
	pop	ar6
	pop	ar7
	mov	a,r5
	rlc	a
	subb	a,acc
	mov	ar2,r5
	mov	ar3,r4
	mov	r4,#0x00
	mov	r5,#0x00
;	App/main.c:79: uint32_t sector = (uint32_t)(((slot%16)*16)+sector_num)<<8;
	anl	ar7,#0x0f
	clr	a
	xch	a,r7
	swap	a
	xch	a,r7
	xrl	a,r7
	xch	a,r7
	anl	a,#0xf0
	xch	a,r7
	xrl	a,r7
	mov	r6,a
	mov	r0,_getMemAddress_PARM_2
	mov	r1,#0x00
	mov	a,r0
	add	a,r7
	mov	r7,a
	mov	a,r1
	addc	a,r6
	mov	ar0,r7
	mov	r1,a
	rlc	a
	subb	a,acc
	mov	r7,a
	mov	ar6,r1
	mov	ar1,r0
;	App/main.c:88: return block | sector | page_num;
	clr	a
	orl	ar4,a
	mov	a,r1
	orl	ar5,a
	mov	a,r6
	orl	ar3,a
	mov	a,r7
	orl	ar2,a
	mov	r0,_getMemAddress_PARM_3
	clr	a
	mov	r1,a
	mov	r6,a
	mov	r7,a
	mov	a,r0
	orl	ar4,a
	mov	a,r1
	orl	ar5,a
	mov	a,r6
	orl	ar3,a
	mov	a,r7
	orl	ar2,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r3
	mov	a,r2
;	App/main.c:89: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'storePayload'
;------------------------------------------------------------
;payload                   Allocated to registers 
;------------------------------------------------------------
;	App/main.c:92: void storePayload(uint8_t payload) 
;	-----------------------------------------
;	 function storePayload
;	-----------------------------------------
_storePayload:
;	App/main.c:97: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'loadData'
;------------------------------------------------------------
;payload                   Allocated to registers r7 
;------------------------------------------------------------
;	App/main.c:100: void loadData(uint8_t payload) 
;	-----------------------------------------
;	 function loadData
;	-----------------------------------------
_loadData:
	mov	r7,dpl
;	App/main.c:102: printText("Load: ");
	mov	dptr,#___str_0
	mov	b,#0x80
	push	ar7
	lcall	_printText
	pop	ar7
;	App/main.c:103: printNumbers(payload, HEX);
	mov	r6,#0x00
	mov	r5,#0x00
	mov	r4,#0x00
	mov	dptr,#_printNumbers_PARM_2
	mov	a,#0x10
	movx	@dptr,a
	mov	dpl,r7
	mov	dph,r6
	mov	b,r5
	mov	a,r4
	lcall	_printNumbers
;	App/main.c:104: printLineBreak();
;	App/main.c:105: }
	ljmp	_printLineBreak
;------------------------------------------------------------
;Allocation info for local variables in function 'operationHandler'
;------------------------------------------------------------
;payload                   Allocated to registers r7 
;------------------------------------------------------------
;	App/main.c:108: void operationHandler(uint8_t payload) 
;	-----------------------------------------
;	 function operationHandler
;	-----------------------------------------
_operationHandler:
	mov	r7,dpl
;	App/main.c:111: switch (protocol.operation) {
	mov	r6,(_protocol + 0x0001)
	cjne	r6,#0x05,00120$
	sjmp	00102$
00120$:
	cjne	r6,#0x0c,00121$
	sjmp	00101$
00121$:
;	App/main.c:113: case PINCH_STORE:
	cjne	r6,#0x7f,00106$
	sjmp	00103$
00101$:
;	App/main.c:114: storePayload(payload);     
	mov	dpl,r7
;	App/main.c:115: break;
;	App/main.c:116: case PINCH_LOAD:
	ljmp	_storePayload
00102$:
;	App/main.c:117: loadData(payload);
	mov	dpl,r7
;	App/main.c:118: break;
;	App/main.c:119: case PINCH_ERASE:
	ljmp	_loadData
00103$:
;	App/main.c:120: printText("Erase\n");
	mov	dptr,#___str_1
	mov	b,#0x80
	lcall	_printText
;	App/main.c:121: mDelaymS(1000);
	mov	dptr,#0x03e8
;	App/main.c:125: }
;	App/main.c:127: }
	ljmp	_mDelaymS
00106$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setup'
;------------------------------------------------------------
;	App/main.c:129: void setup()
;	-----------------------------------------
;	 function setup
;	-----------------------------------------
_setup:
;	App/main.c:131: CfgFsys();
	lcall	_CfgFsys
;	App/main.c:132: LED = 0;
;	assignBit
	clr	_LED
;	App/main.c:133: mDelaymS(10);
	mov	dptr,#0x000a
	lcall	_mDelaymS
;	App/main.c:135: USBInit();
	lcall	_USBInit
;	App/main.c:136: USBSerial();
	lcall	_USBSerial
;	App/main.c:137: SPISetup();
	lcall	_SPISetup
;	App/main.c:139: blink(3);
	mov	dpl,#0x03
	lcall	_blink
;	App/main.c:141: current_state = begin_of_transmission;
	mov	_current_state,#0x00
;	App/main.c:142: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'loop'
;------------------------------------------------------------
;cmdByte                   Allocated to registers r7 
;------------------------------------------------------------
;	App/main.c:144: void loop()
;	-----------------------------------------
;	 function loop
;	-----------------------------------------
_loop:
;	App/main.c:146: while(1)
00135$:
;	App/main.c:149: if (USBSerial_available() > 0)
	lcall	_USBSerial_available
	mov	a,dpl
	jnz	00191$
	ljmp	00133$
00191$:
;	App/main.c:151: uint8_t cmdByte = USBSerial_read();
	lcall	_USBSerial_read
	mov	r7,dpl
;	App/main.c:166: switch (current_state)
	mov	a,_current_state
	add	a,#0xff - 0x05
	jnc	00192$
	ljmp	00131$
00192$:
	mov	a,_current_state
	mov	b,#0x03
	mul	ab
	mov	dptr,#00193$
	jmp	@a+dptr
00193$:
	ljmp	00101$
	ljmp	00104$
	ljmp	00105$
	ljmp	00113$
	ljmp	00128$
	ljmp	00129$
;	App/main.c:168: case begin_of_transmission:
00101$:
;	App/main.c:169: if (cmdByte == PINCH_DEVCONTROL)
	cjne	r7,#0x11,00194$
	sjmp	00195$
00194$:
	ljmp	00131$
00195$:
;	App/main.c:171: protocol.control_flag = cmdByte;
	mov	_protocol,r7
;	App/main.c:172: current_state = operation;
	mov	_current_state,#0x01
;	App/main.c:178: break;
	ljmp	00131$
;	App/main.c:180: case operation:
00104$:
;	App/main.c:182: protocol.operation = cmdByte;
	mov	(_protocol + 0x0001),r7
;	App/main.c:183: current_state = parameter;
	mov	_current_state,#0x02
;	App/main.c:188: break;
	ljmp	00131$
;	App/main.c:190: case parameter:
00105$:
;	App/main.c:192: if (lastCmdByte == PINCH_RS && cmdByte == PINCH_EOT)
	mov	a,#0x1e
	cjne	a,_lastCmdByte,00110$
	cjne	r7,#0x04,00110$
;	App/main.c:194: current_state = end_of_transmission;
	mov	_current_state,#0x04
	ljmp	00131$
00110$:
;	App/main.c:196: else if (protocol.param == lastCmdByte)
	mov	a,_lastCmdByte
	cjne	a,(_protocol + 0x0002),00107$
;	App/main.c:198: protocol.payload_size = cmdByte;
	mov	(_protocol + 0x0003),r7
;	App/main.c:199: current_state = payload;
	mov	_current_state,#0x03
	ljmp	00131$
00107$:
;	App/main.c:207: protocol.param = cmdByte;
	mov	(_protocol + 0x0002),r7
;	App/main.c:213: break;
	ljmp	00131$
;	App/main.c:214: case payload:
00113$:
;	App/main.c:215: if (lastCmdByte == PINCH_DLE && cmdByte == PINCH_RS)
	mov	a,#0x10
	cjne	a,_lastCmdByte,00125$
	cjne	r7,#0x1e,00125$
;	App/main.c:217: byteCount = 0;
	clr	a
	mov	_byteCount,a
	mov	(_byteCount + 1),a
	mov	(_byteCount + 2),a
	mov	(_byteCount + 3),a
;	App/main.c:218: current_state = parameter;
	mov	_current_state,#0x02
	ljmp	00131$
00125$:
;	App/main.c:220: else if (protocol.payload_size > 0 && protocol.payload_size == byteCount)
	mov	a,(_protocol + 0x0003)
	mov	r6,a
	jz	00121$
	clr	a
	mov	r5,a
	mov	r4,a
	mov	r3,a
	mov	a,r6
	cjne	a,_byteCount,00121$
	mov	a,r5
	cjne	a,(_byteCount + 1),00121$
	mov	a,r4
	cjne	a,(_byteCount + 2),00121$
	mov	a,r3
	cjne	a,(_byteCount + 3),00121$
;	App/main.c:222: if (cmdByte == PINCH_RS)
	cjne	r7,#0x1e,00115$
;	App/main.c:224: current_state = parameter;
	mov	_current_state,#0x02
	sjmp	00116$
00115$:
;	App/main.c:228: current_state = payload_error;
	mov	_current_state,#0x05
00116$:
;	App/main.c:230: printLineBreak();
	push	ar7
	lcall	_printLineBreak
	pop	ar7
;	App/main.c:231: byteCount = 0;
	clr	a
	mov	_byteCount,a
	mov	(_byteCount + 1),a
	mov	(_byteCount + 2),a
	mov	(_byteCount + 3),a
	sjmp	00131$
00121$:
;	App/main.c:235: byteCount++;
	inc	_byteCount
	clr	a
	cjne	a,_byteCount,00211$
	inc	(_byteCount + 1)
	cjne	a,(_byteCount + 1),00211$
	inc	(_byteCount + 2)
	cjne	a,(_byteCount + 2),00211$
	inc	(_byteCount + 3)
00211$:
;	App/main.c:236: if (protocol.payload_size == 0 || byteCount <= protocol.payload_size)
	mov	a,(_protocol + 0x0003)
	mov	r6,a
	jz	00117$
	mov	r5,#0x00
	mov	r4,#0x00
	mov	r3,#0x00
	clr	c
	mov	a,r6
	subb	a,_byteCount
	mov	a,r5
	subb	a,(_byteCount + 1)
	mov	a,r4
	subb	a,(_byteCount + 2)
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_byteCount + 3)
	xrl	b,#0x80
	subb	a,b
	jc	00131$
00117$:
;	App/main.c:238: operationHandler(cmdByte);
	mov	dpl,r7
	push	ar7
	lcall	_operationHandler
	pop	ar7
;	App/main.c:241: break;
;	App/main.c:243: case end_of_transmission:
	sjmp	00131$
00128$:
;	App/main.c:244: protocol.control_flag = 0;
;	App/main.c:245: protocol.operation = 0;
;	App/main.c:246: protocol.param = 0;
;	App/main.c:247: protocol.payload_size = 0;
;	App/main.c:248: byteCount = 0;
	clr	a
	mov	_protocol,a
	mov	(_protocol + 0x0001),a
	mov	(_protocol + 0x0002),a
	mov	(_protocol + 0x0003),a
	mov	_byteCount,a
	mov	(_byteCount + 1),a
	mov	(_byteCount + 2),a
	mov	(_byteCount + 3),a
;	App/main.c:249: current_state = begin_of_transmission;
;	1-genFromRTrack replaced	mov	_current_state,#0x00
	mov	_current_state,a
;	App/main.c:250: storePayload(0);
	mov	dpl,#0x00
	push	ar7
	lcall	_storePayload
;	App/main.c:251: printLineBreak();
	lcall	_printLineBreak
;	App/main.c:252: USBSerial_flush();
	lcall	_USBSerial_flush
	pop	ar7
;	App/main.c:253: break;
;	App/main.c:255: case payload_error:
	sjmp	00131$
00129$:
;	App/main.c:256: printLineBreak();
	push	ar7
	lcall	_printLineBreak
;	App/main.c:257: USBSerial_flush();
	lcall	_USBSerial_flush
;	App/main.c:258: printText("ERROR!");
	mov	dptr,#___str_2
	mov	b,#0x80
	lcall	_printText
	pop	ar7
;	App/main.c:260: current_state = end_of_transmission;
	mov	_current_state,#0x04
;	App/main.c:266: }
00131$:
;	App/main.c:268: lastCmdByte = cmdByte;
	mov	_lastCmdByte,r7
00133$:
;	App/main.c:271: USBSerial_flush();
	lcall	_USBSerial_flush
;	App/main.c:274: }
	ljmp	00135$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	App/main.c:276: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	App/main.c:279: setup();
	lcall	_setup
;	App/main.c:280: loop();
;	App/main.c:282: }
	ljmp	_loop
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
___str_0:
	.ascii "Load: "
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_1:
	.ascii "Erase"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area CONST   (CODE)
___str_2:
	.ascii "ERROR!"
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
