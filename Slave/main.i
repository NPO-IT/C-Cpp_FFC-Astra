#line 1 "main.cpp"
#line 1 "./../my_lib/pinsel.h"
#line 1 "./../my_lib/peripheral.h"
#line 1 "./../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "./../my_lib/peripheral.h"
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


























#line 5 "./../my_lib/peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 4 "./../my_lib/pinsel.h"
enum FunCode{
	func_00=0,func_01=1,func_10=2,func_11=3
};
class PINSEL{
	private:
		static ulong* base_addr;
		PINSEL(){};
		~PINSEL(){};
	public:
		
		static void Set(uint port,uint pin,FunCode code);
		static void Set(uint num,uint val);
		static uint Get(uint port,uint pin);
		static uint Get(uint num); 
	   



 	
};















#line 2 "main.cpp"
#line 1 "./../my_lib/fastport.h"



#line 5 "./../my_lib/fastport.h"
#line 6 "./../my_lib/fastport.h"
enum GPIO_REG{
	DIR=0,MASK=4,PIN=5,SET=6,CLR=7	
};
enum FastPortName{
	PORT_0,PORT_1,PORT_2,PORT_3,PORT_4
};

typedef ulong* FastPort;

FastPort GetFastPort(const FastPortName& num);	
#line 3 "main.cpp"
#line 1 "./../my_lib/vic.h"
#line 4 "./../my_lib/vic.h"
	
	class VIC{
		private:
			static ulong *base_addr;	
			static ulong *vect_addr;	
			static ulong *priority;	 	
			static const uint VIC_SIZE;
			enum{
			 	IRQStatus=0,
				FIQStatus=1,
				RawIntr=2,
				IntSelect=3,
				IntEnable=4,
				IntEnClr=5,
				SoftInt=6,
				SoftIntClr=7,
				Protection=8,
				SWPriorityMask=9,
				Addr=960
			};
			
			VIC();
			~VIC();
		public:
			
			
			enum INT_SRC{
			  	WDT_INT= 0		  	
				,SWI_INT= 1			
				,ARM_CORE0_INT= 2	
				,ARM_CORE1_INT=3	
				,TIMER0_INT= 4 		
				,TIMER1_INT= 5		
				,UART0_INT= 6		
				,UART1_INT= 7 		
				,PWM1_INT= 8		
				,I2C0_INT= 9
				,SPI0_INT= 10 
				,SSP0_INT= 10
				,SSP1_INT= 11
				,PLL_INT= 12		
				,RTC_INT= 13		
				,EINT0_INT= 14		
				,EINT1_INT= 15
				,EINT2_INT= 16
				,EINT3_INT= 17
				,ADC0_INT= 18		
				,I2C1_INT= 19
				,BOD_INT= 20		  
				,EMAC_INT= 21
				,USB_INT= 22
				,CAN_INT= 23
				,MCI_INT= 24
				,GPDMA_INT= 25		
				,TIMER2_INT= 26		
				,TIMER3_INT= 27
				,UART2_INT= 28
				,UART3_INT= 29
				,I2C2_INT= 30
				,I2S_INT= 31
			};
			
			static bool InstallIRQ(VIC::INT_SRC int_num,void* Handler,uint _prio);
			static void Init();
			static void ClearInt();
			
	};



#line 4 "main.cpp"
#line 1 "./../my_lib/uart.h"

#line 5 "./../my_lib/uart.h"


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


#line 94 "./../my_lib/uart.h"


#line 5 "main.cpp"
#line 1 "./../my_lib/crc8.h"
#line 4 "./../my_lib/crc8.h"











 


 
byte CalcCRC8(byte *pcBlock,byte len);

#line 6 "main.cpp"
#line 1 "./../my_lib/crc16.h"
#line 4 "./../my_lib/crc16.h"












 
ushort CalcCRC16(byte * pcBlock, ushort len);
#line 7 "main.cpp"
#line 1 "./../my_lib/ssp.h"



