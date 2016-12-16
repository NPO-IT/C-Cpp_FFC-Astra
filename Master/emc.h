#ifndef __EMC_H__
#define __EMC_H__
#include "../my_lib/type.h"
#include "../my_lib/fastport.h"

#define BANK_BYTE   //1байтовый банк

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

//BANK_TYPE ExtMem[BANK_SIZE]	__attribute__((at(0x81000000)));
//унифицированный доступ к памяти
#define $Mem(offset) 	ExtMem[offset&(BANK_SIZE-1)]//произвольный адррес банка
#define $NextMem() 		$Mem(++BANK_ADDR)			//Обратится к следующему адресу банка
#define $CurrentMem() 	$Mem(BANK_ADDR)				//Обратится к текущему адрессу банка
#define ClearMemAddr() 	BANK_ADDR=0					//Сбросить адрес банка

//Адреса восьми суб-банков
uint BANK_HASH[8]={
	0x0,
	0x10000000,
	0x20000000,
	0x30000000,
	0x40000000,
	0x50000000,
	0x60000000,
	0x70000000
};
FastPort BANK_PORT;	//порт адреса суб-банков
//переключение банков 0..7
#define SwitchBank(bank) BANK_PORT[PIN]=BANK_HASH[bank&0x7]

uint read_bank=0,write_bank=0,count_bank=0;
uint BANK_ADDR=0,BANK_NUM=0; byte DELAY_CNT=1;
#define NextAddr() if(++BANK_ADDR==BANK_SIZE) SwitchBank(++BANK_NUM);
#define NextAddrWS()	++BANK_ADDR
#define NextAddr2B() if(++BANK_ADDR==BANK_SIZE) { \
		SwapBank() \
		BANK_ADDR=0; \
	}
#define SwapBank() uint tmp=read_bank;read_bank=write_bank;write_bank=tmp;
#define SwitchReadBank() 	SwitchBank(read_bank)
#define SwitchWriteBank() 	SwitchBank(write_bank)
//#define NextAddrL() read_bank++;write_bank++; if(read_bank==BANK_SIZE) read_bank=0; if(write_bank==BANK_SIZE) write_bank=0;
#define NextAddrLWS() ++read_bank;++write_bank;
#define NextAddrL()	 if(++count_bank==BANK_SIZE) count_bank=0;

//#define ClearAddrL() read_bank=0;write_bank=1;
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

	BANK_PORT=GetFastPort(PORT_4);
	BANK_PORT[DIR]=BANK_HASH[7];
	BANK_PORT[CLR]=BANK_HASH[7];  

}

#endif