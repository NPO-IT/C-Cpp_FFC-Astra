#ifndef __EMC_H__
#define __EMC_H__
#include "../my_lib/type.h"
#include "../my_lib/fastport.h"

#define ADDR_EMC 0x81000000
uint FIFO[0x4000] __attribute__((at(ADDR_EMC)));
uint CNT=0;

#define BANK_MASK 0x1C000
#define ADDR_MASK 0x3FFF
#define BANK_PINS 7<<28
	#define FIFO_SIZE 128000 	//16с
//	#define FIFO_SIZE 64000		//8с
//	#define FIFO_SIZE 32000		//4с
//	#define FIFO_SIZE 16000 	//2с
//	#define FIFO_SIZE 8000 		//1с
/*
#define BANK_USHORT   //1байтовый банк

//2байтовый банк
#ifdef BANK_USHORT
	#define BANK_SIZE 0x8000
	#define BANK_TYPE ushort
#endif

//байтовый банк 
#ifdef BANK_BYTE
	#define BANK_SIZE 32001
	#define BANK_TYPE byte
#endif


//4байтовый банк
#ifdef BANK_UINT 
	#define BANK_SIZE 0x4000
	#define BANK_TYPE uint
#endif
*/
FastPort BANK_PORT;
void  InitEMC(){
	//????????? EMC	
	PCONP   |= 0x00000800;		/* Turn On EMC PCLK */ 
	//EMC_CTRL = 0x00000001;  	//?????????
  	PINSEL4 |= 0x50000000;
  	PINSEL5 |= 0x05050555;
  	PINSEL6 |= 0x55555555;
  	PINSEL8 |= 0x55555555;
  	PINSEL9 = 0x40555555; 	 
 
	//PINSEL::Set(4,30,func_00);
	EMC_STA_CFG1 = 0x80;
 	EMC_STA_WAITWEN1 = 0x2;
 	EMC_STA_WAITOEN1 = 0x2;
 	EMC_STA_WAITRD1 = 0x1f;
 	EMC_STA_WAITPAGE1 = 0x1f;
 	EMC_STA_WAITWR1 = 0x1f;
 	EMC_STA_WAITTURN1 = 0x0f;

	FastPort P4=GetFastPort(PORT_4);
	P4[DIR]=BANK_PINS;
	P4[CLR]=BANK_PINS;
//	BANK_PORT=GetFastPort(PORT_4);
//	BANK_PORT[DIR]=BANK_HASH[7];
//	BANK_PORT[CLR]=BANK_HASH[7];  
}

uint ReadWriteFifo(const uint& input){
	FIO4PIN=(CNT&BANK_MASK)<<14;
	FIFO[CNT&ADDR_MASK]=input;
	if(++CNT==(FIFO_SIZE+1)) 
		CNT=0;
	FIO4PIN=(CNT&BANK_MASK)<<14;
	return  FIFO[CNT&ADDR_MASK];
}
#endif