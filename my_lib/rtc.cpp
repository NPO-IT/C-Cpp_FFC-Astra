#include "rtc.h"

RTC::RTC(RTCName name):Peripheral((ulong*)name){}

RTC::~RTC(){}

void RTC::Init(const RTCOption* const opt){
	/*base_addr[AMR]=opt->alarm_mask;
	base_addr[CIIR]=0;
    base_addr[CCR]|=(opt->CLKSRC)<<4; */
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

//сделать наконец с помощью шаблона!!!!
void RTC::Register(const uint& num,RTC* obj){
	if(num>RTC_SIZE) return;
	DEV[num]=obj;
}
RTC* RTC::Get(const uint& num){
   	if(num>RTC_SIZE) return (RTC*)NULL;
	return DEV[num];
}

RTC* RTC::DEV[1];