#line 5 "./../my_lib/ssp.h"



enum SSPName {
    SSP_0 = (uint)0xE0068000
    , SSP_1 = (uint)0xE0030000
};


	
struct SSPOption{
	byte dss;		
	byte frf;		
	byte scr;			
	byte div;		
	byte spo;			
	byte sph;			
	byte ms;		    
	byte lbm;			
	byte int_mode;		
	byte dma;			
};

class SSP:public Peripheral{
	private:
		enum{
			CR0=0,CR1=1,DR=2,SR=3,CPSR=4,IMSC=5,RIS=6,MIS=7,ICR=8,DMACR=9	
		};
		static SSP* DEV[2];
	public:
		
		enum{
			
			
			
			
			
			TFE=1,TNF=2,RNE=4,RFF=8,BSY=16
		};

		
		enum{
			
			
			
			
			ROR=1,RT=2,RX=4,TX=8	
		};
		SSP(SSPName name);
		~SSP();
		void Init(const SSPOption* const opt);					
		uint GetIntStatus() const ;					
		uint GetStatus() const ;						
		bool Read(byte* buf,const uint& size);		
		bool Send(const byte* buf,const uint& size);		
		bool Read(ushort* buf,const uint& size);
		bool Send(const ushort* buf,const uint& size);
		bool Send(const ushort &word);
		bool Read(ushort &word);
		void ClearRxFIFO();							
		void ClearTxFIFO();							
		void GetAllData(byte*const buf,uint& size);
		void GetAllData(ushort*const buf,uint& size);
		
		static SSP* Get(uint num);
		static void Register(uint num,SSP* obj);

};











#line 8 "main.cpp"
 
#line 1 "busprotocol.h"
#line 4 "busprotocol.h"
#line 5 "busprotocol.h"
#line 6 "busprotocol.h"
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


#line 10 "main.cpp"
#line 1 "packdata.h"
#line 1 "powercelldata.h"



#line 5 "powercelldata.h"
struct PowerCellData{
	ushort ULKPWR;	
					
					
	ushort 	Ni;	
	ushort 	Bi;	
	ushort state;	
					
					
					
};
#line 4 "packdata.h"

struct QueryPack{
	byte bus_agent;		
	byte code_func;		
	byte pack_num;		
	byte prog_num;		
	byte len;			
	byte res1;			
	ushort crc16;		
};

struct AnswerPack{
	byte bus_agent;		
	byte code_func;		
	byte pack_num;		
	byte prog_num;		
	byte len;			
	byte res1;			
	PowerCellData data;	
	ushort crc16;		
};


#line 11 "main.cpp"
#line 1 "doublebufferushort.h"



#line 5 "doublebufferushort.h"








 
class DoubleBufferUshort{
    private:
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;

		ushort* GetBuffer(const uint& get_size,ushort *buffer,uint &count);
    public:

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        
        uint Read(ushort* data,const uint& rsize);
        
        uint Write(const ushort*const data ,const uint& wsize);
		
		void Write(const uint& num,const ushort& data);
        
        void Switch();
		
        bool IsRead();
		
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		
		void Reset(uint cnt,bool rw=false);	
		
		void ResetRead(const uint& cnt);
		void ResetWrite(const uint& cnt);

		void Clear();
		
		const ushort* GetData(const uint& data_size);

		ushort* GetForReadBuf(const uint& get_size);
		ushort* GetForWriteBuf(const uint& get_size);
};
#line 12 "main.cpp"
#line 1 "bdcstream.h"



#line 5 "bdcstream.h"





 
class BDCStreamBase{
    protected:
        enum{
            WORD_SIZE=20,  
            LAST_SHIFT=-4, 
        };
        uint service_addr[WORD_SIZE];
        
        
		uint *words[4];
        
        uint cur_word;
		int shift;
        virtual void CalcServiceAddr(uint * const data){};
        ushort Get4Bit(const uint& num);
    public:
        BDCStreamBase();
        ~BDCStreamBase();
        
