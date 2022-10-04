;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module USBhandler
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _USB_EP1_IN
	.globl _USB_EP0_OUT
	.globl _USB_EP0_IN
	.globl _USB_EP0_SETUP
	.globl _USB_EP2_OUT
	.globl _USB_EP2_IN
	.globl _setControlLineStateHandler
	.globl _getLineCodingHandler
	.globl _setLineCodingHandler
	.globl _resetCDCParameters
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
	.globl _Ep2Buffer
	.globl _Ep1Buffer
	.globl _Ep0Buffer
	.globl _usbMsgFlags
	.globl _pDescr
	.globl _UsbConfig
	.globl _SetupReq
	.globl _SetupLen
	.globl _USBInterrupt
	.globl _USBDeviceCfg
	.globl _USBDeviceIntCfg
	.globl _USBDeviceEndPointCfg
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
_SetupLen::
	.ds 2
_SetupReq::
	.ds 1
_UsbConfig::
	.ds 1
_pDescr::
	.ds 2
_usbMsgFlags::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
_Ep0Buffer::
	.ds 8
_Ep1Buffer::
	.ds 8
_Ep2Buffer::
	.ds 128
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
;	App/core/USBhandler.c:23: volatile uint8_t usbMsgFlags=0;    // uint8_t usbMsgFlags copied from VUSB
	mov	_usbMsgFlags,#0x00
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
;Allocation info for local variables in function 'USB_EP0_SETUP'
;------------------------------------------------------------
;len                       Allocated to registers r7 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	App/core/USBhandler.c:27: void USB_EP0_SETUP(){
;	-----------------------------------------
;	 function USB_EP0_SETUP
;	-----------------------------------------
_USB_EP0_SETUP:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	App/core/USBhandler.c:28: uint8_t len = USB_RX_LEN;
	mov	r7,_USB_RX_LEN
;	App/core/USBhandler.c:29: if(len == (sizeof(USB_SETUP_REQ)))
	cjne	r7,#0x08,00470$
	sjmp	00471$
00470$:
	ljmp	00204$
00471$:
;	App/core/USBhandler.c:31: SetupLen = ((uint16_t)UsbSetupBuf->wLengthH<<8) | (UsbSetupBuf->wLengthL);
	mov	dptr,#(_Ep0Buffer + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0006)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	orl	a,r7
	mov	_SetupLen,a
	mov	a,r4
	orl	a,r6
	mov	(_SetupLen + 1),a
;	App/core/USBhandler.c:32: len = 0;                                                      // Default is success and upload 0 length
	mov	r7,#0x00
;	App/core/USBhandler.c:33: SetupReq = UsbSetupBuf->bRequest;
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	a,@dptr
	mov	_SetupReq,a
;	App/core/USBhandler.c:34: usbMsgFlags = 0;
;	1-genFromRTrack replaced	mov	_usbMsgFlags,#0x00
	mov	_usbMsgFlags,r7
;	App/core/USBhandler.c:35: if ( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ) != USB_REQ_TYP_STANDARD )//Not standard request
	mov	dptr,#_Ep0Buffer
	movx	a,@dptr
	mov	r6,a
	anl	a,#0x60
	jz	00201$
;	App/core/USBhandler.c:41: switch( ( UsbSetupBuf->bRequestType & USB_REQ_TYP_MASK ))
	mov	ar4,r6
	anl	ar4,#0x60
	mov	r5,#0x00
	cjne	r4,#0x20,00473$
	cjne	r5,#0x00,00473$
	sjmp	00104$
00473$:
	cjne	r4,#0x40,00110$
	cjne	r5,#0x00,00110$
;	App/core/USBhandler.c:48: len = 0xFF;                                                                        //command not supported
	mov	r7,#0xff
;	App/core/USBhandler.c:51: break;
	ljmp	00205$
;	App/core/USBhandler.c:53: case USB_REQ_TYP_CLASS:
00104$:
;	App/core/USBhandler.c:55: switch( SetupReq )
	mov	a,#0x20
	cjne	a,_SetupReq,00476$
	ljmp	00205$
00476$:
	mov	a,#0x21
	cjne	a,_SetupReq,00477$
	sjmp	00105$
00477$:
	mov	a,#0x22
;	App/core/USBhandler.c:57: case GET_LINE_CODING:   //0x21  currently configured
	cjne	a,_SetupReq,00108$
	sjmp	00106$
00105$:
;	App/core/USBhandler.c:58: len = getLineCodingHandler();
	lcall	_getLineCodingHandler
	mov	r4,dpl
	mov	r5,dph
	mov	ar7,r4
;	App/core/USBhandler.c:59: break;
	ljmp	00205$
;	App/core/USBhandler.c:60: case SET_CONTROL_LINE_STATE:  //0x22  generates RS-232/V.24 style control signals
00106$:
;	App/core/USBhandler.c:61: setControlLineStateHandler();
	push	ar7
	lcall	_setControlLineStateHandler
	pop	ar7
;	App/core/USBhandler.c:62: break;
	ljmp	00205$
;	App/core/USBhandler.c:66: default:
00108$:
;	App/core/USBhandler.c:67: len = 0xFF;                                                                        //command not supported
	mov	r7,#0xff
;	App/core/USBhandler.c:70: break;
	ljmp	00205$
;	App/core/USBhandler.c:72: default:
00110$:
;	App/core/USBhandler.c:73: len = 0xFF;                                                                        //command not supported
	mov	r7,#0xff
;	App/core/USBhandler.c:75: }
	ljmp	00205$
00201$:
;	App/core/USBhandler.c:80: switch(SetupReq)                                             //Request ccfType
	mov	a,_SetupReq
	add	a,#0xff - 0x0b
	jnc	00479$
	ljmp	00198$
