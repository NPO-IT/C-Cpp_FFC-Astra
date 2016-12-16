#include "UShortFIFO.h"

UshortFIFO::UshortFIFO(ushort* data_ptr,uint fifo_size):size(fifo_size){
    write=0;
    read=0;
    data=data_ptr;
    //data = new ushort[size];!!!!!!!!!!!!!!!!!!!!!!!!!
}
							  
UshortFIFO::~UshortFIFO(){
    //delete [] data; !!!!!!!!!!!!!!!!!!!!
}
//uint PushData(...);
uint UshortFIFO::PushData(const ushort* push_data,const uint& dsize){
    uint i;
	for(i=0;i<dsize;i++){
		if(write>=size){
			//full=true;
			break;
		}
		data[write++]=push_data[i];
	}
	return i;
}

uint UshortFIFO::PopData(ushort* pop_data,const uint& dsize){
    uint i ;
	for(i=0;i<dsize;i++){
        //if(read>=write) {
		if(read>=size){
            pop_data[0]=63;
			break;
        }
        pop_data[i]=data[read++];
    }
    return i;
}
bool UshortFIFO::IsFull() const{
    if(write>=size) return true;
    return false;
}
bool UshortFIFO::AllRead() const{
    if(read>=size) return true;
    return false;
}

void UshortFIFO::Reset(uint r,uint w){
    read=r;
    write=w;
}
ushort& UshortFIFO::operator [](const uint num){
	if(num>=size) return data[0];
	return data[num];
}