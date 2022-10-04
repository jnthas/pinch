;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module USBCDC
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _USB_EP2_OUT
	.globl _USB_EP2_IN
	.globl _USBSerial_read
	.globl _USBSerial_available
	.globl _USBSerial_print_n
	.globl _USBSerial_write
	.globl _USBSerial_flush
	.globl _USBSerial
	.globl _setControlLineStateHandler
	.globl _getLineCodingHandler
	.globl _setLineCodingHandler
	.globl _resetCDCParameters
	.globl _USBInit
	.globl _mDelayuS
	.globl _USBDeviceEndPointCfg
	.globl _USBDeviceIntCfg
	.globl _USBDeviceCfg
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
	.globl _usbWritePointer
	.globl _controlLineState
	.globl _UpPoint2_Busy
	.globl _USBBufOutPointEP2
	.globl _USBByteCountEP2
	.globl _LineCoding
	.globl _USBSerial_print_n_PARM_2
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
_setControlLineStateHandler_tasksArr_131072_13:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
_USBSerial_print_n_PARM_2:
	.ds 2
_USBSerial_print_n_buf_65536_25:
	.ds 3
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_LineCoding::
	.ds 7
_USBByteCountEP2::
	.ds 1
_USBBufOutPointEP2::
	.ds 1
_UpPoint2_Busy::
	.ds 1
_controlLineState::
	.ds 1
