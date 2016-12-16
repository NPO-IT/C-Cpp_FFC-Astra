#ifndef __FIFO_EMC__
#define __FIFO_EMC__
	#include "../my_lib/type.h"
	#define ADDR_EMC 0x81000000
/*
Размер FIFO для четырех параметров
*/
	#define FIFO_SIZE 128000 	//16с
//	#define FIFO_SIZE 64000		//8с
//	#define FIFO_SIZE 32000		//4с
//	#define FIFO_SIZE 16000 	//2с
//	#define FIFO_SIZE 8000 		//1с
	//void InitFifo();
	//byte ReadWriteFifo(const byte& input);
	//void ReadWriteFifo(byte input[4],byte output[4]);
	uint ReadWriteFifo(const uint& input);
#endif