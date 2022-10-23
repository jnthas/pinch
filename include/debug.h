
/* Debug */
/* Provide printf subroutine and delay function */

#pragma once

#include <stdint.h>

void	CfgFsys( );                       // CH554 clock selection and configuration

void mDelayuS (uint16_t n); // Delay in units of uS
void mDelaymS (uint16_t n); // Delay in mS
