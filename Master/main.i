#line 1 "main.cpp"
#line 1 "../my_lib/fastport.h"



#line 1 "../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 5 "../my_lib/fastport.h"
#line 1 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


















 




 
#line 36 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 69 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 104 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 138 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"




 
#line 155 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 166 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 177 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 

















 
#line 203 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 498 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 507 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 515 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 523 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 531 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"



	
 
#line 554 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 574 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 594 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 614 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 639 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 662 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 680 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 698 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 715 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 732 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 742 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 752 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 762 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 770 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 783 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 796 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 827 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 843 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 




 
#line 857 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 868 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"






#line 887 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 900 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 914 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 927 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 950 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 964 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 982 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1079 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1087 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 1095 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"






 
#line 1117 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"





#line 1134 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


























#line 6 "../my_lib/fastport.h"
enum GPIO_REG{
	DIR=0,MASK=4,PIN=5,SET=6,CLR=7	
};
enum FastPortName{
	PORT_0,PORT_1,PORT_2,PORT_3,PORT_4
};

typedef ulong* FastPort;

FastPort GetFastPort(const FastPortName& num);	
#line 2 "main.cpp"
#line 1 "../my_lib/uart.h"

#line 1 "../my_lib/peripheral.h"
#line 4 "../my_lib/peripheral.h"
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


#line 3 "main.cpp"
#line 1 "../my_lib/vic.h"
#line 4 "../my_lib/vic.h"
	
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
#line 1 "../my_lib/pinsel.h"
#line 4 "../my_lib/pinsel.h"
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















#line 5 "main.cpp"
#line 1 "../my_lib/timer.h"
#line 4 "../my_lib/timer.h"
#line 5 "../my_lib/timer.h"
#line 6 "../my_lib/timer.h"

struct TimerMatchOption{
	uint presc;					
	uint mode;					
	uint mr0;					
	uint mr1;
	uint mr2;
	uint mr3;	
}; 


enum TimerName{
	TIMER_0=(uint)0xE0004000,
	TIMER_1=(uint)0xE0008000,
	TIMER_2=(uint)0xE0070000,
	TIMER_3=(uint)0xE0074000
};





class Timer:public Peripheral{
			
	
	public:
	Timer(TimerName name);
	~Timer();

	
	void Init(const TimerMatchOption* opt);
	
	void Clear();
	
	
	void Start();
	void Stop();
	uint GetCount();
	
	
	void ClearInt();
	uint GetIntStatus() const;
	static void Register(uint num,Timer* obj);
	static Timer* Get(uint num);
	
	protected:
	enum{
		IR=0,TCR=1,TC=2,PR=3,PC=4,MCR=5,MR0=6,MR1=7,MR2=8,
		MR3=9,CCR=10,CR0=11,CR1=12,CR2=13,CR3=14,EMR=15,CTCR=28	
	};
	private: 
	
	static Timer* DEV[4];
}; 















#line 6 "main.cpp"
#line 1 "../my_lib/ssp.h"



#line 5 "../my_lib/ssp.h"



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











#line 7 "main.cpp"

#line 1 "emc.h"
#line 4 "emc.h"
#line 5 "emc.h"






























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
FastPort BANK_PORT;	



uint read_bank=0,write_bank=0,count_bank=0;
uint BANK_ADDR=0,BANK_NUM=0; byte DELAY_CNT=1;
#line 60 "emc.h"





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

	BANK_PORT=GetFastPort(PORT_4);
	BANK_PORT[DIR]=BANK_HASH[7];
	BANK_PORT[CLR]=BANK_HASH[7];  

}

#line 9 "main.cpp"

#line 1 "secondstep.h"



#line 1 "DoubleBufferUshort.h"



#line 5 "DoubleBufferUshort.h"
#line 1 "doublebuffer_macro.h"



 


 








 























#line 47 "doublebuffer_macro.h"

#line 6 "DoubleBufferUshort.h"













 

class DoubleBufferUshort{

    public:
		ushort& GetWriteWord(const uint& num);
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;
    

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        
        uint Read(ushort* const data,const uint rsize);
		
		void Read(const uint& num,ushort& data);
        
        void Write(const ushort* data,const uint& wsize);
		
		void Write(const uint& num,const ushort& data);
        
        void Switch();
		
        bool IsRead();
		
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		void Clear();
};
#line 5 "secondstep.h"
#line 6 "secondstep.h"
#line 1 "secondstep_macro.h"
#line 1 "LKF_HASH_TABLE.h"



static const byte LKF_HASH_TABLE[256][4]={
113, 113, 113, 113, 
113, 113, 113, 117, 
113, 113, 113, 115, 
113, 113, 113, 15, 
113, 113, 117, 113, 
113, 113, 117, 117, 
113, 113, 117, 115, 
113, 113, 117, 15, 
113, 113, 115, 113, 
113, 113, 115, 117, 
113, 113, 115, 115, 
113, 113, 115, 15, 
113, 113, 15, 113, 
113, 113, 15, 117, 
113, 113, 15, 115, 
113, 113, 15, 15, 
113, 117, 113, 113, 
113, 117, 113, 117, 
113, 117, 113, 115, 
113, 117, 113, 15, 
113, 117, 117, 113, 
113, 117, 117, 117, 
113, 117, 117, 115, 
113, 117, 117, 15, 
113, 117, 115, 113, 
113, 117, 115, 117, 
113, 117, 115, 115, 
113, 117, 115, 15, 
113, 117, 15, 113, 
113, 117, 15, 117, 
113, 117, 15, 115, 
113, 117, 15, 15, 
113, 115, 113, 113, 
113, 115, 113, 117, 
113, 115, 113, 115, 
113, 115, 113, 15, 
113, 115, 117, 113, 
113, 115, 117, 117, 
113, 115, 117, 115, 
113, 115, 117, 15, 
113, 115, 115, 113, 
113, 115, 115, 117, 
113, 115, 115, 115, 
113, 115, 115, 15, 
113, 115, 15, 113, 
113, 115, 15, 117, 
113, 115, 15, 115, 
113, 115, 15, 15, 
113, 15, 113, 113, 
113, 15, 113, 117, 
113, 15, 113, 115, 
113, 15, 113, 15, 
113, 15, 117, 113, 
113, 15, 117, 117, 
113, 15, 117, 115, 
113, 15, 117, 15, 
113, 15, 115, 113, 
113, 15, 115, 117, 
113, 15, 115, 115, 
113, 15, 115, 15, 
113, 15, 15, 113, 
113, 15, 15, 117, 
113, 15, 15, 115, 
113, 15, 15, 15, 
117, 113, 113, 113, 
117, 113, 113, 117, 
117, 113, 113, 115, 
117, 113, 113, 15, 
117, 113, 117, 113, 
117, 113, 117, 117, 
117, 113, 117, 115, 
117, 113, 117, 15, 
117, 113, 115, 113, 
117, 113, 115, 117, 
117, 113, 115, 115, 
117, 113, 115, 15, 
117, 113, 15, 113, 
117, 113, 15, 117, 
117, 113, 15, 115, 
117, 113, 15, 15, 
117, 117, 113, 113, 
117, 117, 113, 117, 
117, 117, 113, 115, 
117, 117, 113, 15, 
117, 117, 117, 113, 
117, 117, 117, 117, 
117, 117, 117, 115, 
117, 117, 117, 15, 
117, 117, 115, 113, 
117, 117, 115, 117, 
117, 117, 115, 115, 
117, 117, 115, 15, 
117, 117, 15, 113, 
117, 117, 15, 117, 
117, 117, 15, 115, 
117, 117, 15, 15, 
117, 115, 113, 113, 
117, 115, 113, 117, 
117, 115, 113, 115, 
117, 115, 113, 15, 
117, 115, 117, 113, 
117, 115, 117, 117, 
117, 115, 117, 115, 
117, 115, 117, 15, 
117, 115, 115, 113, 
117, 115, 115, 117, 
117, 115, 115, 115, 
117, 115, 115, 15, 
117, 115, 15, 113, 
117, 115, 15, 117, 
117, 115, 15, 115, 
117, 115, 15, 15, 
117, 15, 113, 113, 
117, 15, 113, 117, 
117, 15, 113, 115, 
117, 15, 113, 15, 
117, 15, 117, 113, 
117, 15, 117, 117, 
117, 15, 117, 115, 
117, 15, 117, 15, 
117, 15, 115, 113, 
117, 15, 115, 117, 
117, 15, 115, 115, 
117, 15, 115, 15, 
117, 15, 15, 113, 
117, 15, 15, 117, 
117, 15, 15, 115, 
117, 15, 15, 15, 
115, 113, 113, 113, 
115, 113, 113, 117, 
115, 113, 113, 115, 
115, 113, 113, 15, 
115, 113, 117, 113, 
115, 113, 117, 117, 
115, 113, 117, 115, 
115, 113, 117, 15, 
115, 113, 115, 113, 
115, 113, 115, 117, 
115, 113, 115, 115, 
115, 113, 115, 15, 
115, 113, 15, 113, 
115, 113, 15, 117, 
115, 113, 15, 115, 
115, 113, 15, 15, 
115, 117, 113, 113, 
115, 117, 113, 117, 
115, 117, 113, 115, 
115, 117, 113, 15, 
115, 117, 117, 113, 
115, 117, 117, 117, 
115, 117, 117, 115, 
115, 117, 117, 15, 
115, 117, 115, 113, 
115, 117, 115, 117, 
115, 117, 115, 115, 
115, 117, 115, 15, 
115, 117, 15, 113, 
115, 117, 15, 117, 
115, 117, 15, 115, 
115, 117, 15, 15, 
115, 115, 113, 113, 
115, 115, 113, 117, 
115, 115, 113, 115, 
115, 115, 113, 15, 
115, 115, 117, 113, 
115, 115, 117, 117, 
115, 115, 117, 115, 
115, 115, 117, 15, 
115, 115, 115, 113, 
115, 115, 115, 117, 
115, 115, 115, 115, 
115, 115, 115, 15, 
115, 115, 15, 113, 
115, 115, 15, 117, 
115, 115, 15, 115, 
115, 115, 15, 15, 
115, 15, 113, 113, 
115, 15, 113, 117, 
115, 15, 113, 115, 
115, 15, 113, 15, 
115, 15, 117, 113, 
115, 15, 117, 117, 
115, 15, 117, 115, 
115, 15, 117, 15, 
115, 15, 115, 113, 
115, 15, 115, 117, 
115, 15, 115, 115, 
115, 15, 115, 15, 
115, 15, 15, 113, 
115, 15, 15, 117, 
115, 15, 15, 115, 
115, 15, 15, 15, 
15, 113, 113, 113, 
15, 113, 113, 117, 
15, 113, 113, 115, 
15, 113, 113, 15, 
15, 113, 117, 113, 
15, 113, 117, 117, 
15, 113, 117, 115, 
15, 113, 117, 15, 
15, 113, 115, 113, 
15, 113, 115, 117, 
15, 113, 115, 115, 
15, 113, 115, 15, 
15, 113, 15, 113, 
15, 113, 15, 117, 
15, 113, 15, 115, 
15, 113, 15, 15, 
15, 117, 113, 113, 
15, 117, 113, 117, 
15, 117, 113, 115, 
15, 117, 113, 15, 
15, 117, 117, 113, 
15, 117, 117, 117, 
15, 117, 117, 115, 
15, 117, 117, 15, 
15, 117, 115, 113, 
15, 117, 115, 117, 
15, 117, 115, 115, 
15, 117, 115, 15, 
15, 117, 15, 113, 
15, 117, 15, 117, 
15, 117, 15, 115, 
15, 117, 15, 15, 
15, 115, 113, 113, 
15, 115, 113, 117, 
15, 115, 113, 115, 
15, 115, 113, 15, 
15, 115, 117, 113, 
15, 115, 117, 117, 
15, 115, 117, 115, 
15, 115, 117, 15, 
15, 115, 115, 113, 
15, 115, 115, 117, 
15, 115, 115, 115, 
15, 115, 115, 15, 
15, 115, 15, 113, 
15, 115, 15, 117, 
15, 115, 15, 115, 
15, 115, 15, 15, 
15, 15, 113, 113, 
15, 15, 113, 117, 
15, 15, 113, 115, 
15, 15, 113, 15, 
15, 15, 117, 113, 
15, 15, 117, 117, 
15, 15, 117, 115, 
15, 15, 117, 15, 
15, 15, 115, 113, 
15, 15, 115, 117, 
15, 15, 115, 115, 
15, 15, 115, 15, 
15, 15, 15, 113, 
15, 15, 15, 117, 
15, 15, 15, 115, 
15, 15, 15, 15
};



