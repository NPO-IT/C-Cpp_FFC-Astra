#line 1 "..\\my_lib\\fastport.cpp"
#line 1 "..\\my_lib\\fastport.h"



#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 5 "..\\my_lib\\fastport.h"
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
