#ifndef __CRC8_H__
#define __CRC8_H__
#include "type.h"

/*
  Name  : CRC-8
  Poly  : 0x31    x^8 + x^5 + x^4 + 1
  Init  : 0xFF
  Revert: false
  XorOut: 0x00
  Check : 0xF7 ("123456789")
  MaxLen: 15 байт (127 бит) - обнаружение
    одинарных, двойных, тройных и всех нечетных ошибок
	табличный алгоритм
*/


 
byte CalcCRC8(byte *pcBlock,byte len);

#endif
