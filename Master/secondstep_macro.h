#ifndef _MACRO_SS_H_
#define	_MACRO_SS_H_
#include "LKF_HASH_TABLE.h"

/*
эти макросы использовались на этапе отработки более быстрые алгоритмы ниже

*/
//получить 2 бита свертки в хэшированном виде и и сжатом для сохранения в память 
#define SS4POS_GetNext_SAVE(lkf,val,save_val)\
    if(!lkf->shift){\
        lkf->cur_word=lkf->read[(lkf->rcount)++];\
        lkf->shift=10;\
    }\
	lkf->shift-=2;\
	save_val<<=2;\
	save_val|=((lkf->cur_word)>>(lkf->shift))&0x3;\
    val=SIN[save_val&0x3];\

//получить два бита в хэшированном виде
#define SS4POS_GetNext(lkf,val)\
    if(!lkf->shift){\
        lkf->cur_word=lkf->read[(lkf->rcount)++];\
        lkf->shift=10;\
    }\
	lkf->shift-=2;\
	val=SIN[((lkf->cur_word)>>(lkf->shift))&0x3];\

/*
storage должен быть 16 битным
#define SS4POS_GetNext(lkf,val,storage)\
    if(!lkf->shift){\
        lkf->cur_word=lkf->read[(lkf->rcount)++];\
        lkf->shift=10;\
    }\
	lkf->shift-=2;\
	storage<<=2;\
	storage|=(((lkf->cur_word)>>(lkf->shift))&0x03); \
    val=lkf->CODE[((lkf->cur_word)>>(lkf->shift))&0x03];\

*/
#define BDC4Pos_GetNext(lkf,val)\
	if(!lkf->shift){\
        lkf->cur_word=lkf->read[(lkf->rcount)++];\
        lkf->shift=16;\
    }\
	lkf->shift-=2;\
    val=lkf->CODE[((lkf->cur_word)>>(lkf->shift))&0x03];\
//записать аналоговый паармаетр в канал локальника
#define LC_WriteAnalog(lkf,chan,val){\
	lkf->write[chan]&=0x200;lkf->write[chan]|=(val&0x1FF);\
}
//записать контактный параметр в канал локальника
#define LC_WriteContact(lkf,chan,val){\
	lkf->write[chan]&=0x1FF;lkf->write[chan]|=((val)&1)<<9;\
}
//быстыре алгоритмы!!!!!!!!!!
//---Новый алгоритм упаковки локальника в ОКФ----//
//Таблица масок
const ushort HLMask[4][2]={
	0x3FC,0x3,
	0x3F0,0xF,
	0x3C0,0x3F,
	0x300,0xFF,
};
enum{
    HIGHT_MASK=0,
    LOW_MASK=1
};
//выделить страшую и младшую часть слова
#define Low(num,data) (data[num]&HLMask[num][LOW_MASK])
#define Hight(num,data) (data[num]&HLMask[num][HIGHT_MASK])

#define H0(data) (Hight(0,data)>>2)
#define H1(data) (Hight(1,data)>>4)
#define H2(data) (Hight(2,data)>>6)
#define H3(data) (Hight(3,data)>>8)

#define L0(data) (Low(0,data)<<6)
#define L1(data) (Low(1,data)<<4)
#define L2(data) (Low(2,data)<<2)
#define L3(data) (Low(3,data))
//преобразование 4 10 разрядных слов в 5 8 разрядных
#define Make4to5(word4,word5) \
    word5[0]=H0(word4); \
    word5[1]=H1(word4)|L0(word4); \
    word5[2]=H2(word4)|L1(word4); \
    word5[3]=H3(word4)|L2(word4); \
    word5[4]=L3(word4) 

//получить следующий индекс свертки ДЛЯ 4!!!! Каналов 
/*
таблица локальныника это матрица 256х4
все значение 0..255 -индекс i
значения полочек синуса для ОКФ	для 8 бит  - индекс j
вытягивая по 8 бит за 5 раз вытащим 4 10-битных слова

в бусе порядок бит инверсный!!!!
*/
//!!! За одну операцию получаем 8 бит локальника!!!!
#define GetNextLKFHash(lkf,hash_index)	\
	if(--lkf->cnt_5==0){\
		lkf->word4=lkf->read+lkf->rcount; \
		lkf->rcount+=4; \
		lkf->cnt_5=5; \
		Make4to5(lkf->word4,lkf->word5); \
	}\
	hash_index=lkf->word5[5-lkf->cnt_5];

//Возвращает 4 слова локальника по входному 8 разрядному индексу свертки
//Слова это полочки 4х позционного кода прохэшированные для упаковки в кадр	ОКФ
//получить строку в таблице хэширования в виде указетеля можно работать с ним как с массивом
//byte *ptr=GetLKF(val); ptr[0] ptr[1] ptr[2] ptr[3] 4 канала ОКФ готовы к записи в буффер кадра
#define GetLKF(index) LKF_HASH_TABLE[index]
//не используется бус пакуется по той же таблице, что и  	
#define GetBDC(index) BDC_HASH_TABLE[index]
#endif
