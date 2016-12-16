#ifndef __CELL_OF_POWER_H_
#define __CELL_OF_POWER_H_

#include "./../my_lib/type.h"
struct PowerCellData{
	ushort ULKPWR;	//	Измерение напряжения на шине питания
					//	(после входных ключей. Будет первым
					//	 реальным данным).
	ushort 	Ni;	//	Напряжение наземного источника.
	ushort 	Bi;	//	Измерение бортового источника.
	ushort state;	//	Состояние входных управляющих сигналов или
					//	Состояние питания.	бит 0 -	Bkey_in
					//					бит 1 - 	Gkey_in
					//					бит 2 - 	Rfen_in	
};
#endif