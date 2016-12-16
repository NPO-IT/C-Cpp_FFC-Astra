#ifndef __CELL_OF_POWER_H_
#define __CELL_OF_POWER_H_

#include "./../my_lib/type.h"
struct PowerCellData{
	ushort ULKPWR;	//	��������� ���������� �� ���� �������
					//	(����� ������� ������. ����� ������
					//	 �������� ������).
	ushort 	Ni;	//	���������� ��������� ���������.
	ushort 	Bi;	//	��������� ��������� ���������.
	ushort state;	//	��������� ������� ����������� �������� ���
					//	��������� �������.	��� 0 -	Bkey_in
					//					��� 1 - 	Gkey_in
					//					��� 2 - 	Rfen_in	
};
#endif