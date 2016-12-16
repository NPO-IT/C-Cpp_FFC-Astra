#ifndef __DOUBLE_BUFFER_MACRO_H_
#define __DOUBLE_BUFFER_MACRO_H_

 /*
 –еализаци€ двойного буффера через макросы 
 в ћј –ќ— ѕ≈–≈ƒј≈“—я ” ј«ј“≈Ћ№!!!!
 */
//записать в буффер dbuf, по индексу num значение elem
#define DB_WriteElem(dbuf,num,elem){\
	dbuf->write[num]=elem;\
}
//выдать значение в переменную elem по номеру
//удобнее было бы сделать #define DB_ReadElem(dbuf,num) (dbuf->read[num])
/*
тут похоже ошибка!!! нужно dbuf->read[num];
*/
#define DB_ReadElem(dbuf,num,elem){\
	elem=dbuf->read[num];\
}

//скопировать в буффер из buf, buf_size слов
#define DB_WriteBuf(dbuf,buf,buf_size)\
	for(uint i=0;i<buf_size;i++){\
		dbuf->write[dbuf->wcount++]=buf[i];\
	}
//считать из буффера в buf, buf_size слов
#define DB_ReadBuf(dbuf,buf,buf_size)\
	for(uint i=0;i<buf_size;i++){\
		buf[i]=dbuf->read[dbuf->rcount++];\
	}
//прочитать по текушему внутреннему индексу чтени€  значение буффера
#define DB_CurrentRead(dbuf) dbuf->read[dbuf->rcount]
//записать по текущему внутреннему индексу записи значение
#define DB_CurrentWrite(dbuf) dbuf->write[dbuf->wcount]

//проверка прочитан ли буфер чтени€
#define DB_IsRead(lkf) (lkf->rcount>=lkf->size)

//переключание буфера чтени€ и записи 
#define DB_Switch(lkf) {\
	ushort* tmp;\
    tmp=lkf->read;\
    lkf->read=lkf->write;\
    lkf->write=tmp;\
    lkf->rcount=lkf->wcount=0;\
}

#endif