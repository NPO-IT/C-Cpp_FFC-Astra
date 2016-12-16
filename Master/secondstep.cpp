#include "SecondStep.h"

 //РАСПИСАТЬ АЛГОРИТМЫ!!!
SecondStepBase::SecondStepBase(ushort*const data_ptr,const uint& size):
DoubleBufferUshort(data_ptr,size),mask(0){
/*	CODE[0]=7;
	CODE[1]=23;
	CODE[2]=39;
	CODE[3]=56;	 */
}

void SecondStepBase::WriteAnalog(const uint& num,const ushort&  val){
	ushort& word=read[num];
	word&=0xFE00; 			//очистили
	word|=(val&0x1FF);    	//перезаписали
}
void SecondStepBase::WriteContact(const uint& num,const ushort& val){
	ushort& word=GetWriteWord(num);
	word&=0xFDFF; 			//очистили
	word|=((val&0x1)<<9);   //перезаписали
}

SecondStep2POS::SecondStep2POS(ushort*const data_ptr,const uint& size):SecondStepBase(data_ptr,size){}
inline byte SecondStep2POS::GetNext(){
 /*   byte ret_val=0;
    //return CODE[0];
    if(!mask){
        Read(&cur_word,1);
        //if (IsRead()) Switch();
        mask=512;
    }
    if(cur_word&mask) ret_val=CODE[3];
    else ret_val=CODE[0];
    mask>>=1;
    return ret_val;		 */
}

SecondStep4POS::SecondStep4POS(ushort* const data_ptr,const uint& size)
:SecondStepBase(data_ptr,size){
	shift=0;cnt_5=1;
}
inline byte SecondStep4POS::GetNext(){
 /*   //byte ret_val=0;
    if(shift==0){
        cur_word=read[rcount++];
        shift=10;
    }

    //ret_val=CODE[(cur_word&mask)>>shift];
    shift-=2;
    return CODE[(cur_word>>shift)&3]; */
}

  //реализация потоков БУСА!
BDCStreamAddr::BDCStreamAddr(ushort* const data_ptr,const uint&size):SecondStepBase(data_ptr,size){}

inline byte BDCStreamAddr::GetNext(){
/*	byte ret_val=0;
    if(!mask){
        Read(&cur_word,1);
        mask=49152;
        shift=14;
    }

    ret_val=CODE[(cur_word&mask)>>shift];
    shift-=2;
    mask>>=2;
    return ret_val;	*/
}

