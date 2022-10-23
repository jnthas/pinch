/********************************** (C) COPYRIGHT *******************************
* File Name          : Debug.C
* Author             : WCH
* Version            : V1.0
* Date               : 2017/01/20
* Description        : CH554 DEBUG Interface
                     CH554 main frequency modification, delay function definition
                     Serial port 0 and serial port 1 initialization
                     Serial port 0 and serial port 1 transceiver subfunctions
                     Watchdog initialization			 
*******************************************************************************/

#include <stdint.h>

#include "ch552.h"
#include "debug.h"

/*******************************************************************************
* Function Name  : CfgFsys( )
* Description  : CH554 clock selection and configuration function, Fsys 6MHz is used by default, FREQ_SYS can be passed
                 CLOCK_CFG configuration, the formula is as follows:
                 Fsys = (Fosc * 4 / (CLOCK_CFG & MASK_SYS_CK_SEL); the specific clock needs to be configured by yourself
*******************************************************************************/
void CfgFsys()
{
	SAFE_MOD = 0x55;
	SAFE_MOD = 0xAA;
	CLOCK_CFG = CLOCK_CFG & ~MASK_SYS_CK_SEL | 0x06; // 24MHz
	SAFE_MOD = 0x00;
}

/*******************************************************************************
* Function Name  : mDelayus(UNIT16 n)
* Description    : us delay function
* Input          : UNIT16 n
* Output         : None
* Return         : None
*******************************************************************************/
void mDelayuS(uint16_t n) // Delay in uS
{
	while (n)
	{				// total = 12~13 Fsys cycles, 1uS @Fsys=12MHz
		++SAFE_MOD; // 2 Fsys cycles, for higher Fsys, add operation here
		++SAFE_MOD; 
		++SAFE_MOD;
		++SAFE_MOD;
		--n;
	}
}

/*******************************************************************************
* Function Name  : mDelayms(UNIT16 n)
* Description    : ms delay function
* Input          : UNIT16 n
* Output         : None
* Return         : None
*******************************************************************************/
void mDelaymS(uint16_t n) // Delay in mS
{
	while (n)
	{
		mDelayuS(1000);
		--n;
	}
}
