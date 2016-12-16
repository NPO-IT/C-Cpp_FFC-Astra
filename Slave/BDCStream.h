#ifndef __BDCSTREAM_H__
#define __BDCSTREAM_H__

#include "../my_lib/type.h"
/*
� ������ ����������� �������� �������������� ������ �� ������ ���  � 4/3 ���������
��� �� ������������ ��� �������� ������ ��� 15 � 16 ������ ���� ���38/34
� 16 ������ ������������ �������� ������������ 4 ���������� ������
��� �������� � 5-�� ������� ���-���� ��� ������ ����� ������� � ������� 
*/
class BDCStreamBase{
    protected:
        enum{
            WORD_SIZE=20,  //����������� ���� � ����������
            LAST_SHIFT=-4, 
        };
        uint service_addr[WORD_SIZE];
        //������
        //const 
		uint *words[4];
        //��������������� ��������
        uint cur_word;
		int shift;
        virtual void CalcServiceAddr(uint * const data){};
        ushort Get4Bit(const uint& num);
    public:
        BDCStreamBase();
        ~BDCStreamBase();
        //240 ���� 20x3 18��������� ����(uint)
        void SetData(uint *data_ptr);
        void ClearCount();
        ushort GetHash();
};
//-15 ������ ��� ��� ���������� ���������--//
class BDCStream15:public BDCStreamBase{
    protected:
        void CalcServiceAddr(uint * const data){};
    public:
         BDCStream15();
        ~BDCStream15();
};

class BDCStream16:public BDCStreamBase{
    private:
        //��l ������� ��� ������� ���������� ���������
        static const ushort HASH6BIT_SERVICE[64];
        //�������� ��������� 4���� ���������� ��� ������
        void CalcServiceAddr(uint * const data);//������ ���������� ���������
    public:
        BDCStream16();
        ~BDCStream16();
};

//-----��������� ����� ��� ���!
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
