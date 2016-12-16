#line 1 "..\\my_lib\\port.cpp"
#line 1 "..\\my_lib\\port.h"



#line 1 "..\\my_lib\\peripheral.h"
#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "..\\my_lib\\peripheral.h"
#line 1 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


















 




 
#line 36 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 69 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 104 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 138 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"




 
#line 155 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 166 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 177 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 

















 
#line 203 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 498 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 507 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 515 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 523 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 531 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"



	
 
#line 554 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 574 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 594 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 614 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 639 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 662 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 680 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 698 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 715 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 732 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 742 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 752 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 762 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 770 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 783 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 796 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 827 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 843 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 




 
#line 857 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 868 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"






#line 887 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 900 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 914 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 927 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 950 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 964 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 982 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1079 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1087 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 1095 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"






 
#line 1117 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"





#line 1134 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\LPC23xx.h"


























#line 5 "..\\my_lib\\peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 5 "..\\my_lib\\port.h"


enum PortName{
	PORT_0=0x3FFFC000,
	PORT_1=0x3FFFC020,
	PORT_2=0x3FFFC040,
	PORT_3=0x3FFFC060,
	PORT_4=0x3FFFC080
};

typedef struct PortOption{
	uint mode;
	uint mask;	
};

class Port:Peripheral{
	private:
	enum{DIR=0,MASK=4,PIN=5,SET=6,CLR=7};
	uint mask;
	
	public:
		virtual Port* operator=(uint);
		Port(PortName name,uint _mask=0,uint mode=OUTPUT);
		~Port();
		virtual void Init(PortOption* opt);
		void SetValue(uint val);
		uint GetValue() const;
		
		enum{
			INPUT=0,OUTPUT=1
		};
};
#line 2 "..\\my_lib\\port.cpp"


Port::Port(PortName name,uint _mask,uint mode):Peripheral((ulong*)name),mask(_mask){
	(*(volatile unsigned long *)(0xE01FC000 + 0x1A0))|=1;		
	
	if(mode==OUTPUT){
		base_addr[DIR]=~mask&0xFFFFFFFF;	
	}
	base_addr[MASK]=mask;
	
}
Port::~Port(){}
void Port::Init(PortOption* opt){
	if(opt->mode==OUTPUT){
		base_addr[DIR]=~(opt->mask)&0xFFFFFFFF;	
	}
	base_addr[MASK]=opt->mask;
	mask=opt->mask;	
}
Port* Port::operator=(uint val){
	base_addr[MASK]=mask;
	base_addr[PIN]=val;
	return this;
}

void Port::SetValue(uint val){
	base_addr[MASK]=mask;
	base_addr[PIN]=val;
}
uint Port::GetValue() const{
	base_addr[MASK]=mask;
	return base_addr[PIN];
}
