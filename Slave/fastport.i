#line 1 "..\\my_lib\\fastport.cpp"
#line 1 "..\\my_lib\\fastport.h"



#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 5 "..\\my_lib\\fastport.h"
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


























#line 6 "..\\my_lib\\fastport.h"
enum GPIO_REG{
	DIR=0,MASK=4,PIN=5,SET=6,CLR=7	
};
enum FastPortName{
	PORT_0,PORT_1,PORT_2,PORT_3,PORT_4
};

typedef ulong* FastPort;

FastPort GetFastPort(const FastPortName& num);	
#line 2 "..\\my_lib\\fastport.cpp"

FastPort FAST_PORTS[5]={
	(ulong*)0x3FFFC000,
	(ulong*)0x3FFFC020,
	(ulong*)0x3FFFC040,
	(ulong*)0x3FFFC060,
	(ulong*)0x3FFFC080
};

FastPort GetFastPort(const FastPortName& num){
	return FAST_PORTS[num];
}
