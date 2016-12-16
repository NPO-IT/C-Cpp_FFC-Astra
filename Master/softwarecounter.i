#line 1 "softwarecounter.cpp"
#line 1 "softwarecounter.h"
#line 1 "./../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

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

#line 2 "softwarecounter.cpp"


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
