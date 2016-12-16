#line 1 "BDCStream.cpp"
#line 1 "BDCStream.h"



#line 1 "../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 5 "BDCStream.h"





 
class BDCStreamBase{
    protected:
        enum{
            WORD_SIZE=20,  
            LAST_SHIFT=-4, 
        };
        uint service_addr[WORD_SIZE];
        
        
		uint *words[4];
        
        uint cur_word;
		int shift;
        virtual void CalcServiceAddr(uint * const data){};
        ushort Get4Bit(const uint& num);
    public:
        BDCStreamBase();
        ~BDCStreamBase();
        
        void SetData(uint *data_ptr);
        void ClearCount();
        ushort GetHash();
};

class BDCStream15:public BDCStreamBase{
    protected:
        void CalcServiceAddr(uint * const data){};
    public:
         BDCStream15();
        ~BDCStream15();
};

class BDCStream16:public BDCStreamBase{
    private:
        
        static const ushort HASH6BIT_SERVICE[64];
        
        void CalcServiceAddr(uint * const data);
    public:
        BDCStream16();
        ~BDCStream16();
};


struct BDCPack{
	byte agent_id;
	byte code_func;
	byte pack_num;
	byte prog_num;
	byte res1;
	byte res2;
	ushort crc16;
};
#line 2 "BDCStream.cpp"


































































 

const ushort BDCStream16::HASH6BIT_SERVICE[64]={					   
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