00479$:
	mov	a,_SetupReq
	add	a,#(00480$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,_SetupReq
	add	a,#(00481$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00480$:
	.db	00194$
	.db	00145$
	.db	00198$
	.db	00168$
	.db	00198$
	.db	00138$
	.db	00112$
	.db	00198$
	.db	00139$
	.db	00142$
	.db	00205$
	.db	00205$
00481$:
	.db	00194$>>8
	.db	00145$>>8
	.db	00198$>>8
	.db	00168$>>8
	.db	00198$>>8
	.db	00138$>>8
	.db	00112$>>8
	.db	00198$>>8
	.db	00139$>>8
	.db	00142$>>8
	.db	00205$>>8
	.db	00205$>>8
;	App/core/USBhandler.c:82: case USB_GET_DESCRIPTOR:
00112$:
;	App/core/USBhandler.c:83: switch(UsbSetupBuf->wValueH)
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x01,00482$
	sjmp	00113$
00482$:
	cjne	r5,#0x02,00483$
	sjmp	00114$
00483$:
	cjne	r5,#0x03,00484$
	sjmp	00115$
00484$:
	ljmp	00131$
;	App/core/USBhandler.c:85: case 1:                                                       //Device Descriptor
00113$:
;	App/core/USBhandler.c:86: pDescr = DevDesc;                                         //Put Device Descriptor into outgoing buffer
	mov	_pDescr,#_DevDesc
	mov	(_pDescr + 1),#(_DevDesc >> 8)
;	App/core/USBhandler.c:87: len = DevDescLen;
	mov	dptr,#_DevDescLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
;	App/core/USBhandler.c:88: break;
	ljmp	00132$
;	App/core/USBhandler.c:89: case 2:                                                        //Configure Descriptor
00114$:
;	App/core/USBhandler.c:90: pDescr = CfgDesc;                                       
	mov	_pDescr,#_CfgDesc
	mov	(_pDescr + 1),#(_CfgDesc >> 8)
;	App/core/USBhandler.c:91: len = CfgDescLen;
	mov	dptr,#_CfgDescLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
;	App/core/USBhandler.c:92: break;
	ljmp	00132$
;	App/core/USBhandler.c:93: case 3:
00115$:
;	App/core/USBhandler.c:94: if(UsbSetupBuf->wValueL == 0)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	jnz	00129$
;	App/core/USBhandler.c:96: pDescr = LangDes;
	mov	_pDescr,#_LangDes
	mov	(_pDescr + 1),#(_LangDes >> 8)
;	App/core/USBhandler.c:97: len = LangDesLen;
	mov	dptr,#_LangDesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
	ljmp	00132$
00129$:
;	App/core/USBhandler.c:99: else if(UsbSetupBuf->wValueL == 1)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x01,00126$
;	App/core/USBhandler.c:101: pDescr = (__code uint8_t *)Manuf_Des;
	mov	_pDescr,#_Manuf_Des
	mov	(_pDescr + 1),#(_Manuf_Des >> 8)
;	App/core/USBhandler.c:102: len = Manuf_DesLen;
	mov	dptr,#_Manuf_DesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
	sjmp	00132$
00126$:
;	App/core/USBhandler.c:104: else if(UsbSetupBuf->wValueL == 2)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x02,00123$
;	App/core/USBhandler.c:106: pDescr = (__code uint8_t *)Prod_Des;
	mov	_pDescr,#_Prod_Des
	mov	(_pDescr + 1),#(_Prod_Des >> 8)
;	App/core/USBhandler.c:107: len = Prod_DesLen;
	mov	dptr,#_Prod_DesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
	sjmp	00132$
00123$:
;	App/core/USBhandler.c:109: else if(UsbSetupBuf->wValueL == 3)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x03,00120$
;	App/core/USBhandler.c:111: pDescr = (__code uint8_t *)SerDes;
	mov	_pDescr,#_SerDes
	mov	(_pDescr + 1),#(_SerDes >> 8)
;	App/core/USBhandler.c:112: len = SerDesLen;
	mov	dptr,#_SerDesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
	sjmp	00132$
00120$:
;	App/core/USBhandler.c:114: else if(UsbSetupBuf->wValueL == 4)
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x04,00117$
;	App/core/USBhandler.c:116: pDescr = (__code uint8_t *)CDC_Des;
	mov	_pDescr,#_CDC_Des
	mov	(_pDescr + 1),#(_CDC_Des >> 8)
;	App/core/USBhandler.c:117: len = CDC_DesLen;
	mov	dptr,#_CDC_DesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
	sjmp	00132$
00117$:
;	App/core/USBhandler.c:121: pDescr = (__code uint8_t *)SerDes;
	mov	_pDescr,#_SerDes
	mov	(_pDescr + 1),#(_SerDes >> 8)
;	App/core/USBhandler.c:122: len = SerDesLen;
	mov	dptr,#_SerDesLen
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	mov	a,#0x01
	movc	a,@a+dptr
	mov	r5,a
	mov	ar7,r4
;	App/core/USBhandler.c:124: break;
;	App/core/USBhandler.c:125: default:
	sjmp	00132$
00131$:
;	App/core/USBhandler.c:126: len = 0xff;                                                // Unsupported descriptors or error
	mov	r7,#0xff
