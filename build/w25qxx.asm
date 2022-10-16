;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module w25qxx
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sendCommand
	.globl _unselect
	.globl _select
	.globl _CH554SPIMasterRead
	.globl _CH554SPIMasterWrite
	.globl _SPIMasterModeSet
	.globl _mDelayuS
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
	.globl _writeBytes_PARM_3
	.globl _writeBytes_PARM_2
	.globl _writeByte_PARM_2
	.globl _readBytes_PARM_3
	.globl _readBytes_PARM_2
	.globl _SPISetup
	.globl _readDeviceId
	.globl _readUniqueId
	.globl _readByte
	.globl _readBytes
	.globl _readStatus
	.globl _busy
	.globl _enableWrite
	.globl _writeByte
	.globl _writeBytes
	.globl _chipErase
	.globl _blockErase4K
	.globl _blockErase32K
	.globl _blockErase64K
	.globl _sleep
	.globl _wakeup
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
_readBytes_PARM_2:
	.ds 3
_readBytes_PARM_3:
	.ds 2
_writeByte_PARM_2:
	.ds 1
_writeBytes_PARM_2:
	.ds 3
_writeBytes_PARM_3:
	.ds 2
_writeBytes_addr_65536_67:
	.ds 4
_writeBytes_n_65536_68:
	.ds 2
_writeBytes_maxBytes_65536_68:
	.ds 2
_writeBytes_offset_65536_68:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
;Allocation info for local variables in function 'SPISetup'
;------------------------------------------------------------
;	App/flash/w25qxx.c:4: void SPISetup()
;	-----------------------------------------
;	 function SPISetup
;	-----------------------------------------
_SPISetup:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	App/flash/w25qxx.c:6: SPIMasterModeSet(3); // SPI master mode setting, mode 3
	mov	dpl,#0x03
	lcall	_SPIMasterModeSet
;	App/flash/w25qxx.c:7: SPI_CK_SET(2);       // divide by 2, fastest
	mov	_SPI0_CK_SE,#0x02
;	App/flash/w25qxx.c:8: unselect();
	lcall	_unselect
;	App/flash/w25qxx.c:9: wakeup();
;	App/flash/w25qxx.c:10: }
	ljmp	_wakeup
;------------------------------------------------------------
;Allocation info for local variables in function 'select'
;------------------------------------------------------------
;	App/flash/w25qxx.c:12: void select()
;	-----------------------------------------
;	 function select
;	-----------------------------------------
_select:
;	App/flash/w25qxx.c:14: SCS = 0;
;	assignBit
	clr	_SCS
;	App/flash/w25qxx.c:15: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'unselect'
;------------------------------------------------------------
;	App/flash/w25qxx.c:17: void unselect()
;	-----------------------------------------
;	 function unselect
;	-----------------------------------------
_unselect:
;	App/flash/w25qxx.c:19: SCS = 1;
;	assignBit
	setb	_SCS
;	App/flash/w25qxx.c:20: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendCommand'
;------------------------------------------------------------
;cmd                       Allocated to registers r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:22: void sendCommand(uint8_t cmd)
;	-----------------------------------------
;	 function sendCommand
;	-----------------------------------------
_sendCommand:
	mov	r7,dpl
;	App/flash/w25qxx.c:24: if (cmd != SPIFLASH_WAKE) while(busy());
	cjne	r7,#0xab,00112$
	sjmp	00105$
00112$:
00101$:
	push	ar7
	lcall	_busy
	mov	a,dpl
	pop	ar7
	jnz	00101$
00105$:
;	App/flash/w25qxx.c:26: select();
	push	ar7
	lcall	_select
	pop	ar7
;	App/flash/w25qxx.c:27: CH554SPIMasterWrite(cmd);
	mov	dpl,r7
;	App/flash/w25qxx.c:28: }
	ljmp	_CH554SPIMasterWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'readDeviceId'
