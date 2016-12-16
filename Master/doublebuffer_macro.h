#ifndef __DOUBLE_BUFFER_MACRO_H_
#define __DOUBLE_BUFFER_MACRO_H_

 /*
 ���������� �������� ������� ����� ������� 
 � ������ ���������� ���������!!!!
 */
//�������� � ������ dbuf, �� ������� num �������� elem
#define DB_WriteElem(dbuf,num,elem){\
	dbuf->write[num]=elem;\
}
//������ �������� � ���������� elem �� ������
//������� ���� �� ������� #define DB_ReadElem(dbuf,num) (dbuf->read[num])
/*
��� ������ ������!!! ����� dbuf->read[num];
*/
#define DB_ReadElem(dbuf,num,elem){\
	elem=dbuf->read[num];\
}

//����������� � ������ �� buf, buf_size ����
#define DB_WriteBuf(dbuf,buf,buf_size)\
	for(uint i=0;i<buf_size;i++){\
		dbuf->write[dbuf->wcount++]=buf[i];\
	}
//������� �� ������� � buf, buf_size ����
#define DB_ReadBuf(dbuf,buf,buf_size)\
	for(uint i=0;i<buf_size;i++){\
		buf[i]=dbuf->read[dbuf->rcount++];\
	}
//��������� �� �������� ����������� ������� ������  �������� �������
#define DB_CurrentRead(dbuf) dbuf->read[dbuf->rcount]
//�������� �� �������� ����������� ������� ������ ��������
#define DB_CurrentWrite(dbuf) dbuf->write[dbuf->wcount]

//�������� �������� �� ����� ������
#define DB_IsRead(lkf) (lkf->rcount>=lkf->size)

//������������ ������ ������ � ������ 
#define DB_Switch(lkf) {\
	ushort* tmp;\
    tmp=lkf->read;\
    lkf->read=lkf->write;\
    lkf->write=tmp;\
    lkf->rcount=lkf->wcount=0;\
}

#endif