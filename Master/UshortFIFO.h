#ifndef _USHORT_FIFO_H_
#define _USHORT_FIFO_H_

#include "type.h"
class UshortFIFO{
    private:
        ushort* data;
        const uint size;
        uint write,read;
    public:
        UshortFIFO(ushort* data_ptr,uint stack_size);
        ~UshortFIFO();
        uint PushData(const ushort* push_data,const uint& dsize);
        uint PopData(ushort* pop_data,const uint& dsize);
        bool IsFull() const;
        bool AllRead() const;
        void Reset(uint r=0,uint w=0);
		//вызывает сомнение нахождение данногометода в этом классе
		//не логично!!!
		ushort& operator [](const uint num);
};
#endif
