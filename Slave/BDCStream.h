#ifndef __BDCSTREAM_H__
#define __BDCSTREAM_H__

#include "../my_lib/type.h"
/*
в классе реализованн алгоритм преобразования данных от потока БУС  в 4/3 подадреса
так же реализованны два дочерних класса для 15 и 16 битных слов БУС38/34
в 16 битном реализоавнна операция формирования 4 служебного потока
для упаковки в 5-ти байтный суб-кадр для обмена между ведомым и ведущим 
*/
class BDCStreamBase{
    protected:
        enum{
            WORD_SIZE=20,  //колличество слов в поддадресе
            LAST_SHIFT=-4, 
        };
        uint service_addr[WORD_SIZE];
        //данные
        //const 
		uint *words[4];
        //вспомогательные счетчики
        uint cur_word;
		int shift;
        virtual void CalcServiceAddr(uint * const data){};
        ushort Get4Bit(const uint& num);
    public:
        BDCStreamBase();
        ~BDCStreamBase();
        //240 байт 20x3 18разрядных слов(uint)
        void SetData(uint *data_ptr);
        void ClearCount();
        ushort GetHash();
};
//-15 Битный БУС без служебного подадреса--//
class BDCStream15:public BDCStreamBase{
    protected:
        void CalcServiceAddr(uint * const data){};
    public:
         BDCStream15();
        ~BDCStream15();
};

class BDCStream16:public BDCStreamBase{
    private:
        //хэl таблица для расчета служебного подадреса
        static const ushort HASH6BIT_SERVICE[64];
        //получить следующие 4бита сервисного под адреса
        void CalcServiceAddr(uint * const data);//Расчет служебного подадреса
    public:
        BDCStream16();
        ~BDCStream16();
};

//-----запросный пакет для БУС!
struct BDCPack{
	byte agent_id;
	byte code_func;
	byte pack_num;
	byte prog_num;
	byte res1;
	byte res2;
	ushort crc16;
};
#endif
