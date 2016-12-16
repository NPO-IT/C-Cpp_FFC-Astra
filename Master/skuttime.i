#line 1 "skuttime.cpp"
#line 1 "skuttime.h"
#line 1 "./../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

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

	
#line 2 "skuttime.cpp"





SKUTTime::SKUTTime():marker((1<<18)+2){
	time=marker;
	units=tens=hundreds=thousands=0;
}


SKUTTime::~SKUTTime(){};

uint SKUTTime::GetBit(){
	
	time>>=1;
	return (time&0x1);
};

void SKUTTime::Clear() {
	time=marker;
	units=tens=hundreds=thousands=0;
}

void SKUTTime::Set(const byte& u,const byte& t,const byte& h,const byte& th){
	units=u;
	tens=t;
	hundreds=h;
	thousands=th;
}

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
