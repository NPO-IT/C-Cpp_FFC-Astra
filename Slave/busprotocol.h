#ifndef __BUS_PROTOCOL_H_
#define __BUS_PROTOCOL_H_
#include "../my_lib/type.h"
#include "../my_lib/crc16.h"
#include "../my_lib/uart.h"
#include "../my_lib/fastport.h"

/*
API ��� ������ � ���������� ������ ����� ��������

*/
//�������� ���������
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
	
	__packed byte res[4]; //������������ � ������!!!!!
	byte crc8;
};
//�������� ��� ������� ��������� ������
typedef void CALLBACK_(byte*,ushort *);

struct BusAgent{
	Head query;
	CALLBACK_* callback;
	//ByteBuffer buf;
};

//����� ������� ������ ��� ������ � 
//����������� 485 ��� ���� � �������� ����� ������ ������
class RS485;
//
class PackBuffer;
//����� ��� ������ � ����� ���� �� �����+UART ���������
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
			FastPort const iport,	//������� ���� ����
			const uint& idir_val,	//�������� ��� �������� �����
			UART* const iuart	 //����������� ���������!!!! �������� � ��� ����� ���������, � ��� ����� ���!!!
		);
		~BUS();
		//��������(�������) ����� true-������ false - ���
		//bool RcvBlock();
		//����� ������ ����� � ������ ������ ������ crc16 
		//virtual bool IsOk();
		//void ProcData(); //����� callback �������
		//��������� ����� query �������� size
		void SendQuery(void *query,const uint &size);
		//�������� id ���������� �������
		uint GetID() const;
		//������� � ����� ��� �������� ������������ � ��
		//void Send(byte* const data,const uint& size);
  		
};


#endif