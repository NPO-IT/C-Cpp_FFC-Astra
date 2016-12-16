#ifndef __DOUBLEBUFFERUSHORT_H_
#define __DOUBLEBUFFERUSHORT_H_

#include "./../my_lib/type.h"
/*
Класс двойного буффера память выделяется с наружи!!! одним блоком, т.е.
нужен буффер на 200 слов объявляешь массив на 400 слов и передаешь в конструктор
массив и 200

const uint BUF_SIZE=200;
ushort buffer[BUF_SIZE*2];
DoubleBufferUshort buf(buffer,BUF_SIZE); 
*/
class DoubleBufferUshort{
    private:
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;

		ushort* GetBuffer(const uint& get_size,ushort *buffer,uint &count);
    public:

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        //читеам 
        uint Read(ushort* data,const uint& rsize);
        //пишем
        uint Write(const ushort*const data ,const uint& wsize);
		//пишем в конкретный адресс
		void Write(const uint& num,const ushort& data);
        //переключаемся
        void Switch();
		//Буффер прочитан?
        bool IsRead();
		//Буффер наполнен?
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		//rw=false - read изменяем, rw=true изменяем write 
		void Reset(uint cnt,bool rw=false);	//булев тип не прозрачный!!!! неясно что и куда ясность нужна из интерфейса
		
		void ResetRead(const uint& cnt);
		void ResetWrite(const uint& cnt);

		void Clear();
		//выдать блок данных
		const ushort* GetData(const uint& data_size);

		ushort* GetForReadBuf(const uint& get_size);
		ushort* GetForWriteBuf(const uint& get_size);
};
#endif
