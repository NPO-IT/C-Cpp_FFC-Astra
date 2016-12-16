#ifndef __PACK_DATA_H_
#define __PACK_DATA_H_
#include "powercelldata.h"

struct QueryPack{
	byte bus_agent;		//����� ��������
	byte code_func;		//��� �������
	byte pack_num;		//����� ������
	byte prog_num;		//����� ��������� �����
	byte len;			//������ ������ 
	byte res1;			//������
	ushort crc16;		//����������� �����
};

struct AnswerPack{
	byte bus_agent;		//����� ��������
	byte code_func;		//��� �������
	byte pack_num;		//����� ������
	byte prog_num;		//����� ��������� �����
	byte len;			//������ ������ 
	byte res1;			//������
	PowerCellData data;	//������ ������ �������
	ushort crc16;		//����������� �����
};


#endif