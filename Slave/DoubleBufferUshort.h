#ifndef __DOUBLEBUFFERUSHORT_H_
#define __DOUBLEBUFFERUSHORT_H_

#include "./../my_lib/type.h"
/*
����� �������� ������� ������ ���������� � ������!!! ����� ������, �.�.
����� ������ �� 200 ���� ���������� ������ �� 400 ���� � ��������� � �����������
������ � 200

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
        //������ 
        uint Read(ushort* data,const uint& rsize);
        //�����
        uint Write(const ushort*const data ,const uint& wsize);
		//����� � ���������� ������
		void Write(const uint& num,const ushort& data);
        //�������������
        void Switch();
		//������ ��������?
        bool IsRead();
		//������ ��������?
        bool IsFull();

		void Reset(uint r=0,uint w=0);
		//rw=false - read ��������, rw=true �������� write 
		void Reset(uint cnt,bool rw=false);	//����� ��� �� ����������!!!! ������ ��� � ���� ������� ����� �� ����������
		
		void ResetRead(const uint& cnt);
		void ResetWrite(const uint& cnt);

		void Clear();
		//������ ���� ������
		const ushort* GetData(const uint& data_size);

		ushort* GetForReadBuf(const uint& get_size);
		ushort* GetForWriteBuf(const uint& get_size);
};
#endif
