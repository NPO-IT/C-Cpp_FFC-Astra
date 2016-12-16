#ifndef __DOUBLEBUFFERUSHORT_H_
#define __DOUBLEBUFFERUSHORT_H_

#include "./../my_lib/type.h"
#include "doublebuffer_macro.h"

/*
 ласс двойного буффера пам€ть выдел€етс€ с наружи!!! одним блоком, т.е.
нужен буффер на 200 слов объ€вл€ешь массив на 400 слов и передаешь в конструктор
массив и 200

const uint BUF_SIZE=200;
ushort buffer[BUF_SIZE*2];
DoubleBufferUshort buf(buffer,BUF_SIZE);

Ё“ќ ћќƒ»‘» ј÷»я!!! тут все члены класса публичные и к членам класса возможен доступ извне 
что бы сократить врем€, которое тратитьс€ на вызвов функций 
дл€ удобства использовани€ есть макросы #include "doublebuffer_macro.h"
*/

class DoubleBufferUshort{
//‘»Ќ“ ”Ўјћ» как бы не вышел боком
    public:
		ushort& GetWriteWord(const uint& num);
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;
    

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        //читеам 
        uint Read(ushort* const data,const uint rsize);
		
		void Read(const uint& num,ushort& data);
        //пишем
        void Write(const ushort* data,const uint& wsize);
		//пишем в конкретный канал
		void Write(const uint& num,const ushort& data);
        //переключаемс€
        void Switch();
		//Ѕуффер прочитан?
        bool IsRead();
		//Ѕуффер наполнен?
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		void Clear();
};
#endif
