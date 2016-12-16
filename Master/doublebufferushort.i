#line 1 "DoubleBufferUshort.cpp"
#line 1 "DoubleBufferUshort.h"



#line 1 "./../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 5 "DoubleBufferUshort.h"
#line 1 "doublebuffer_macro.h"



 


 








 























#line 47 "doublebuffer_macro.h"

#line 6 "DoubleBufferUshort.h"













 

class DoubleBufferUshort{

    public:
		ushort& GetWriteWord(const uint& num);
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;
    

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        
        uint Read(ushort* const data,const uint rsize);
		
		void Read(const uint& num,ushort& data);
        
        void Write(const ushort* data,const uint& wsize);
		
		void Write(const uint& num,const ushort& data);
        
        void Switch();
		
        bool IsRead();
		
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		void Clear();
};
#line 2 "DoubleBufferUshort.cpp"

DoubleBufferUshort::DoubleBufferUshort( ushort* const data_ptr,const uint& dsize):size(dsize){
    read=data_ptr;
    write=data_ptr+size;
    rcount=0;
    wcount=0;
}
DoubleBufferUshort::~DoubleBufferUshort(){}




 
uint DoubleBufferUshort::Read(ushort* const data,const uint rsize){
    uint i;
    for(i=0;i<rsize;i++){
        data[i]=read[rcount++];
    }
    return i;
}

inline void DoubleBufferUshort::Read(const uint& num,ushort& data){
	data=read[num];
}
void DoubleBufferUshort::Write(const ushort* data,const uint& wsize){
    uint i;
    for(i=0;i<wsize;i++){
        write[wcount++]=data[i];
    }
}
void DoubleBufferUshort::Write(const uint& num,const ushort& data){
	write[num]=data;
}

void DoubleBufferUshort::Switch(){
    ushort* tmp;
    tmp=read;
    read=write;
    write=tmp;
    rcount=wcount=0;
}

bool DoubleBufferUshort::IsRead(){
     return (rcount>=size)? true: false;
}
bool DoubleBufferUshort::IsFull(){
    return (wcount>=size)? true: false;
}

void DoubleBufferUshort::Reset(uint r,uint w){
	rcount=r;
	wcount=w;
}
void DoubleBufferUshort::Clear(){
	for(uint i=0;i<size;i++){
		write[i]=read[i]=0;
	}
}

ushort& DoubleBufferUshort::GetWriteWord(const uint& num){
	if(num>=size) return write[0];
	return write[num];
}
