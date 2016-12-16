#line 1 "..\\my_lib\\rtc.cpp"
#line 1 "..\\my_lib\\rtc.h"
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

#line 4 "..\\my_lib\\rtc.h"







 

enum RTCName{
	RTC_0=0xE0024000
};

struct RTCOption{
	byte clksrc;
	byte alarm_mask;
	byte ciir;
};
struct RTCTime{
    byte sec;      
    byte min;      
    byte hour;     
    byte day;     
    byte mon;      
    ushort year;     
    byte w_day;     
    byte y_day;     
} ;

class RTC:public Peripheral{
	private:
		
		enum{
			ILR= 0,
			CTC=1,
			CCR=2,
			CIIR=3,
			AMR=4,
			CTIME0=5,
			CTIME1=6,
			CTIME2=7,
			SEC=8,
			MIN=9,
			HOUR=10,
			DOM=11,
			DOW=12,
			DOY=13,
			MONTH=14,
			YEAR=15,
			CISS=16,

			ALSEC=24,
			ALMIN=25,
			ALHOU=26,
			ALDOM=27,
			ALDOW=28,
			ALDOY=29,
			ALMON=30,
			ALYEAR=31,
			PREINT=32,
			PREFRAC=33		
		};
		
		
		static RTC* DEV[1];
		public:
		
		enum{
			IMSEC=1,IMMIN=2,IMHOUR=4,IMDOM=8,IMDOW=16,IMDOY=32,IMMON=64,IMYEAR=128
		};
	  
	  	 
		RTC(RTCName name);
		~RTC();
		void Init(const RTCOption* const opt);
				
		 
		void Start();	  
		void Stop();	  
		void Set(const RTCTime* const time);  		
		
		const RTCTime	GetTime();
		void Clear();	  
		
		 
		void ClearInt();  
		const uint GetIntStatus() const; 
		
		 
		static void Register(const uint& num,RTC* obj);
		static RTC* Get(const uint& num);
};

#line 2 "..\\my_lib\\rtc.cpp"

RTC::RTC(RTCName name):Peripheral((ulong*)name){}

RTC::~RTC(){}

void RTC::Init(const RTCOption* const opt){
	

 
	base_addr[AMR]=opt->alarm_mask;
	base_addr[CIIR]=opt->ciir;
	base_addr[CCR]|=(opt->clksrc)<<4;
}
				
void RTC::Start(){
	base_addr[CCR]|=1;
}
void RTC::Stop(){
	base_addr[CCR]&=~1;
}
void RTC::Set(const RTCTime* const time){
	base_addr[SEC] = time->sec;
    base_addr[MIN] = time->min;
    base_addr[HOUR] = time->hour;
    base_addr[DOM] = time->day;
    base_addr[DOW] = time->w_day;
    base_addr[DOY] = time->y_day;
    base_addr[MONTH] = time->mon;
    base_addr[YEAR] = time->year;
}

const RTCTime	RTC::GetTime(){
	RTCTime time;
	 time.sec=base_addr[SEC];
     time.min=base_addr[MIN];
     time.hour=base_addr[HOUR];
     time.day=base_addr[DOM];
     time.w_day=base_addr[DOW];
     time.y_day=base_addr[DOY];
     time.mon=base_addr[MONTH];
     time.year=base_addr[YEAR];
	return time;
}
void RTC::Clear(){
	base_addr[CCR]|=2;
	base_addr[CCR]&=~2;
}

void RTC::ClearInt(){
	base_addr[ILR]|=base_addr[ILR];
}
const uint RTC::GetIntStatus() const{
	return	base_addr[ILR];
}


void RTC::Register(const uint& num,RTC* obj){
	if(num>1) return;
	DEV[num]=obj;
}
RTC* RTC::Get(const uint& num){
   	if(num>1) return (RTC*)((void *)0);
	return DEV[num];
}

RTC* RTC::DEV[1];
