#ifndef __SSP_H_
#define __SSP_H_

#include "peripheral.h"


//Имена SSP
enum SSPName {
    SSP_0 = (uint)SSP0_BASE_ADDR
    , SSP_1 = (uint)SSP1_BASE_ADDR
};

#define SSP_SIZE 2
	
struct SSPOption{
	byte dss;		//режим бит 4..16 поле 4 разрядное, т.е. пишем зачение на единицу меньшем чем нам нужна разрядность
	byte frf;		//режим передачи SPI|TI|microwire
	byte scr;			//множитель делителя
	byte div;		//Делитель	 2..254
	byte spo;			//полярность 
	byte sph;			//фаза
	byte ms;		    //Мастер/подчиненный
	byte lbm;			//режим циклической проверки
	byte int_mode;		//режим прерываний
	byte dma;			//дма 1 -RECEIVE DMA 2 - TRANSMIT DMA
};

class SSP:public Peripheral{
	private:
		enum{
			CR0=0,CR1=1,DR=2,SR=3,CPSR=4,IMSC=5,RIS=6,MIS=7,ICR=8,DMACR=9	
		};
		static SSP* DEV[SSP_SIZE];
	public:
		//состояния интерфейса
		enum{
			//Буффер передатчика пуст
			//Буффер передатчика не полон
			//Буффер приемника не пуст
			//Буффер приемника полон
			//ЗАНЯТО! 
			TFE=1,TNF=2,RNE=4,RFF=8,BSY=16
		};

		//прерывания
		enum{
			//переполнение, точнее буффер приема полон
			// буффер приема не пуст - таймаут
			/// Буффер приема на половину полон
			// буффер передачи на половину пуст 
			ROR=1,RT=2,RX=4,TX=8	
		};
		SSP(SSPName name);
		~SSP();
		void Init(const SSPOption* const opt);					//переферия
		uint GetIntStatus() const ;					//Переферия
		uint GetStatus() const ;						//Переферия
		bool Read(byte* buf,const uint& size);		//!шинный интерфейс
		bool Send(const byte* buf,const uint& size);		//Шинный интерфейс
		bool Read(ushort* buf,const uint& size);
		bool Send(const ushort* buf,const uint& size);
		bool Send(const ushort &word);
		bool Read(ushort &word);
		void ClearRxFIFO();							//Шинный интерфейс
		void ClearTxFIFO();							//Шинный интерфейс
		void GetAllData(byte*const buf,uint& size);
		void GetAllData(ushort*const buf,uint& size);
		//интерфейс реестра
		static SSP* Get(uint num);
		static void Register(uint num,SSP* obj);

};


#define PREPARE_SSP \
SSP ssp_dev0(SSP_0),ssp_dev1(SSP_1);\
SSP::Register(0,&ssp_dev0);\
SSP::Register(1,&ssp_dev1);

#define PREPARE_SSP_PTR \
SSP::Register(0,new SSP(SSP_0));\
SSP::Register(1,new SSP(SSP_1));

#endif