;------------------------------------------------------------
;id                        Allocated to registers r5 r4 
;------------------------------------------------------------
;	App/flash/w25qxx.c:30: uint16_t readDeviceId()
;	-----------------------------------------
;	 function readDeviceId
;	-----------------------------------------
_readDeviceId:
;	App/flash/w25qxx.c:35: sendCommand(SPIFLASH_IDREAD);
	mov	dpl,#0x9f
	lcall	_sendCommand
;	App/flash/w25qxx.c:36: mDelayuS(2);
	mov	dptr,#0x0002
	lcall	_mDelayuS
;	App/flash/w25qxx.c:37: id = CH554SPIMasterRead() << 8;
	lcall	_CH554SPIMasterRead
	mov	r6,dpl
	mov	r7,#0x00
;	App/flash/w25qxx.c:38: id |= CH554SPIMasterRead();
	push	ar7
	push	ar6
	lcall	_CH554SPIMasterRead
	mov	r5,dpl
	pop	ar6
	pop	ar7
	mov	r4,#0x00
	mov	a,r7
	orl	ar5,a
	mov	a,r6
	orl	ar4,a
;	App/flash/w25qxx.c:39: unselect();
	push	ar5
	push	ar4
	lcall	_unselect
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:41: return id;
	mov	dpl,r5
	mov	dph,r4
;	App/flash/w25qxx.c:42: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readUniqueId'
;------------------------------------------------------------
;a                         Allocated to registers r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:44: uint8_t *readUniqueId()
;	-----------------------------------------
;	 function readUniqueId
;	-----------------------------------------
_readUniqueId:
;	App/flash/w25qxx.c:46: sendCommand(SPIFLASH_MACREAD);
	mov	dpl,#0x4b
	lcall	_sendCommand
;	App/flash/w25qxx.c:47: mDelayuS(2);
	mov	dptr,#0x0002
	lcall	_mDelayuS
;	App/flash/w25qxx.c:48: CH554SPIMasterWrite(0);
	mov	dpl,#0x00
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:49: CH554SPIMasterWrite(0);
	mov	dpl,#0x00
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:50: CH554SPIMasterWrite(0);
	mov	dpl,#0x00
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:51: CH554SPIMasterWrite(0);
	mov	dpl,#0x00
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:52: mDelayuS(2);
	mov	dptr,#0x0002
	lcall	_mDelayuS
;	App/flash/w25qxx.c:53: for (uint8_t a = 0; a < 8; a++)
	mov	r7,#0x00
00103$:
	cjne	r7,#0x08,00116$
00116$:
	jnc	00101$
;	App/flash/w25qxx.c:55: UNIQUEID[a] = CH554SPIMasterRead();
	mov	a,r7
	add	a,#_UNIQUEID
	mov	r5,a
	clr	a
	addc	a,#(_UNIQUEID >> 8)
	mov	r6,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_CH554SPIMasterRead
	mov	r4,dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	a,r4
	movx	@dptr,a
;	App/flash/w25qxx.c:53: for (uint8_t a = 0; a < 8; a++)
	inc	r7
	sjmp	00103$
00101$:
;	App/flash/w25qxx.c:57: unselect();
	lcall	_unselect
;	App/flash/w25qxx.c:59: return UNIQUEID;
	mov	dptr,#_UNIQUEID
	mov	b,#0x00
;	App/flash/w25qxx.c:60: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readByte'
;------------------------------------------------------------
;addr                      Allocated to registers r4 r5 r6 r7 
;result                    Allocated to registers r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:62: uint8_t readByte(uint32_t addr)
;	-----------------------------------------
;	 function readByte
;	-----------------------------------------
_readByte:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:64: sendCommand(SPIFLASH_ARRAYREADLOWFREQ);
	mov	dpl,#0x03
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:65: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:66: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:67: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:68: mDelayuS(2);
	mov	dptr,#0x0002
	lcall	_mDelayuS
