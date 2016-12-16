#ifndef __BUS_PROTOCOL_H_
#define __BUS_PROTOCOL_H_
#include "../my_lib/type.h"
#include "../my_lib/crc16.h"
#include "../my_lib/uart.h"
#include "../my_lib/fastport.h"

/*
API дл€ работы с протоколом обмена между €чейками

*/
//стркутра заголовка
struct Head{
	byte bus_agent;
	byte code_func;
	byte pack_num;
	byte prog_num;
	byte len;
	byte res1;
	ushort crc16;
};

struct COPAnswer{
	byte bus_agent;
	byte STATE;
	ushort ULK_PWR;
	ushort NI;
	ushort BI;
	
	__packed byte res[4]; //выравнивание в пам€ти!!!!!
	byte crc8;
};
//прототип дл€ функции обратного вызова
typedef void CALLBACK_(byte*,ushort *);

struct BusAgent{
	Head query;
	CALLBACK_* callback;
	//ByteBuffer buf;
};

//хотел сделать классы дл€ работы с 
//интерфйесом 485 где нога и задержка будут скрыты внутри
class RS485;
//
class PackBuffer;
//класс дл€ работы с шиной нога на порте+UART интерфейс
class BUS{
	private:
		//RS485
		FastPort const dir_port;
		const uint dir_val;
		UART* const uart;
		uint device_id;

		enum {
			RS485DELAY=70
		};
	public:
		BUS(
			FastPort const iport,	//быстрый порт ноги
			const uint& idir_val,	//значени€ дл€ быстрого порта
			UART* const iuart	 //константный указатель!!!! значени€ в нем могут измен€тс€, а сам адрес нет!!!
		);
		~BUS();
		//получить(собрать) пакет true-собран false - нет
		//bool RcvBlock();
		//пакет собран верно в базвом классе только crc16 
		//virtual bool IsOk();
		//void ProcData(); //вызов callback функции
		//отправить буфер query размером size
		void SendQuery(void *query,const uint &size);
		//получить id последнего запроса
		uint GetID() const;
		//послать в тупую без прив€зки обработчиков и тд
		//void Send(byte* const data,const uint& size);
  		
};


#endif