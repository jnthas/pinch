/********************************** (C) COPYRIGHT *******************************
* File Name          : SPI.C
* Author             : WCH
* Version            : V1.0
* Date               : 2017/01/20
* Description : CH554 SPI master and slave mode interface function
Note: When the chip selection is valid, the slave will automatically load the preset value of SPI0_S_PRE into the transmit shift buffer, so it is best to select the
Write the pre-transmitted value to the SPI0_S_PRE register before valid, or discard the first received byte at the host side. When sending, note that the host will first
Take the value in SPI0_S_PRE to generate an S0_IF_BYTE interrupt.
If the chip selection changes from invalid to valid, and the slave sends first, it is best to put the first byte of the output in the SPI0_S_PRE register;
If the chip selection is already valid, the data data can use SPI0_DATA
*******************************************************************************/


#include <ch554.h>
#include <stdint.h>
#include "spi.h" 

/*******************************************************************************
* Function Name  : SPIMasterModeSet( uint8_t mode )
* Description : SPI master mode initialization
* Input          : uint8_t mode						 
* Output         : None
* Return         : None
*******************************************************************************/
void SPIMasterModeSet(uint8_t mode)
{
    SPI0_SETUP &= ~bS0_MODE_SLV;                                               // Master mode
    if(mode == 0){
      SPI0_CTRL = SPI0_CTRL & ~(bS0_MST_CLK | bS0_CLR_ALL) | bS0_MOSI_OE | bS0_SCK_OE;//模式0			
    }			
    else if(mode == 3){
      SPI0_CTRL = SPI0_CTRL & ~bS0_CLR_ALL | bS0_MST_CLK | bS0_MOSI_OE | bS0_SCK_OE;//模式3
    }			
    SPI0_CTRL &= ~bS0_MISO_OE;
    P1_MOD_OC &= 0x0F;
    P1_DIR_PU |= 0xB0 ;                                                         // SCS,MOSI,SCK set push-pull output
    P1_DIR_PU &= 0xBF ;                                                         // MISO set floating input
}

/*******************************************************************************
* Function Name  : CH554SPIInterruptInit()
* Description : CH554SPI interrupt initialization
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPIInterruptInit()
{
    // IP_EX |= bIP_SPI0; //SPI0 interrupt priority setting
    SPI0_SETUP |= bS0_IE_FIFO_OV | bS0_IE_BYTE;                                 // Enable receive 1 byte interrupt, enable FIFO overflow interrupt
    SPI0_CTRL |= bS0_AUTO_IF;                                                   // Automatically clear S0_IF_BYTE interrupt flag
    SPI0_STAT |= 0xff ;                                                          // Clear the SPI0 interrupt flag
#ifdef SPI_Interrupt
    IE_SPI0 = 1 ;                                                                // Enable SPI0 interrupt
#endif
}

/*******************************************************************************
* Function Name  : CH554SPIMasterWrite(uint8_t dat)
* Description : CH554 hardware SPI write data, master mode
* Input : uint8_t dat data
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPIMasterWrite(uint8_t dat)
{
    SPI0_DATA = dat;
    while (S0_FREE == 0 );													    // Wait for the transfer to complete		
// If bS0_DATA_DIR is 1, one byte of data can be directly read here for fast read and write	
}

/*******************************************************************************
* Function Name  : CH554SPIMasterRead( )
* Description : CH554 hardware SPI0 read data, host mode
* Input          : None
* Output         : None
* Return : uint8_t right   
*******************************************************************************/
uint8_t CH554SPIMasterRead()
{
    SPI0_DATA = 0xff;
    while(S0_FREE == 0);
    return SPI0_DATA;
}

/*******************************************************************************
* Function Name  : SPISlvModeSet( )
* Description : SPI slave mode initialization
* Input          : None						 
* Output         : None
* Return         : None
*******************************************************************************/
void  SPISlvModeSet()
{
    SPI0_SETUP |= bS0_MODE_SLV;                                                // Slv mode
    SPI0_CTRL = SPI0_CTRL & ~( bS0_CLR_ALL | bS0_MOSI_OE | bS0_MISO_OE | bS0_SCK_OE) | bS0_AUTO_IF; // Read and write FIFO, automatically clear S0_IF_BYTE flag
    P1_MOD_OC &= 0x0F;
    P1_DIR_PU &= 0x0F ;                                                         // SCS,MOSI,SCK,MISO all set floating input
}

/*******************************************************************************
* Function Name  : CH554SPISlvWrite(uint8_t dat)
* Description : CH554 hardware SPI write data, slave mode
* Input : uint8_t dat data
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPISlvWrite(uint8_t dat)
{
    while(S0_IF_BYTE);
    S0_IF_BYTE = 0;
    SPI0_DATA = dat;
}

/*******************************************************************************
* Function Name  : CH554SPISlvRead( )
* Description : CH554 hardware SPI0 read data, slave mode
* Input          : None
* Output         : None
* Return : uint8_t right   
*******************************************************************************/
uint8_t CH554SPISlvRead()
{
    while(S0_IF_BYTE);
    S0_IF_BYTE = 0;	
    return SPI0_DATA;
}

#if SPI_Interrupt
/*******************************************************************************
* Function Name  : ADCInterrupt(void)
* Description : ADC interrupt service routine
*******************************************************************************/
void 	SPIInterrupt ( void ) interrupt INT_NO_SPI0 using 1                        // SPI interrupt service routine, use register set 1
{ 
}
#endif