;	App/flash/w25qxx.c:69: uint8_t result = CH554SPIMasterRead();
	lcall	_CH554SPIMasterRead
	mov	r7,dpl
;	App/flash/w25qxx.c:70: unselect();
	push	ar7
	lcall	_unselect
	pop	ar7
;	App/flash/w25qxx.c:74: return result;
	mov	dpl,r7
;	App/flash/w25qxx.c:75: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readBytes'
;------------------------------------------------------------
;buf                       Allocated with name '_readBytes_PARM_2'
;len                       Allocated with name '_readBytes_PARM_3'
;addr                      Allocated to registers r4 r5 r6 r7 
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:78: void readBytes(uint32_t addr, void *buf, uint16_t len)
;	-----------------------------------------
;	 function readBytes
;	-----------------------------------------
_readBytes:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:80: sendCommand(SPIFLASH_ARRAYREAD);
	mov	dpl,#0x0b
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:81: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:82: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:83: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:84: CH554SPIMasterWrite(0); //"dont care"
	mov	dpl,#0x00
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:85: for (uint16_t i = 0; i < len; ++i)
	mov	r6,#0x00
	mov	r7,#0x00
00103$:
	clr	c
	mov	a,r6
	subb	a,_readBytes_PARM_3
	mov	a,r7
	subb	a,(_readBytes_PARM_3 + 1)
	jnc	00101$
;	App/flash/w25qxx.c:86: ((uint8_t *)buf)[i] = CH554SPIMasterRead();
	mov	r3,_readBytes_PARM_2
	mov	r4,(_readBytes_PARM_2 + 1)
	mov	r5,(_readBytes_PARM_2 + 2)
	mov	a,r6
	add	a,r3
	mov	r3,a
	mov	a,r7
	addc	a,r4
	mov	r4,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	lcall	_CH554SPIMasterRead
	mov	r2,dpl
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r3
	mov	dph,r4
	mov	b,r5
	mov	a,r2
	lcall	__gptrput
;	App/flash/w25qxx.c:85: for (uint16_t i = 0; i < len; ++i)
	inc	r6
	cjne	r6,#0x00,00103$
	inc	r7
	sjmp	00103$
00101$:
;	App/flash/w25qxx.c:87: unselect();
;	App/flash/w25qxx.c:88: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'readStatus'
;------------------------------------------------------------
;status                    Allocated to registers r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:91: uint8_t readStatus()
;	-----------------------------------------
;	 function readStatus
;	-----------------------------------------
_readStatus:
;	App/flash/w25qxx.c:93: select();  
	lcall	_select
;	App/flash/w25qxx.c:94: CH554SPIMasterWrite(SPIFLASH_STATUSREAD);
	mov	dpl,#0x05
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:95: uint8_t status = CH554SPIMasterRead();
	lcall	_CH554SPIMasterRead
	mov	r7,dpl
;	App/flash/w25qxx.c:96: unselect();
	push	ar7
	lcall	_unselect
	pop	ar7
;	App/flash/w25qxx.c:97: return status;
	mov	dpl,r7
;	App/flash/w25qxx.c:98: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'busy'
;------------------------------------------------------------
;	App/flash/w25qxx.c:101: bool busy()
;	-----------------------------------------
;	 function busy
;	-----------------------------------------
_busy:
;	App/flash/w25qxx.c:103: return readStatus() & 1;
	lcall	_readStatus
	mov	a,dpl
	rrc	a
	clr	a
	rlc	a
	mov	dpl,a
;	App/flash/w25qxx.c:104: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'enableWrite'
;------------------------------------------------------------
;	App/flash/w25qxx.c:106: void enableWrite()
;	-----------------------------------------
;	 function enableWrite
;	-----------------------------------------
_enableWrite:
;	App/flash/w25qxx.c:108: sendCommand(SPIFLASH_WRITEENABLE);
	mov	dpl,#0x06
	lcall	_sendCommand
