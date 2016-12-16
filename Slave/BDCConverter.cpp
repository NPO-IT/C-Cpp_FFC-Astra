#include "bdcconverter.h"


BDCConverter::BDCConverter(){}
BDCConverter::~BDCConverter(){}
void BDCConverter::SetAddr(const uint *const data,const uint &num){
    if(num>3) return;
    for(uint i=0;i<20;i++){
        data_16[num][i]=data_18[num][i]=data[i];
    }
}
void BDCConverter::SetAddr(const ushort *const data,const uint &num){
    if(num>3) return;
    for(uint i=0;i<20;i++){
        data_18[num][i]=data_16[num][i]=data[i];
    }
}
const ushort* BDCConverter::GetAddr(const uint &num){
    if(num>3) return 0;
    return data_16[num];
}

/*
	//??? ??????? ???????? ? ????????? ????? (?????????)
	+--+--+ +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
	|17|16| |15|14|13|12|11|10| 9| 8|7 |6 |5 |4 |3 |2 |1 |0 |
	+--+--+ +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
	?? ???? ???? ??????????? ???? ????? 6 ????????? ????? ??? ??? ???????
	+-----+-----+-----+
	|  0  |  1  |  2  |
	+-----+-----+-----+
	|17|16|17|16|17|16|
	+-----+-----+-----+
	????? ?? ??? ??????? ?????????? ????? ??? ?????????? ?????????? ??????
*/
void BDCConverter::Convert(){
    const uint mask=0x30000;
    for(uint i=0;i<20;i++){
        uint sign=
            (data_18[0][i]&mask)>>12|
            (data_18[1][i]&mask)>>14|
            (data_18[2][i]&mask)>>16;
        data_16[3][i]=HASH_TABLE[sign];
    }
}
const ushort BDCConverter::HASH_TABLE[64]={
    0xC000, 0xC124, 0xC800, 0xC924, 0xC092, 0xC1B6, 0xC892, 0xC9B6, 0xE400,
	0xE524, 0xEC00, 0xED24, 0xE492, 0xE5B6, 0xEC92, 0xEDB6, 0xC049, 0xC16D,
	0xC849, 0xC96D, 0xC0DB, 0xC1FF, 0xC8DB, 0xC9FF, 0xE449, 0xE56D, 0xEC49,
	0xED6D, 0xE4DB, 0xE5FF, 0xECDB, 0xEDFF, 0xD200, 0xD324, 0xDA00, 0xDB24,
	0xD292, 0xD3B6, 0xDA92, 0xDBB6, 0xF600, 0xF724, 0xFE00, 0xFF24, 0xF692,
	0xF7B6, 0xFE92, 0xFFB6, 0xD249, 0xD36D, 0xDA49, 0xDB6D, 0xD2DB, 0xD3FF,
	0xDADB, 0xDBFF, 0xF649, 0xF76D, 0xFE49, 0xFF6D, 0xF6DB, 0xF7FF, 0xFEDB,
	0xFFFF,
};