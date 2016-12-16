
#include "busprotocol.h"
BUS::BUS(
	FastPort const iport,
	const uint& idir_val,
	UART* const iuart
):dir_port(iport),dir_val(idir_val),uart(iuart){
	device_id=0;	
}
 /*
//пока не соберется пакет возвращает false
bool BUS::RcvBlock(){
	uart->Read(buf+count,block_size);
	count+=block_size;
	if(count>=size){
		count=0;		//спорный момент ибо не ясно 
		 return true;
	}
	return false; 
}

bool BUS::IsOk(){
	//Answer* answ=(Answer*)buf;
	ushort*  crc16=(ushort*)(buf+size-2);
	if(CalcCRC16(buf,size-2)!=*crc16) return false;
	return true;
}

void BUS::ProcData(){
	 if(agent->callback!=0){
		//agent->callback(buf+6,);
	 }
};
   */
void BUS::SendQuery(void *query,const uint &size){
	 device_id= *((byte*)query);
	 
	 dir_port[SET]|=dir_val;
	 uart->Send((byte*)query,size);
	 {uint i=RS485DELAY;while(i--);}
	 dir_port[CLR]|=dir_val;
}

uint BUS::GetID() const{
	return device_id;
};
/*
void BUS::Send(byte* const data,const uint& size){
	 dir_port[SET]|=dir_val;
	 uart->Send(data,size);
	 {uint i=70;while(i--);}
	 dir_port[CLR]|=dir_val;

}	   */