;	App/core/USBhandler.c:128: }
00132$:
;	App/core/USBhandler.c:129: if (len != 0xff){
	cjne	r7,#0xff,00494$
	ljmp	00205$
00494$:
;	App/core/USBhandler.c:130: if ( SetupLen > len )
	mov	ar4,r7
	mov	r5,#0x00
	clr	c
	mov	a,r4
	subb	a,_SetupLen
	mov	a,r5
	subb	a,(_SetupLen + 1)
	jnc	00134$
;	App/core/USBhandler.c:132: SetupLen = len;    // Limit length
	mov	_SetupLen,r4
	mov	(_SetupLen + 1),r5
00134$:
;	App/core/USBhandler.c:134: len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;                            //transmit length for this packet
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x08
	mov	a,r5
	subb	a,#0x00
	jc	00217$
	mov	r2,#0x08
	mov	r3,#0x00
	sjmp	00218$
00217$:
	mov	r2,_SetupLen
	mov	r3,(_SetupLen + 1)
00218$:
	mov	ar7,r2
;	App/core/USBhandler.c:135: for (uint8_t i=0;i<len;i++){
	mov	r3,#0x00
00213$:
	clr	c
	mov	a,r3
	subb	a,r7
	jnc	00135$
;	App/core/USBhandler.c:136: Ep0Buffer[i] = pDescr[i];
	mov	a,r3
	add	a,#_Ep0Buffer
	mov	r1,a
	clr	a
	addc	a,#(_Ep0Buffer >> 8)
	mov	r2,a
	mov	a,r3
	add	a,_pDescr
	mov	dpl,a
	clr	a
	addc	a,(_pDescr + 1)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r0,a
	mov	dpl,r1
	mov	dph,r2
	movx	@dptr,a
;	App/core/USBhandler.c:135: for (uint8_t i=0;i<len;i++){
	inc	r3
	sjmp	00213$
00135$:
;	App/core/USBhandler.c:138: SetupLen -= len;
	mov	ar2,r7
	mov	r3,#0x00
	mov	a,r4
	clr	c
	subb	a,r2
	mov	r4,a
	mov	a,r5
	subb	a,r3
	mov	r5,a
	mov	_SetupLen,r4
	mov	(_SetupLen + 1),r5
;	App/core/USBhandler.c:139: pDescr += len;
	mov	a,r7
	add	a,_pDescr
	mov	_pDescr,a
	clr	a
	addc	a,(_pDescr + 1)
	mov	(_pDescr + 1),a
;	App/core/USBhandler.c:141: break;
	ljmp	00205$
;	App/core/USBhandler.c:142: case USB_SET_ADDRESS:
00138$:
;	App/core/USBhandler.c:143: SetupLen = UsbSetupBuf->wValueL;                              // Save the assigned address
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r5,a
	mov	_SetupLen,r5
	mov	(_SetupLen + 1),#0x00
;	App/core/USBhandler.c:144: break;
	ljmp	00205$
;	App/core/USBhandler.c:145: case USB_GET_CONFIGURATION:
00139$:
;	App/core/USBhandler.c:146: Ep0Buffer[0] = UsbConfig;
	mov	dptr,#_Ep0Buffer
	mov	a,_UsbConfig
	movx	@dptr,a
;	App/core/USBhandler.c:147: if ( SetupLen >= 1 )
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
	clr	c
	mov	a,r4
	subb	a,#0x01
	mov	a,r5
	subb	a,#0x00
	jnc	00498$
	ljmp	00205$
00498$:
;	App/core/USBhandler.c:149: len = 1;
	mov	r7,#0x01
;	App/core/USBhandler.c:151: break;
	ljmp	00205$
;	App/core/USBhandler.c:152: case USB_SET_CONFIGURATION:
00142$:
;	App/core/USBhandler.c:153: UsbConfig = UsbSetupBuf->wValueL;
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	_UsbConfig,a
;	App/core/USBhandler.c:154: break;
	ljmp	00205$
;	App/core/USBhandler.c:159: case USB_CLEAR_FEATURE:                                            //Clear Feature
00145$:
;	App/core/USBhandler.c:160: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )                  // Clear the device featuee.
	mov	a,r6
	anl	a,#0x1f
	jnz	00166$
;	App/core/USBhandler.c:162: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	cjne	r5,#0x01,00150$
	cjne	r4,#0x00,00150$
;	App/core/USBhandler.c:164: if( CfgDesc[ 7 ] & 0x20 )
	mov	dptr,#(_CfgDesc + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	jnb	acc.5,00503$
	ljmp	00205$
00503$:
;	App/core/USBhandler.c:170: len = 0xFF;                                        //Failed
	mov	r7,#0xff
	ljmp	00205$
00150$:
;	App/core/USBhandler.c:175: len = 0xFF;                                            //Failed
	mov	r7,#0xff
	ljmp	00205$
00166$:
;	App/core/USBhandler.c:178: else if ( ( UsbSetupBuf->bRequestType & USB_REQ_RECIP_MASK ) == USB_REQ_RECIP_ENDP )// endpoint
	mov	ar4,r6
	anl	ar4,#0x1f
	mov	r5,#0x00
	cjne	r4,#0x02,00163$
	cjne	r5,#0x00,00163$
;	App/core/USBhandler.c:180: switch( UsbSetupBuf->wIndexL )
	mov	dptr,#(_Ep0Buffer + 0x0004)
	movx	a,@dptr
	mov	r5,a
	cjne	r5,#0x01,00506$
	sjmp	00159$
00506$:
	cjne	r5,#0x02,00507$
	sjmp	00157$
00507$:
	cjne	r5,#0x03,00508$
	sjmp	00155$
00508$:
	cjne	r5,#0x04,00509$
	sjmp	00153$
00509$:
	cjne	r5,#0x81,00510$
	sjmp	00158$
00510$:
	cjne	r5,#0x82,00511$
	sjmp	00156$
00511$:
	cjne	r5,#0x83,00512$
	sjmp	00154$
00512$:
	cjne	r5,#0x84,00160$
;	App/core/USBhandler.c:183: UEP4_CTRL = UEP4_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP4_CTRL
	orl	a,#0x02
	mov	_UEP4_CTRL,a
;	App/core/USBhandler.c:184: break;
	ljmp	00205$
;	App/core/USBhandler.c:185: case 0x04:
00153$:
;	App/core/USBhandler.c:186: UEP4_CTRL = UEP4_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP4_CTRL,#0x73
;	App/core/USBhandler.c:187: break;
	ljmp	00205$
;	App/core/USBhandler.c:188: case 0x83:
00154$:
;	App/core/USBhandler.c:189: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP3_CTRL
	orl	a,#0x02
	mov	_UEP3_CTRL,a
;	App/core/USBhandler.c:190: break;
	ljmp	00205$
;	App/core/USBhandler.c:191: case 0x03:
00155$:
;	App/core/USBhandler.c:192: UEP3_CTRL = UEP3_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP3_CTRL,#0x73
;	App/core/USBhandler.c:193: break;
	ljmp	00205$
;	App/core/USBhandler.c:194: case 0x82:
00156$:
;	App/core/USBhandler.c:195: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP2_CTRL
	orl	a,#0x02
	mov	_UEP2_CTRL,a
;	App/core/USBhandler.c:196: break;
	ljmp	00205$
;	App/core/USBhandler.c:197: case 0x02:
00157$:
;	App/core/USBhandler.c:198: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP2_CTRL,#0x73
;	App/core/USBhandler.c:199: break;
	ljmp	00205$
;	App/core/USBhandler.c:200: case 0x81:
00158$:
;	App/core/USBhandler.c:201: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
;	App/core/USBhandler.c:202: break;
	ljmp	00205$
;	App/core/USBhandler.c:203: case 0x01:
00159$:
;	App/core/USBhandler.c:204: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP1_CTRL,#0x73
;	App/core/USBhandler.c:205: break;
	ljmp	00205$
;	App/core/USBhandler.c:206: default:
00160$:
;	App/core/USBhandler.c:207: len = 0xFF;                                         // Unsupported endpoint
	mov	r7,#0xff
;	App/core/USBhandler.c:209: }
	ljmp	00205$
00163$:
;	App/core/USBhandler.c:213: len = 0xFF;                                                // Unsupported for non-endpoint
	mov	r7,#0xff
;	App/core/USBhandler.c:215: break;
	ljmp	00205$
;	App/core/USBhandler.c:216: case USB_SET_FEATURE:                                          // Set Feature
00168$:
;	App/core/USBhandler.c:217: if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_DEVICE )                  // Set  the device featuee.
	mov	a,r6
	anl	a,#0x1f
	jnz	00192$
