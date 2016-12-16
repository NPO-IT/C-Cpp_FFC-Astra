
#ifndef   __UART__CLASS_H
#define   __UART__CLASS_H
#include "peripheral.h"

//����� ������
typedef enum UARTName UARTName;
enum UARTName {
    UART_0 = (uint)UART0_BASE_ADDR
    , UART_1 = (uint)UART1_BASE_ADDR
    , UART_2 = (uint)UART2_BASE_ADDR
    , UART_3 = (uint)UART3_BASE_ADDR
};
/*
--------���������� ��������  ---------
Divisor=Pclk/(16*BAUD) dll;
--------����������    --------------
	0 RBR
	1 THRE
	2 Rx line
	
--------������ ����� lcr----------------
	00 5
	01 6
	10 7
	11 8
---------FCR FIFO-----------------
0 ���/����
1 ����� Rx
2 ����� Tx

<<6	�������� ������ ��� �������������
00	1
01	4
10	8
11	14
*/

struct UARTOption{
	byte dll;		 //������� ��������	
	byte dlm; 	     //������� ��������
	uint type_int;   //��� ����������
	byte lcr;		 //����� ����� �������� ���� �������� ���������� �����������
	byte fcr;		 //���������� ���� ���/���� ����� ��/Rx ������� ���������
};

#define UART_SIZE 4


//���������� ������ ����
class UART:public Peripheral{
	//byte buf[8];
	protected:
	enum {
		RBR=0,THR=0,DLL=0,DLM=1,IER=1,IIR=2,FCR=2,LCR=3,
		LSR=5,SCR=7,ACR=8,ICR=9,FDR=10,TER=12		
	};
	static UART* DEV[UART_SIZE];

	public:
		//UART(UARTName name,UARTOption *Option = (UARTOption *)NULL);
		UART(UARTName name);
		virtual ~UART();
		void Init(const UARTOption* Option);
		//void Init(UARTOption* Option);
		uint GetState() const;
		uint GetIntStatus() const;
		void ClearInt();
		bool Read(byte* buf,const uint& size);
		bool Send(const byte* buf,const uint& size);
		//���� ������ RX Tx ���������� ����� 14 ���� 0_� ?????
		void ClearRxFIFO();
		void ClearTxFIFO();
		static UART* Get(uint num);
		static void Register(uint num,UART* obj);
		//�������� ���� ������� ������ ���������� �� ������� ��������� � ��������� IIR
		//static UART* GetIntSource(uint term);
};


#define PREPARE_UART \
UART udev0(UART_0),udev1(UART_1),udev2(UART_2),udev3(UART_3);\
UART::Register(0,&udev0);\
UART::Register(1,&udev1);\
UART::Register(2,&udev2);\
UART::Register(3,&udev3);\

#define PREPARE_UART_PTR \
	UART::Register(0,new UART(UART_0));\
	UART::Register(1,new UART(UART_1));\
	UART::Register(2,new UART(UART_2));\
	UART::Register(3,new UART(UART_3));\



#endif
