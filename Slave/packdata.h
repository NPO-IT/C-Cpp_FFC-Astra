#ifndef __PACK_DATA_H_
#define __PACK_DATA_H_
#include "powercelldata.h"

struct QueryPack{
	byte bus_agent;		//номер абонента
	byte code_func;		//код функции
	byte pack_num;		//номер пакета
	byte prog_num;		//номер программы сбора
	byte len;			//длинна пакета 
	byte res1;			//резерв
	ushort crc16;		//контрольная сумма
};

struct AnswerPack{
	byte bus_agent;		//номер абонента
	byte code_func;		//код функции
	byte pack_num;		//номер пакета
	byte prog_num;		//номер программы сбора
	byte len;			//длинна пакета 
	byte res1;			//резерв
	PowerCellData data;	//Данные ячейки питания
	ushort crc16;		//Контрольная сумма
};


#endif