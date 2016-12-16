#include "softwarecounter.h"


SoftwareCounter::SoftwareCounter(const uint& trigger,const uint& istep,EVT_HANDLER *handler, const uint& start_val):trggr_val(trigger),EventHandler(handler),count(start_val),step(istep){};
SoftwareCounter::~SoftwareCounter(){}
void SoftwareCounter::operator++ (int){
    count+=step;
    if(count>=trggr_val){
        count=0;
        if(EventHandler!=0)
           EventHandler();
    }
}

void SoftwareCounter::operator++ (){
	count+=step;
    if(count>=trggr_val){
        count=0;
        if(EventHandler!=0)
            EventHandler();
    }	
}

const uint& SoftwareCounter::GetValue() const{
    return count;
}

void SoftwareCounter::Set(uint val){
	if (val<trggr_val)
		count=val;
}

bool SoftwareCounter::operator >(uint match_val) const{
	return (count>match_val)?true:false;	
}
bool SoftwareCounter::operator <(uint match_val) const{
	return count<match_val; 
}
bool SoftwareCounter::operator ==(uint match_val) const{
	return count==match_val;
}
bool SoftwareCounter::operator >=(uint match_val) const{
	return count>=match_val;
}
bool SoftwareCounter::operator <=(uint match_val) const{
	return count<=match_val;
}
bool SoftwareCounter::operator !=(uint match_val) const{
   return count!=match_val;
}
