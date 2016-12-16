#include "DoubleBufferUshort.h"

DoubleBufferUshort::DoubleBufferUshort( ushort* const data_ptr,const uint& dsize):size(dsize){
    read=data_ptr;
    write=data_ptr+size;
    rcount=0;
    wcount=0;
}
DoubleBufferUshort::~DoubleBufferUshort(){}
uint DoubleBufferUshort::Read(ushort* data,const uint& rsize){
    uint i;
    for(i=0;i<rsize;i++){
        if(rcount>=size) break;
        data[i]=read[rcount++];
    }
    return i;
}
uint DoubleBufferUshort::Write(const ushort* const data,const uint& wsize){
    uint i;
    for(i=0;i<wsize;i++){
        if(wcount>=size) break;
        write[wcount++]=data[i];
    }
    return i;
}
void DoubleBufferUshort::Write(const uint& num,const ushort& data){
	if(num>=size) return;
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

const ushort* DoubleBufferUshort::GetData(const uint& data_size){
	if(rcount>=size) return 0;
	ushort* ret_val=read+rcount;
	rcount+=data_size;
	return ret_val;
};

void DoubleBufferUshort::Reset(uint cnt,bool rw){
	if (cnt>=size) return;
	//read 
	if(rw){
		rcount=cnt;	
	}
	//write
	else{
		wcount=cnt;
	}
}

void DoubleBufferUshort::ResetRead(const uint& cnt){
	if (cnt>=size) return;
	rcount=cnt;
}
void DoubleBufferUshort::ResetWrite(const uint& cnt){
	if (cnt>=size) return;
	wcount=cnt;
}

ushort* DoubleBufferUshort::GetForReadBuf(const uint& get_size){
    return GetBuffer(get_size,read,rcount);
}
ushort* DoubleBufferUshort::GetForWriteBuf(const uint& get_size){
    return GetBuffer(get_size,write,wcount);
}

ushort* DoubleBufferUshort::GetBuffer(const uint& get_size,ushort *buffer,uint &count){
    if((get_size+count)>size) return (ushort*)0;
    ushort* ret_val=buffer+count;
    count+=get_size;
    return ret_val;
}