;	App/core/USBhandler.c:219: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x01 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	orl	ar5,a
	mov	a,r2
	orl	ar4,a
	cjne	r5,#0x01,00173$
	cjne	r4,#0x00,00173$
;	App/core/USBhandler.c:221: if( CfgDesc[ 7 ] & 0x20 )
	mov	dptr,#(_CfgDesc + 0x0007)
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	jnb	acc.5,00519$
	ljmp	00205$
00519$:
;	App/core/USBhandler.c:236: len = 0xFF;                                        // Failed
	mov	r7,#0xff
	ljmp	00205$
00173$:
;	App/core/USBhandler.c:241: len = 0xFF;                                            // Failed
	mov	r7,#0xff
	ljmp	00205$
00192$:
;	App/core/USBhandler.c:244: else if( ( UsbSetupBuf->bRequestType & 0x1F ) == USB_REQ_RECIP_ENDP )             //endpoint
	anl	ar6,#0x1f
	mov	r5,#0x00
	cjne	r6,#0x02,00520$
	cjne	r5,#0x00,00520$
	sjmp	00521$
00520$:
	ljmp	00189$
00521$:
;	App/core/USBhandler.c:246: if( ( ( ( uint16_t )UsbSetupBuf->wValueH << 8 ) | UsbSetupBuf->wValueL ) == 0x00 )
	mov	dptr,#(_Ep0Buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	mov	a,r6
	orl	a,r5
	jz	00522$
	ljmp	00186$
00522$:
;	App/core/USBhandler.c:248: switch( ( ( uint16_t )UsbSetupBuf->wIndexH << 8 ) | UsbSetupBuf->wIndexL )
	mov	dptr,#(_Ep0Buffer + 0x0005)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_Ep0Buffer + 0x0004)
	movx	a,@dptr
	mov	r4,a
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	cjne	r6,#0x01,00523$
	cjne	r5,#0x00,00523$
	ljmp	00182$
00523$:
	cjne	r6,#0x02,00524$
	cjne	r5,#0x00,00524$
	sjmp	00180$
00524$:
	cjne	r6,#0x03,00525$
	cjne	r5,#0x00,00525$
	sjmp	00178$
00525$:
	cjne	r6,#0x04,00526$
	cjne	r5,#0x00,00526$
	sjmp	00176$
00526$:
	cjne	r6,#0x81,00527$
	cjne	r5,#0x00,00527$
	sjmp	00181$
00527$:
	cjne	r6,#0x82,00528$
	cjne	r5,#0x00,00528$
	sjmp	00179$
00528$:
	cjne	r6,#0x83,00529$
	cjne	r5,#0x00,00529$
	sjmp	00177$
00529$:
	cjne	r6,#0x84,00183$
	cjne	r5,#0x00,00183$
;	App/core/USBhandler.c:251: UEP4_CTRL = UEP4_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint4 IN STALL 
	mov	a,#0xbf
	anl	a,_UEP4_CTRL
	orl	a,#0x03
	mov	_UEP4_CTRL,a
;	App/core/USBhandler.c:252: break;
;	App/core/USBhandler.c:253: case 0x04:
	sjmp	00205$
