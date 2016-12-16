#ifndef _SECOND_STEP_H_
#define _SECOND_STEP_H_

#include "DoubleBufferUshort.h"
#include "./../my_lib/type.h"
#include "secondstep_macro.h"

/*
 лассы локальников дл€ 2-х и 4-х позиционного кода,
а так же дл€ Ѕ”—'а
ƒл€ работы с этим класом тоже определны 
макросы дл€ повышени€ бустродействи€

----------јлгоритм локальника следующий--------
буффер из 64 слова ushort используетс€ только 10 бит 
0..8 значение аналогового канала
9 - значение контактного

4-х позиционный код
дл€ по битной передачи считываем по 2 бита из текущего слова
когда текущеее слово прочитано читаем следующее слово из буффера
2 бита преобразуютс€ в полочку синуса

*/

class SecondStepBase:public DoubleBufferUshort{
    public:
        ushort cur_word;
        uint mask;
    	uint shift;
		uint   cnt_5;	//счетчик массива индексов
		ushort *word4; 	//указатель на следующие 4 слова локальника
		byte word5[5];	//преобразованные слова индексы сверток окф
		//byte CODE[4];

        SecondStepBase(ushort*const data_ptr,const uint& size);
        //разные алгоритмы дл€ разных позиционностей
		virtual byte GetNext()=0;
		
		void WriteAnalog(const uint& num,const ushort&  val); //запись аналоговых
		void WriteContact(const uint& num,const ushort& val); //запись контактных
};

class SecondStep2POS:public SecondStepBase{
    public:
        SecondStep2POS(ushort*const data_ptr,const uint& size);
        virtual byte GetNext();
        //void CalcWord(const ushort& word,byte* data,const uint& size);
};

class SecondStep4POS:public SecondStepBase{
    public:
        SecondStep4POS(ushort* const data_ptr,const uint& size);
        virtual byte GetNext();
        //void CalcWord(const ushort& word,byte* data,const uint& size);
};


class BDCStreamAddr:public SecondStepBase{
	public:
		BDCStreamAddr(ushort* const data_ptr,const uint&size);
		virtual byte GetNext();
};
#endif