        void SetData(uint *data_ptr);
        void ClearCount();
        ushort GetHash();
};

class BDCStream15:public BDCStreamBase{
    protected:
        void CalcServiceAddr(uint * const data){};
    public:
         BDCStream15();
        ~BDCStream15();
};

class BDCStream16:public BDCStreamBase{
    private:
        
        static const ushort HASH6BIT_SERVICE[64];
        
        void CalcServiceAddr(uint * const data);
    public:
        BDCStream16();
        ~BDCStream16();
};


struct BDCPack{
	byte agent_id;
	byte code_func;
	byte pack_num;
	byte prog_num;
	byte res1;
	byte res2;
	ushort crc16;
};
#line 13 "main.cpp"
#line 1 "emcfifo.h"
#line 4 "emcfifo.h"
#line 5 "emcfifo.h"


uint FIFO[0x4000] __attribute__((at(0x81000000)));
uint CNT=0;






























 
FastPort BANK_PORT;
void  InitEMC(){
	
	(*(volatile unsigned long *)(0xE01FC000 + 0x0C4))   |= 0x00000800;		  
	
  	(*(volatile unsigned long *)(0xE002C000 + 0x10)) |= 0x50000000;
  	(*(volatile unsigned long *)(0xE002C000 + 0x14)) |= 0x05050555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x18)) |= 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x20)) |= 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x24)) = 0x40555555; 	 
 
	
	(*(volatile unsigned long *)(0xFFE08000 + 0x220)) = 0x80;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x224)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x228)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x22C)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x230)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x234)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x238)) = 0x0f;

	FastPort P4=GetFastPort(PORT_4);
	P4[DIR]=7<<28;
	P4[CLR]=7<<28;



}

uint ReadWriteFifo(const uint& input){
	(*(volatile unsigned long *)(0x3FFFC000 + 0x94))=(CNT&0x1C000)<<14;
	FIFO[CNT&0x3FFF]=input;
	if(++CNT==(128000+1)) 
		CNT=0;
	(*(volatile unsigned long *)(0x3FFFC000 + 0x94))=(CNT&0x1C000)<<14;
	return  FIFO[CNT&0x3FFF];
}
#line 14 "main.cpp"




BUS *bus[3];	


enum {COP_ID=18,BDC_ID=1,TEMP2_ID=52};
BDCPack bdc_query={BDC_ID,65,1,};    
BDCPack bdc2_query = {BDC_ID, 65, 1};

byte temp_query[4]={TEMP2_ID,0,0,0}; 
byte cop_query[4]={COP_ID};


UART *uart3,*uart2,*uart1;
SSP* ssp1;
FastPort P0,DIR6,DIR5,P4, DIR7;
const uint DIR6_VAL=1,DIR5_VAL=1<<12, DIR7_VAL=1<<3;

extern "C"{
	void UART1Handler() __irq;
	void UART2Handler() __irq;
	void UART3Handler() __irq;
}






const ushort MAX_SCALE=450;
const ushort MIN_SCALE=63;

const unsigned char HASHYATP[32]={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,0,1};








struct MultyBuffer{
	ushort &index; 
	uint read; 
	uint write;
	ushort data[2][160][6] ;
};

ushort read[6]; 		
MultyBuffer SSP_BUF={read[0],0,1,};








struct {
	byte addr;
	byte val;
}Temp2Num;

struct{
  	byte ULK_PWR;  		
	byte NI;
	byte BI;
	byte STATE;
}COPNum;


DoubleBufferUshort *bdc_buf;
DoubleBufferUshort *bdc2_buf; 





 
	const byte PROG_ANALOG_PACK[160]={

255,
0,16,1,17,2,18,3,19,
4,5,21,6,22,7,23,8,
24,9,10,11,12,13,14,15,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
0,16,1,17,2,18,3,19,
4,5,21,6,22,7,23,8,
24,9,10,11,12,13,14,15,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255
	};
	
	
	
	const uint BDC_DATA_SIZE=272;
	ushort *analog_data;    
	uint analog_data_count=0; 
	ushort *analog2_data; 
	uint analog2_data_count=0;