static const byte BDC_HASH_TABLE[256][4]={
113, 113, 113, 113, 
113, 113, 113, 115, 
113, 113, 113, 117, 
113, 113, 113, 15, 
113, 113, 115, 113, 
113, 113, 115, 115, 
113, 113, 115, 117, 
113, 113, 115, 15, 
113, 113, 117, 113, 
113, 113, 117, 115, 
113, 113, 117, 117, 
113, 113, 117, 15, 
113, 113, 15, 113, 
113, 113, 15, 115, 
113, 113, 15, 117, 
113, 113, 15, 15, 
113, 115, 113, 113, 
113, 115, 113, 115, 
113, 115, 113, 117, 
113, 115, 113, 15, 
113, 115, 115, 113, 
113, 115, 115, 115, 
113, 115, 115, 117, 
113, 115, 115, 15, 
113, 115, 117, 113, 
113, 115, 117, 115, 
113, 115, 117, 117, 
113, 115, 117, 15, 
113, 115, 15, 113, 
113, 115, 15, 115, 
113, 115, 15, 117, 
113, 115, 15, 15, 
113, 117, 113, 113, 
113, 117, 113, 115, 
113, 117, 113, 117, 
113, 117, 113, 15, 
113, 117, 115, 113, 
113, 117, 115, 115, 
113, 117, 115, 117, 
113, 117, 115, 15, 
113, 117, 117, 113, 
113, 117, 117, 115, 
113, 117, 117, 117, 
113, 117, 117, 15, 
113, 117, 15, 113, 
113, 117, 15, 115, 
113, 117, 15, 117, 
113, 117, 15, 15, 
113, 15, 113, 113, 
113, 15, 113, 115, 
113, 15, 113, 117, 
113, 15, 113, 15, 
113, 15, 115, 113, 
113, 15, 115, 115, 
113, 15, 115, 117, 
113, 15, 115, 15, 
113, 15, 117, 113, 
113, 15, 117, 115, 
113, 15, 117, 117, 
113, 15, 117, 15, 
113, 15, 15, 113, 
113, 15, 15, 115, 
113, 15, 15, 117, 
113, 15, 15, 15, 
115, 113, 113, 113, 
115, 113, 113, 115, 
115, 113, 113, 117, 
115, 113, 113, 15, 
115, 113, 115, 113, 
115, 113, 115, 115, 
115, 113, 115, 117, 
115, 113, 115, 15, 
115, 113, 117, 113, 
115, 113, 117, 115, 
115, 113, 117, 117, 
115, 113, 117, 15, 
115, 113, 15, 113, 
115, 113, 15, 115, 
115, 113, 15, 117, 
115, 113, 15, 15, 
115, 115, 113, 113, 
115, 115, 113, 115, 
115, 115, 113, 117, 
115, 115, 113, 15, 
115, 115, 115, 113, 
115, 115, 115, 115, 
115, 115, 115, 117, 
115, 115, 115, 15, 
115, 115, 117, 113, 
115, 115, 117, 115, 
115, 115, 117, 117, 
115, 115, 117, 15, 
115, 115, 15, 113, 
115, 115, 15, 115, 
115, 115, 15, 117, 
115, 115, 15, 15, 
115, 117, 113, 113, 
115, 117, 113, 115, 
115, 117, 113, 117, 
115, 117, 113, 15, 
115, 117, 115, 113, 
115, 117, 115, 115, 
115, 117, 115, 117, 
115, 117, 115, 15, 
115, 117, 117, 113, 
115, 117, 117, 115, 
115, 117, 117, 117, 
115, 117, 117, 15, 
115, 117, 15, 113, 
115, 117, 15, 115, 
115, 117, 15, 117, 
115, 117, 15, 15, 
115, 15, 113, 113, 
115, 15, 113, 115, 
115, 15, 113, 117, 
115, 15, 113, 15, 
115, 15, 115, 113, 
115, 15, 115, 115, 
115, 15, 115, 117, 
115, 15, 115, 15, 
115, 15, 117, 113, 
115, 15, 117, 115, 
115, 15, 117, 117, 
115, 15, 117, 15, 
115, 15, 15, 113, 
115, 15, 15, 115, 
115, 15, 15, 117, 
115, 15, 15, 15, 
117, 113, 113, 113, 
117, 113, 113, 115, 
117, 113, 113, 117, 
117, 113, 113, 15, 
117, 113, 115, 113, 
117, 113, 115, 115, 
117, 113, 115, 117, 
117, 113, 115, 15, 
117, 113, 117, 113, 
117, 113, 117, 115, 
117, 113, 117, 117, 
117, 113, 117, 15, 
117, 113, 15, 113, 
117, 113, 15, 115, 
117, 113, 15, 117, 
117, 113, 15, 15, 
117, 115, 113, 113, 
117, 115, 113, 115, 
117, 115, 113, 117, 
117, 115, 113, 15, 
117, 115, 115, 113, 
117, 115, 115, 115, 
117, 115, 115, 117, 
117, 115, 115, 15, 
117, 115, 117, 113, 
117, 115, 117, 115, 
117, 115, 117, 117, 
117, 115, 117, 15, 
117, 115, 15, 113, 
117, 115, 15, 115, 
117, 115, 15, 117, 
117, 115, 15, 15, 
117, 117, 113, 113, 
117, 117, 113, 115, 
117, 117, 113, 117, 
117, 117, 113, 15, 
117, 117, 115, 113, 
117, 117, 115, 115, 
117, 117, 115, 117, 
117, 117, 115, 15, 
117, 117, 117, 113, 
117, 117, 117, 115, 
117, 117, 117, 117, 
117, 117, 117, 15, 
117, 117, 15, 113, 
117, 117, 15, 115, 
117, 117, 15, 117, 
117, 117, 15, 15, 
117, 15, 113, 113, 
117, 15, 113, 115, 
117, 15, 113, 117, 
117, 15, 113, 15, 
117, 15, 115, 113, 
117, 15, 115, 115, 
117, 15, 115, 117, 
117, 15, 115, 15, 
117, 15, 117, 113, 
117, 15, 117, 115, 
117, 15, 117, 117, 
117, 15, 117, 15, 
117, 15, 15, 113, 
117, 15, 15, 115, 
117, 15, 15, 117, 
117, 15, 15, 15, 
15, 113, 113, 113, 
15, 113, 113, 115, 
15, 113, 113, 117, 
15, 113, 113, 15, 
15, 113, 115, 113, 
15, 113, 115, 115, 
15, 113, 115, 117, 
15, 113, 115, 15, 
15, 113, 117, 113, 
15, 113, 117, 115, 
15, 113, 117, 117, 
15, 113, 117, 15, 
15, 113, 15, 113, 
15, 113, 15, 115, 
15, 113, 15, 117, 
15, 113, 15, 15, 
15, 115, 113, 113, 
15, 115, 113, 115, 
15, 115, 113, 117, 
15, 115, 113, 15, 
15, 115, 115, 113, 
15, 115, 115, 115, 
15, 115, 115, 117, 
15, 115, 115, 15, 
15, 115, 117, 113, 
15, 115, 117, 115, 
15, 115, 117, 117, 
15, 115, 117, 15, 
15, 115, 15, 113, 
15, 115, 15, 115, 
15, 115, 15, 117, 
15, 115, 15, 15, 
15, 117, 113, 113, 
15, 117, 113, 115, 
15, 117, 113, 117, 
15, 117, 113, 15, 
15, 117, 115, 113, 
15, 117, 115, 115, 
15, 117, 115, 117, 
15, 117, 115, 15, 
15, 117, 117, 113, 
15, 117, 117, 115, 
15, 117, 117, 117, 
15, 117, 117, 15, 
15, 117, 15, 113, 
15, 117, 15, 115, 
15, 117, 15, 117, 
15, 117, 15, 15, 
15, 15, 113, 113, 
15, 15, 113, 115, 
15, 15, 113, 117, 
15, 15, 113, 15, 
15, 15, 115, 113, 
15, 15, 115, 115, 
15, 15, 115, 117, 
15, 15, 115, 15, 
15, 15, 117, 113, 
15, 15, 117, 115, 
15, 15, 117, 117, 
15, 15, 117, 15, 
15, 15, 15, 113, 
15, 15, 15, 115, 
15, 15, 15, 117, 
15, 15, 15, 15

} ;	 
#line 4 "secondstep_macro.h"




 

#line 20 "secondstep_macro.h"

#line 29 "secondstep_macro.h"



#line 41 "secondstep_macro.h"
 
#line 53 "secondstep_macro.h"







const ushort HLMask[4][2]={
	0x3FC,0x3,
	0x3F0,0xF,
	0x3C0,0x3F,
	0x300,0xFF,
};
enum{
    HIGHT_MASK=0,
    LOW_MASK=1
};














#line 90 "secondstep_macro.h"









 

#line 109 "secondstep_macro.h"







#line 7 "secondstep.h"

















 

class SecondStepBase:public DoubleBufferUshort{
    public:
        ushort cur_word;
        uint mask;
    	uint shift;
		uint   cnt_5;	
		ushort *word4; 	
		byte word5[5];	
		

        SecondStepBase(ushort*const data_ptr,const uint& size);
        
		virtual byte GetNext()=0;
		
		void WriteAnalog(const uint& num,const ushort&  val); 
		void WriteContact(const uint& num,const ushort& val); 
};

class SecondStep2POS:public SecondStepBase{
    public:
        SecondStep2POS(ushort*const data_ptr,const uint& size);
        virtual byte GetNext();
        
};

class SecondStep4POS:public SecondStepBase{
    public:
        SecondStep4POS(ushort* const data_ptr,const uint& size);
        virtual byte GetNext();
        
};


class BDCStreamAddr:public SecondStepBase{
	public:
		BDCStreamAddr(ushort* const data_ptr,const uint&size);
		virtual byte GetNext();
};
#line 11 "main.cpp"
#line 1 "softwarecounter.h"
#line 4 "softwarecounter.h"
typedef void EVT_HANDLER();

class SoftwareCounter{
	private:
		uint count;				
		const uint trggr_val;	
		const uint step;        
		EVT_HANDLER *EventHandler;		
	public:
		
		SoftwareCounter(const uint& trigger,const uint& istep=1,EVT_HANDLER handler=0, const uint& start_val=0);
		~SoftwareCounter();
		void operator++ (int);
		void operator++ ();
		bool operator >(uint match_val) const;
		bool operator <(uint match_val) const;
		bool operator ==(uint match_val) const;
		bool operator >=(uint match_val) const;
		bool operator <=(uint match_val) const;
		bool operator !=(uint match_val) const;

		const uint& GetValue() const;
		void Set(uint val);
};

#line 12 "main.cpp"
#line 1 "skuttime.h"
#line 4 "skuttime.h"


class SKUTTime{
	private:
		const uint marker;
		byte units,tens,hundreds,thousands;
		uint time;
	public:
		SKUTTime();
		~SKUTTime();
		uint GetBit();
		void Clear();
		void Set(const byte& u,const byte& t,const byte& h,const byte& th);
		void Set(const uint& n_time);
		void operator++(int);





 
};

	
#line 13 "main.cpp"

 
#line 1 "yalkpoll.h"


 

 
struct PollingNumber{
	byte analog;
	byte contact;
	byte lkf;
	byte chan;
};



