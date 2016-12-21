#line 1 "..\\my_lib\\gpdma.cpp"
#line 1 "..\\my_lib\\gpdma.h"
#line 1 "..\\my_lib\\peripheral.h"
#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "..\\my_lib\\peripheral.h"
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


























#line 5 "..\\my_lib\\peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 4 "..\\my_lib\\gpdma.h"
#line 5 "..\\my_lib\\gpdma.h"





 


struct GPDMAOption{
	byte endian_mode; 		
	byte SBSize;		    
	byte DBSize;
	byte SWidth;
	byte DWidth;
	byte SI;				
	byte DI;			    
	byte Prot;			    
	byte IntEnable;
	byte SrcP;
	byte DestP;
	byte FlowCntl;
	byte IE;
	byte ITC;
	byte L;
	byte H;	
};	
enum DMAChannelName{
	CHAN_0=(uint)0xFFE04100,
	CHAN_1=(uint)0xFFE04120,
};

class GPDMA:public Peripheral {
	private:
	enum{
	   IntStatus,
	   IntTCStatus,
	   IntClear,
	   IntErrorStatus,
	   IntErrClr,
	   RawIntTCStatus,
	   RawIntErrorStatus,
	   EnbldChns,
	   SoftBReq,
	   SoftSReq,
	   SoftLBreq,
	   SoftLSReq,
	   Configuration,
	   Sync
	};

	enum{
		CH_SrcAddr,
		CH_DestAddr,
		CH_LLI,
		CH_Control,
		CH_Configuration
	};
	ulong* chan;   
	uint chan_mask; 
	static GPDMA* DEV[2]; 
	public:
		enum FlowControl{
			M2M_DMA,   
			M2P_DMA,   
			P2M_DMA,   
			P2P_DMA,   
			P2P_DP,	   
			M2P_P,	   
			P2M_P,	   
			P2P_SP,	   
		};
		enum SRCDESTPeripheral{
			SSP0_TX,
			SSP0_RX,
			SSP1_TX,
			SSP1_RX,
			SD_MMC,
			I2S_CH0,
			I2S_CH1	
		};
		
		enum BurstSize{
			BS_1=0,
			BS_4=1,
			BS_8=2,
			BS_16=3,
			BS_32=4,
			BS_64=5
		};
		enum TransferWidth{
			BYTE_8=0,
			HALFWORD_16=1,
			WORD_32=2
		}; 
		
		enum{

		};
		GPDMA(DMAChannelName name);
		~GPDMA();
		void Init(const GPDMAOption* opt);
		void SetSrc(void* addr);
		void SetDest(void* addr);
		void Start(const uint tsize=0);
		void Stop();
		uint GetIntStatus();
		void ClearInt();
		
		static void Register(GPDMA* const obj,const uint num);
		static GPDMA* Get(uint num);

		uint GetSrcAddr();
		uint GetDestAddr();
};





#line 2 "..\\my_lib\\gpdma.cpp"

GPDMA::GPDMA(DMAChannelName name):Peripheral((ulong*)0xFFE04000),chan((ulong*)name){
	if (name==CHAN_0) chan_mask=1;
	else chan_mask=2;
};
GPDMA::~GPDMA(){}

void GPDMA::Init(const GPDMAOption* opt){
	
	base_addr[Configuration]=1|(opt->endian_mode)<<1;
	while ( !(base_addr[Configuration] & 0x1) );
	
	
	base_addr[IntClear] = chan_mask;
	base_addr[IntErrClr] = chan_mask; 
	

	chan[CH_Control]=
		((opt->SBSize)<<12)|
		((opt->DBSize)<<15)|
		((opt->SWidth)<<18)|
		((opt->DWidth)<<21)|
		((opt->SI)<<26)|
		((opt->DI)<<27)|
		((opt->Prot)<<28)|
		((opt->IntEnable)<<31);
	chan[CH_Configuration]=
		((opt->SrcP)<<1)|
		((opt->DestP)<<6)|
		((opt->FlowCntl)<<11)|
		((opt->IE)<<14)|
		((opt->ITC)<<15)|
		((opt->L)<<16)|
		((opt->H)<<18);
	
	
};
void GPDMA::SetSrc(void* addr){
	chan[CH_SrcAddr]=(ulong)addr;
}
void GPDMA::SetDest(void* addr){
	chan[CH_DestAddr]=(ulong)addr;
}
void GPDMA::Start(const uint tsize){
	chan[CH_Control]|=tsize&0xFFF;	
	chan[CH_Configuration]|=1;
}
void GPDMA::Stop(){
	chan[CH_Configuration]&=(~1);
}



uint GPDMA::GetIntStatus(){
	return base_addr[IntStatus];
}
void GPDMA::ClearInt(){
	base_addr[IntClear]|=chan_mask;
}

uint GPDMA::GetSrcAddr(){
	return chan[CH_SrcAddr];
}
uint GPDMA::GetDestAddr(){
	return chan[CH_DestAddr];
}



void GPDMA::Register(GPDMA* const obj,const uint num){
	if(num>=2) return;
	DEV[num]=obj;
}

GPDMA* GPDMA::Get(uint num){
	if(num>=2) return (GPDMA*)0x0;
	else	return DEV[num];
}

GPDMA* GPDMA::DEV[2];
