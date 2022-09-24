/*--------------------------------------------------------------------------
CH554.H
Header file for CH554 microcontrollers.
****************************************
**  Copyright  (C)  W.ch  1999-2014   **
**  Web:              http://wch.cn   **
****************************************
--------------------------------------------------------------------------*/

#ifndef __BASE_TYPE__
#define __BASE_TYPE__

/*----- constant and type define -----------------------------------------*/

#ifndef TRUE
#define TRUE    1
#define FALSE   0
#endif
#ifndef NULL
#define NULL    0
#endif
/*
#ifndef BOOL
typedef bit                             BOOL;
#endif
*/
#ifndef UINT8
typedef unsigned char                   UINT8;
#endif
#ifndef UINT16
typedef unsigned short                  UINT16;
#endif
#ifndef UINT32
typedef unsigned long                   UINT32;
#endif

#ifndef STRUCT_OFFSET
#define STRUCT_OFFSET( s, m )       ( (UINT8)( & (((s) *)0) -> (m) ) )  /* get the offset address for a member of a structure */
#endif

#endif  // __BASE_TYPE__