;	App/flash/w25qxx.c:109: unselect();
;	App/flash/w25qxx.c:110: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'writeByte'
;------------------------------------------------------------
;byt                       Allocated with name '_writeByte_PARM_2'
;addr                      Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:112: void writeByte(uint32_t addr, uint8_t byt)
;	-----------------------------------------
;	 function writeByte
;	-----------------------------------------
_writeByte:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:114: enableWrite();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_enableWrite
;	App/flash/w25qxx.c:115: sendCommand(SPIFLASH_BYTEPAGEPROGRAM);
	mov	dpl,#0x02
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:116: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:117: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:118: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:119: CH554SPIMasterWrite(byt);
	mov	dpl,_writeByte_PARM_2
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:120: unselect();
;	App/flash/w25qxx.c:121: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'writeBytes'
;------------------------------------------------------------
;buf                       Allocated with name '_writeBytes_PARM_2'
;len                       Allocated with name '_writeBytes_PARM_3'
;addr                      Allocated with name '_writeBytes_addr_65536_67'
;n                         Allocated with name '_writeBytes_n_65536_68'
;maxBytes                  Allocated with name '_writeBytes_maxBytes_65536_68'
;offset                    Allocated with name '_writeBytes_offset_65536_68'
;i                         Allocated to registers r0 r1 
;------------------------------------------------------------
;	App/flash/w25qxx.c:129: void writeBytes(uint32_t addr, const void* buf, uint16_t len) {
;	-----------------------------------------
;	 function writeBytes
;	-----------------------------------------
_writeBytes:
	mov	_writeBytes_addr_65536_67,dpl
	mov	(_writeBytes_addr_65536_67 + 1),dph
	mov	(_writeBytes_addr_65536_67 + 2),b
	mov	(_writeBytes_addr_65536_67 + 3),a
;	App/flash/w25qxx.c:131: uint16_t maxBytes = 256-(addr%256);  // force the first set of bytes to stay within the first page
	mov	r0,_writeBytes_addr_65536_67
	clr	a
	mov	r1,a
	mov	r2,a
	mov	r3,a
	clr	c
	subb	a,r0
	mov	_writeBytes_maxBytes_65536_68,a
	mov	a,#0x01
	subb	a,r1
	mov	(_writeBytes_maxBytes_65536_68 + 1),a
;	App/flash/w25qxx.c:132: uint16_t offset = 0;
	clr	a
	mov	_writeBytes_offset_65536_68,a
	mov	(_writeBytes_offset_65536_68 + 1),a
;	App/flash/w25qxx.c:133: while (len>0)
00102$:
	mov	a,_writeBytes_PARM_3
	orl	a,(_writeBytes_PARM_3 + 1)
	jnz	00133$
	ret
00133$:
;	App/flash/w25qxx.c:135: n = (len<=maxBytes) ? len : maxBytes;
	clr	c
	mov	a,_writeBytes_maxBytes_65536_68
	subb	a,_writeBytes_PARM_3
	mov	a,(_writeBytes_maxBytes_65536_68 + 1)
	subb	a,(_writeBytes_PARM_3 + 1)
	jc	00110$
	mov	r2,_writeBytes_PARM_3
	mov	r3,(_writeBytes_PARM_3 + 1)
	sjmp	00111$
00110$:
	mov	r2,_writeBytes_maxBytes_65536_68
	mov	r3,(_writeBytes_maxBytes_65536_68 + 1)
00111$:
	mov	_writeBytes_n_65536_68,r2
	mov	(_writeBytes_n_65536_68 + 1),r3
;	App/flash/w25qxx.c:136: enableWrite();
	lcall	_enableWrite
;	App/flash/w25qxx.c:137: sendCommand(SPIFLASH_BYTEPAGEPROGRAM);
	mov	dpl,#0x02
	lcall	_sendCommand
;	App/flash/w25qxx.c:138: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,(_writeBytes_addr_65536_67 + 2)
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:139: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,(_writeBytes_addr_65536_67 + 1)
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:140: CH554SPIMasterWrite(addr);
	mov	dpl,_writeBytes_addr_65536_67
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:142: for (uint16_t i = 0; i < n; i++)
	mov	r0,#0x00
	mov	r1,#0x00
00106$:
	clr	c
	mov	a,r0
	subb	a,_writeBytes_n_65536_68
	mov	a,r1
	subb	a,(_writeBytes_n_65536_68 + 1)
	jnc	00101$
;	App/flash/w25qxx.c:143: CH554SPIMasterWrite(((uint8_t*) buf)[offset + i]);
	mov	r5,_writeBytes_PARM_2
	mov	r6,(_writeBytes_PARM_2 + 1)
	mov	r7,(_writeBytes_PARM_2 + 2)
	mov	a,r0
	add	a,_writeBytes_offset_65536_68
	mov	r3,a
	mov	a,r1
	addc	a,(_writeBytes_offset_65536_68 + 1)
	mov	r4,a
	mov	a,r3
	add	a,r5
	mov	r5,a
	mov	a,r4
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	push	ar1
	push	ar0
	lcall	_CH554SPIMasterWrite
	pop	ar0
	pop	ar1
;	App/flash/w25qxx.c:142: for (uint16_t i = 0; i < n; i++)
	inc	r0
	cjne	r0,#0x00,00106$
	inc	r1
	sjmp	00106$
00101$:
;	App/flash/w25qxx.c:144: unselect();
	lcall	_unselect
;	App/flash/w25qxx.c:146: addr+=n;  // adjust the addresses and remaining bytes by what we've just transferred.
	mov	r2,_writeBytes_n_65536_68
	mov	r3,(_writeBytes_n_65536_68 + 1)
	clr	a
	mov	r6,a
	mov	r7,a
	mov	a,r2
	add	a,_writeBytes_addr_65536_67
	mov	_writeBytes_addr_65536_67,a
	mov	a,r3
	addc	a,(_writeBytes_addr_65536_67 + 1)
	mov	(_writeBytes_addr_65536_67 + 1),a
	mov	a,r6
	addc	a,(_writeBytes_addr_65536_67 + 2)
	mov	(_writeBytes_addr_65536_67 + 2),a
	mov	a,r7
	addc	a,(_writeBytes_addr_65536_67 + 3)
	mov	(_writeBytes_addr_65536_67 + 3),a
;	App/flash/w25qxx.c:147: offset +=n;
	mov	a,_writeBytes_n_65536_68
	add	a,_writeBytes_offset_65536_68
	mov	_writeBytes_offset_65536_68,a
	mov	a,(_writeBytes_n_65536_68 + 1)
	addc	a,(_writeBytes_offset_65536_68 + 1)
	mov	(_writeBytes_offset_65536_68 + 1),a
;	App/flash/w25qxx.c:148: len -= n;
	mov	a,_writeBytes_PARM_3
	clr	c
	subb	a,_writeBytes_n_65536_68
	mov	_writeBytes_PARM_3,a
	mov	a,(_writeBytes_PARM_3 + 1)
	subb	a,(_writeBytes_n_65536_68 + 1)
	mov	(_writeBytes_PARM_3 + 1),a
;	App/flash/w25qxx.c:149: maxBytes = 256;   // now we can do up to 256 bytes per loop
;	1-genFromRTrack replaced	mov	_writeBytes_maxBytes_65536_68,#0x00
	mov	_writeBytes_maxBytes_65536_68,r7
	mov	(_writeBytes_maxBytes_65536_68 + 1),#0x01
;	App/flash/w25qxx.c:151: }
	ljmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'chipErase'
