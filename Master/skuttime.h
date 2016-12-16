#ifndef _SKUT_TIME_H_
#define _SKUT_TIME_H_
#include "./../my_lib/type.h"


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
/*
		void print(){
            cout<<"time "<<(uint)thousands<<(uint)hundreds<<(uint)tens<<(uint)units<<":\t"<<
            ((time>>1)&(~marker))<<endl<<"-----------"<<endl;
		}
*/
};

	
#endif
