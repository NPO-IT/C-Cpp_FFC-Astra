#ifndef __FIFO_EMC__
#define __FIFO_EMC__
	#include "../my_lib/type.h"
	#define ADDR_EMC 0x81000000
/*
������ FIFO ��� ������� ����������
*/
	#define FIFO_SIZE 128000 	//16�
//	#define FIFO_SIZE 64000		//8�
//	#define FIFO_SIZE 32000		//4�
//	#define FIFO_SIZE 16000 	//2�
//	#define FIFO_SIZE 8000 		//1�
	//void InitFifo();
	//byte ReadWriteFifo(const byte& input);
	//void ReadWriteFifo(byte input[4],byte output[4]);
	uint ReadWriteFifo(const uint& input);
#endif