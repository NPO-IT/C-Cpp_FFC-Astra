#ifndef __MAIN_DEF_H_
#define __MAIN_DEF_H__

#define LOOP while(1)
#define PACK_SIZE 80
#define FRAME_SIZE 80

#define $DBG(do) P2[do]|=1<<8

//byte *FRAME[8];
#define DMA_SRC  0x7FD00000
#define	DMA_DST	 0xE0068008
//Служебные номера каналов I и II поток
#define CHAN_39_I 38
#define CHAN_40_I 39
#define CHAN_30_I 29
#define CHAN_19_I 18
#define CHAN_39_II 78
#define CHAN_40_II 79
#define CHAN_30_II 69
#define CHAN_19_II 58


#define HALF_SCALE 31 //((MAX_SCALE-MIN_SCALE)>>1)
#define FULL_SCALE 63 //SIN[3]
//Пока это вляет на SSP но нужно увязать это и с програмами опроса шин
#define POLLING_SIZE 160
//--Калибровки---
uint MAX_SCALE=450;
uint MIN_SCALE1=575;
uint MIN_SCALE2=575;
byte SIN[8]={7,23,39,56,56,39,23,7};
//---------------Температура ------------------
//76 значение
#define TEMP_VAL(event_time,lkf,val) event_time:{\
		val=~val;\
		LC_WriteContact(lkf,0,(val));  \
		LC_WriteContact(lkf,1,(val>>1));\
		LC_WriteContact(lkf,2,(val>>2));\
		LC_WriteContact(lkf,3,(val>>3));\
		LC_WriteContact(lkf,4,(val>>4));\
		LC_WriteContact(lkf,5,(val>>5));\
		LC_WriteContact(lkf,6,(val>>6));\
		LC_WriteContact(lkf,7,(val>>7));\
		LC_WriteContact(lkf,8,(val>>8));\
		LC_WriteContact(lkf,9,(val>>9));\
		LC_WriteContact(lkf,10,(val>>10));\
		LC_WriteContact(lkf,11,(val>>11));\
		break;\
	}	
//адрес
//78
#define TEMP_ADDR(event_time,lkf,val) event_time : { \
		val=~val;\
		LC_WriteContact(lkf,12,(val));  \
		LC_WriteContact(lkf,13,(val>>1));\
		LC_WriteContact(lkf,14,(val>>2));\
		LC_WriteContact(lkf,15,(val>>3));\
		LC_WriteContact(lkf,16,(val>>4));\
		LC_WriteContact(lkf,17,(((val&0x1F)==31)?0:1)); \
		break;\
	}