00176$:
;	App/core/USBhandler.c:254: UEP4_CTRL = UEP4_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint4 OUT Stall 
	mov	a,#0x7f
	anl	a,_UEP4_CTRL
	orl	a,#0x0c
	mov	_UEP4_CTRL,a
;	App/core/USBhandler.c:255: break;
;	App/core/USBhandler.c:256: case 0x83:
	sjmp	00205$
00177$:
;	App/core/USBhandler.c:257: UEP3_CTRL = UEP3_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint3 IN STALL 
	mov	a,#0xbf
	anl	a,_UEP3_CTRL
	orl	a,#0x03
	mov	_UEP3_CTRL,a
;	App/core/USBhandler.c:258: break;
;	App/core/USBhandler.c:259: case 0x03:
	sjmp	00205$
00178$:
;	App/core/USBhandler.c:260: UEP3_CTRL = UEP3_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint3 OUT Stall 
	mov	a,#0x7f
	anl	a,_UEP3_CTRL
	orl	a,#0x0c
	mov	_UEP3_CTRL,a
;	App/core/USBhandler.c:261: break;
;	App/core/USBhandler.c:262: case 0x82:
	sjmp	00205$
00179$:
;	App/core/USBhandler.c:263: UEP2_CTRL = UEP2_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint2 IN STALL 
	mov	a,#0xbf
	anl	a,_UEP2_CTRL
	orl	a,#0x03
	mov	_UEP2_CTRL,a
;	App/core/USBhandler.c:264: break;
;	App/core/USBhandler.c:265: case 0x02:
	sjmp	00205$
00180$:
;	App/core/USBhandler.c:266: UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint2 OUT Stall 
	mov	a,#0x7f
	anl	a,_UEP2_CTRL
	orl	a,#0x0c
	mov	_UEP2_CTRL,a
;	App/core/USBhandler.c:267: break;
;	App/core/USBhandler.c:268: case 0x81:
	sjmp	00205$
00181$:
;	App/core/USBhandler.c:269: UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set endpoint1 IN STALL 
	mov	a,#0xbf
	anl	a,_UEP1_CTRL
	orl	a,#0x03
	mov	_UEP1_CTRL,a
;	App/core/USBhandler.c:270: break;
;	App/core/USBhandler.c:271: case 0x01:
	sjmp	00205$
00182$:
;	App/core/USBhandler.c:272: UEP1_CTRL = UEP1_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set endpoint1 OUT Stall 
	mov	a,#0x7f
	anl	a,_UEP1_CTRL
	orl	a,#0x0c
	mov	_UEP1_CTRL,a
;	App/core/USBhandler.c:273: default:
00183$:
;	App/core/USBhandler.c:274: len = 0xFF;                                    // Failed
	mov	r7,#0xff
;	App/core/USBhandler.c:276: }
	sjmp	00205$
00186$:
;	App/core/USBhandler.c:280: len = 0xFF;                                      // Failed
	mov	r7,#0xff
	sjmp	00205$
00189$:
;	App/core/USBhandler.c:285: len = 0xFF;                                          // Failed
	mov	r7,#0xff
;	App/core/USBhandler.c:287: break;
;	App/core/USBhandler.c:288: case USB_GET_STATUS:
	sjmp	00205$
00194$:
;	App/core/USBhandler.c:289: Ep0Buffer[0] = 0x00;
	mov	dptr,#_Ep0Buffer
	clr	a
	movx	@dptr,a
;	App/core/USBhandler.c:290: Ep0Buffer[1] = 0x00;
	mov	dptr,#(_Ep0Buffer + 0x0001)
	movx	@dptr,a
;	App/core/USBhandler.c:291: if ( SetupLen >= 2 )
	mov	r5,_SetupLen
	mov	r6,(_SetupLen + 1)
	clr	c
	mov	a,r5
	subb	a,#0x02
	mov	a,r6
	subb	a,#0x00
	jc	00196$
;	App/core/USBhandler.c:293: len = 2;
	mov	r7,#0x02
	sjmp	00205$
00196$:
;	App/core/USBhandler.c:297: len = SetupLen;
	mov	r7,_SetupLen
;	App/core/USBhandler.c:299: break;
;	App/core/USBhandler.c:300: default:
	sjmp	00205$
00198$:
;	App/core/USBhandler.c:301: len = 0xff;                                                    // Failed
	mov	r7,#0xff
;	App/core/USBhandler.c:303: }
	sjmp	00205$
00204$:
;	App/core/USBhandler.c:308: len = 0xff;                                                         //Wrong packet length
	mov	r7,#0xff
00205$:
;	App/core/USBhandler.c:310: if(len == 0xff)
	cjne	r7,#0xff,00210$
;	App/core/USBhandler.c:312: SetupReq = 0xFF;
	mov	_SetupReq,#0xff
;	App/core/USBhandler.c:313: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;//STALL
	mov	_UEP0_CTRL,#0xcf
	ret
00210$:
;	App/core/USBhandler.c:315: else if(len <= DEFAULT_ENDP0_SIZE)                                                       // Tx data to host or send 0-length packet
	mov	a,r7
	add	a,#0xff - 0x08
	jc	00207$
;	App/core/USBhandler.c:317: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r7
;	App/core/USBhandler.c:318: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;//Expect DATA1, Answer ACK
	mov	_UEP0_CTRL,#0xc0
	ret
00207$:
;	App/core/USBhandler.c:322: UEP0_T_LEN = 0;  // Tx data to host or send 0-length packet
	mov	_UEP0_T_LEN,#0x00
;	App/core/USBhandler.c:323: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;//Expect DATA1, Answer ACK
	mov	_UEP0_CTRL,#0xc0
