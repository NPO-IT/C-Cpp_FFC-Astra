#line 1 "busprotocol.cpp"

#line 1 "busprotocol.h"
#line 1 "../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "busprotocol.h"
#line 1 "../my_lib/crc16.h"
#line 4 "../my_lib/crc16.h"












 
ushort CalcCRC16(byte * pcBlock, ushort len);
#line 5 "busprotocol.h"
#line 1 "../my_lib/uart.h"

#line 1 "../my_lib/peripheral.h"
#line 4 "../my_lib/peripheral.h"
#line 1 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


















 




 
#line 36 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 69 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 104 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 138 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"




 
#line 155 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 166 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 177 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 

















 
#line 203 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 498 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 507 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 515 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 523 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 531 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"



	
 
#line 554 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 574 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 594 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 614 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 639 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 662 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 680 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 698 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 715 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 732 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 742 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 752 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 762 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 770 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 783 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 796 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 827 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 843 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 




 
#line 857 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 868 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"






#line 887 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 900 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 914 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 927 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 950 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 964 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 982 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1079 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1087 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 1095 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"






 
#line 1117 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"





#line 1134 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


























#line 5 "../my_lib/peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 5 "../my_lib/uart.h"


typedef enum UARTName UARTName;
enum UARTName {
    UART_0 = (uint)0xE000C000
    , UART_1 = (uint)0xE0010000
    , UART_2 = (uint)0xE0078000
    , UART_3 = (uint)0xE007C000
};























 

struct UARTOption{
	byte dll;		 
	byte dlm; 	     
	uint type_int;   
	byte lcr;		 
	byte fcr;		 
};





class UART:public Peripheral{
	
	protected:
	enum {
		RBR=0,THR=0,DLL=0,DLM=1,IER=1,IIR=2,FCR=2,LCR=3,
		LSR=5,SCR=7,ACR=8,ICR=9,FDR=10,TER=12		
	};
	static UART* DEV[4];

	public:
		
		UART(UARTName name);
		virtual ~UART();
		void Init(const UARTOption* Option);
		
		uint GetState() const;
		uint GetIntStatus() const;
		void ClearInt();
		bool Read(byte* buf,const uint& size);
		bool Send(const byte* buf,const uint& size);
		
		void ClearRxFIFO();
		void ClearTxFIFO();
		static UART* Get(uint num);
		static void Register(uint num,UART* obj);
		
		
};


#line 94 "../my_lib/uart.h"


#line 6 "busprotocol.h"
#line 1 "../my_lib/fastport.h"



#line 5 "../my_lib/fastport.h"
#line 6 "../my_lib/fastport.h"
enum GPIO_REG{
	DIR=0,MASK=4,PIN=5,SET=6,CLR=7	
};
enum FastPortName{
	PORT_0,PORT_1,PORT_2,PORT_3,PORT_4
};

typedef ulong* FastPort;

FastPort GetFastPort(const FastPortName& num);	
#line 7 "busprotocol.h"




 

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
	
	__packed byte res[4]; 
	byte crc8;
};

typedef void CALLBACK_(byte*,ushort *);

struct BusAgent{
	Head query;
	CALLBACK_* callback;
	
};



class RS485;

class PackBuffer;

class BUS{
	private:
		
		FastPort const dir_port;
		const uint dir_val;
		UART* const uart;
		uint device_id;

		enum {
			RS485DELAY=70
		};
	public:
		BUS(
			FastPort const iport,	
			const uint& idir_val,	
			UART* const iuart	 
		);
		~BUS();
		
		
		
		
		
		
		void SendQuery(void *query,const uint &size);
		
		uint GetID() const;
		
		
  		
};


#line 3 "busprotocol.cpp"
BUS::BUS(
	FastPort const iport,
	const uint& idir_val,
	UART* const iuart
):dir_port(iport),dir_val(idir_val),uart(iuart){
	device_id=0;	
}
 























 
void BUS::SendQuery(void *query,const uint &size){
	 device_id= *((byte*)query);
	 
	 dir_port[SET]|=dir_val;
	 uart->Send((byte*)query,size);
	 {uint i=RS485DELAY;while(i--);}
	 dir_port[CLR]|=dir_val;
}

uint BUS::GetID() const{
	return device_id;
};







 
