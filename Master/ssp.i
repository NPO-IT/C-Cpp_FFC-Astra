#line 1 "..\\my_lib\\ssp.cpp"
#line 1 "..\\my_lib\\ssp.h"



#line 1 "..\\my_lib\\peripheral.h"
#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "..\\my_lib\\peripheral.h"
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


























#line 5 "..\\my_lib\\peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 5 "..\\my_lib\\ssp.h"



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











#line 2 "..\\my_lib\\ssp.cpp"

SSP::SSP(SSPName name):Peripheral((ulong*)name){

}
SSP::~SSP(){

}
void SSP::Init(const SSPOption* const opt){
	



 
	
	base_addr[CR1]&=~2;			
	
	base_addr[CR0]=opt->dss|opt->frf<<4|opt->spo<<6|opt->sph<<7|opt->scr<<8;
	
	base_addr[CR1]=opt->lbm|opt->ms<<2;
	base_addr[CPSR]=opt->div;			
	base_addr[IMSC]=opt->int_mode; 		
	base_addr[DMACR]=opt->dma;
	base_addr[CR1]|=2;					
	
}

uint SSP::GetIntStatus()const  {
	return base_addr[MIS];
}
uint SSP::GetStatus() const {
	return base_addr[SR];
}

bool SSP::Read(byte* buf,const uint& size){
	for(uint i=0;i<size;i++){
		while(!base_addr[SR]&RNE);
		buf[i]=base_addr[DR];	 
	}
	return true;
}
bool SSP::Send(const byte* buf,const uint& size){
	while(!(base_addr[SR]&TNF));
	for(uint i=0;i<size;i++){
		base_addr[DR]=buf[i];
		
	}
	
	return true;
}


bool SSP::Read(ushort* buf,const uint& size){
	for(uint i=0;i<size;i++){
		while(!(base_addr[SR]&RNE));
		buf[i]=base_addr[DR];
	}
	return true;
}
bool SSP::Send(const ushort* buf,const uint& size){
	for(uint i=0;i<size;i++){
		while(!(base_addr[SR]&TNF))	;
		base_addr[DR]=buf[i];
		
	} 	
	return true;
}
void SSP::ClearRxFIFO(){
	ushort data;
	while((base_addr[SR]&RNE)){
		data=base_addr[DR];
	}
}

void SSP::ClearTxFIFO(){
	
}
		
SSP* SSP::Get(uint num){
	if(num>=2) return (SSP*)0;
	return DEV[num];
}

void SSP::Register(uint num,SSP* obj){
	if(num>=2) return;
	DEV[num]=obj;
}

SSP* SSP::DEV[2];


void SSP::GetAllData(byte*const buf,uint& size){
	size=0;
	
	while(base_addr[SR]&RNE){
		buf[size++]=base_addr[DR];	
	}
}


void SSP::GetAllData(ushort* const buf,uint& size){
	size=0;
	
	while(base_addr[SR]&RNE){
		buf[size++]=base_addr[DR];	
	}
}
bool SSP::Send(const ushort &word){
	
	if(base_addr[SR]&BSY) return false;
	
	if(!(base_addr[SR]&TNF))return false;
	
	base_addr[DR]=word;
	return true;
}
bool SSP::Read(ushort &word){
	while(!(base_addr[SR]&RNE));
	word=base_addr[DR];

	return true;
}