;	App/core/USBhandler.c:325: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_IN'
;------------------------------------------------------------
;len                       Allocated to registers r4 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	App/core/USBhandler.c:327: void USB_EP0_IN(){
;	-----------------------------------------
;	 function USB_EP0_IN
;	-----------------------------------------
_USB_EP0_IN:
;	App/core/USBhandler.c:328: switch(SetupReq)
	mov	a,#0x05
	cjne	a,_SetupReq,00134$
	sjmp	00103$
00134$:
	mov	a,#0x06
	cjne	a,_SetupReq,00104$
;	App/core/USBhandler.c:332: uint8_t len = SetupLen >= DEFAULT_ENDP0_SIZE ? DEFAULT_ENDP0_SIZE : SetupLen;                                 //send length
	mov	r6,_SetupLen
	mov	r7,(_SetupLen + 1)
	clr	c
	mov	a,r6
	subb	a,#0x08
	mov	a,r7
	subb	a,#0x00
	jc	00111$
	mov	r4,#0x08
	mov	r5,#0x00
	sjmp	00112$
00111$:
	mov	r4,_SetupLen
	mov	r5,(_SetupLen + 1)
00112$:
;	App/core/USBhandler.c:333: for (uint8_t i=0;i<len;i++){
	mov	r5,#0x00
00107$:
	clr	c
	mov	a,r5
	subb	a,r4
	jnc	00102$
;	App/core/USBhandler.c:334: Ep0Buffer[i] = pDescr[i];
	mov	a,r5
	add	a,#_Ep0Buffer
	mov	r2,a
	clr	a
	addc	a,#(_Ep0Buffer >> 8)
	mov	r3,a
	mov	a,r5
	add	a,_pDescr
	mov	dpl,a
	clr	a
	addc	a,(_pDescr + 1)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r1,a
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	App/core/USBhandler.c:333: for (uint8_t i=0;i<len;i++){
	inc	r5
	sjmp	00107$
00102$:
;	App/core/USBhandler.c:337: SetupLen -= len;
	mov	ar3,r4
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r3
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	mov	_SetupLen,r6
	mov	(_SetupLen + 1),r7
;	App/core/USBhandler.c:338: pDescr += len;
	mov	a,r4
	add	a,_pDescr
	mov	_pDescr,a
	clr	a
	addc	a,(_pDescr + 1)
	mov	(_pDescr + 1),a
;	App/core/USBhandler.c:339: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r4
;	App/core/USBhandler.c:340: UEP0_CTRL ^= bUEP_T_TOG;                    //Switch between DATA0 and DATA1
	mov	r6,_UEP0_CTRL
	xrl	ar6,#0x40
	mov	_UEP0_CTRL,r6
;	App/core/USBhandler.c:342: break;
;	App/core/USBhandler.c:343: case USB_SET_ADDRESS:
	ret
00103$:
;	App/core/USBhandler.c:344: USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
	mov	a,_USB_DEV_AD
	anl	a,#0x80
	mov	r7,a
	mov	a,_SetupLen
	orl	a,r7
	mov	_USB_DEV_AD,a
;	App/core/USBhandler.c:345: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	App/core/USBhandler.c:346: break;
;	App/core/USBhandler.c:347: default:
	ret
00104$:
;	App/core/USBhandler.c:348: UEP0_T_LEN = 0;                                                      // End of transaction
	mov	_UEP0_T_LEN,#0x00
;	App/core/USBhandler.c:349: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	App/core/USBhandler.c:351: }
;	App/core/USBhandler.c:352: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_OUT'
;------------------------------------------------------------
;	App/core/USBhandler.c:354: void USB_EP0_OUT(){
;	-----------------------------------------
;	 function USB_EP0_OUT
;	-----------------------------------------
_USB_EP0_OUT:
;	App/core/USBhandler.c:355: if(SetupReq ==SET_LINE_CODING)  //Set line coding
	mov	a,#0x20
	cjne	a,_SetupReq,00104$
;	App/core/USBhandler.c:357: if( U_TOG_OK )
	jnb	_U_TOG_OK,00106$
;	App/core/USBhandler.c:359: setLineCodingHandler();
	lcall	_setLineCodingHandler
;	App/core/USBhandler.c:360: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	App/core/USBhandler.c:361: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_ACK;  // send 0-length packet
	mov	_UEP0_CTRL,_UEP0_CTRL
	ret
00104$:
;	App/core/USBhandler.c:366: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	App/core/USBhandler.c:367: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;  //Respond Nak
	orl	_UEP0_CTRL,#0x02
00106$:
;	App/core/USBhandler.c:369: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP1_IN'
;------------------------------------------------------------
;	App/core/USBhandler.c:372: void USB_EP1_IN(){
;	-----------------------------------------
;	 function USB_EP1_IN
;	-----------------------------------------
_USB_EP1_IN:
;	App/core/USBhandler.c:373: UEP1_T_LEN = 0;
	mov	_UEP1_T_LEN,#0x00
;	App/core/USBhandler.c:374: UEP1_CTRL = UEP1_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;           // Default NAK
	mov	a,#0xfc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
;	App/core/USBhandler.c:375: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBInterrupt'
;------------------------------------------------------------
;callIndex                 Allocated to registers r7 
;------------------------------------------------------------
;	App/core/USBhandler.c:380: void USBInterrupt(void) {   //inline not really working in multiple files in SDCC
;	-----------------------------------------
;	 function USBInterrupt
;	-----------------------------------------
_USBInterrupt:
;	App/core/USBhandler.c:381: if(UIF_TRANSFER) {
	jb	_UIF_TRANSFER,00208$
	ljmp	00135$
00208$:
;	App/core/USBhandler.c:383: uint8_t callIndex=USB_INT_ST & MASK_UIS_ENDP;
	mov	a,_USB_INT_ST
	anl	a,#0x0f
	mov	r7,a
;	App/core/USBhandler.c:384: switch (USB_INT_ST & MASK_UIS_TOKEN) {
	mov	r5,_USB_INT_ST
	anl	ar5,#0x30
	mov	r6,#0x00
	cjne	r5,#0x00,00209$
	cjne	r6,#0x00,00209$
	sjmp	00101$
00209$:
	cjne	r5,#0x10,00210$
	cjne	r6,#0x00,00210$
	sjmp	00109$
00210$:
	cjne	r5,#0x20,00211$
	cjne	r6,#0x00,00211$
	sjmp	00117$
00211$:
	cjne	r5,#0x30,00212$
	cjne	r6,#0x00,00212$
	ljmp	00125$
00212$:
	ljmp	00133$
;	App/core/USBhandler.c:385: case UIS_TOKEN_OUT:
00101$:
;	App/core/USBhandler.c:387: switch (callIndex) {
	mov	a,r7
	add	a,#0xff - 0x04
	jnc	00213$
	ljmp	00133$
00213$:
	mov	a,r7
	add	a,r7
;	App/core/USBhandler.c:388: case 0: EP0_OUT_Callback(); break;
	mov	dptr,#00214$
	jmp	@a+dptr
00214$:
	sjmp	00102$
	sjmp	00133$
	sjmp	00104$
	sjmp	00133$
	sjmp	00133$
00102$:
	lcall	_USB_EP0_OUT
;	App/core/USBhandler.c:390: case 2: EP2_OUT_Callback(); break;
	sjmp	00133$
00104$:
	lcall	_USB_EP2_OUT
;	App/core/USBhandler.c:397: case UIS_TOKEN_SOF:
	sjmp	00133$
00109$:
;	App/core/USBhandler.c:399: switch (callIndex) {
	mov	a,r7
	add	a,#0xff - 0x04
	jc	00133$
	mov	a,r7
	add	a,r7
;	App/core/USBhandler.c:409: case UIS_TOKEN_IN:
	mov	dptr,#00216$
	jmp	@a+dptr
00216$:
	sjmp	00133$
	sjmp	00133$
	sjmp	00133$
	sjmp	00133$
	sjmp	00133$
00117$:
;	App/core/USBhandler.c:411: switch (callIndex) {
	mov	a,r7
	add	a,#0xff - 0x04
	jc	00133$
	mov	a,r7
	add	a,r7
;	App/core/USBhandler.c:412: case 0: EP0_IN_Callback(); break;
	mov	dptr,#00218$
	jmp	@a+dptr
00218$:
	sjmp	00118$
	sjmp	00119$
	sjmp	00120$
	sjmp	00133$
	sjmp	00133$
00118$:
	lcall	_USB_EP0_IN
;	App/core/USBhandler.c:413: case 1: EP1_IN_Callback(); break;
	sjmp	00133$
00119$:
	lcall	_USB_EP1_IN
;	App/core/USBhandler.c:414: case 2: EP2_IN_Callback(); break;
	sjmp	00133$
00120$:
	lcall	_USB_EP2_IN
;	App/core/USBhandler.c:421: case UIS_TOKEN_SETUP:
	sjmp	00133$
00125$:
;	App/core/USBhandler.c:423: switch (callIndex) {
	mov	a,r7
	add	a,#0xff - 0x04
	jc	00133$
	mov	a,r7
	add	a,r7
;	App/core/USBhandler.c:424: case 0: EP0_SETUP_Callback(); break;
	mov	dptr,#00220$
	jmp	@a+dptr
00220$:
	sjmp	00126$
	sjmp	00133$
	sjmp	00133$
	sjmp	00133$
	sjmp	00133$
00126$:
	lcall	_USB_EP0_SETUP
;	App/core/USBhandler.c:433: }
00133$:
;	App/core/USBhandler.c:435: UIF_TRANSFER = 0;                                                     // Clear interrupt flag
;	assignBit
	clr	_UIF_TRANSFER
00135$:
;	App/core/USBhandler.c:439: if(UIF_BUS_RST) {
	jnb	_UIF_BUS_RST,00137$
;	App/core/USBhandler.c:440: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	App/core/USBhandler.c:441: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;                //Endpoint 1 automatically flips the sync flag, and IN transaction returns NAK
	mov	_UEP1_CTRL,#0x12
;	App/core/USBhandler.c:442: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;        //Endpoint 2 automatically flips the sync flag, IN transaction returns NAK, OUT returns ACK
	mov	_UEP2_CTRL,#0x12
;	App/core/USBhandler.c:445: USB_DEV_AD = 0x00;
	mov	_USB_DEV_AD,#0x00
;	App/core/USBhandler.c:446: UIF_SUSPEND = 0;
;	assignBit
	clr	_UIF_SUSPEND
;	App/core/USBhandler.c:447: UIF_TRANSFER = 0;
;	assignBit
	clr	_UIF_TRANSFER
;	App/core/USBhandler.c:448: UIF_BUS_RST = 0;                                                        // Clear interrupt flag
;	assignBit
	clr	_UIF_BUS_RST
;	App/core/USBhandler.c:450: resetCDCParameters();
	lcall	_resetCDCParameters
00137$:
;	App/core/USBhandler.c:454: if (UIF_SUSPEND) {
;	App/core/USBhandler.c:455: UIF_SUSPEND = 0;
;	assignBit
	jbc	_UIF_SUSPEND,00222$
	ret
00222$:
;	App/core/USBhandler.c:456: if ( USB_MIS_ST & bUMS_SUSPEND ) {                    // Suspend
	mov	a,_USB_MIS_ST
	jb	acc.2,00157$
;	App/core/USBhandler.c:468: USB_INT_FG = 0xFF;        // Clear interrupt flag
	mov	_USB_INT_FG,#0xff
00157$:
;	App/core/USBhandler.c:471: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBDeviceCfg'
;------------------------------------------------------------
;	App/core/USBhandler.c:474: void USBDeviceCfg()
;	-----------------------------------------
;	 function USBDeviceCfg
;	-----------------------------------------
_USBDeviceCfg:
;	App/core/USBhandler.c:476: USB_CTRL = 0x00;                                                           //Clear USB control register
	mov	_USB_CTRL,#0x00
;	App/core/USBhandler.c:477: USB_CTRL &= ~bUC_HOST_MODE;                                                //This bit is the device selection mode
	anl	_USB_CTRL,#0x7f
;	App/core/USBhandler.c:478: USB_CTRL |=  bUC_DEV_PU_EN | bUC_INT_BUSY | bUC_DMA_EN;                    //USB device and internal pull-up enable, automatically return to NAK before interrupt flag is cleared during interrupt
	orl	_USB_CTRL,#0x29
;	App/core/USBhandler.c:479: USB_DEV_AD = 0x00;                                                         //Device address initialization
	mov	_USB_DEV_AD,#0x00
;	App/core/USBhandler.c:482: USB_CTRL &= ~bUC_LOW_SPEED;
	anl	_USB_CTRL,#0xbf
;	App/core/USBhandler.c:483: UDEV_CTRL &= ~bUD_LOW_SPEED;                                             //Select full speed 12M mode, default mode
	anl	_UDEV_CTRL,#0xfb
;	App/core/USBhandler.c:490: UDEV_CTRL |= bUD_PORT_EN;                                                  //Enable physical port
	orl	_UDEV_CTRL,#0x01
;	App/core/USBhandler.c:491: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBDeviceIntCfg'
;------------------------------------------------------------
;	App/core/USBhandler.c:493: void USBDeviceIntCfg()
;	-----------------------------------------
;	 function USBDeviceIntCfg
;	-----------------------------------------
_USBDeviceIntCfg:
;	App/core/USBhandler.c:495: USB_INT_EN |= bUIE_SUSPEND;                                               //Enable device hang interrupt
	orl	_USB_INT_EN,#0x04
;	App/core/USBhandler.c:496: USB_INT_EN |= bUIE_TRANSFER;                                              //Enable USB transfer completion interrupt
	orl	_USB_INT_EN,#0x02
;	App/core/USBhandler.c:497: USB_INT_EN |= bUIE_BUS_RST;                                               //Enable device mode USB bus reset interrupt
	orl	_USB_INT_EN,#0x01
;	App/core/USBhandler.c:498: USB_INT_FG |= 0x1F;                                                       //Clear interrupt flag
	orl	_USB_INT_FG,#0x1f
;	App/core/USBhandler.c:499: IE_USB = 1;                                                               //Enable USB interrupt
;	assignBit
	setb	_IE_USB
;	App/core/USBhandler.c:500: EA = 1;                                                                   //Enable global interrupts
;	assignBit
	setb	_EA
;	App/core/USBhandler.c:501: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBDeviceEndPointCfg'
;------------------------------------------------------------
;	App/core/USBhandler.c:503: void USBDeviceEndPointCfg()
;	-----------------------------------------
;	 function USBDeviceEndPointCfg
;	-----------------------------------------
_USBDeviceEndPointCfg:
;	App/core/USBhandler.c:505: UEP1_DMA = (uint16_t) Ep1Buffer;                                                      //Endpoint 1 data transfer address
	mov	r6,#_Ep1Buffer
	mov	r7,#(_Ep1Buffer >> 8)
	mov	((_UEP1_DMA >> 0) & 0xFF),r6
	mov	((_UEP1_DMA >> 8) & 0xFF),r7
;	App/core/USBhandler.c:506: UEP2_DMA = (uint16_t) Ep2Buffer;                                                      //Endpoint 2 data transfer address
	mov	r6,#_Ep2Buffer
	mov	r7,#(_Ep2Buffer >> 8)
	mov	((_UEP2_DMA >> 0) & 0xFF),r6
	mov	((_UEP2_DMA >> 8) & 0xFF),r7
;	App/core/USBhandler.c:507: UEP2_3_MOD = 0x0C;                                                         //Endpoint2 double buffer
	mov	_UEP2_3_MOD,#0x0c
;	App/core/USBhandler.c:508: UEP1_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK;                //Endpoint 1 automatically flips the sync flag, and IN transaction returns NAK
	mov	_UEP1_CTRL,#0x12
;	App/core/USBhandler.c:509: UEP2_CTRL = bUEP_AUTO_TOG | UEP_T_RES_NAK | UEP_R_RES_ACK;        //Endpoint 2 automatically flips the sync flag, IN transaction returns NAK, OUT returns ACK
	mov	_UEP2_CTRL,#0x12
;	App/core/USBhandler.c:511: UEP0_DMA = (uint16_t) Ep0Buffer;                                                      //Endpoint 0 data transfer address
	mov	r6,#_Ep0Buffer
	mov	r7,#(_Ep0Buffer >> 8)
	mov	((_UEP0_DMA >> 0) & 0xFF),r6
	mov	((_UEP0_DMA >> 8) & 0xFF),r7
;	App/core/USBhandler.c:512: UEP4_1_MOD = 0X40;                                                         //endpoint1 TX enable
	mov	_UEP4_1_MOD,#0x40
;	App/core/USBhandler.c:513: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;                //Manual flip, OUT transaction returns ACK, IN transaction returns NAK
	mov	_UEP0_CTRL,#0x02
;	App/core/USBhandler.c:514: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
