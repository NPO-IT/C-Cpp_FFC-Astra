#include "skuttime.h"


//const uint SKUTTime::marker=(1<<18)+2;


SKUTTime::SKUTTime():marker((1<<18)+2){
	time=marker;
	units=tens=hundreds=thousands=0;
}


SKUTTime::~SKUTTime(){};

uint SKUTTime::GetBit(){
	//uint ret_val=
	time>>=1;
	return (time&0x1);
};

void SKUTTime::Clear() {
	time=marker;
	units=tens=hundreds=thousands=0;
}
//тут скрыт баг!
void SKUTTime::Set(const byte& u,const byte& t,const byte& h,const byte& th){
	units=u;
	tens=t;
	hundreds=h;
	thousands=th;
}
//типа из реальных значений секунд пересчитать
void SKUTTime::Set(const uint& n_time){}
void SKUTTime::operator++(int){
	if(++units==10){
		units=0;
		if(++tens==10){
			tens=0;
			if(++hundreds==10){
				hundreds=0;
				if(++thousands==10){
					 thousands=0;
				}
			}
		}
	}
	time=marker;
	time|=((units<<2)|(tens<<6)|(hundreds<<10)|(thousands<<14));
}