//-------------данные с ячейки питания от ведущего --------------
//Данные по аналоговым каналам
#define COP_DATA_ANALOG(event_time,lkf,chan,val) event_time:{\
	LC_WriteAnalog(lkf,chan,(val)+MIN_SCALE1);\
	break;\
}
//Признаки по 3 каналам
#define COP_DATA_STATE(event_time,lkf,chan1,chan2,chan3,val) event_time:{\
	LC_WriteAnalog(lkf,chan1,((val&1)?MIN_SCALE1:MAX_SCALE));\
	LC_WriteAnalog(lkf,chan2,((val&2)?MIN_SCALE1:MAX_SCALE));\
	LC_WriteAnalog(lkf,chan3,((val&4)?MIN_SCALE1:MAX_SCALE));\
	break;\
}
//------------счетчики времени----------------------	
//время
#define TIME(event_time,lkf,time_opt,data) event_time:{\
	LC_WriteAnalog(lkf,lkf0_opt.count_chan,data.lkf_frames++); \
	if(data.lkf_frames==100){								   \
		data.lkf_frames=0;									  \
	}	 \
	data.okf_frames+=80;								  \
	if (data.okf_frames>=8000){						   \
		data.okf_frames=0;									\
		if(++data.TIME_SEC==0x40000) data.TIME_SEC=0;		\
/*		if (data.TIME_SEC == 10) /* выкл1 К1*/\
/*		{*/\
/*			ssp_empty2[0] = 191;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 20)*/ /* вкл1 К2*/\
/*		{*/\
/*			ssp_empty2[0] = 194;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 25)*/ /* выкл1 К2*/\
/*		{*/\
/*			ssp_empty2[0] = 195;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 33)*/ /* вкл2 К1*/\
/*		{*/\
/*			ssp_empty2[0] = 192;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 34)*/ /* выкл2 К1*/\
/*		{*/\
/*			ssp_empty2[0] = 193;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 55)*/ /* вкл2 К2*/\
/*		{*/\
/*			ssp_empty2[0] = 196;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 56)*/ /* выкл2 К2*/\
/*		{*/\
/*			ssp_empty2[0] = 197;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 500)*/ /* вкл1 К3*/\
/*		{*/\
/*			ssp_empty2[0] = 198;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 501)*/ /* выкл1 К3*/\
/*		{*/\
/*			ssp_empty2[0] = 199;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 700)*/ /* вкл2 К3*/\
/*		{*/\
/*			ssp_empty2[0] = 200;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 701)*/ /* выкл2 К3*/\
/*		{*/\
/*			ssp_empty2[0] = 201;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 765)*/ /* вкл1 К4*/\
/*		{*/\
/*			ssp_empty2[0] = 202;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 777)*/ /* выкл1 К4*/\
/*		{*/\
/*			ssp_empty2[0] = 203;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 800)*/ /* вкл2 К4*/\
/*		{*/\
/*			ssp_empty2[0] = 204;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
/*		if (data.TIME_SEC == 900)*/ /* выкл2 К4*/\
/*		{*/\
/*			ssp_empty2[0] = 205;*/\
/*			ssp1->Send(ssp_empty2,5);*/\
/*		}*/\
		(*data.time_contact)++;\
	}\
	LC_WriteAnalog(lkf,time_opt.time0_chan,data.TIME_SEC);\
	LC_WriteAnalog(lkf,time_opt.time1_chan,(data.TIME_SEC>>9));\
	LC_WriteContact(lkf,time_opt.contact_time,data.time_contact->GetBit());\
	break;			\
}

//---------БУС аналоговый---------------
//добавить таблицу опроса аналоговой части БУСа?!?!?!?!
//Аналоговые каналы
#define BDC_ANALOG(event_time,lkf,chan,data) event_time: {\
	data>>=1;\
	LC_WriteAnalog(lkf,chan,data); \
	break;\
}

//Контактные каналы
#define BDC_CONTACT(event_time,lkf,chan,data) event_time: {\
	LC_WriteContact(lkf,chan,data);\
	break;\
}
	//Маски ШОУ =)
	#define IE1(val)	(val>>3)
	#define IE2(val)	(val>>4)
	#define IE3(val)	(val>>5)
	#define IE4(val) 	(val>>6)
	#define IE5(val)	(val>>7)
	#define IE6(val)	(val>>8)
	#define IE7(val)	(val>>9)
	#define IE8(val)	(val>>10)
	#define RefreshPB(val) 	(val>>1)
	#define SwitchUPPB(val) (val>>2)
	#define NK9(val)		(val)

//Просто каналы
#define BDC(event_time,lkf,chan,data) event_time:{\
	DB_Write(lkf,chan,val);\
	break; \
}

//счетчики температурных запросов
//event_time(63) data(61); event_time(143) data(61)
//тут какая то бага!!!
#define TEMP_COUNT_NEXT(event_time,data) event_time:{\
	data.analog+=2; \
	data.analog&=0x1F;	\
	data.contact=TempModeTable[data.analog+32];\
	data.crc8=CalcCRC8((byte*)&data,3);\
	ssp_empty[2]=TempModeTable[data.analog];\
	ssp_empty[1]=data.analog;\
	break;\
}


#define DELAY485 50

#define Clk_CPU 76800


//#define __SYNC_OFF__
#endif