;------------------------------------------------------------
;	App/flash/w25qxx.c:159: void chipErase() {
;	-----------------------------------------
;	 function chipErase
;	-----------------------------------------
_chipErase:
;	App/flash/w25qxx.c:160: enableWrite();
	lcall	_enableWrite
;	App/flash/w25qxx.c:161: sendCommand(SPIFLASH_CHIPERASE);
	mov	dpl,#0x60
	lcall	_sendCommand
;	App/flash/w25qxx.c:162: unselect();
;	App/flash/w25qxx.c:163: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'blockErase4K'
;------------------------------------------------------------
;addr                      Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:166: void blockErase4K(uint32_t addr) {
;	-----------------------------------------
;	 function blockErase4K
;	-----------------------------------------
_blockErase4K:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:167: enableWrite();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_enableWrite
;	App/flash/w25qxx.c:168: sendCommand(SPIFLASH_BLOCKERASE_4K);
	mov	dpl,#0x20
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:169: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:170: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:171: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:172: unselect();
;	App/flash/w25qxx.c:173: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'blockErase32K'
;------------------------------------------------------------
;addr                      Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:176: void blockErase32K(uint32_t addr) {
;	-----------------------------------------
;	 function blockErase32K
;	-----------------------------------------
_blockErase32K:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:177: enableWrite();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_enableWrite
;	App/flash/w25qxx.c:178: sendCommand(SPIFLASH_BLOCKERASE_32K);
	mov	dpl,#0x52
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:179: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:180: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:181: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:182: unselect();
;	App/flash/w25qxx.c:183: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'blockErase64K'
;------------------------------------------------------------
;addr                      Allocated to registers r4 r5 r6 r7 
;------------------------------------------------------------
;	App/flash/w25qxx.c:186: void blockErase64K(uint32_t addr) {
;	-----------------------------------------
;	 function blockErase64K
;	-----------------------------------------
_blockErase64K:
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
;	App/flash/w25qxx.c:187: enableWrite();
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_enableWrite
;	App/flash/w25qxx.c:188: sendCommand(SPIFLASH_BLOCKERASE_64K);
	mov	dpl,#0xd8
	lcall	_sendCommand
	pop	ar4
	pop	ar5
	pop	ar6
;	App/flash/w25qxx.c:189: CH554SPIMasterWrite(addr >> 16);
	mov	dpl,r6
	push	ar6
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
;	App/flash/w25qxx.c:190: CH554SPIMasterWrite(addr >> 8);
	mov	dpl,r5
	push	ar5
	push	ar4
	lcall	_CH554SPIMasterWrite
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
;	App/flash/w25qxx.c:191: CH554SPIMasterWrite(addr);
	mov	dpl,r4
	lcall	_CH554SPIMasterWrite
;	App/flash/w25qxx.c:192: unselect();
;	App/flash/w25qxx.c:193: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'sleep'
;------------------------------------------------------------
;	App/flash/w25qxx.c:200: void sleep() {
;	-----------------------------------------
;	 function sleep
;	-----------------------------------------
_sleep:
;	App/flash/w25qxx.c:201: sendCommand(SPIFLASH_SLEEP);
	mov	dpl,#0xb9
	lcall	_sendCommand
;	App/flash/w25qxx.c:202: unselect();
;	App/flash/w25qxx.c:203: }
	ljmp	_unselect
;------------------------------------------------------------
;Allocation info for local variables in function 'wakeup'
;------------------------------------------------------------
;	App/flash/w25qxx.c:209: void wakeup() {
;	-----------------------------------------
;	 function wakeup
;	-----------------------------------------
_wakeup:
;	App/flash/w25qxx.c:210: sendCommand(SPIFLASH_WAKE);
	mov	dpl,#0xab
	lcall	_sendCommand
;	App/flash/w25qxx.c:211: unselect();
;	App/flash/w25qxx.c:212: }
	ljmp	_unselect
	.area CSEG    (CODE)
	.area CONST   (CODE)
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
