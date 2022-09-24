#pragma once

#include <stdint.h>

// #define SPI_INTERRUPT   1

#define  SPI_CK_SET( n ) (SPI0_CK_SE = n)                                     //SPIÊ±ÖÓÉèÖÃº¯Êý 

#define SPIMasterAssertCS() (SCS = 0)
#define SPIMasterDeassertCS() (SCS = 1)


/*******************************************************************************
* Function Name  : SPIMasterModeSet( uint8_t mode ) 
* Description : SPI master mode initialization
* Input          : uint8_t_t mode						 
* Output         : None
* Return         : None
*******************************************************************************/
void SPIMasterModeSet(uint8_t mode);

/*******************************************************************************
* Function Name  : CH554SPIInterruptInit()
* Description : CH554SPI interrupt initialization
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPIInterruptInit(void);

/*******************************************************************************
* Function Name  : CH554SPIMasterWrite(uint8_t dat)
* Description : CH554 hardware SPI write data, host mode
* Input : uint8_t dat data
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPIMasterWrite(uint8_t dat);

/*******************************************************************************
* Function Name  : CH554SPIMasterRead( )
* Description : CH554 hardware SPI0 read data, host mode
* Input          : None
* Output         : None
* Return : uint8_t right   
*******************************************************************************/
uint8_t CH554SPIMasterRead(void);

/*******************************************************************************
* Function Name  : SPISlvModeSet( ) 
* Description : SPI slave mode initialization
* Input          : None						 
* Output         : None
* Return         : None
*******************************************************************************/
void  SPISlvModeSet(void);

/*******************************************************************************
* Function Name  : CH554SPISlvWrite(uint8_t dat)
* Description : CH554 hardware SPI write data, slave mode
* Input : uint8_t dat data
* Output         : None
* Return         : None
*******************************************************************************/
void  CH554SPISlvWrite(uint8_t dat);

/*******************************************************************************
* Function Name  : CH554SPISlvRead( )
* Description : CH554 hardware SPI0 read data, slave mode
* Input          : None
* Output         : None
* Return : uint8_t right   
*******************************************************************************/
uint8_t CH554SPISlvRead(void);
