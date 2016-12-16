#ifndef __CRC16_H_
#define __CRC16_H_
#include "type.h"



/*
  Name  : CRC-16 CCITT
  Poly  : 0x1021    x^16 + x^12 + x^5 + 1
  Init  : 0xFFFF
  Revert: false
  XorOut: 0x0000
  Check : 0x29B1 ("123456789")
  MaxLen: 4095 ���� (32767 ���) - �����������
    ���������, �������, ������� � ���� �������� ������
*/
ushort CalcCRC16(byte * pcBlock, ushort len);
#endif
