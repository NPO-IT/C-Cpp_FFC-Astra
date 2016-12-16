#ifndef _SECOND_STEP_H_
#define _SECOND_STEP_H_

#include "DoubleBufferUshort.h"
#include "./../my_lib/type.h"
#include "secondstep_macro.h"

/*
������ ����������� ��� 2-� � 4-� ������������ ����,
� ��� �� ��� ���'�
��� ������ � ���� ������ ���� ��������� 
������� ��� ��������� ��������������

----------�������� ���������� ���������--------
������ �� 64 ����� ushort ������������ ������ 10 ��� 
0..8 �������� ����������� ������
9 - �������� �����������

4-� ����������� ���
��� �� ������ �������� ��������� �� 2 ���� �� �������� �����
����� �������� ����� ��������� ������ ��������� ����� �� �������
2 ���� ������������� � ������� ������

*/

class SecondStepBase:public DoubleBufferUshort{
    public:
        ushort cur_word;
        uint mask;
    	uint shift;
		uint   cnt_5;	//������� ������� ��������
		ushort *word4; 	//��������� �� ��������� 4 ����� ����������
		byte word5[5];	//��������������� ����� ������� ������� ���
		//byte CODE[4];

        SecondStepBase(ushort*const data_ptr,const uint& size);
        //������ ��������� ��� ������ ��������������
		virtual byte GetNext()=0;
		
		void WriteAnalog(const uint& num,const ushort&  val); //������ ����������
		void WriteContact(const uint& num,const ushort& val); //������ ����������
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
