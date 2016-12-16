#ifndef __SOFTWARECOUNTER_H_
#define __SOFTWARECOUNETR_H_
#include "./../my_lib/type.h"
typedef void EVT_HANDLER();

class SoftwareCounter{
	private:
		uint count;				//��� �������
		const uint trggr_val;	//����� ������������
		const uint step;        //���
		EVT_HANDLER *EventHandler;		//���������� ������� �������
	public:
		//SoftwareCounter();
		SoftwareCounter(const uint& trigger,const uint& istep=1,EVT_HANDLER handler=0, const uint& start_val=0);
		~SoftwareCounter();
		void operator++ (int);
		void operator++ ();
		bool operator >(uint match_val) const;
		bool operator <(uint match_val) const;
		bool operator ==(uint match_val) const;
		bool operator >=(uint match_val) const;
		bool operator <=(uint match_val) const;
		bool operator !=(uint match_val) const;

		const uint& GetValue() const;
		void Set(uint val);
};

#endif
