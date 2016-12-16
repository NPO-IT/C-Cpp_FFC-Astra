#ifndef __POLLING_TABLE_H_
#define __POLLING_TABLE_H_

#include "./../my_lib/type.h"

template <uint SIZE,typename TABLE_TYPE>
class	PollingTable{
	protected:
		const uint size;
		uint count;
		const TABLE_TYPE* const table;
	public:
		PollingTable(const uint s,const TABLE_TYPE* const tab);
		Next();
		Reset(uint c=0);
		const TABLE_TYPE* GetCurrent()=0 const ;
		const uint GetCount() const;
}; 

template <uint SIZE,typename TABLE_TYPE>
PollingTable<SIZE,TABLE_TYPE>PollingTable::PollingTable(const uint s):size(s),table(tab){}
//заменить оператором ++/--
PollingTableBase::Next(){
	if(++count==size) count=0;
}

PollingTableBase::Reset(uint c=0){
	count=c;
}
const uint PollingTableBase::GetCount() const{
	return count;
}

#endif
