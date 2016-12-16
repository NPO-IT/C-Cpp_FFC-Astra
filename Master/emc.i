#line 1 "emc.cpp"
#line 1 "emc.h"
#line 1 "..\\..\\..\\..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "emc.h"
#line 1 "..\\..\\..\\..\\my_lib\\fastport.h"



#line 5 "..\\..\\..\\..\\my_lib\\fastport.h"
#line 1 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


















 




 
#line 36 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 69 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 104 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 138 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"




 
#line 155 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 166 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 177 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 

















 
#line 203 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 498 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 507 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 515 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 523 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 531 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"



	
 
#line 554 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 574 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 594 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 614 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 639 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 662 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 680 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 698 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 715 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 732 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 742 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 752 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 762 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 770 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 783 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 796 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 827 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 843 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 




 
#line 857 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 868 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"






#line 887 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"
  	
#line 900 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 914 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"
  	
#line 927 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 950 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 964 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


 
#line 982 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 1079 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

 
#line 1087 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"

#line 1095 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"






 
#line 1117 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"





#line 1134 "C:\\Keil\\ARM\\INC\\Philips\\LPC23xx.h"


























#line 6 "..\\..\\..\\..\\my_lib\\fastport.h"
enum GPIO_REG{
	DIR=0,MASK=4,PIN=5,SET=6,CLR=7	
};
enum FastPortName{
	PORT_0,PORT_1,PORT_2,PORT_3,PORT_4
};

typedef ulong* FastPort;

FastPort GetFastPort(const FastPortName& num);	
#line 5 "emc.h"





ushort ExtMemUshort[0x10000>>1] __attribute__((at(0x81000000)));


uint BANK_HASH[8]={
	0x0,
	0x10000000,
	0x20000000,
	0x30000000,
	0x40000000,
	0x50000000,
	0x60000000,
	0x70000000
};
FastPort BANK_PORT;



void  InitEMC(){
	
	(*(volatile unsigned long *)(0xE01FC000 + 0x0C4))   |= 0x00000800;		  
	
  	(*(volatile unsigned long *)(0xE002C000 + 0x10))  = 0x50000000;
  	(*(volatile unsigned long *)(0xE002C000 + 0x14))  = 0x05050555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x18))  = 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x20))  = 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x24))  = 0x40050000; 

	
	(*(volatile unsigned long *)(0xFFE08000 + 0x220)) = 0x80;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x224)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x228)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x22C)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x230)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x234)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x238)) = 0x0f;

	BANK_PORT[DIR]=BANK_HASH[7];
	BANK_PORT[CLR]=BANK_HASH[7];

}
#line 2 "emc.cpp"
#line 3 "emc.cpp"

void InitEMC(){
	
	(*(volatile unsigned long *)(0xE01FC000 + 0x0C4))   |= 0x00000800;		  
	
  	(*(volatile unsigned long *)(0xE002C000 + 0x10))  = 0x50000000;
  	(*(volatile unsigned long *)(0xE002C000 + 0x14))  = 0x05050555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x18))  = 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x20))  = 0x55555555;
  	(*(volatile unsigned long *)(0xE002C000 + 0x24))  = 0x40050000; 

	
	(*(volatile unsigned long *)(0xFFE08000 + 0x220)) = 0x80;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x224)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x228)) = 0x2;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x22C)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x230)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x234)) = 0x1f;
 	(*(volatile unsigned long *)(0xFFE08000 + 0x238)) = 0x0f;

	BANK_PORT[DIR]=BANK_HASH[7];
	BANK_PORT[CLR]=BANK_HASH[7];
}

