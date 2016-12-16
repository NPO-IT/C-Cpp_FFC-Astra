#line 1 "..\\my_lib\\pwm.cpp"
#line 1 "..\\my_lib\\pwm.h"



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

#line 5 "..\\my_lib\\pwm.h"

enum PWMName{
	PWM_0=0xE0014000,
	PWM_1=0xE0018000
};

struct PWMOption{
	
	
	uint mcr;			
	
	uint pcr;		
	
	uint mr0;
	uint mr1;
	uint mr2;
	uint mr3;
	uint mr4;
	uint mr5;
	uint mr6;
	
	
	
	
	
	uint prescaler;		
};

class PWM:public Peripheral{
	private:
		
		enum{
			IR=0,TCR=1,TC=2,PR=3,PC=4,MCR=5,MR0=6,MR1=7,MR2=8,MR3=9,CCR=10,
			CR0=11,CR1=12,CR2=13,CR3=14,MR4=16,MR5=17,MR6=18,PCR=19,LER=20,CTCR=28	
		};
		
		
		static PWM* DEV[1]; 
	public:
		
		enum{
			IMR0=1,IMR1=2,IMR2=4,IMR3=8,IMR4=256,IMR5=512,IMR6=1024
		};

		PWM(PWMName name);
		~PWM();

		void Init(PWMOption* opt);		

		void Enable();	  
		void Disable();	  
		void Clear();	  
		void ClearInt();  
		uint GetIntStatus() const; 
		

		
		
		
		
		static void Register(const uint& num,PWM* obj);
		static PWM* Get(const uint& num);
}; 


#line 2 "..\\my_lib\\pwm.cpp"

PWM::PWM(PWMName name):Peripheral((ulong*)name){};
PWM::~PWM(){};

void PWM::Init(PWMOption* opt){
	base_addr[PC]=opt->prescaler;
	base_addr[MCR]=opt->mcr;
	base_addr[MR0]=opt->mr0;
	base_addr[MR1]=opt->mr1;
	base_addr[MR2]=opt->mr2;
	base_addr[MR3]=opt->mr3;
	base_addr[MR4]=opt->mr4;
	base_addr[MR5]=opt->mr5;
	base_addr[MR6]=opt->mr6;
	base_addr[PCR]=opt->pcr;

}	

void PWM::Enable(){
	base_addr[TCR]=9;
}
void PWM::Disable(){
	base_addr[TCR]=0;
}
void PWM::Clear(){
	base_addr[TCR]=2;
}

void PWM::ClearInt(){
	base_addr[IR]|=base_addr[IR];
}

uint PWM::GetIntStatus() const{
	return base_addr[IR];
}


PWM* PWM::DEV[1]={};

void PWM::Register(const uint& num,PWM* obj){
	
	if(num>0) return;
	DEV[num]=obj;
}
PWM* PWM::Get(const uint num){
	if(num>0) return (PWM*)0;
	return DEV[num];
}
