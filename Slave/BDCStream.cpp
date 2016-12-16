#include "BDCStream.h"

/*const ushort BDCStream16::HASH6BIT_SERVICE[64]={			   //Хеш для передачи с младших битов
    49152,
49444,
51200,
51492,
49298,
49590,
51346,
51638,
58368,
58660,
60416,
60708,
58514,
58806,
60562,
60854,
49225,
49517,
51273,
51565,
49371,
49663,
51419,
51711,
58441,
58733,
60489,
60781,
58587,
58879,
60635,
60927,
53760,
54052,
55808,
56100,
53906,
54198,
55954,
56246,
62976,
63268,
65024,
65316,
63122,
63414,
65170,
65462,
53833,
54125,
55881,
56173,
53979,
54271,
56027,
56319,
63049,
63341,
65097,
65389,
63195,
63487,
65243,
65535
};	 */

const ushort BDCStream16::HASH6BIT_SERVICE[64]={					   //Хеш для передачи со старших битов
3,
9347,
19,
9363,
18691,
28035,
18707,
28051,
39,
9383,
55,
9399,
18727,
28071,
18743,
28087,
37379,
46723,
37395,
46739,
56067,
65411,
56083,
65427,
37415,
46759,
37431,
46775,
56103,
65447,
56119,
65463,
75,
9419,
91,
9435,
18763,
28107,
18779,
28123,
111,
9455,
127,
9471,
18799,
28143,
18815,
28159,
37451,
46795,
37467,
46811,
56139,
65483,
56155,
65499,
37487,
46831,
37503,
46847,
56175,
65519,
56191,
65535
};	

BDCStreamBase::BDCStreamBase(){
    cur_word=0;
    shift=0;
	for(uint i=0;i<WORD_SIZE;i++){
		service_addr[i]=0;
	}
}

unsigned char ChangeBitsHash[16]=
{
	0,8,4,12,2,10,6,14,
	1,9,5,13,3,11,7,15	 
}; 

BDCStreamBase::~BDCStreamBase(){}
void BDCStreamBase::SetData(uint *data_ptr){
    words[0]=data_ptr;
    words[1]=data_ptr+20;
    words[2]=data_ptr+40;
    words[3]=service_addr; 
    CalcServiceAddr(service_addr);
    ClearCount();
}
void BDCStreamBase::ClearCount(){
    cur_word=0;shift=12;
}
ushort BDCStreamBase::GetHash(){
    if(shift==LAST_SHIFT){
        shift=12;
        if(++cur_word==WORD_SIZE){
            cur_word=0;
        }
    }
    ushort stream_hash_key=Get4Bit(0)|(Get4Bit(1)<<4)|(Get4Bit(2)<<8)|(Get4Bit(3)<<12);
    shift-=4;
    return stream_hash_key;
}
ushort BDCStreamBase::Get4Bit(const uint& addr){
    return ChangeBitsHash[(words[addr][cur_word]>>shift)&0xF];
}


BDCStream15::BDCStream15():BDCStreamBase(){}
BDCStream15::~BDCStream15(){}


BDCStream16::BDCStream16():BDCStreamBase(){}
BDCStream16::~BDCStream16(){}


/*void BDCStream16::CalcServiceAddr(uint *data[3],uint *const service_addr)*/
void BDCStream16::CalcServiceAddr(uint *const data){
   for(uint i=0;i<WORD_SIZE;i++){
        byte key;
        key=
            ((words[0][i]&0x30000)>>16)|
            ((words[1][i]&0x30000)>>14)|
            ((words[2][i]&0x30000)>>12);

            data[i]=HASH6BIT_SERVICE[key&0x3F];
        }
}
