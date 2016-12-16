
#include "fifo_emc.h"
#include <lpc23xx.h>
//byte *FIFO=(byte*)ADDR_EMC;
uint FIFO[0x4000] __attribute__((at(ADDR_EMC)));
uint CNT=0;

#define BANK_MASK 0x1C000
#define ADDR_MASK 0x3FFF

//Адреса восьми суб-банков
 /*
byte ReadWriteFifo(const byte& input){
	FIO4PIN=(CNT&BANK_MASK)<<12;
	FIFO[CNT&ADDR_MASK]=input;
	if(++CNT==(FIFO_SIZE+1)) 
		CNT=0;
	FIO4PIN=(CNT&BANK_MASK)<<12;
	return  FIFO[CNT&ADDR_MASK];
};		 */
   /*
void ReadWriteFifo(byte input[4],byte output[4]){
	//пишем
	for(uint i=0;i<4;i++){
		FIO4PIN=(CNT&BANK_MASK)<<12;
		FIFO[CNT&ADDR_MASK]=input[i];
	}
	//переходим к следующем
	if(++CNT==(FIFO_SIZE+1)) 
		CNT=0;
	//читаем
	FIO4PIN=(CNT&BANK_MASK)<<12;
	FIFO[CNT&ADDR_MASK];
}		*/

uint ReadWriteFifo(const uint& input){
	uint result;
	if(++CNT==(FIFO_SIZE)) CNT=0;
	FIO4PIN=(CNT&BANK_MASK)<<14;
	result=FIFO[CNT&ADDR_MASK];
	FIFO[CNT&ADDR_MASK]=input;	 
	return result;
}