_usbWritePointer::
	.ds 1
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
;Allocation info for local variables in function 'USBInit'
;------------------------------------------------------------
;	App/core/USBCDC.c:26: void USBInit(){
;	-----------------------------------------
;	 function USBInit
;	-----------------------------------------
_USBInit:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	App/core/USBCDC.c:27: USBDeviceCfg();                                                       //Device mode configuration
	lcall	_USBDeviceCfg
;	App/core/USBCDC.c:28: USBDeviceEndPointCfg();                                               //Endpoint configuration   
	lcall	_USBDeviceEndPointCfg
;	App/core/USBCDC.c:29: USBDeviceIntCfg();                                                    //Interrupt configuration    
	lcall	_USBDeviceIntCfg
;	App/core/USBCDC.c:30: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	App/core/USBCDC.c:31: UEP1_T_LEN = 0;                                                       //Pre-use send length must be cleared	  
	mov	_UEP1_T_LEN,#0x00
;	App/core/USBCDC.c:32: UEP2_T_LEN = 0;                                                          
	mov	_UEP2_T_LEN,#0x00
;	App/core/USBCDC.c:33: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'resetCDCParameters'
;------------------------------------------------------------
;	App/core/USBCDC.c:35: void resetCDCParameters(){
;	-----------------------------------------
;	 function resetCDCParameters
;	-----------------------------------------
_resetCDCParameters:
;	App/core/USBCDC.c:37: USBByteCountEP2 = 0;       //Bytes of received data on USB endpoint
	mov	dptr,#_USBByteCountEP2
	clr	a
	movx	@dptr,a
;	App/core/USBCDC.c:38: UpPoint2_Busy = 0;
	mov	dptr,#_UpPoint2_Busy
	movx	@dptr,a
;	App/core/USBCDC.c:39: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setLineCodingHandler'
;------------------------------------------------------------
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	App/core/USBCDC.c:41: void setLineCodingHandler(){
;	-----------------------------------------
;	 function setLineCodingHandler
;	-----------------------------------------
_setLineCodingHandler:
;	App/core/USBCDC.c:42: for (uint8_t i=0;i<((LINE_CODEING_SIZE<=USB_RX_LEN)?LINE_CODEING_SIZE:USB_RX_LEN);i++){
	mov	r7,#0x00
00103$:
	mov	a,#0x100 - 0x07
	add	a,_USB_RX_LEN
	jnc	00107$
	mov	r5,#0x07
	mov	r6,#0x00
	sjmp	00108$
00107$:
	mov	r5,_USB_RX_LEN
	mov	r6,#0x00
00108$:
	mov	ar3,r7
	mov	r4,#0x00
	clr	c
	mov	a,r3
	subb	a,r5
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jnc	00105$
;	App/core/USBCDC.c:43: LineCoding[i] = Ep0Buffer[i];
	mov	a,r7
	add	a,#_LineCoding
	mov	r5,a
	clr	a
	addc	a,#(_LineCoding >> 8)
	mov	r6,a
	mov	a,r7
	add	a,#_Ep0Buffer
	mov	dpl,a
	clr	a
	addc	a,#(_Ep0Buffer >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	App/core/USBCDC.c:42: for (uint8_t i=0;i<((LINE_CODEING_SIZE<=USB_RX_LEN)?LINE_CODEING_SIZE:USB_RX_LEN);i++){
	inc	r7
	sjmp	00103$
00105$:
;	App/core/USBCDC.c:47: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getLineCodingHandler'
;------------------------------------------------------------
;returnLen                 Allocated to registers 
;i                         Allocated to registers r7 
;------------------------------------------------------------
;	App/core/USBCDC.c:49: uint16_t getLineCodingHandler(){
;	-----------------------------------------
;	 function getLineCodingHandler
;	-----------------------------------------
_getLineCodingHandler:
;	App/core/USBCDC.c:53: for (uint8_t i=0;i<returnLen;i++){
	mov	r7,#0x00
00103$:
	mov	ar5,r7
	mov	r6,#0x00
	clr	c
	mov	a,r5
	subb	a,#0x07
	mov	a,r6
	subb	a,#0x00
	jnc	00101$
;	App/core/USBCDC.c:54: Ep0Buffer[i] = LineCoding[i];
	mov	a,r7
	add	a,#_Ep0Buffer
	mov	r5,a
	clr	a
	addc	a,#(_Ep0Buffer >> 8)
	mov	r6,a
	mov	a,r7
	add	a,#_LineCoding
	mov	dpl,a
	clr	a
	addc	a,#(_LineCoding >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	App/core/USBCDC.c:53: for (uint8_t i=0;i<returnLen;i++){
	inc	r7
	sjmp	00103$
00101$:
;	App/core/USBCDC.c:57: return returnLen;
	mov	dptr,#0x0007
;	App/core/USBCDC.c:58: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setControlLineStateHandler'
;------------------------------------------------------------
;tasksArr                  Allocated with name '_setControlLineStateHandler_tasksArr_131072_13'
;------------------------------------------------------------
;	App/core/USBCDC.c:60: void setControlLineStateHandler(){
;	-----------------------------------------
;	 function setControlLineStateHandler
;	-----------------------------------------
_setControlLineStateHandler:
;	App/core/USBCDC.c:61: controlLineState = Ep0Buffer[2];
	mov	dptr,#(_Ep0Buffer + 0x0002)
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_controlLineState
	movx	@dptr,a
;	App/core/USBCDC.c:64: if ( ((controlLineState & 0x01) == 0) && (*((__xdata uint32_t *)LineCoding) == 1200) ){ //both linecoding and sdcc are little-endian
	movx	a,@dptr
	jb	acc.0,00104$
	mov	dptr,#_LineCoding
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
	cjne	r4,#0xb0,00104$
	cjne	r5,#0x04,00104$
	cjne	r6,#0x00,00104$
	cjne	r7,#0x00,00104$
;	App/core/USBCDC.c:66: USB_CTRL = 0;
	mov	_USB_CTRL,#0x00
;	App/core/USBCDC.c:67: EA = 0;                                                                    //Disabling all interrupts is required.
;	assignBit
	clr	_EA
;	App/core/USBCDC.c:68: TMOD = 0;
	mov	_TMOD,#0x00
;	App/core/USBCDC.c:69: tasksArr[0] = (pTaskFn)0x3800;
	mov	(_setControlLineStateHandler_tasksArr_131072_13 + 0),#0x00
	mov	(_setControlLineStateHandler_tasksArr_131072_13 + 1),#0x38
;	App/core/USBCDC.c:70: mDelayuS(50000);
	mov	dptr,#0xc350
	lcall	_mDelayuS
;	App/core/USBCDC.c:71: mDelayuS(50000);
	mov	dptr,#0xc350
	lcall	_mDelayuS
;	App/core/USBCDC.c:72: (tasksArr[0])( );                                                          //Jump to bootloader code
	mov	r6,(_setControlLineStateHandler_tasksArr_131072_13 + 0)
	mov	r7,(_setControlLineStateHandler_tasksArr_131072_13 + 1)
	push	ar7
	push	ar6
	mov	dpl,r6
	mov	dph,r7
	lcall	__sdcc_call_dptr
	pop	ar6
	pop	ar7
00104$:
;	App/core/USBCDC.c:76: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial'
;------------------------------------------------------------
;result                    Allocated to registers r7 
;------------------------------------------------------------
;	App/core/USBCDC.c:78: bool USBSerial(){
;	-----------------------------------------
;	 function USBSerial
;	-----------------------------------------
_USBSerial:
;	App/core/USBCDC.c:79: bool result = false;
	mov	r7,#0x00
;	App/core/USBCDC.c:80: if (controlLineState > 0) 
	mov	dptr,#_controlLineState
	movx	a,@dptr
	jz	00102$
;	App/core/USBCDC.c:81: result = true;
	mov	r7,#0x01
00102$:
;	App/core/USBCDC.c:83: return result;
	mov	dpl,r7
;	App/core/USBCDC.c:84: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial_flush'
;------------------------------------------------------------
;	App/core/USBCDC.c:87: void USBSerial_flush(void){
;	-----------------------------------------
;	 function USBSerial_flush
;	-----------------------------------------
_USBSerial_flush:
;	App/core/USBCDC.c:88: if (!UpPoint2_Busy && usbWritePointer>0){
	mov	dptr,#_UpPoint2_Busy
	movx	a,@dptr
	jnz	00104$
	mov	dptr,#_usbWritePointer
	movx	a,@dptr
	mov	r7,a
	movx	a,@dptr
	jz	00104$
;	App/core/USBCDC.c:89: UEP2_T_LEN = usbWritePointer;                                                   
	mov	_UEP2_T_LEN,r7
;	App/core/USBCDC.c:90: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_ACK;            //Respond ACK
	anl	_UEP2_CTRL,#0xfc
;	App/core/USBCDC.c:91: UpPoint2_Busy = 1;
	mov	dptr,#_UpPoint2_Busy
	mov	a,#0x01
	movx	@dptr,a
;	App/core/USBCDC.c:92: usbWritePointer = 0;
	mov	dptr,#_usbWritePointer
	clr	a
	movx	@dptr,a
00104$:
;	App/core/USBCDC.c:94: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial_write'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;waitWriteCount            Allocated to registers r5 r6 
;------------------------------------------------------------
;	App/core/USBCDC.c:96: uint8_t USBSerial_write(char c){  //3 bytes generic pointer
;	-----------------------------------------
;	 function USBSerial_write
;	-----------------------------------------
_USBSerial_write:
	mov	r7,dpl
;	App/core/USBCDC.c:98: if (controlLineState > 0) {
	mov	dptr,#_controlLineState
	movx	a,@dptr
	jz	00113$
;	App/core/USBCDC.c:101: while (UpPoint2_Busy){//wait for 250ms or give up, on my mac it takes about 256us
00117$:
	mov	r5,#0x00
	mov	r6,#0x00
00103$:
	mov	dptr,#_UpPoint2_Busy
	movx	a,@dptr
	jz	00105$
;	App/core/USBCDC.c:102: waitWriteCount++;
	inc	r5
	cjne	r5,#0x00,00138$
	inc	r6
00138$:
;	App/core/USBCDC.c:103: mDelayuS(5);
	mov	dptr,#0x0005
	push	ar7
	push	ar6
	push	ar5
	lcall	_mDelayuS
	pop	ar5
	pop	ar6
	pop	ar7
;	App/core/USBCDC.c:104: if (waitWriteCount>=50000) return 0;
	clr	c
	mov	a,r5
	subb	a,#0x50
	mov	a,r6
	subb	a,#0xc3
	jc	00103$
	mov	dpl,#0x00
	ret
00105$:
;	App/core/USBCDC.c:106: if (usbWritePointer<MAX_PACKET_SIZE){
	mov	dptr,#_usbWritePointer
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x40,00140$
00140$:
	jnc	00107$
;	App/core/USBCDC.c:107: Ep2Buffer[MAX_PACKET_SIZE+usbWritePointer] = c;
	mov	r5,#0x00
	mov	a,#0x40
	add	a,r6
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r5,a
	mov	a,r6
	add	a,#_Ep2Buffer
	mov	dpl,a
	mov	a,r5
	addc	a,#(_Ep2Buffer >> 8)
	mov	dph,a
	mov	a,r7
	movx	@dptr,a
;	App/core/USBCDC.c:108: usbWritePointer++;
	mov	dptr,#_usbWritePointer
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	App/core/USBCDC.c:109: return 1;
	mov	dpl,#0x01
	ret
00107$:
;	App/core/USBCDC.c:111: USBSerial_flush();  //go back to first while
	push	ar7
	lcall	_USBSerial_flush
	pop	ar7
	sjmp	00117$
00113$:
;	App/core/USBCDC.c:115: return 0;
	mov	dpl,#0x00
;	App/core/USBCDC.c:116: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial_print_n'
;------------------------------------------------------------
;waitWriteCount            Allocated to registers r6 r7 
;len                       Allocated with name '_USBSerial_print_n_PARM_2'
;buf                       Allocated with name '_USBSerial_print_n_buf_65536_25'
;------------------------------------------------------------
;	App/core/USBCDC.c:118: uint8_t USBSerial_print_n(uint8_t * __xdata buf, __xdata int len){  //3 bytes generic pointer, not using USBSerial_write for a bit efficiency
;	-----------------------------------------
;	 function USBSerial_print_n
;	-----------------------------------------
_USBSerial_print_n:
	mov	r7,b
	mov	r6,dph
	mov	a,dpl
	mov	dptr,#_USBSerial_print_n_buf_65536_25
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
;	App/core/USBCDC.c:120: if (controlLineState > 0) {
	mov	dptr,#_controlLineState
	movx	a,@dptr
	jnz	00154$
	ljmp	00116$
00154$:
;	App/core/USBCDC.c:121: while (len>0){
00112$:
	mov	dptr,#_USBSerial_print_n_PARM_2
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	clr	c
	clr	a
	subb	a,r6
	mov	a,#(0x00 ^ 0x80)
	mov	b,r7
	xrl	b,#0x80
	subb	a,b
	jc	00155$
	ljmp	00116$
00155$:
;	App/core/USBCDC.c:123: while (UpPoint2_Busy){//wait for 250ms or give up, on my mac it takes about 256us
	mov	r6,#0x00
	mov	r7,#0x00
00103$:
	mov	dptr,#_UpPoint2_Busy
	movx	a,@dptr
	jz	00126$
;	App/core/USBCDC.c:124: waitWriteCount++;
	inc	r6
	cjne	r6,#0x00,00157$
	inc	r7
00157$:
;	App/core/USBCDC.c:125: mDelayuS(5);   
	mov	dptr,#0x0005
	push	ar7
	push	ar6
	lcall	_mDelayuS
	pop	ar6
	pop	ar7
;	App/core/USBCDC.c:126: if (waitWriteCount>=50000) return 0;
	clr	c
	mov	a,r6
	subb	a,#0x50
	mov	a,r7
	subb	a,#0xc3
	jc	00103$
	mov	dpl,#0x00
	ret
;	App/core/USBCDC.c:128: while (len>0){
00126$:
	mov	dptr,#_USBSerial_print_n_buf_65536_25
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_USBSerial_print_n_PARM_2
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
00109$:
	clr	c
	clr	a
	subb	a,r3
	mov	a,#(0x00 ^ 0x80)
	mov	b,r4
	xrl	b,#0x80
	subb	a,b
	jnc	00112$
;	App/core/USBCDC.c:129: if (usbWritePointer<MAX_PACKET_SIZE){
	mov	dptr,#_usbWritePointer
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00160$
00160$:
	jnc	00107$
;	App/core/USBCDC.c:130: Ep2Buffer[MAX_PACKET_SIZE+usbWritePointer] = *buf++;
	mov	ar1,r2
	mov	r2,#0x00
	mov	a,#0x40
	add	a,r1
	mov	r1,a
	clr	a
	addc	a,r2
	mov	r2,a
	mov	a,r1
	add	a,#_Ep2Buffer
	mov	r1,a
	mov	a,r2
	addc	a,#(_Ep2Buffer >> 8)
	mov	r2,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r0,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	dptr,#_USBSerial_print_n_buf_65536_25
	mov	a,r5
	movx	@dptr,a
	mov	a,r6
	inc	dptr
	movx	@dptr,a
	mov	a,r7
	inc	dptr
	movx	@dptr,a
	mov	dpl,r1
	mov	dph,r2
	mov	a,r0
	movx	@dptr,a
;	App/core/USBCDC.c:131: usbWritePointer++;
	mov	dptr,#_usbWritePointer
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	App/core/USBCDC.c:132: len--;
	dec	r3
	cjne	r3,#0xff,00162$
	dec	r4
00162$:
	mov	dptr,#_USBSerial_print_n_PARM_2
	mov	a,r3
	movx	@dptr,a
	mov	a,r4
	inc	dptr
	movx	@dptr,a
	sjmp	00109$
00107$:
;	App/core/USBCDC.c:134: USBSerial_flush();  //go back to first while
	lcall	_USBSerial_flush
;	App/core/USBCDC.c:135: break;
	ljmp	00112$
00116$:
;	App/core/USBCDC.c:140: return 0;
	mov	dpl,#0x00
;	App/core/USBCDC.c:141: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial_available'
;------------------------------------------------------------
;	App/core/USBCDC.c:143: uint8_t USBSerial_available(){
;	-----------------------------------------
;	 function USBSerial_available
;	-----------------------------------------
_USBSerial_available:
;	App/core/USBCDC.c:144: return USBByteCountEP2;
	mov	dptr,#_USBByteCountEP2
	movx	a,@dptr
;	App/core/USBCDC.c:145: }
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USBSerial_read'
;------------------------------------------------------------
;data                      Allocated to registers r7 
;------------------------------------------------------------
;	App/core/USBCDC.c:147: char USBSerial_read(){
;	-----------------------------------------
;	 function USBSerial_read
;	-----------------------------------------
_USBSerial_read:
;	App/core/USBCDC.c:148: if(USBByteCountEP2==0) return 0;
	mov	dptr,#_USBByteCountEP2
	movx	a,@dptr
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	App/core/USBCDC.c:149: char data = Ep2Buffer[USBBufOutPointEP2];
	mov	dptr,#_USBBufOutPointEP2
	movx	a,@dptr
	add	a,#_Ep2Buffer
	mov	dpl,a
	clr	a
	addc	a,#(_Ep2Buffer >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
;	App/core/USBCDC.c:150: USBBufOutPointEP2++;
	mov	dptr,#_USBBufOutPointEP2
	movx	a,@dptr
	inc	a
	movx	@dptr,a
;	App/core/USBCDC.c:151: USBByteCountEP2--;
	mov	dptr,#_USBByteCountEP2
	movx	a,@dptr
	dec	a
	movx	@dptr,a
;	App/core/USBCDC.c:152: if(USBByteCountEP2==0) {
	movx	a,@dptr
	jnz	00104$
;	App/core/USBCDC.c:153: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_ACK;
	anl	_UEP2_CTRL,#0xf3
00104$:
;	App/core/USBCDC.c:155: return data;
	mov	dpl,r7
;	App/core/USBCDC.c:156: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP2_IN'
;------------------------------------------------------------
;	App/core/USBCDC.c:158: void USB_EP2_IN(){
;	-----------------------------------------
;	 function USB_EP2_IN
;	-----------------------------------------
_USB_EP2_IN:
;	App/core/USBCDC.c:159: UEP2_T_LEN = 0;                                                    // No data to send anymore
	mov	_UEP2_T_LEN,#0x00
;	App/core/USBCDC.c:160: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_T_RES | UEP_T_RES_NAK;           //Respond NAK by default
	mov	a,#0xfc
	anl	a,_UEP2_CTRL
	orl	a,#0x02
	mov	_UEP2_CTRL,a
;	App/core/USBCDC.c:161: UpPoint2_Busy = 0;                                                  //Clear busy flag
	mov	dptr,#_UpPoint2_Busy
	clr	a
	movx	@dptr,a
;	App/core/USBCDC.c:162: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP2_OUT'
;------------------------------------------------------------
;	App/core/USBCDC.c:164: void USB_EP2_OUT(){
;	-----------------------------------------
;	 function USB_EP2_OUT
;	-----------------------------------------
_USB_EP2_OUT:
;	App/core/USBCDC.c:165: if ( U_TOG_OK )                                                     // Discard unsynchronized packets
	jnb	_U_TOG_OK,00105$
;	App/core/USBCDC.c:167: USBByteCountEP2 = USB_RX_LEN;
	mov	dptr,#_USBByteCountEP2
	mov	a,_USB_RX_LEN
	movx	@dptr,a
;	App/core/USBCDC.c:168: USBBufOutPointEP2 = 0;                                             //Reset Data pointer for fetching
	mov	dptr,#_USBBufOutPointEP2
	clr	a
	movx	@dptr,a
;	App/core/USBCDC.c:169: if (USBByteCountEP2)    
	mov	dptr,#_USBByteCountEP2
	movx	a,@dptr
	jz	00105$
;	App/core/USBCDC.c:170: UEP2_CTRL = UEP2_CTRL & ~ MASK_UEP_R_RES | UEP_R_RES_NAK;       //Respond NAK after a packet. Let main code change response after handling.
	mov	a,#0xf3
	anl	a,_UEP2_CTRL
	orl	a,#0x08
	mov	_UEP2_CTRL,a
00105$:
;	App/core/USBCDC.c:172: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
__xinit__LineCoding:
	.db #0x00	; 0
	.db #0xe1	; 225
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
__xinit__USBByteCountEP2:
	.db #0x00	; 0
__xinit__USBBufOutPointEP2:
	.db #0x00	; 0
__xinit__UpPoint2_Busy:
	.db #0x00	; 0
__xinit__controlLineState:
	.db #0x00	; 0
__xinit__usbWritePointer:
	.db #0x00	; 0
	.area CABS    (ABS,CODE)
