#ifndef __RTC_TIME_H_
#define __RTC_TIME_H_
#include "peripheral.h"
/*
реализованно только упрвление значением времени часы минуты секунды дни и тп
получение и установка этих значений 
старт стоп и базовый функционал

преррывания маски будильника счетчики и прочее не реализоавнно!!!	
	
*/

enum RTCName{
	RTC_0=RTC_BASE_ADDR
};

struct RTCOption{
	byte clksrc;
	byte alarm_mask;
	byte ciir;
};
struct RTCTime{
    byte sec;     /* Second value - [0,59] */
    byte min;     /* Minute value - [0,59] */
    byte hour;    /* Hour value - [0,23] */
    byte day;    /* Day of the month value - [1,31] */
    byte mon;     /* Month value - [1,12] */
    ushort year;    /* Year value - [0,4095] */
    byte w_day;    /* Day of week value - [0,6] */
    byte y_day;    /* Day of year value - [1,365] */
} ;

class RTC:public Peripheral{
	private:
		//Регистры
		enum{
			ILR= 0,
			CTC=1,
			CCR=2,
			CIIR=3,
			AMR=4,
			CTIME0=5,
			CTIME1=6,
			CTIME2=7,
			SEC=8,
			MIN=9,
			HOUR=10,
			DOM=11,
			DOW=12,
			DOY=13,
			MONTH=14,
			YEAR=15,
			CISS=16,

			ALSEC=24,
			ALMIN=25,
			ALHOU=26,
			ALDOM=27,
			ALDOW=28,
			ALDOY=29,
			ALMON=30,
			ALYEAR=31,
			PREINT=32,
			PREFRAC=33		
		};
		//static ulong* MR_addr[];
		//static ulong* CR_addr[];
		static RTC* DEV[1];
		public:
		//прерывания
		enum{
			IMSEC=1,IMMIN=2,IMHOUR=4,IMDOM=8,IMDOW=16,IMDOY=32,IMMON=64,IMYEAR=128
		};
	  
	  	/*БАЗА*/
		RTC(RTCName name);
		~RTC();
		void Init(const RTCOption* const opt);
				
		/*Интерфейс устройства*/
		void Start();	  //Запустить часики	
		void Stop();	  //Остановиьь часики
		void Set(const RTCTime* const time);  		//установить
		// а может void GetTime(cosnt RTCTime* time);
		const RTCTime	GetTime();
		void Clear();	  //сброс
		
		/*Базовый функционал устройства*/
		void ClearInt();  //Сброс флагов прерывания
		const uint GetIntStatus() const; //Статус прерывания
		
		/*Реестр*/
		static void Register(const uint& num,RTC* obj);
		static RTC* Get(const uint& num);
};

#define RTC_SIZE 1
#define PREPARE_RTC RTC RTC1_dev(RTC_0); RTC::Register(0,&RTC1_dev); 
#endif