uint PPLL_COUNT=10;






 	  
struct CLCPoll{
	byte ID;
	byte analog;
	byte contact;
	byte crc8;
	byte lkf;
	byte chan;
	byte writemode;			
};


	




  CLCPoll clcpolltable[2][160]={

42,78,82,20,0,21,2,
42,32,82,44,255,255,0,
42,31,82,7,0,0,1,
42,30,82,243,1,1,1,
42,37,82,91,1,2,1,
42,36,82,175,1,3,1,	 
42,35,82,1,1,4,1,	
42,34,82,245,1,5,1,
42,3,82,221,1,6,1,			 
42,2,82,41,1,7,1,
42,1,82,4,1,8,1,
42,0,82,240,1,9,1,
42,7,82,94,1,10,1,
42,72,82,78,1,11,1,
42,5,82,135,1,12,1,
42,15,82,105,0,8,1,			 
42,14,82,157,1,14,1,
42,13,82,176,1,15,1,
42,12,82,68,1,16,1,
42,11,82,234,1,17,1,
42,10,82,30,1,18,1,
42,9,82,51,1,19,1,
42,8,82,199,1,20,1,
42,53,82,53,1,21,1,
42,79,82,224,1,22,1,
42,56,82,117,1,27,1,
42,57,82,129,0,16,1,
42,34,82,245,1,25,1,
42,73,82,186,1,26,1,			 
42,80,80,117,1,23,1,			 
42,81,82,227,0,24,1,			
42,49,82,182,255,255,0,		 
42,80,48,206,0,13,1,
42,47,16,234,1,31,1,
42,80,80,117,1,32,2,		   	 
42,59,82,88,1,33,0,			
42,17,42,43,255,255,0,
42,80,43,103,1,48,1,				 
42,80,80,117,1,36,0,					  		  
42,58,82,172,1,37,2,					   
42,21,65,249,255,255,0,
42,80,80,117,1,49,1,			 
42,31,18,58,1,40,0,
42,80,24,241,255,255,0,	   
42,63,25,12,1,34,0,
42,81,26,103,1,43,2,
42,35,41,19,1,44,0,
42,80,80,117,1,45,0,						
42,34,4,45,1,38,0,		
42,2,64,8,255,255,0,
42,1,71,178,1,39,0,
42,80,80,117,1,41,0,			
42,44,82,152,1,42,0,
42,45,82,108,255,255,0,
42,5,27,50,1,52,1,
42,15,28,75,1,53,1,		 
42,66,82,160,1,46,0,						
42,38,82,118,1,47,0,
42,80,80,117,1,56,1,			 
42,67,82,84,1,54,1,
42,80,82,23,255,255,0,
42,80,80,117,1,59,1,			  
42,80,80,117,1,60,1,			  
42,82,82,206,255,255,0,
42,80,80,117,255,255,0,		  
42,80,80,117,1,63,1,	   		  
42,82,82,206,255,255,0,
42,34,82,245,255,255,0,
42,80,82,23,0,63,1,		  
42,80,82,23,1,55,1,
42,81,82,227,0,28,1,
42,80,80,117,1,28,1,			  
42,81,33,72,1,13,1,	   
42,80,74,237,255,255,0,	   
42,80,29,4,254,255,0,	   
42,80,80,117,0,19,2,			  
42,80,60,179,0,17,2,		 
42,80,80,117,255,255,0,		  
42,80,75,220,1,35,2,	   
42,80,80,117,255,255,0,		  
42,78,82,20,0,21,2,		  
42,32,82,44,255,255,0,
42,31,82,7,0,32,1,		   
42,30,82,243,1,1,1,
42,37,82,91,1,2,1,
42,36,82,175,1,3,1,
42,35,82,1,1,4,1,
42,34,82,245,1,5,1, 
42,3,82,221,1,6,1,
42,2,82,41,1,7,1,
42,1,82,4,1,8,1,
42,0,82,240,1,9,1,
42,7,82,94,1,10,1,
42,72,82,78,1,11,1,
42,5,82,135,1,12,1,
42,15,82,105,0,40,1,
42,14,82,157,1,14,1,
42,13,82,176,1,15,1,
42,12,82,68,1,16,1,
42,11,82,234,1,17,1,
42,10,82,30,1,18,1,
42,9,82,51,1,19,1,
42,8,82,199,1,20,1,
42,53,82,53,1,21,1,
42,79,82,224,1,22,1,
42,56,82,117,1,27,1,
42,57,82,129,0,48,1,
42,34,82,245,1,25,1,
42,73,82,186,1,26,1,
42,80,80,117,1,23,1,			
42,81,82,227,0,56,1,		
42,49,82,182,255,255,0,
42,80,48,206,0,13,1,
42,47,16,234,1,31,1,
42,80,80,117,1,32,2,			 
42,59,82,88,1,33,0,		  
42,17,42,43,255,255,0,
42,80,43,103,1,48,1,
42,80,80,117,1,36,0,			 
42,58,82,172,1,37,2,
42,21,65,249,255,255,0,
42,80,80,117,1,49,1,			  
42,31,18,58,1,40,0,
42,80,24,241,255,255,0,			
42,63,25,12,1,34,0,
42,81,26,103,1,43,2,
42,35,41,19,1,44,0,				 
42,80,80,117,1,45,0,					
42,34,4,45,1,38,0,
42,2,64,8,255,255,0,
42,1,71,178,1,39,0,
42,80,80,117,1,41,0,			 
42,44,82,152,1,42,0,
42,45,82,108,255,255,0,
42,5,27,50,1,52,1,
42,15,28,75,1,53,1,
42,66,82,160,1,46,0,		   				
42,38,82,118,1,47,0,
42,80,80,117,1,56,1,			  
42,67,82,84,1,54,1,
42,80,82,23,255,255,0,
42,80,80,117,1,59,1,			  
42,80,80,117,1,60,1,			  
42,82,82,206,255,255,0,
42,80,80,117,255,255,0,		  
42,80,80,117,1,63,1,			  
42,80,80,117,255,255,0,		  
42,34,82,245,255,255,0,
42,80,82,23,255,255,0,
42,80,82,23,1,55,1,
42,81,82,227,0,28,1,
42,80,80,117,1,28,1,			  
42,81,33,72,1,13,1,   	    
42,80,74,237,255,255,0,	   
42,80,29,4,254,255,0,					
42,80,80,117,0,19,2,			  
42,80,60,179,0,17,2,	 
42,80,80,117,255,255,0,		  
42,80,75,220,1,35,2,					
42,80,80,117,255,255,0,		  

43	,	36	,	82	,	233	,	2	,	63	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,			
43	,	0	,	82	,	182	,	2	,	5	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	10	,	48	,	129	,	2	,	11	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	33	,	19	,	146	,	2	,	20	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	37	,	82	,	29	,	2	,	25	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0, 
43	,	63	,	82	,	157	,	2	,	4	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	15	,	82	,	47	,	2	,	9	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	55	,	4	,	114	,	2	,	15	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	20	,	66	,	24	,	2	,	24	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	59	,	41	,	12	,	2	,	39	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	48	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	60	,	18	,	2	,	21	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	54	,	16	,	1	,	2	,	27	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	32	,	82	,	106	,	2	,	23	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	35	,	82	,	71	,	2	,	1	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	1	,	82	,	66	,	2	,	6	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	12	,	58	,	0	,	2	,	10	,	1,		  	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	57	,	61	,	82	,	2	,	18	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	22	,	13	,	210	,	2	,	26	,	0,		  	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	45	,	82	,	42	,	2	,	41	,	0,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	67	,	155	,	2	,	56	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	37	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	44	,	48	,	7	,	2	,	43	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	31	,	19	,	77	,	2	,	52	,	0,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	34	,	82	,	179	,	2	,	57	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	7	,	82	,	24	,	2	,	7	,	1,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	11	,	47	,	24	,	2	,	12	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	56	,	42	,	114	,	2	,	19	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	23	,	38	,	74	,	2	,	30	,	0,		   	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	80	,	82	,	81	,	2	,	42	,	0,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	60	,	1,			
52	,	0	,	0	,	191	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	53	,	0,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,			 
43	,	39	,	16	,	155	,	2	,	59	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	30	,	82	,	181	,	2	,	55	,	0,	 	 	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	3	,	82	,	155	,	2	,	3	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	5	,	82	,	193	,	2	,	8	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	8	,	14	,	130	,	2	,	14	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	49	,	43	,	128	,	2	,	22	,	0,	  		
81	,	81	,	0	,	72	,	255	,	255	,  	0,
43	,	81	,	40	,	134	,	2	,	31	,	0,		   	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	82	,	82	,	136	,	2	,	45	,	0,			
0	,	0	,	0	,	75	,	255	,	255	,	0,			
43	,	36	,	82	,	233	,	2	,	63	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	5	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	10	,	48	,	129	,	2	,	11	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	33	,	19	,	146	,	2	,	20	,	0,	  		
0	,	30	,	0	,	72	,	255	,	255	,	0,
43	,	37	,	82	,	29	,	2	,	25	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	63	,	82	,	157	,	2	,	4	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	15	,	82	,	47	,	2	,	9	,	1,	  	 	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	55	,	4	,	114	,	2	,	15	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	20	,	66	,	24	,	2	,	24	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	59	,	41	,	12	,	2	,	39	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	48	,	0,   	  	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	60	,	18	,	2	,	21	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	54	,	16	,	1	,	2	,	27	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,  	0,
43	,	32	,	82	,	106	,	2	,	23	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	35	,	82	,	71	,	2	,	1	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	1	,	82	,	66	,	2	,	6	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	12	,	58	,	0	,	2	,	10	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	57	,	61	,	82	,	2	,	18	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	22	,	13	,	210	,	2	,	26	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	45	,	82	,	42	,	2	,	41	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	67	,	155	,	2	,	56	,	1,	  	  	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	37	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	44	,	48	,	7	,	2	,	43	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	31	,	19	,	77	,	2	,	52	,	0,	   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	34	,	82	,	179	,	2	,	57	,	0,	   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	7	,	82	,	24	,	2	,	7	,	1,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	11	,	47	,	24	,	2	,	12	,	1,		 	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	56	,	42	,	114	,	2	,	19	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	23	,	38	,	74	,	2	,	30	,	0,  		
0	,	0	,	0	,	75	,	255	,	255	,	0,   
43	,	80	,	82	,	81	,	2	,	42	,	0,   		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	60	,	1,	 		
52	,	1	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	53	,	0,	  		
0	,	0	,	0	,	75	,	255	,	255	,	0,	   
43	,	39	,	16	,	155	,	2	,	59	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	30	,	82	,	181	,	2	,	55	,	0,  	 	
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	3	,	82	,	155	,	2	,	3	,	1,	 		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	5	,	82	,	193	,	2	,	8	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	8	,	14	,	130	,	2	,	14	,	1,			
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	49	,	43	,	128	,	2	,	22	,	0,		 	
81	,	81	,	0	,	72	,	255	,	255	,	0,
43	,	81	,	40	,	134	,	2	,	31	,	0,		   	
0	,	0	,	0	,	75	,	255	,	255	,  	0,
43	,	82	,	82	,	136	,	2	,	45	,	0,			
0	,	0	,	0	,	75	,	255	,	255	,	0
};						

struct YALKTestPoll
{
	unsigned char ID;
	unsigned char analog;
	unsigned char contact;
	unsigned char analogchan;
	unsigned char contactchan;
};

struct YALKTestPoll YALKTestPollTable[160]={				
	42,	33,	42,255,255,   
	42,	32,	43,255,255,	  
	42,	31,	44,	0,	50,	  
	42,	30,	45,	1,	51,	  
	42,	37,	38,	2,	52,	  
	42,	36,	39,	3,	53,	  
	42,	35,	40,	4,	54,	  
	42,	34,	41,	5,	55,	  
	42,	3,	4,	6,	56,	  
	42,	2,	67,	7,	57,	  
	42,	1,	66,	8,	58,	  
	42,	0,	65,	9,	59,	  
	42,	7,	64,	10,	60,	  
	42,	6,	71,	11,	61,	  
	42,	5,	24,	12,	62,	  
	42,	15,	25,	13,	63,	  
	42,	14,	26,	14,	64,	  
	42,	13,	27,	15,	65,	  
	42,	12,	28,	16,	66,	  
	42,	11,	29,	17,	67,	  
	42,	10,	85,	18,	68,	  
	42,	9,	84,	19,	69,	  
	42,	8,	91,	20,	70,	  
	42,	54,	50,	21,	71,	  
	42,	55,	51,	22,	72,	  
	42,	56,	52,	23,	73,	  
	42,	57,	70,	24,	74,	  
	42,	53,	69,	25,	75,	  
	42,	88,	68,	26,	76,	  
	42,	87,	76,	27,	77,	  
	42,	86,	77,	28,	78,	  
	42,	49,	78,	29,	79,	  
	42,	48,	79,	30,	80,	  
	42,	47,	72,	31,	81,	  
	42,	46,	73,	32,	82,	  
	42,	16,	74,	33,	83,	  
	42,	17,	75,	34,	84,	  
	42,	18,	90,	35,	85,	  
	42,	19,	92,	36,	86,	  
	42,	20,	93,	37,	87,	  
	42,	21,	94,	38,	88,	  
	42,	22,	95,	39,	89,	  
	42,	23,	96,	40,	90,	  
	42,	89,	97,	41,	91,	  
	42,	63,	98,	42,	92,	  
	42,	62,	99,	43,	93,	  
	42,	61,	80,	44,	94,	  
	42,	60,	81,	45,	95,	  
	42,	59,	82,	46,	96,	  
	42,	58,	83,	47,	97,	  
	42,	42,	33,	48,	98,	  
	42,	43,	32,	49,	99,	  
	42,	44,	31,	50,	0,	  
	42,	45,	30,	51,	1,	  
	42,	38,	37,	52,	2,	  
	42,	39,	36,	53,	3,	  
	42,	40,	35,	54,	4,	  
	42,	41,	34,	55,	5,	  
	42,	4,	3,	56,	6,	  
	42,	67,	2,	57,	7,	  
	42,	66,	1,	58,	8,	  
	42,	65,	0,	59,	9,	  
	42,	64,	7,	60,	10,	  
	42,	71,	6,	61,	11,	  
	42,	24,	5,	62,	12,	  
	42,	25,	15,	63,	13,	  
	42,	26,	14,	64,	14,	  
	42,	27,	13,	65,	15,	  
	42,	28,	12,	66,	16,	  
	42,	29,	11,	67,	17,	  
	42,	85,	10,	68,	18,	  
	42,	84,	9,	69,	19,	  
	42,	91,	8,	70,	20,	  
	42,	50,	54,	71,	21,	  
	42,	51,	55,	72,	22,	  
	42,	52,	56,	73,	23,	  
	42,	70,	57,	74,	24,	  
	42,	69,	53,	75,	25,	  
	42,	68,	88,	76,	26,	  
	42,	76,	87,	77,	27,	  
	42,	77,	86,	78,	28,	  
	42,	78,	49,	79,	29,	  
	42,	79,	48,	80,	30,	  
	42,	72,	47,	81,	31,	  
	42,	73,	46,	82,	32,	  
	42,	74,	16,	83,	33,	  
	42,	75,	17,	84,	34,	  
	42,	90,	18,	85,	35,	  
	42,	92,	19,	86,	36,	  
	42,	93,	20,	87,	37,	  
	42,	94,	21,	88,	38,	  
	42,	95,	22,	89,	39,	  
	42,	96,	23,	90,	40,	  
	42,	97,	89,	91,	41,	  
	42,	98,	63,	92,	42,	  
	42,	99,	62,	93,	43,	  
	42,	80,	61,	94,	44,	  
	42,	81,	60,	95,	45,	  
	42,	82,	59,	96,	46,	  
	42,	83,	58,	97,	47,	  
	42,	82,	82,	98,	48,
	42,	82,	82,	99,	49,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
};														

uint clc_poll_count=0;







