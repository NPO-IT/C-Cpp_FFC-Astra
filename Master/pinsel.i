#line 1 "..\\my_lib\\pinsel.cpp"
#line 1 "..\\my_lib\\pinsel.h"
#line 1 "..\\my_lib\\peripheral.h"
#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "..\\my_lib\\peripheral.h"
#line 1 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


















 




 
#line 36 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 69 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 104 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 138 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"




 
#line 155 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 166 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 177 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 

















 
#line 203 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 498 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 507 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 515 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 523 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 531 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"



	
 
#line 554 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 574 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 594 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 614 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 639 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 662 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 680 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 698 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 715 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 732 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 742 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 752 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 762 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 770 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 783 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 796 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 827 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 843 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 




 
#line 857 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 868 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"






#line 887 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 900 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 914 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"
  	
#line 927 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 950 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 964 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


 
#line 982 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1079 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

 
#line 1087 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"

#line 1095 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"






 
#line 1117 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"





#line 1134 "C:\\Keil\\ARM\\Inc\\Philips\\LPC23xx.h"


























#line 5 "..\\my_lib\\peripheral.h"






 
class Peripheral{
	protected:
		ulong *base_addr;
	public:
		
		Peripheral(ulong *addr):base_addr(addr){};
		
 
		 ~Peripheral(){};
		
		
		
};

#line 4 "..\\my_lib\\pinsel.h"
enum FunCode{
	func_00=0,func_01=1,func_10=2,func_11=3
};
class PINSEL{
	private:
		static ulong* base_addr;
		PINSEL(){};
		~PINSEL(){};
	public:
		
		static void Set(uint port,uint pin,FunCode code);
		static void Set(uint num,uint val);
		static uint Get(uint port,uint pin);
		static uint Get(uint num); 
	   



 	
};















#line 2 "..\\my_lib\\pinsel.cpp"



void PINSEL::Set(uint port,uint pin,FunCode code){
	uint offset=port<<1;
	uint shift=pin<<1;
	if(pin>15){
		offset++;
		shift-=32;
	}
	base_addr[offset]&=~(3<<shift);
	base_addr[offset]|=code<<shift;
}
		
void PINSEL::Set(uint num,uint val){
	base_addr[num]=val;
}
uint PINSEL::Get(uint port,uint pin){
	uint offset=port<<1;
	uint shift=pin<<1;
	if(pin>15){
		offset++;
		pin-=32;
	}
	return base_addr[offset]&(3<<shift);
}
uint PINSEL::Get(uint num){
	return base_addr[num];
} 

ulong* PINSEL::base_addr=(ulong*)0xE002C000;
