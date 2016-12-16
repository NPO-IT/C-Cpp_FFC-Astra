#include "DoubleBufferUshort.h"

DoubleBufferUshort::DoubleBufferUshort( ushort* const data_ptr,const uint& dsize):size(dsize){
    read=data_ptr;
    write=data_ptr+size;
    rcount=0;
    wcount=0;
}
DoubleBufferUshort::~DoubleBufferUshort(){}
/*
ushort* DoubleBufferUshort::GetData(const uint& data_size){
	if(rcount>=size) return 0;
	return read+rcount	
} */
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