byte temp1_table[32][4]={
52, 0, 0, 191,
52, 1, 0, 75,
52, 2, 0, 102,
52, 3, 0, 146,
52, 4, 0, 60,
52, 5, 0, 200,
52, 6, 0, 229,
52, 7, 0, 17,
52, 8, 0, 136,
52, 9, 0, 124,
52, 10, 0, 81,
52, 11, 0, 165,
52, 12, 0, 11,
52, 13, 0, 255,
52, 14, 0, 210,
52, 15, 0, 38,
52, 16, 0, 209,
52, 17, 0, 37,
52, 18, 0, 8,
52, 19, 0, 252,
52, 20, 0, 82,
52, 21, 0, 166,
52, 22, 0, 139,
52, 23, 0, 127,
52, 24, 0, 230,
52, 25, 0, 18,
52, 26, 0, 63,
52, 27, 0, 203,
52, 28, 0, 101,
52, 29, 0, 145,
52, 30, 0, 188,
52, 31, 0, 72	
};
byte temp1_count=0;



#line 16 "main.cpp"
#line 1 "../my_lib/crc8.h"
#line 4 "../my_lib/crc8.h"











 


 
byte CalcCRC8(byte *pcBlock,byte len);

#line 17 "main.cpp"
#line 1 "../my_lib/crc16.h"
#line 4 "../my_lib/crc16.h"












 
ushort CalcCRC16(byte * pcBlock, ushort len);
#line 18 "main.cpp"
#line 1 "maindef.h"













#line 22 "maindef.h"







uint MAX_SCALE=450;
uint MIN_SCALE1=575;
uint MIN_SCALE2=575;
byte SIN[8]={7,23,39,56,56,39,23,7};


#line 51 "maindef.h"


#line 63 "maindef.h"








#line 77 "maindef.h"


#line 170 "maindef.h"















	
#line 197 "maindef.h"










#line 216 "maindef.h"








#line 19 "main.cpp"

#line 1 "fifo_emc.h"
#line 4 "fifo_emc.h"



 





	
	
	
	uint ReadWriteFifo(const uint& input);
#line 21 "main.cpp"
#line 1 "../my_lib/flash.h"






















extern "C" {



 
int SetState  (unsigned char*, unsigned short,int  );




 
int GetState  (int  );
}





int EraseSector  (	unsigned short  );















typedef void (*IAP)(unsigned int [], unsigned int []);	
														

#line 22 "main.cpp"

extern "C"{
	
	void UART1Handler() __irq;	
	
	void EINT2Handler() __irq;	
	void UART2Handler() __irq;	
	void UART0Handler() __irq;	
};

void InitINT2(); 	
bool SYNC=false;	
byte buf_yalk[1];	
byte buff[20];
byte buff2[70];
byte NumberPacket=0,NumberPacket2=0,NumberPacket3=0;
char BDC2flag = 0;
unsigned int LKF3counter = 0;
unsigned char TestYALKFlag=0;
unsigned char CountTestYALK=0;

ushort CalcFromCOPScale(uint max,uint min,uint val);

void CalcSIN(byte* sin);











 
SecondStepBase *LKF[11];


struct LKFOption{
	byte time0_chan;
	byte time1_chan;
	byte count_chan;
	byte contact_time;
};

static const LKFOption lkf0_opt={50,51,49,43};

struct {
	ushort lkf_frames; 				
	ushort TIME_SEC;   				
	ushort okf_frames; 				
	SKUTTime *time_contact;	   	
} TheTime={0,0,0};

#line 84 "main.cpp"





 

byte FRAME[8][80] __attribute__((at(0x7FD00000)));  
FastPort P0=GetFastPort(PORT_0),P4=GetFastPort(PORT_4);

const unsigned char NumberChannel[100]=
{
	33,	32,	31,	30,	37,	36,	35,	34,	3,	2,
	1,	0,	7,	6,	5,	15,	14,	13,	12,	11,
	10,	9,	8,	54,	55,	56,	57,	53,	88,	87,
	86,	49,	48,	47,	46,	16,	17,	18,	19,	20,
	21,	22,	23,	89,	63,	62,	61,	60,	59,	58,
	42,	43,	44,	45,	38,	39,	40,	41,	4,	67,
	66,	65,	64,	71,	24,	25,	26,	27,	28,	29,
	85,	84,	91,	50,	51,	52,	70,	69,	68,	76,
	77,	78,	79,	72,	73,	74,	75,	90,	92,	93,
	94,	95,	96,	97,	98,	99,	80,	81,	82,	83 
};

const unsigned char NumberContactChannel[100]=
{
	42,	43,	44,	45,	38,	39,	40,	41,	4,	67,
	66,	65,	64,	71,	24,	25,	26,	27,	28,	29,
	85,	84,	91,	50,	51,	52,	70,	69,	68,	76,
	77,	78,	79,	72,	73,	74,	75,	90,	92,	93,
	94,	95,	96,	97,	98,	99,	80,	81,	82,	83, 
	33,	32,	31,	30,	37,	36,	35,	34,	3,	2,
	1,	0,	7,	6,	5,	15,	14,	13,	12,	11,
	10,	9,	8,	54,	55,	56,	57,	53,	88,	87,
	86,	49,	48,	47,	46,	16,	17,	18,	19,	20,
	21,	22,	23,	89,	63,	62,	61,	60,	59,	58
};

const unsigned char HASHYATP[32]={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,0,1};


const byte HASH6BIT[]=  {
0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,
};

unsigned char TempModeTable[64];								 

unsigned char CalibrQueryYALK1[4]={42,80,82,23};
unsigned char CalibrQueryYALK2[4]={43,80,82,81};













UART *uart1,*uart2; 
SSP* ssp1;


FastPort DIR1=GetFastPort(PORT_0),DIR2=GetFastPort(PORT_0);
const uint DIR1_VAL=1<<17;
const uint DIR2_VAL=1<<19;

struct FastQuery{
	byte  ID;
	byte analog;
	byte contact;
	byte crc8;
};




uint PRG_CNT=0,FRM_CNT=0,cnt63=0,count=0;


ushort ssp_empty[8]={0,0,0,0,0,0,0,0};
ushort ssp_empty2[8] ={0,0,0,0,0,0,0,0};
ushort ssp_sync[8]={0,0,223932,9189,13,0,223932,9189};  
ushort ssp_read[8]={0,0,0,0,0,400,450,500};

	void UART0_Init()
{
	(*(volatile unsigned long *)(0xE000C000 + 0x0C))  |= 0x80;			
	(*(volatile unsigned long *)(0xE000C000 + 0x04)) = 0;
	(*(volatile unsigned long *)(0xE000C000 + 0x00)) = 1;			    
	(*(volatile unsigned long *)(0xE000C000 + 0x0C))  = 0x03;		    
	(*(volatile unsigned long *)(0xE000C000 + 0x08)) = 0x47;			
	(*(volatile unsigned long *)(0xE000C000 + 0x04)) = 0x1;			
}

	void UART0_Send(const unsigned char* buffer,int bufSize)
{
	int i=0;
	(*(volatile unsigned long *)(0x3FFFC000 + 0x58))|=1<<10;					
	while (i<bufSize)
	{
	(*(volatile unsigned long *)(0xE000C000 + 0x00)) = buffer[i];
	while (((*(volatile unsigned long *)(0xE000C000 + 0x14))&0x20)==0);
	i++;
	}
}

void UART0_Read(unsigned char* buffer,int bufsize)
{
	int i=0;
	for (i=0;i<bufsize;i++) buffer[i]=(*(volatile unsigned long *)(0xE000C000 + 0x00));
}

void UART2_Read(unsigned char* buffer,int bufsize)
{
	int i=0;
	for (i=0;i<bufsize;i++) buffer[i]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
}
	
