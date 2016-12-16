#ifndef __DOUBLEBUFFERUSHORT_H_
#define __DOUBLEBUFFERUSHORT_H_

#include "./../my_lib/type.h"
#include "doublebuffer_macro.h"

/*
����� �������� ������� ������ ���������� � ������!!! ����� ������, �.�.
����� ������ �� 200 ���� ���������� ������ �� 400 ���� � ��������� � �����������
������ � 200

const uint BUF_SIZE=200;
ushort buffer[BUF_SIZE*2];
DoubleBufferUshort buf(buffer,BUF_SIZE);

��� �����������!!! ��� ��� ����� ������ ��������� � � ������ ������ �������� ������ ����� 
��� �� ��������� �����, ������� ��������� �� ������ ������� 
��� �������� ������������� ���� ������� #include "doublebuffer_macro.h"
*/

class DoubleBufferUshort{
//���� ����� ��� �� �� ����� �����
    public:
		ushort& GetWriteWord(const uint& num);
        const uint size;
        ushort *write,*read;
        uint rcount,wcount;
    

        DoubleBufferUshort( ushort* const data_ptr,const uint& dsize);
        ~DoubleBufferUshort();
        //������ 
        uint Read(ushort* const data,const uint rsize);
		
		void Read(const uint& num,ushort& data);
        //�����
        void Write(const ushort* data,const uint& wsize);
		//����� � ���������� �����
		void Write(const uint& num,const ushort& data);
        //�������������
        void Switch();
		//������ ��������?
        bool IsRead();
		//������ ��������?
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		void Clear();
};
#endif