int main(){
	

 
	
	(*(volatile unsigned long *)(0xE01FC000 + 0x1A0))|=1;					
	P0=GetFastPort(PORT_0);	
	P0[DIR]|=1<<31;
	P4=GetFastPort(PORT_4);	
	P4[DIR]|=1<<4;
	DIR6=GetFastPort(PORT_2); 
	DIR6[DIR]|=DIR6_VAL;
	DIR5=GetFastPort(PORT_2); 
	DIR5[DIR]|=DIR5_VAL;
	DIR7=GetFastPort(PORT_2); 
	DIR7[DIR]|=DIR7_VAL;
	
	InitEMC();
	
	UART udev0(UART_0),udev1(UART_1),udev2(UART_2),udev3(UART_3);UART::Register(0,&udev0);UART::Register(1,&udev1);UART::Register(2,&udev2);UART::Register(3,&udev3);
	



 
	UARTOption u_opt={0,0,1,3,7|2<<6};
	
	uart2=UART::Get(2);
	uart2->Init(&u_opt);
	
	PINSEL::Set(0,10,func_01);			
	PINSEL::Set(0,11,func_01);			
	VIC::InstallIRQ(VIC::UART2_INT,(void*)UART2Handler,0);

	
	u_opt.fcr|=(3<<6);
	uart1=UART::Get(1);
	uart1->Init(&u_opt);
	PINSEL::Set(0,15,func_01);	 
	PINSEL::Set(0,16,func_01);	 
	VIC::InstallIRQ(VIC::UART1_INT,(void*)UART1Handler,1);
	
	
	uart3=UART::Get(3);
	uart3->Init(&u_opt);
	PINSEL::Set(0,0,func_10);	 
	PINSEL::Set(0,1,func_10);	 
	VIC::InstallIRQ(VIC::UART3_INT,(void*)UART3Handler,1);
	
	
	SSP ssp_dev0(SSP_0),ssp_dev1(SSP_1);SSP::Register(0,&ssp_dev0);SSP::Register(1,&ssp_dev1);
	 
	
	
	const SSPOption ssp_opt={
	   0xF,0,0,8,0,0,1,0,0,0
	};
	ssp1=SSP::Get(1);
	ssp1->Init(&ssp_opt);
	
	PINSEL::Set(0,6,func_10);  
	PINSEL::Set(0,7,func_10);  
	PINSEL::Set(0,8,func_10);  
	PINSEL::Set(0,9,func_10);  
	
	

 
	uint cnt=0;
	for (uint i=0;i<160;i++){
		SSP_BUF.data[SSP_BUF.read][i][0]=cnt;
		SSP_BUF.data[SSP_BUF.write][i][0]=cnt;
		cnt++;
	}
	


 	bus[0]= new BUS(DIR5,DIR5_VAL,uart1);
	bus[1]= new BUS(DIR6,DIR6_VAL,uart2);
	bus[2]= new BUS(DIR7, DIR7_VAL, uart3);
	
	
	bdc_query.crc16=CalcCRC16((byte*)&bdc_query,6);
	bdc2_query.crc16=CalcCRC16((byte*)&bdc2_query, 6);
	
	cop_query[3]=CalcCRC8(cop_query,3);
	
	
	const PowerCellData cop_data={444,200,400,7};

	
	
	
	BDCStream16 stream1;
	BDCStream16 stream2;
	
	uint bdc_save;
	ushort *bdc_ptr=(ushort*)&bdc_save;
	
	bdc_buf=new DoubleBufferUshort(new ushort[BDC_DATA_SIZE*2],BDC_DATA_SIZE);
	
	
	bdc2_buf = new DoubleBufferUshort(new ushort[BDC_DATA_SIZE*2],BDC_DATA_SIZE);
	BDCStream16 stream3;
	BDCStream16 stream4;
	uint bdc2_save;
	ushort *bdc2_ptr=(ushort*)&bdc2_save;
	
	SSP_BUF.index=0;	
	




	ssp1->ClearRxFIFO();

	(*(volatile unsigned long *)(0xE0000000 + 0x10))=1;                     
	(*(volatile unsigned long *)(0xE0000000 + 0x04))=480000;                     	          
	(*(volatile unsigned long *)(0xE0000000 + 0x00))=3;                       	
	(*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0xAA;					
  (*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0x55;



	while(1){
		P0[SET]|=1<<31;
		P0[CLR]|=1<<31;	
		int place;
		

		ssp1->Read(read,6);


		
		
		if(++SSP_BUF . index>=160){
			SSP_BUF . index=0;  
			
			uint tmp=SSP_BUF.read;
			SSP_BUF.read=SSP_BUF.write;
			SSP_BUF.write=tmp;
			
			
		}
		P4[SET]|=1<<4;
		
		
		
		switch(SSP_BUF.index){
		
			
			case 3:{
				
				Temp2Num.addr=78;
				Temp2Num.val=79;
				
		
				bus[0]->SendQuery(temp_query,4);
				
				temp_query[1]=read[1];
				temp_query[1]&=0x1F;
				temp_query[2]=read[2];
				temp_query[3]=CalcCRC8(temp_query,3);

				(*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0xAA;					
				(*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0x55;
				break;	
			}
			
			case 83:{
				Temp2Num.addr=158;
			   	Temp2Num.val=159;
		
				bus[0]->SendQuery(temp_query,4);
				
				temp_query[1]=read[1];
				temp_query[1]&=0x1F;
				temp_query[2]=read[2];
				temp_query[3]=CalcCRC8(temp_query,3);  

				(*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0xAA;					
				(*(volatile unsigned long *)(0xE0000000 + 0x08)) = 0x55;
			 	break;
			}

			
			case 70:{
				
				
				COPNum.ULK_PWR=70;
				COPNum.NI=71;
				COPNum.BI=72;
				COPNum.STATE=73;

					
					SSP_BUF . data[SSP_BUF . write][COPNum.ULK_PWR][4]=0; 	
					SSP_BUF . data[SSP_BUF . write][COPNum.NI][4]=0; 			
					SSP_BUF . data[SSP_BUF . write][COPNum.BI][4]=0;			
					SSP_BUF . data[SSP_BUF . write][COPNum.STATE][4]=7;		

				
			
				cop_query[2]=read[3];
				cop_query[3]=CalcCRC8(cop_query,3);
				bus[0]->SendQuery(cop_query,4);
				break;
			}
			case 150:{

				
				COPNum.ULK_PWR=150;
				COPNum.NI=151;
				COPNum.BI=152;
				COPNum.STATE=153;

					
					SSP_BUF . data[SSP_BUF . write][COPNum.ULK_PWR][4]=0; 	
					SSP_BUF . data[SSP_BUF . write][COPNum.NI][4]=0; 			
					SSP_BUF . data[SSP_BUF . write][COPNum.BI][4]=0;			
					SSP_BUF . data[SSP_BUF . write][COPNum.STATE][4]=7;		

				
				cop_query[2]=50;
				cop_query[3]=CalcCRC8(cop_query,3);
				bus[0]->SendQuery(cop_query,4);
				break;
			}

		
			case 0:{
				bdc_buf->Switch(); 
				stream1.SetData((uint*)bdc_buf->GetForReadBuf(120));
				stream2.SetData((uint*)bdc_buf->GetForReadBuf(120));
				
				
				stream1.ClearCount();
				stream2.ClearCount();
				
				analog_data=bdc_buf->GetForReadBuf(32);
		
				bus[1]->SendQuery(&bdc_query,sizeof(BDCPack));
				analog_data_count=0;
				break;
			}
			case 80:{
				bdc_buf->Switch();
				stream1.SetData((uint*)bdc_buf->GetForReadBuf(120));
				stream2.SetData((uint*)bdc_buf->GetForReadBuf(120));

				stream1.ClearCount();
				stream2.ClearCount();
				
				
				analog_data=bdc_buf->GetForReadBuf(32);
				analog_data_count=0;				
				bus[1]->SendQuery(&bdc_query,sizeof(BDCPack));
				break;
			}
			
			case 40:{
				bdc2_buf->Switch(); 
				stream3.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				stream4.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				
				
				stream3.ClearCount();
				stream4.ClearCount();
				
				analog2_data=bdc2_buf->GetForReadBuf(32);
		
				bus[2]->SendQuery(&bdc2_query,sizeof(BDCPack));
				analog2_data_count=0;
				break;
			}
			case 120:{
				bdc2_buf->Switch();
				stream3.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				stream4.SetData((uint*)bdc2_buf->GetForReadBuf(120));

				stream3.ClearCount();
				stream4.ClearCount();
				
				
				analog2_data=bdc2_buf->GetForReadBuf(32);
				analog2_data_count=0;				
				bus[2]->SendQuery(&bdc2_query,sizeof(BDCPack));
				break;
			}
		}
		
		
		
		if(PROG_ANALOG_PACK[SSP_BUF . index]!=255){
			SSP_BUF . data[SSP_BUF . write][SSP_BUF . index][4]=analog_data[PROG_ANALOG_PACK[SSP_BUF . index]];
		
		}
		
		
		bdc_ptr[0]=stream1.GetHash();
		bdc_ptr[1]=stream2.GetHash();
		SSP_BUF . data[SSP_BUF . write][SSP_BUF . index][0]=bdc_ptr[0]; 
		SSP_BUF . data[SSP_BUF . write][SSP_BUF . index][1]=bdc_ptr[1]; 
		
		bdc2_ptr[0]=stream3.GetHash();
		bdc2_ptr[1]=stream4.GetHash();
			
		bdc_save=ReadWriteFifo(bdc_save);
		
		place = SSP_BUF . index;
			if ((place-40)<0) place=160+place;	
			
		SSP_BUF . data[SSP_BUF . write][SSP_BUF . index][2]=bdc_ptr[0];
		SSP_BUF . data[SSP_BUF . write][place-40][3]=bdc2_ptr[0];
		SSP_BUF . data[SSP_BUF . write][place-40][5]=bdc2_ptr[1];






























 
		
		

			ssp1->Send(SSP_BUF . data[SSP_BUF . read][SSP_BUF.index],6);

		
	} 
	return 0; 
}



void UART3Handler() __irq{
	
	byte* buf = (byte*)bdc2_buf->GetForWriteBuf(4);
	uart3->Read(buf, 8);
	VIC::ClearInt();
}
void UART2Handler() __irq{
	
	byte* buf=(byte*)bdc_buf->GetForWriteBuf(4);
	uart2->Read(buf,8);	
	VIC::ClearInt();
}

void UART1Handler() __irq{
	byte buf[14];
	uart1->Read(buf,14);
	
	switch(bus[0]->GetID()){
		case COP_ID : {
			COPAnswer *answ=(COPAnswer*)buf;
			
		    SSP_BUF . data[SSP_BUF . write][COPNum.ULK_PWR][4]=answ->ULK_PWR; 	
			SSP_BUF . data[SSP_BUF . write][COPNum.NI][4]=answ->NI; 			
			SSP_BUF . data[SSP_BUF . write][COPNum.BI][4]=answ->BI;			
			SSP_BUF . data[SSP_BUF . write][COPNum.STATE][4]=answ->STATE;		
			break;
		}
		case TEMP2_ID: {
			SSP_BUF . data[SSP_BUF . write][Temp2Num.val][4]=*((ushort*)(buf+2));
			SSP_BUF . data[SSP_BUF . write][Temp2Num.addr][4]=HASHYATP[buf[1]&0x1F];
			break;
		}	
	};
	VIC::ClearInt();
}
