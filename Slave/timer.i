#line 1 "..\\my_lib\\timer.cpp"
#line 1 "..\\my_lib\\timer.h"
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

#line 4 "..\\my_lib\\timer.h"
#line 5 "..\\my_lib\\timer.h"
#line 6 "..\\my_lib\\timer.h"

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















#line 2 "..\\my_lib\\timer.cpp"



Timer::Timer(TimerName name):Peripheral((ulong*)name){};
Timer::~Timer(){}

void Timer::Init(const TimerMatchOption* opt){
	base_addr[PR]=opt->presc;
	base_addr[TCR]=2;
	base_addr[MCR]=opt->mode;
	base_addr[MR0]=opt->mr0;
	base_addr[MR1]=opt->mr1;
	base_addr[MR2]=opt->mr2;
	base_addr[MR3]=opt->mr3;
}

void Timer::Clear(){
   base_addr[TCR]=3;
}

void Timer::Start(){
   	base_addr[TCR]=1;
}
void Timer::Stop(){
	base_addr[TCR]&=~1;	
}
uint Timer::GetCount(){
	return base_addr[TC];
}

void Timer::ClearInt(){
	base_addr[IR]|=base_addr[IR];
}

uint Timer::GetIntStatus() const{
	return base_addr[IR];
}



void Timer::Register(uint num,Timer* obj){
	if(num>4) return;
	DEV[num]=obj;
}
Timer* Timer::Get(uint num){
	if(num>4) return (Timer*)((void *)0);
	return DEV[num];
}

Timer* Timer::DEV[4];