int main(){
	
	(*(volatile unsigned long *)(0xE01FC000 + 0x1A0))|=1;		   
	VIC::Init();		

	
	(*(volatile unsigned long *)(0xE01FC000 + 0x0C4))|= (1 << 29);
   	(*(volatile unsigned long *)(0xFFE04000 + 0x030))=1;
	while ( !((*(volatile unsigned long *)(0xFFE04000 + 0x030)) & 0x1) );
	(*(volatile unsigned long *)(0xFFE04000 + 0x104))= 0xE0068008;

	(*(volatile unsigned long *)(0xFFE04000 + 0x008)) = 0x01;
	(*(volatile unsigned long *)(0xFFE04000 + 0x010)) = 0x01;

	(*(volatile unsigned long *)(0xFFE04000 + 0x10C)) = (0x0 << 12) | (0x0<< 15)|(0<<18)|(0<<21)| (1 << 26)|(1<<31);	
	(*(volatile unsigned long *)(0xFFE04000 + 0x110)) = (0x01 << 11)|(0x0 << 6)|(1<<15)|(1<<14);

	
	UART::Register(0,new UART(UART_0)); UART::Register(1,new UART(UART_1)); UART::Register(2,new UART(UART_2)); UART::Register(3,new UART(UART_3));			
	const UARTOption u_opt={0,0,1,3,7|(3<<6)};
	uart1=UART::Get(1);
	uart1->Init(&u_opt);
	
	
	PINSEL::Set(0,15,func_01);   
	PINSEL::Set(0,16,func_01);	
	
	DIR1[DIR]|=DIR1_VAL;
	PINSEL::Set(0,17,func_00);
	

	
	
	for (int i=0;i<=19;i++) TempModeTable[i]=1;				
	for (int i=20;i<=29;i++) TempModeTable[i]=4;			
	TempModeTable[30]=5;									
	TempModeTable[31]=6;									

	
	for (int i=32;i<=51;i++) TempModeTable[i]=1;				
	for (int i=52;i<=61;i++) TempModeTable[i]=4;			
	TempModeTable[62]=5;									
	TempModeTable[63]=6;									
	
	
	(*(volatile unsigned long *)(0x3FFFC000 + 0x00))|=1<<2;							
	(*(volatile unsigned long *)(0x3FFFC000 + 0x40))|=1<<10;							
	(*(volatile unsigned long *)(0xE002C000 + 0x00))|=(1<<4)|(1<<6);					
	UART0_Init();
	(*(volatile unsigned long *)(0xFFFFF000 + 0x118)) = (unsigned long)UART0Handler;     
  (*(volatile unsigned long *)(0xFFFFF000 + 0x218)) = 0;
	(*(volatile unsigned long *)(0xFFFFF000 + 0x010))|=1<<6;
	
	
	uart2=UART::Get(2);
	uart2->Init(&u_opt);
	
	
	PINSEL::Set(0,10,func_01);
	PINSEL::Set(0,11,func_01);
	
	DIR2[DIR]|=DIR2_VAL;
	
	
	
	SSP::Register(0,new SSP(SSP_0));SSP::Register(1,new SSP(SSP_1));
	
	SSP* ssp0=SSP::Get(0);
	const SSPOption s0_opt={
		7,
		1,
		0,
		0xC,
		0,
		0,
		0,
		0,
		0,
		2
	};
	ssp0->Init(&s0_opt);
	

	PINSEL::Set(0,18,func_10);
   
	ssp1=SSP::Get(1);
	
	const SSPOption s1_opt={0xF,0,0,10,0,0,0,0,SSP::ROR,0};
	ssp1->Init(&s1_opt);
	
	
	PINSEL::Set(0,6,func_10);  
	PINSEL::Set(0,7,func_10);  
	PINSEL::Set(0,8,func_10);  
	PINSEL::Set(0,9,func_10);  

	
	P0[DIR]|=1<<22;
	P0[DIR]|=1;
	
	InitINT2();
	
	InitEMC();








	LKF[0]=new SecondStep4POS(new ushort[128],64);
	LKF[1]=new SecondStep4POS(new ushort[128],64);
	LKF[2]=new SecondStep4POS(new ushort[128],64);
	
	
	
	LKF[3]=new BDCStreamAddr(new ushort[40],20); 
	LKF[4]=new BDCStreamAddr(new ushort[40],20); 
   	LKF[5]=new BDCStreamAddr(new ushort[40],20); 
	LKF[6]=new BDCStreamAddr(new ushort[40],20); 
	
	LKF[7]=new BDCStreamAddr(new ushort[40],20); 
	LKF[8]=new BDCStreamAddr(new ushort[40],20); 
   	LKF[9]=new BDCStreamAddr(new ushort[40],20); 
	LKF[10]=new BDCStreamAddr(new ushort[40],20);


int i;
byte buf[14];

DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<50;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
uart1->Read(buf,14);

for (i=0;i<10000;i++);

DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<50;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
uart1->Read(buf,14);

for (i=0;i<10000;i++);

DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<50;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
if (uart1->Read(buf,14)) MIN_SCALE1=(buf[12]|(buf[13]<<8));


DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<50;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
uart2->Read(buf,14);

for (i=0;i<10000;i++);

DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<50;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
uart2->Read(buf,14);

for (i=0;i<10000;i++);

DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<50;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
if (uart2->Read(buf,14)) MIN_SCALE2=(buf[12]|(buf[13]<<8));  

VIC::InstallIRQ(VIC::UART1_INT,(void*)UART1Handler,2);						
VIC::InstallIRQ(VIC::UART2_INT,(void*)UART2Handler,2);						





	for(uint i=0;i<64;i++){
		LKF[0]->Write(i,MIN_SCALE1);
		LKF[1]->Write(i,MIN_SCALE1);
		LKF[2]->Write(i,MIN_SCALE2);
	}
	
	
	LKF[0]->Write(62,1023);
	LKF[1]->Write(62,1023);
	LKF[2]->Write(62,1023); 

	
	LKF[0]->Write(61,1023);
	LKF[1]->Write(61,1023);
	LKF[2]->Write(61,1023);

	LKF[0]->Write(45,960);			 
	LKF[0]->Write(60,576);			 
	
	LKF[0]->Switch();
	LKF[1]->Switch();
	LKF[2]->Switch();
	for(uint i=0;i<64;i++){
		LKF[0]->Write(i,MIN_SCALE1);
		LKF[1]->Write(i,MIN_SCALE1);
		LKF[2]->Write(i,MIN_SCALE2);
	}
	
	
	LKF[0]->Write(62,1023);
	LKF[1]->Write(62,1023);
	LKF[2]->Write(62,1023);
	
	LKF[0]->Write(61,1023);
	LKF[1]->Write(61,1023);
	LKF[2]->Write(61,1023);

	LKF[0]->Write(45,960);			 
	LKF[0]->Write(60,576);			 

	LKF[0]->Switch();
	LKF[1]->Switch();
	LKF[2]->Switch();



	
	for(int i=0;i<8;i++){
		for(int j=0;j<80-1;j++){
			FRAME[i][j]=HASH6BIT[0];
		}
		
		
		for(uint j=0;j<80;j++)
			FRAME[i][j]=HASH6BIT[0];
		
		FRAME[i][18]=HASH6BIT[SIN[0]];
		FRAME[i][38]=HASH6BIT[31];
		FRAME[i][39]=HASH6BIT[31];
		FRAME[i][29]=HASH6BIT[SIN[i]];
	
		

		
		FRAME[i][58]=HASH6BIT[SIN[0]];
		FRAME[i][78]=HASH6BIT[31];
		FRAME[i][79]=HASH6BIT[31];
		FRAME[i][69]=HASH6BIT[SIN[i]];
	}
	
	
	
	TheTime.time_contact=new SKUTTime();
	
	
	uint LKF_COUNT=0;
	int dat=0;
	FRM_CNT=0; 
	
	clc_poll_count=0; 







(*(volatile unsigned long *)(0x3FFFC000 + 0x00))|=1<<26;
	while(1){
		
		





 		
		ssp1->Send(ssp_empty,6);
		ssp1->Read(ssp_read,6);
		
		
		if(++clc_poll_count==160) clc_poll_count=0; 

		
		
		(*(volatile unsigned long *)(0x3FFFC000 + 0x18))|=0xA0000;
		
		uart1->Send(((byte*)(&clcpolltable[0][clc_poll_count])),4);
		uart2->Send(((byte*)(&clcpolltable[1][clc_poll_count])),4);
		
		












 
		
		DIR1[CLR]|=DIR1_VAL;
		{ LKF[1]->write[35]&=0x200;LKF[1]->write[35]|=(TheTime . TIME_SEC&0x1FF);};
		
		
		for(uint i=0;i<3;i++){
			if((LKF[i]->rcount>=LKF[i]->size)){
				{ ushort* tmp; tmp=LKF[i]->read; LKF[i]->read=LKF[i]->write; LKF[i]->write=tmp; LKF[i]->rcount=LKF[i]->wcount=0;};		
			}
		}
		



 
		
		DIR2[CLR]|=DIR2_VAL;
		
		

		switch(ssp_empty[0]){
		
			case 79:{ ssp_read[4]=~ssp_read[4]; { LKF[1]->write[0]&=0x1FF;LKF[1]->write[0]|=(((ssp_read[4]))&1)<<9;}; { LKF[1]->write[1]&=0x1FF;LKF[1]->write[1]|=(((ssp_read[4]>>1))&1)<<9;}; { LKF[1]->write[2]&=0x1FF;LKF[1]->write[2]|=(((ssp_read[4]>>2))&1)<<9;}; { LKF[1]->write[3]&=0x1FF;LKF[1]->write[3]|=(((ssp_read[4]>>3))&1)<<9;}; { LKF[1]->write[4]&=0x1FF;LKF[1]->write[4]|=(((ssp_read[4]>>4))&1)<<9;}; { LKF[1]->write[5]&=0x1FF;LKF[1]->write[5]|=(((ssp_read[4]>>5))&1)<<9;}; { LKF[1]->write[6]&=0x1FF;LKF[1]->write[6]|=(((ssp_read[4]>>6))&1)<<9;}; { LKF[1]->write[7]&=0x1FF;LKF[1]->write[7]|=(((ssp_read[4]>>7))&1)<<9;}; { LKF[1]->write[8]&=0x1FF;LKF[1]->write[8]|=(((ssp_read[4]>>8))&1)<<9;}; { LKF[1]->write[9]&=0x1FF;LKF[1]->write[9]|=(((ssp_read[4]>>9))&1)<<9;}; { LKF[1]->write[10]&=0x1FF;LKF[1]->write[10]|=(((ssp_read[4]>>10))&1)<<9;}; { LKF[1]->write[11]&=0x1FF;LKF[1]->write[11]|=(((ssp_read[4]>>11))&1)<<9;}; break; };
			case 78 : { ssp_read[4]=~ssp_read[4]; { LKF[1]->write[12]&=0x1FF;LKF[1]->write[12]|=(((ssp_read[4]))&1)<<9;}; { LKF[1]->write[13]&=0x1FF;LKF[1]->write[13]|=(((ssp_read[4]>>1))&1)<<9;}; { LKF[1]->write[14]&=0x1FF;LKF[1]->write[14]|=(((ssp_read[4]>>2))&1)<<9;}; { LKF[1]->write[15]&=0x1FF;LKF[1]->write[15]|=(((ssp_read[4]>>3))&1)<<9;}; { LKF[1]->write[16]&=0x1FF;LKF[1]->write[16]|=(((ssp_read[4]>>4))&1)<<9;}; { LKF[1]->write[17]&=0x1FF;LKF[1]->write[17]|=(((((ssp_read[4]&0x1F)==31)?0:1))&1)<<9;}; break; };
			
			case (80+79):{ ssp_read[4]=~ssp_read[4]; { LKF[1]->write[0]&=0x1FF;LKF[1]->write[0]|=(((ssp_read[4]))&1)<<9;}; { LKF[1]->write[1]&=0x1FF;LKF[1]->write[1]|=(((ssp_read[4]>>1))&1)<<9;}; { LKF[1]->write[2]&=0x1FF;LKF[1]->write[2]|=(((ssp_read[4]>>2))&1)<<9;}; { LKF[1]->write[3]&=0x1FF;LKF[1]->write[3]|=(((ssp_read[4]>>3))&1)<<9;}; { LKF[1]->write[4]&=0x1FF;LKF[1]->write[4]|=(((ssp_read[4]>>4))&1)<<9;}; { LKF[1]->write[5]&=0x1FF;LKF[1]->write[5]|=(((ssp_read[4]>>5))&1)<<9;}; { LKF[1]->write[6]&=0x1FF;LKF[1]->write[6]|=(((ssp_read[4]>>6))&1)<<9;}; { LKF[1]->write[7]&=0x1FF;LKF[1]->write[7]|=(((ssp_read[4]>>7))&1)<<9;}; { LKF[1]->write[8]&=0x1FF;LKF[1]->write[8]|=(((ssp_read[4]>>8))&1)<<9;}; { LKF[1]->write[9]&=0x1FF;LKF[1]->write[9]|=(((ssp_read[4]>>9))&1)<<9;}; { LKF[1]->write[10]&=0x1FF;LKF[1]->write[10]|=(((ssp_read[4]>>10))&1)<<9;}; { LKF[1]->write[11]&=0x1FF;LKF[1]->write[11]|=(((ssp_read[4]>>11))&1)<<9;}; break; };
			case (80+78) : { ssp_read[4]=~ssp_read[4]; { LKF[1]->write[12]&=0x1FF;LKF[1]->write[12]|=(((ssp_read[4]))&1)<<9;}; { LKF[1]->write[13]&=0x1FF;LKF[1]->write[13]|=(((ssp_read[4]>>1))&1)<<9;}; { LKF[1]->write[14]&=0x1FF;LKF[1]->write[14]|=(((ssp_read[4]>>2))&1)<<9;}; { LKF[1]->write[15]&=0x1FF;LKF[1]->write[15]|=(((ssp_read[4]>>3))&1)<<9;}; { LKF[1]->write[16]&=0x1FF;LKF[1]->write[16]|=(((ssp_read[4]>>4))&1)<<9;}; { LKF[1]->write[17]&=0x1FF;LKF[1]->write[17]|=(((((ssp_read[4]&0x1F)==31)?0:1))&1)<<9;}; break; };
	    
			case 63:{ clcpolltable[1][61]. analog+=2; clcpolltable[1][61]. analog&=0x1F; clcpolltable[1][61]. contact=TempModeTable[clcpolltable[1][61]. analog+32]; clcpolltable[1][61]. crc8=CalcCRC8((byte*)&clcpolltable[1][61],3); ssp_empty[2]=TempModeTable[clcpolltable[1][61]. analog]; ssp_empty[1]=clcpolltable[1][61]. analog; break;};
			
			case (63+80):{ clcpolltable[1][61+80]. analog+=2; clcpolltable[1][61+80]. analog&=0x1F; clcpolltable[1][61+80]. contact=TempModeTable[clcpolltable[1][61+80]. analog+32]; clcpolltable[1][61+80]. crc8=CalcCRC8((byte*)&clcpolltable[1][61+80],3); ssp_empty[2]=TempModeTable[clcpolltable[1][61+80]. analog]; ssp_empty[1]=clcpolltable[1][61+80]. analog; break;};
	    
	   		
			
		
			
			
			case 70:{ { LKF[1]->write[0]&=0x200;LKF[1]->write[0]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};	 
			case 71:{ { LKF[1]->write[57]&=0x200;LKF[1]->write[57]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};	 
			case 72:{ { LKF[1]->write[50]&=0x200;LKF[1]->write[50]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};	 
			
			case 150:{ { LKF[1]->write[0]&=0x200;LKF[1]->write[0]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};  
			case 151:{ { LKF[1]->write[57]&=0x200;LKF[1]->write[57]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};  
			case 152:{ { LKF[1]->write[50]&=0x200;LKF[1]->write[50]|=((ssp_read[4])+MIN_SCALE1&0x1FF);}; break;};  
			
			case 73:{ { LKF[1]->write[58]&=0x200;LKF[1]->write[58]|=(((ssp_read[4]&1)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; { LKF[1]->write[51]&=0x200;LKF[1]->write[51]|=(((ssp_read[4]&2)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; { LKF[1]->write[32]&=0x200;LKF[1]->write[32]|=(((ssp_read[4]&4)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; break;}; 
			case 153:{ { LKF[1]->write[58]&=0x200;LKF[1]->write[58]|=(((ssp_read[4]&1)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; { LKF[1]->write[51]&=0x200;LKF[1]->write[51]|=(((ssp_read[4]&2)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; { LKF[1]->write[32]&=0x200;LKF[1]->write[32]|=(((ssp_read[4]&4)?MIN_SCALE1:MAX_SCALE)&0x1FF);}; break;};
		
			
			case 1: { ssp_read[4]>>=1; { LKF[0]->write[1]&=0x200;LKF[0]->write[1]|=(ssp_read[4]&0x1FF);}; break;};
			case 2: { ssp_read[4]>>=1; { LKF[0]->write[17]&=0x200;LKF[0]->write[17]|=(ssp_read[4]&0x1FF);}; break;};
			case 81: { ssp_read[4]>>=1; { LKF[0]->write[33]&=0x200;LKF[0]->write[33]|=(ssp_read[4]&0x1FF);}; break;};
			case 82: { ssp_read[4]>>=1; { LKF[0]->write[49]&=0x200;LKF[0]->write[49]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 3: { ssp_read[4]>>=1; { LKF[0]->write[4]&=0x200;LKF[0]->write[4]|=(ssp_read[4]&0x1FF);}; break;};
			case 4: { ssp_read[4]>>=1; { LKF[0]->write[20]&=0x200;LKF[0]->write[20]|=(ssp_read[4]&0x1FF);}; break;};
			case 83: { ssp_read[4]>>=1; { LKF[0]->write[36]&=0x200;LKF[0]->write[36]|=(ssp_read[4]&0x1FF);}; break;};
			case 84: { ssp_read[4]>>=1; { LKF[0]->write[52]&=0x200;LKF[0]->write[52]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 5: { ssp_read[4]>>=1; { LKF[0]->write[3]&=0x200;LKF[0]->write[3]|=(ssp_read[4]&0x1FF);}; break;};
			case 6: { ssp_read[4]>>=1; { LKF[0]->write[19]&=0x200;LKF[0]->write[19]|=(ssp_read[4]&0x1FF);}; break;};
			case 85: { ssp_read[4]>>=1; { LKF[0]->write[35]&=0x200;LKF[0]->write[35]|=(ssp_read[4]&0x1FF);}; break;};
			case 86: { ssp_read[4]>>=1; { LKF[0]->write[51]&=0x200;LKF[0]->write[51]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 7: { ssp_read[4]>>=1; { LKF[0]->write[7]&=0x200;LKF[0]->write[7]|=(ssp_read[4]&0x1FF);}; break;};
			case 8: { ssp_read[4]>>=1; { LKF[0]->write[23]&=0x200;LKF[0]->write[23]|=(ssp_read[4]&0x1FF);}; break;};
			case 87: { ssp_read[4]>>=1; { LKF[0]->write[39]&=0x200;LKF[0]->write[39]|=(ssp_read[4]&0x1FF);}; break;};
			case 88: { ssp_read[4]>>=1; { LKF[0]->write[55]&=0x200;LKF[0]->write[55]|=(ssp_read[4]&0x1FF);}; break;};
			
			
			case 10: { ssp_read[4]>>=1; { LKF[0]->write[2]&=0x200;LKF[0]->write[2]|=(ssp_read[4]&0x1FF);}; break;};
			case 11: { ssp_read[4]>>=1; { LKF[0]->write[18]&=0x200;LKF[0]->write[18]|=(ssp_read[4]&0x1FF);}; break;};
			case 90: { ssp_read[4]>>=1; { LKF[0]->write[34]&=0x200;LKF[0]->write[34]|=(ssp_read[4]&0x1FF);}; break;};
			case 91: { ssp_read[4]>>=1; { LKF[0]->write[50]&=0x200;LKF[0]->write[50]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 12: { ssp_read[4]>>=1; { LKF[0]->write[6]&=0x200;LKF[0]->write[6]|=(ssp_read[4]&0x1FF);}; break;};
			case 13: { ssp_read[4]>>=1; { LKF[0]->write[22]&=0x200;LKF[0]->write[22]|=(ssp_read[4]&0x1FF);}; break;};
			case 92: { ssp_read[4]>>=1; { LKF[0]->write[38]&=0x200;LKF[0]->write[38]|=(ssp_read[4]&0x1FF);}; break;};
			case 93: { ssp_read[4]>>=1; { LKF[0]->write[54]&=0x200;LKF[0]->write[54]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 14: { ssp_read[4]>>=1; { LKF[0]->write[10]&=0x200;LKF[0]->write[10]|=(ssp_read[4]&0x1FF);}; break;};
			case 15: { ssp_read[4]>>=1; { LKF[0]->write[26]&=0x200;LKF[0]->write[26]|=(ssp_read[4]&0x1FF);}; break;};
			case 94: { ssp_read[4]>>=1; { LKF[0]->write[42]&=0x200;LKF[0]->write[42]|=(ssp_read[4]&0x1FF);}; break;};
			case 95: { ssp_read[4]>>=1; { LKF[0]->write[58]&=0x200;LKF[0]->write[58]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 16: { ssp_read[4]>>=1; { LKF[0]->write[9]&=0x200;LKF[0]->write[9]|=(ssp_read[4]&0x1FF);}; break;};
			case 17: { ssp_read[4]>>=1; { LKF[0]->write[25]&=0x200;LKF[0]->write[25]|=(ssp_read[4]&0x1FF);}; break;};
			case 96: { ssp_read[4]>>=1; { LKF[0]->write[41]&=0x200;LKF[0]->write[41]|=(ssp_read[4]&0x1FF);}; break;};
			case 97: { ssp_read[4]>>=1; { LKF[0]->write[57]&=0x200;LKF[0]->write[57]|=(ssp_read[4]&0x1FF);}; break;};
			
			
			case 9: { ssp_read[4]>>=1; { LKF[0]->write[12]&=0x200;LKF[0]->write[12]|=(ssp_read[4]&0x1FF);}; break;};
			case 89: { ssp_read[4]>>=1; { LKF[0]->write[44]&=0x200;LKF[0]->write[44]|=(ssp_read[4]&0x1FF);}; break;};
			
			
			case 18: { ssp_read[4]>>=1; { LKF[0]->write[21]&=0x200;LKF[0]->write[21]|=(ssp_read[4]&0x1FF);}; break;};
			case 98: { ssp_read[4]>>=1; { LKF[0]->write[53]&=0x200;LKF[0]->write[53]|=(ssp_read[4]&0x1FF);}; break;};
		    
			
			case 19: { ssp_read[4]>>=1; { LKF[0]->write[5]&=0x200;LKF[0]->write[5]|=(ssp_read[4]&0x1FF);}; break;};
			case 99: { ssp_read[4]>>=1; { LKF[0]->write[37]&=0x200;LKF[0]->write[37]|=(ssp_read[4]&0x1FF);}; break;};
		    
			
			case 20: { ssp_read[4]>>=1; { LKF[0]->write[11]&=0x200;LKF[0]->write[11]|=(ssp_read[4]&0x1FF);}; break;};
			case 100: { ssp_read[4]>>=1; { LKF[0]->write[43]&=0x200;LKF[0]->write[43]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 21: { ssp_read[4]>>=1; { LKF[0]->write[15]&=0x200;LKF[0]->write[15]|=(ssp_read[4]&0x1FF);}; break;};
			case 101: { ssp_read[4]>>=1; { LKF[0]->write[47]&=0x200;LKF[0]->write[47]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 22: { ssp_read[4]>>=1; { LKF[0]->write[27]&=0x200;LKF[0]->write[27]|=(ssp_read[4]&0x1FF);}; break;};
			case 102: { ssp_read[4]>>=1; { LKF[0]->write[59]&=0x200;LKF[0]->write[59]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 23: { ssp_read[4]>>=1; { LKF[0]->write[14]&=0x200;LKF[0]->write[14]|=(ssp_read[4]&0x1FF);}; break;};
			case 103: { ssp_read[4]>>=1; { LKF[0]->write[46]&=0x200;LKF[0]->write[46]|=(ssp_read[4]&0x1FF);}; break;};
			
			case 24:{
				
				{ LKF[0]->write[0]&=0x1FF;LKF[0]->write[0]|=(((ssp_read[4]>>3))&1)<<9;};
				
				{ LKF[0]->write[2]&=0x1FF;LKF[0]->write[2]|=(((ssp_read[4]>>4))&1)<<9;};
				
				{ LKF[0]->write[4]&=0x1FF;LKF[0]->write[4]|=(((ssp_read[4]>>5))&1)<<9;};
				
				{ LKF[0]->write[6]&=0x1FF;LKF[0]->write[6]|=(((ssp_read[4]>>6))&1)<<9;};
				
				{ LKF[0]->write[8]&=0x1FF;LKF[0]->write[8]|=(((ssp_read[4]>>7))&1)<<9;};
				
				{ LKF[0]->write[10]&=0x1FF;LKF[0]->write[10]|=(((ssp_read[4]>>8))&1)<<9;};
				
				{ LKF[0]->write[12]&=0x1FF;LKF[0]->write[12]|=(((ssp_read[4]>>9))&1)<<9;};
				
				{ LKF[0]->write[14]&=0x1FF;LKF[0]->write[14]|=(((ssp_read[4]>>10))&1)<<9;};
				
				{ LKF[0]->write[7]&=0x1FF;LKF[0]->write[7]|=(((ssp_read[4]>>1))&1)<<9;};
				
				{ LKF[0]->write[11]&=0x1FF;LKF[0]->write[11]|=(((ssp_read[4]>>2))&1)<<9;};
				
				{ LKF[0]->write[15]&=0x1FF;LKF[0]->write[15]|=(((ssp_read[4]))&1)<<9;};
				
				
				break;
			}
			case 104:{
				
				{ LKF[0]->write[32]&=0x1FF;LKF[0]->write[32]|=(((ssp_read[4]>>3))&1)<<9;};
				
				{ LKF[0]->write[34]&=0x1FF;LKF[0]->write[34]|=(((ssp_read[4]>>4))&1)<<9;};
				
				{ LKF[0]->write[36]&=0x1FF;LKF[0]->write[36]|=(((ssp_read[4]>>5))&1)<<9;};
				
				{ LKF[0]->write[38]&=0x1FF;LKF[0]->write[38]|=(((ssp_read[4]>>6))&1)<<9;};
				
				{ LKF[0]->write[40]&=0x1FF;LKF[0]->write[40]|=(((ssp_read[4]>>7))&1)<<9;};
				
				{ LKF[0]->write[42]&=0x1FF;LKF[0]->write[42]|=(((ssp_read[4]>>8))&1)<<9;};
				
				{ LKF[0]->write[44]&=0x1FF;LKF[0]->write[44]|=(((ssp_read[4]>>9))&1)<<9;};
				
				{ LKF[0]->write[46]&=0x1FF;LKF[0]->write[46]|=(((ssp_read[4]>>10))&1)<<9;};
				
				{ LKF[0]->write[39]&=0x1FF;LKF[0]->write[39]|=(((ssp_read[4]>>1))&1)<<9;};
				
				{ LKF[0]->write[43]&=0x1FF;LKF[0]->write[43]|=(((ssp_read[4]>>2))&1)<<9;};
				
				{ LKF[0]->write[47]&=0x1FF;LKF[0]->write[47]|=(((ssp_read[4]))&1)<<9;};
				
				
				break;
			}
			
			case 45:{ { LKF[2]->write[lkf0_opt . count_chan]&=0x200;LKF[2]->write[lkf0_opt . count_chan]|=(TheTime . lkf_frames++ &0x1FF);}; if(TheTime . lkf_frames==100){ TheTime . lkf_frames=0; } TheTime . okf_frames+=80; if (TheTime . okf_frames>=8000){ TheTime . okf_frames=0; if(++TheTime . TIME_SEC==0x40000) TheTime . TIME_SEC=0; (*TheTime . time_contact)++; } { LKF[2]->write[lkf0_opt . time0_chan]&=0x200;LKF[2]->write[lkf0_opt . time0_chan]|=(TheTime . TIME_SEC&0x1FF);}; { LKF[2]->write[lkf0_opt . time1_chan]&=0x200;LKF[2]->write[lkf0_opt . time1_chan]|=((TheTime . TIME_SEC>>9)&0x1FF);}; { LKF[2]->write[lkf0_opt . contact_time]&=0x1FF;LKF[2]->write[lkf0_opt . contact_time]|=((TheTime . time_contact->GetBit())&1)<<9;}; break; };
			case 125:{ { LKF[2]->write[lkf0_opt . count_chan]&=0x200;LKF[2]->write[lkf0_opt . count_chan]|=(TheTime . lkf_frames++ &0x1FF);}; if(TheTime . lkf_frames==100){ TheTime . lkf_frames=0; } TheTime . okf_frames+=80; if (TheTime . okf_frames>=8000){ TheTime . okf_frames=0; if(++TheTime . TIME_SEC==0x40000) TheTime . TIME_SEC=0; (*TheTime . time_contact)++; } { LKF[2]->write[lkf0_opt . time0_chan]&=0x200;LKF[2]->write[lkf0_opt . time0_chan]|=(TheTime . TIME_SEC&0x1FF);}; { LKF[2]->write[lkf0_opt . time1_chan]&=0x200;LKF[2]->write[lkf0_opt . time1_chan]|=((TheTime . TIME_SEC>>9)&0x1FF);}; { LKF[2]->write[lkf0_opt . contact_time]&=0x1FF;LKF[2]->write[lkf0_opt . contact_time]|=((TheTime . time_contact->GetBit())&1)<<9;}; break; };	
		}
	
		
		
		
		if (++ssp_empty[0]==160){
			ssp_empty[0]=0;
		}
		
		
 		if(++LKF_COUNT==640)
		{
			LKF_COUNT=0;
			FRAME[FRM_CNT][18]=FRAME[FRM_CNT][18+40]=HASH6BIT[SIN[3]];
		} 
		if (LKF_COUNT==3) FRAME[7][18]=FRAME[7][18+40]=HASH6BIT[SIN[0]];
		
		byte tmp_val; 				
		
		uint SAVE_LKF_INT=0;
		byte *SAVE_LKF=(byte*)&SAVE_LKF_INT; 	
		
		
		if (!(FRM_CNT&1)){ 
			if(--LKF[0]->cnt_5==0){ LKF[0]->word4=LKF[0]->read+LKF[0]->rcount; LKF[0]->rcount+=4; LKF[0]->cnt_5=5; LKF[0]->word5[0]=((LKF[0]->word4[0]&HLMask[0][HIGHT_MASK])>>2); LKF[0]->word5[1]=((LKF[0]->word4[1]&HLMask[1][HIGHT_MASK])>>4)|((LKF[0]->word4[0]&HLMask[0][LOW_MASK])<<6); LKF[0]->word5[2]=((LKF[0]->word4[2]&HLMask[2][HIGHT_MASK])>>6)|((LKF[0]->word4[1]&HLMask[1][LOW_MASK])<<4); LKF[0]->word5[3]=((LKF[0]->word4[3]&HLMask[3][HIGHT_MASK])>>8)|((LKF[0]->word4[2]&HLMask[2][LOW_MASK])<<2); LKF[0]->word5[4]=((LKF[0]->word4[3]&HLMask[3][LOW_MASK])); } SAVE_LKF[0]=LKF[0]->word5[5-LKF[0]->cnt_5];;
			const byte* lkf0=LKF_HASH_TABLE[SAVE_LKF[0]];
			
			
			FRAME[FRM_CNT][4]=lkf0[0];
			FRAME[FRM_CNT][24]=lkf0[1];
			
			FRAME[FRM_CNT+1][4]=lkf0[2];
			FRAME[FRM_CNT+1][24]=lkf0[3];	
		}
		
		if(--LKF[1]->cnt_5==0){ LKF[1]->word4=LKF[1]->read+LKF[1]->rcount; LKF[1]->rcount+=4; LKF[1]->cnt_5=5; LKF[1]->word5[0]=((LKF[1]->word4[0]&HLMask[0][HIGHT_MASK])>>2); LKF[1]->word5[1]=((LKF[1]->word4[1]&HLMask[1][HIGHT_MASK])>>4)|((LKF[1]->word4[0]&HLMask[0][LOW_MASK])<<6); LKF[1]->word5[2]=((LKF[1]->word4[2]&HLMask[2][HIGHT_MASK])>>6)|((LKF[1]->word4[1]&HLMask[1][LOW_MASK])<<4); LKF[1]->word5[3]=((LKF[1]->word4[3]&HLMask[3][HIGHT_MASK])>>8)|((LKF[1]->word4[2]&HLMask[2][LOW_MASK])<<2); LKF[1]->word5[4]=((LKF[1]->word4[3]&HLMask[3][LOW_MASK])); } SAVE_LKF[1]=LKF[1]->word5[5-LKF[1]->cnt_5];;
		const byte* lkf1=LKF_HASH_TABLE[SAVE_LKF[1]];
		FRAME[FRM_CNT][5]=lkf1[0];
		FRAME[FRM_CNT][15]=lkf1[1];
		FRAME[FRM_CNT][25]=lkf1[2];
		FRAME[FRM_CNT][35]=lkf1[3];

		
	  	if(--LKF[2]->cnt_5==0){ LKF[2]->word4=LKF[2]->read+LKF[2]->rcount; LKF[2]->rcount+=4; LKF[2]->cnt_5=5; LKF[2]->word5[0]=((LKF[2]->word4[0]&HLMask[0][HIGHT_MASK])>>2); LKF[2]->word5[1]=((LKF[2]->word4[1]&HLMask[1][HIGHT_MASK])>>4)|((LKF[2]->word4[0]&HLMask[0][LOW_MASK])<<6); LKF[2]->word5[2]=((LKF[2]->word4[2]&HLMask[2][HIGHT_MASK])>>6)|((LKF[2]->word4[1]&HLMask[1][LOW_MASK])<<4); LKF[2]->word5[3]=((LKF[2]->word4[3]&HLMask[3][HIGHT_MASK])>>8)|((LKF[2]->word4[2]&HLMask[2][LOW_MASK])<<2); LKF[2]->word5[4]=((LKF[2]->word4[3]&HLMask[3][LOW_MASK])); } SAVE_LKF[2]=LKF[2]->word5[5-LKF[2]->cnt_5];;
		const byte* lkf2=LKF_HASH_TABLE[SAVE_LKF[2]];
		FRAME[FRM_CNT][6]=lkf2[0];
		FRAME[FRM_CNT][16]=lkf2[1];
		FRAME[FRM_CNT][26]=lkf2[2];
		FRAME[FRM_CNT][36]=lkf2[3];
		
		SAVE_LKF[3]=FRAME[FRM_CNT][9]&63;						

	 
		










 

		

 

		const byte *bdc8_bit_index=(byte*)ssp_read;	 
		const byte *bdc_levels;	  
		
		{
			
			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[0]];	 
			
			
			FRAME[FRM_CNT][13]=bdc_levels[3];
			FRAME[FRM_CNT][33]=bdc_levels[2];
			
			FRAME[FRM_CNT][3]=bdc_levels[1];
			FRAME[FRM_CNT][23]=bdc_levels[0];

			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[1]];	 
			
			
			FRAME[FRM_CNT][11]=bdc_levels[3];
			FRAME[FRM_CNT][31]=bdc_levels[2]; 
			
			FRAME[FRM_CNT][8]=bdc_levels[1];
			FRAME[FRM_CNT][28]=bdc_levels[0];
					 
		}
		
		{
			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[2]];
			
			
			FRAME[FRM_CNT][12]=bdc_levels[3];
			FRAME[FRM_CNT][32]=bdc_levels[2];
			
			FRAME[FRM_CNT][2]=bdc_levels[1];
			FRAME[FRM_CNT][22]=bdc_levels[0];

			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[3]];	 
			
			
			FRAME[FRM_CNT][1]=bdc_levels[3];
			FRAME[FRM_CNT][21]=bdc_levels[2];
			
			FRAME[FRM_CNT][14]=bdc_levels[1];
			FRAME[FRM_CNT][34]=bdc_levels[0];
		}
		
		
		{
			
			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[4]];	 
			
			
			FRAME[FRM_CNT][40+13]=bdc_levels[3];
			FRAME[FRM_CNT][40+33]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+3]=bdc_levels[1];
			FRAME[FRM_CNT][40+23]=bdc_levels[0];

			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[5]];	 
			
			
			FRAME[FRM_CNT][40+11]=bdc_levels[3];
			FRAME[FRM_CNT][40+31]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+8]=bdc_levels[1];
			FRAME[FRM_CNT][40+28]=bdc_levels[0];		 
		}
		
		{
			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[6]];
			
			
			FRAME[FRM_CNT][40+12]=bdc_levels[3];
			FRAME[FRM_CNT][40+32]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+2]=bdc_levels[1];
			FRAME[FRM_CNT][40+22]=bdc_levels[0];

			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[7]];	 
			
			
			FRAME[FRM_CNT][40+1]=bdc_levels[3];
			FRAME[FRM_CNT][40+21]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+14]=bdc_levels[1];
			FRAME[FRM_CNT][40+34]=bdc_levels[0];
		}		
				
		
		
		SAVE_LKF_INT=ReadWriteFifo(SAVE_LKF_INT);
		
		

		if(!(FRM_CNT&1)){ 
			const byte* saved_lkf0=LKF_HASH_TABLE[SAVE_LKF[0]];
			
			
			FRAME[FRM_CNT][40+4]=saved_lkf0[0];
			FRAME[FRM_CNT][40+24]=saved_lkf0[1];
			
			FRAME[FRM_CNT+1][40+4]=saved_lkf0[2];
			FRAME[FRM_CNT+1][40+24]=saved_lkf0[3];	
		}

		if (BDC2flag==0) 

		{
		const byte* saved_lkf1=LKF_HASH_TABLE[SAVE_LKF[1]];

		FRAME[FRM_CNT][40+5]=saved_lkf1[0];
		FRAME[FRM_CNT][40+15]=saved_lkf1[1];
		FRAME[FRM_CNT][40+25]=saved_lkf1[2];
		FRAME[FRM_CNT][40+35]=saved_lkf1[3];

		const byte* saved_lkf2=LKF_HASH_TABLE[SAVE_LKF[2]];
	
		FRAME[FRM_CNT][40+6]=saved_lkf2[0];
		FRAME[FRM_CNT][40+16]=saved_lkf2[1];
		FRAME[FRM_CNT][40+26]=saved_lkf2[2];
		FRAME[FRM_CNT][40+36]=saved_lkf2[3];
		}
else 
		{
			
			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[10]];	 
			
			
			FRAME[FRM_CNT][40+5]=bdc_levels[3];
			FRAME[FRM_CNT][40+25]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+15]=bdc_levels[1];
			FRAME[FRM_CNT][40+35]=bdc_levels[0];

			bdc_levels=LKF_HASH_TABLE[bdc8_bit_index[11]];	 
			
			
			FRAME[FRM_CNT][40+6]=bdc_levels[3];
			FRAME[FRM_CNT][40+26]=bdc_levels[2];
			
			FRAME[FRM_CNT][40+16]=bdc_levels[1];
			FRAME[FRM_CNT][40+36]=bdc_levels[0];		 
		}
if (LKF3counter>128000) 
		FRAME[FRM_CNT][40+9]=SAVE_LKF[3];	  
	else
LKF3counter++;
	
	
		
		while(!SYNC);
		
		SYNC=false;
		(*(volatile unsigned long *)(0xFFE04000 + 0x100)) = (ulong)FRAME[FRM_CNT];	
		(*(volatile unsigned long *)(0xFFE04000 + 0x10C)) |= (80);	
		(*(volatile unsigned long *)(0xFFE04000 + 0x110)) |= 0x01;
		
		if(++FRM_CNT==8) FRM_CNT=0;
	}
   	return 0;
}


static const byte PROG_POLL1[]={
	0,7,9,10,
	17,19,20,27,30,
	37,40,50,60,67,77
};


void UART1Handler() __irq{
	
	
	
	 
		byte buf[14];
		
		buf[0]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[1]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[2]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[3]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[4]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[5]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[6]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[7]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[8]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[9]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[10]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[11]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[12]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		buf[13]=(*(volatile unsigned long *)(0xE0010000 + 0x00));
		
if (TestYALKFlag==0)
		{
			
			FRAME[FRM_CNT][PROG_POLL1[0]]=HASH6BIT[buf[0]];
			FRAME[FRM_CNT][PROG_POLL1[1]]=HASH6BIT[buf[1]];
			FRAME[FRM_CNT][PROG_POLL1[2]]=HASH6BIT[buf[2]];
			FRAME[FRM_CNT][PROG_POLL1[3]]=HASH6BIT[buf[3]];
			FRAME[FRM_CNT][PROG_POLL1[4]]=HASH6BIT[buf[4]];	
			FRAME[FRM_CNT][PROG_POLL1[5]]=HASH6BIT[buf[5]];
			FRAME[FRM_CNT][PROG_POLL1[6]]=HASH6BIT[buf[6]];
			FRAME[FRM_CNT][PROG_POLL1[7]]=HASH6BIT[buf[7]];		  
			FRAME[FRM_CNT][PROG_POLL1[8]]=HASH6BIT[buf[8]];
			FRAME[FRM_CNT][PROG_POLL1[9]]=HASH6BIT[buf[9]];
			FRAME[FRM_CNT][PROG_POLL1[10]]=HASH6BIT[buf[10]];
			FRAME[FRM_CNT][PROG_POLL1[11]]=HASH6BIT[buf[11]];
			FRAME[FRM_CNT][PROG_POLL1[12]]=HASH6BIT[((buf[0]>>6)&0x3)|((buf[1]>>4)&0xC)|((buf[2]>>2)&0x30)];
			FRAME[FRM_CNT][PROG_POLL1[13]]=HASH6BIT[((buf[3]>>6)&0x3)|((buf[4]>>4)&0xC)|((buf[5]>>2)&0x30)];
			FRAME[FRM_CNT][PROG_POLL1[14]]=HASH6BIT[((buf[6]>>6)&0x3)|((buf[7]>>4)&0xC)|((buf[8]>>2)&0x30)];
			
			if(clcpolltable[0][clc_poll_count]. lkf<254){
					ushort tmp_val=(buf[12]|(buf[13]<<8));
					
					if (clcpolltable[0][clc_poll_count]. lkf==0){
						if (clcpolltable[0][clc_poll_count]. writemode==1) { LKF[0]->write[clcpolltable[0][clc_poll_count]. chan]&=0x200;LKF[0]->write[clcpolltable[0][clc_poll_count]. chan]|=(tmp_val&0x1FF);}
						else { LKF[0]->write[clcpolltable[0][clc_poll_count]. chan]&=0x1FF;LKF[0]->write[clcpolltable[0][clc_poll_count]. chan]|=((tmp_val>>9)&1)<<9;};		
					}
					
					else if(clcpolltable[0][clc_poll_count]. writemode==1) {
						{ LKF[clcpolltable[0][clc_poll_count]. lkf]->write[clcpolltable[0][clc_poll_count]. chan]&=0x200;LKF[clcpolltable[0][clc_poll_count]. lkf]->write[clcpolltable[0][clc_poll_count]. chan]|=(tmp_val&0x1FF);};
					}
					else{
						{ LKF[clcpolltable[0][clc_poll_count]. lkf]->write[clcpolltable[0][clc_poll_count]. chan]=tmp_val;};
					}
			}
			else if (clcpolltable[0][clc_poll_count]. lkf==254)					   
			{
				if ((buf[13] & 0x02) == 0) TheTime.TIME_SEC = 0;	   
			}
		 if (clcpolltable[0][clc_poll_count]. chan==36)					  
			{
				if ((buf[13] & 0x02) == 0) BDC2flag=1;
				else BDC2flag = 0;
			}
		}
		else
		{
			buf[13]=buf[13] | ((YALKTestPollTable[CountTestYALK].analogchan & 63)<<2);	
			buf[11]=(buf[11] & 63) | (YALKTestPollTable[CountTestYALK].analogchan & 0xC0);		
			UART0_Send(buf,14);				
			CountTestYALK++;
			if (CountTestYALK>=160) CountTestYALK=0;
 			uint delay=50;
			while(--delay);
			(*(volatile unsigned long *)(0x3FFFC000 + 0x5C))|=1<<10;					
		}

	(*(volatile unsigned long *)(0xFFFFF000 + 0xF00))=0x0;
}

ushort CalcFromCOPScale(uint max,uint min,uint val){
	uint ret_val=(max-min)*val;
	ret_val>>=10;
	return ret_val+min;
}


void CalcSIN(uint max,uint min,byte* sin){
	
	max>>=3;
	min>>=3;
	const uint delta=max-min;
	
	sin[0]=min;
	sin[7]=min;
	
	sin[3]=max;
	sin[4]=max;
	
	sin[1]=((delta*42)>>7)+min;
	sin[6]=sin[1];
	
	sin[2]=((delta*84)>>7)+min;
	sin[5]=sin[2];
}

void SSP1Handler()__irq{
	byte ssp_read[8];
	(*(volatile unsigned long *)(0xFFFFF000 + 0xF00))=0x0;	
}

void InitINT2(){
	PINSEL::Set(2,12,func_01);
	VIC::InstallIRQ(VIC::EINT2_INT,(void*)EINT2Handler,1);	
	(*(volatile unsigned long *)(0xE0028000 + 0xB0)) = 1<<12;
    (*(volatile unsigned long *)(0xE01FC000 + 0x148)) = 1<<2;	
    (*(volatile unsigned long *)(0xE01FC000 + 0x14C)) =0;
}

void EINT2Handler() __irq{
	
	if (TestYALKFlag==0) SYNC=true;					 
	else											 
	{
		buff[0]=42;
		buff[1]=YALKTestPollTable[CountTestYALK].analog;
		buff[2]=YALKTestPollTable[CountTestYALK].contact;				
		buff[3]=CalcCRC8(buff,3);
			
		DIR1[SET]|=DIR1_VAL;
		uart1->Send(buff,4);				
		uint delay=50;
		while(--delay);
		DIR1[CLR]|=DIR1_VAL;			
	}

	(*(volatile unsigned long *)(0xE01FC000 + 0x140))=1<<2;
	(*(volatile unsigned long *)(0xFFFFF000 + 0xF00))=0x0;
}


static const byte PROG_POLL2[]={
	40+7,40+17,40+19
};
void UART2Handler() __irq{
	
	
	static byte cnt=0;
	
	
	byte buf[14];
	
		buf[0]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[1]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[2]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[3]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[4]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[5]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[6]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[7]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[8]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[9]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[10]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[11]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[12]=(*(volatile unsigned long *)(0xE0078000 + 0x00));
		buf[13]=(*(volatile unsigned long *)(0xE0078000 + 0x00));

		switch(clcpolltable[1][clc_poll_count]. ID){
			case 43:{
				
				uint next=(((FRM_CNT+1)==8)?0:FRM_CNT+1);

				FRAME[FRM_CNT][PROG_POLL2[0]]=HASH6BIT[buf[0]];
				FRAME[next][PROG_POLL2[0]]=HASH6BIT[buf[1]];

				FRAME[FRM_CNT][PROG_POLL2[1]]=HASH6BIT[buf[2]];
				FRAME[next][PROG_POLL2[1]]=HASH6BIT[buf[3]];

				FRAME[FRM_CNT][PROG_POLL2[2]]=HASH6BIT[buf[4]];
				FRAME[next][PROG_POLL2[2]]=HASH6BIT[buf[5]];	  	 
		
				ushort val=buf[12]|(buf[13]<<8);
				if(clcpolltable[1][clc_poll_count]. lkf!=255){
					ushort tmp_val=(buf[12]|(buf[13]<<8));
					if(clcpolltable[1][clc_poll_count]. writemode!=1){
						{ LKF[2]->write[clcpolltable[1][clc_poll_count]. chan]=tmp_val;};
					}
					else{
						{ LKF[2]->write[clcpolltable[1][clc_poll_count]. chan]&=0x200;LKF[2]->write[clcpolltable[1][clc_poll_count]. chan]|=(tmp_val&0x1FF);};
					}	
				}	   
				
				break;
			}	  
			
			case 0x34:{
				ushort temp_val=~(buf[2]|(buf[3]<<8));
				
				
				byte addr=buf[1];
				addr=~HASHYATP[addr];

				{ LKF[2]->write[12]&=0x1FF;LKF[2]->write[12]|=((addr)&1)<<9;};  
				{ LKF[2]->write[13]&=0x1FF;LKF[2]->write[13]|=(((addr>>1))&1)<<9;};
				{ LKF[2]->write[14]&=0x1FF;LKF[2]->write[14]|=(((addr>>2))&1)<<9;};
				{ LKF[2]->write[15]&=0x1FF;LKF[2]->write[15]|=(((addr>>3))&1)<<9;};
				{ LKF[2]->write[16]&=0x1FF;LKF[2]->write[16]|=(((addr>>4))&1)<<9;}; 
				{ LKF[2]->write[17]&=0x1FF;LKF[2]->write[17]|=(((((addr&0x1F)==31)?0:1))&1)<<9;};
				
				
				{ LKF[2]->write[0]&=0x1FF;LKF[2]->write[0]|=(((temp_val))&1)<<9;}; 
				{ LKF[2]->write[1]&=0x1FF;LKF[2]->write[1]|=(((temp_val>>1))&1)<<9;};
				{ LKF[2]->write[2]&=0x1FF;LKF[2]->write[2]|=(((temp_val>>2))&1)<<9;};
				{ LKF[2]->write[3]&=0x1FF;LKF[2]->write[3]|=(((temp_val>>3))&1)<<9;};
				{ LKF[2]->write[4]&=0x1FF;LKF[2]->write[4]|=(((temp_val>>4))&1)<<9;};
				{ LKF[2]->write[5]&=0x1FF;LKF[2]->write[5]|=(((temp_val>>5))&1)<<9;};
				{ LKF[2]->write[6]&=0x1FF;LKF[2]->write[6]|=(((temp_val>>6))&1)<<9;};
				{ LKF[2]->write[7]&=0x1FF;LKF[2]->write[7]|=(((temp_val>>7))&1)<<9;};
				{ LKF[2]->write[8]&=0x1FF;LKF[2]->write[8]|=(((temp_val>>8))&1)<<9;};
				{ LKF[2]->write[9]&=0x1FF;LKF[2]->write[9]|=(((temp_val>>9))&1)<<9;};
				{ LKF[2]->write[10]&=0x1FF;LKF[2]->write[10]|=(((temp_val>>10))&1)<<9;};
				{ LKF[2]->write[11]&=0x1FF;LKF[2]->write[11]|=(((temp_val>>11))&1)<<9;};	 
				
				break;
			}
		}	
	(*(volatile unsigned long *)(0xFFFFF000 + 0xF00))=0x0;
}

void UART0Handler() __irq				
{			
	int Status=(*(volatile unsigned long *)(0xE000C000 + 0x08))&0xE;		
	UART0_Read(buff,4);					
	if (buff[0]==45)				
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			if (buff[2]==1)			    
			{
				(*(volatile unsigned long *)(0xFFFFF000 + 0x014))=(1<<7)|(1<<16)|(1<<28);		
			}
			else if (buff[2]==0)
			{
				(*(volatile unsigned long *)(0xFFFFF000 + 0x010))=(1<<6)|(1<<7)|(1<<16)|(1<<28);
			}
			DIR1[SET]|=DIR1_VAL;
			uart1->Send(buff,4);				

			if (((*(volatile unsigned long *)(0xE0010000 + 0x14))&1)!=0)buf_yalk[0]=(*(volatile unsigned long *)(0xE0010000 + 0x00));	

			UART0_Send(buf_yalk,1);			

 			uint delay=25;
			while(--delay);
			DIR1[CLR]|=DIR1_VAL;			
			(*(volatile unsigned long *)(0x3FFFC000 + 0x5C))|=1<<10;					
		}
	}
	else if (buff[0]==44)					
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			if (buff[2]==1) TestYALKFlag=1;	  
			if (buff[2]==0) TestYALKFlag=0;
		}	
	}
	else if (buff[0]==52)				
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			(*(volatile unsigned long *)(0xFFFFF000 + 0x014))=(1<<16)|(1<<7)|(1<<28);			

			DIR2[SET]|=DIR2_VAL;
			uart2->Send(buff,4);				
			uint delay=50;
			while(--delay);
			DIR2[CLR]|=DIR2_VAL;

			while (((*(volatile unsigned long *)(0xE0078000 + 0x14))&1)==0);
			UART2_Read(buff2,14);

			UART0_Send(buff2,14);			

 			delay=50;
			while(--delay);
			(*(volatile unsigned long *)(0x3FFFC000 + 0x5C))|=1<<10;					
		}
	}
	else if ((buff[0]==175)&&(NumberPacket==0))					
	{
		 for (int i=0;i<4;i++) buff2[i]=buff[i];
		 NumberPacket=1;
	}
	else if (NumberPacket!=0)
	{
		if (NumberPacket==1)
		{
			for (int i=0;i<4;i++) buff2[i+4]=buff[i];
			NumberPacket=2;
		}
		else if (NumberPacket==2)
		{
			for (int i=0;i<4;i++) buff2[i+8]=buff[i];
			NumberPacket=0;							
			if (CalcCRC8(buff2,11)==buff2[11])
				if ((buff2[1]&2)!=0) 
				{					
					(*(volatile unsigned long *)(0x3FFFC000 + 0x18))|=1<<26;				
					DIR1[SET]|=DIR1_VAL;
					uart1->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR1[CLR]|=DIR1_VAL;			
					(*(volatile unsigned long *)(0x3FFFC000 + 0x1C))|=1<<26;
				}
				else 
				{
					(*(volatile unsigned long *)(0x3FFFC000 + 0x18))|=1<<26;
					DIR2[SET]|=DIR2_VAL;
					uart2->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR2[CLR]|=DIR2_VAL;			
					(*(volatile unsigned long *)(0x3FFFC000 + 0x1C))|=1<<26;
				}	
		}
	}
	else if ((buff[0]==176)&&(NumberPacket3==0))					
	{
		 for (int i=0;i<4;i++) buff2[i]=buff[i];
		 NumberPacket3=1;
	}
	else if (NumberPacket3!=0)
	{
		if (NumberPacket3==1)
		{
			for (int i=0;i<4;i++) buff2[i+4]=buff[i];
			NumberPacket3=2;
		}
		else if (NumberPacket3==2)
		{
			for (int i=0;i<4;i++) buff2[i+8]=buff[i];
			NumberPacket3=0;							
			if (CalcCRC8(buff2,11)==buff2[11])
				if ((buff2[1]&2)!=0) 
				{					
					(*(volatile unsigned long *)(0x3FFFC000 + 0x18))|=1<<26;				
					DIR1[SET]|=DIR1_VAL;
					uart1->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR1[CLR]|=DIR1_VAL;			
					(*(volatile unsigned long *)(0x3FFFC000 + 0x1C))|=1<<26;
				}
				else 
				{
					(*(volatile unsigned long *)(0x3FFFC000 + 0x18))|=1<<26;
					DIR2[SET]|=DIR2_VAL;
					uart2->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR2[CLR]|=DIR2_VAL;			
					(*(volatile unsigned long *)(0x3FFFC000 + 0x1C))|=1<<26;
				}	
		}
	}		
	else if ((buff[0]==27)&&(NumberPacket2==0))										 
	{		
		for (int i=0;i<4;i++) buff2[i]=buff[i];
		NumberPacket2=1;
	}			 
	else if (NumberPacket2!=0)
	{
		switch (NumberPacket2)
		{
			case 1: for (int i=0;i<4;i++) buff2[i+4]=buff[i]; NumberPacket2=2; break;
			case 2: for (int i=0;i<4;i++) buff2[i+8]=buff[i]; NumberPacket2=3; break;
			case 3: for (int i=0;i<4;i++) buff2[i+12]=buff[i]; NumberPacket2=4; break;
			case 4: for (int i=0;i<4;i++) buff2[i+16]=buff[i]; NumberPacket2=5; break;
			case 5: for (int i=0;i<4;i++) buff2[i+20]=buff[i]; NumberPacket2=6; break;
			case 6: for (int i=0;i<4;i++) buff2[i+24]=buff[i]; NumberPacket2=7; break;
			case 7: for (int i=0;i<4;i++) buff2[i+28]=buff[i]; NumberPacket2=8; break;
			case 8: for (int i=0;i<4;i++) buff2[i+32]=buff[i]; NumberPacket2=9; break;
			case 9: for (int i=0;i<4;i++) buff2[i+36]=buff[i]; NumberPacket2=10; break;
			case 10: for (int i=0;i<4;i++) buff2[i+40]=buff[i]; NumberPacket2=11; break;
			case 11: for (int i=0;i<4;i++) buff2[i+44]=buff[i]; NumberPacket2=12; break;
			case 12: for (int i=0;i<4;i++) buff2[i+48]=buff[i]; NumberPacket2=13; break;
			case 13: for (int i=0;i<4;i++) buff2[i+52]=buff[i]; NumberPacket2=14; break;
			case 14: for (int i=0;i<4;i++) buff2[i+56]=buff[i]; NumberPacket2=15; break;
			case 15: for (int i=0;i<4;i++) buff2[i+60]=buff[i]; NumberPacket2=16; break;
			case 16: 
				{
					for (int i=0;i<4;i++) buff2[i+64]=buff[i];
					NumberPacket2=0;
					if (CalcCRC16(buff2,66)==(buff2[66]|(buff2[67]<<8)))
					{
						EraseSector((unsigned short)(76800));			 
						if (SetState(buff2+1, (unsigned short)(76800), 64)==1) 
						{
							for (int i=0;i<3;i++) buff[i]=27;
							buff[3]=CalcCRC8(buff,3);
							UART0_Send(buff,4);							 
							uint delay=50;
							while(--delay);
							(*(volatile unsigned long *)(0x3FFFC000 + 0x5C))|=1<<10;								 
							for (int i=0;i<64;i++) TempModeTable[i]=buff2[i+1];
						}	
					}
				}
		}		  
	}
		
		 	
	(*(volatile unsigned long *)(0xFFFFF000 + 0xF00))=0;
}
