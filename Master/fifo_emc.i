#line 1 "fifo_emc.cpp"

#line 1 "fifo_emc.h"
#line 1 "../my_lib/type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "fifo_emc.h"



 





	
	
	
	uint ReadWriteFifo(const uint& input);
#line 3 "fifo_emc.cpp"
#line 1 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


















 




 
#line 36 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 69 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 104 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 138 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"




 
#line 155 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 166 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 177 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 

















 
#line 203 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 498 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 507 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 515 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 523 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 531 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"



	
 
#line 554 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 574 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 594 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 614 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 639 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 662 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 680 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 698 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 715 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 732 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 742 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 752 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 762 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 770 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 783 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 796 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 827 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 843 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 




 
#line 857 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 868 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"






#line 887 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"
  	
#line 900 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 914 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"
  	
#line 927 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 950 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 964 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 982 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 1079 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 1087 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 1095 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"






 
#line 1117 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"





#line 1134 "C:\\Keil\\ARM\\Inc\\Philips\\lpc23xx.h"


























#line 4 "fifo_emc.cpp"

uint FIFO[0x4000] __attribute__((at(0x81000000)));
uint CNT=0;





 







 
   












 

uint ReadWriteFifo(const uint& input){
	uint result;
	if(++CNT==(128000)) CNT=0;
	(*(volatile unsigned long *)(0x3FFFC000 + 0x94))=(CNT&0x1C000)<<14;
	result=FIFO[CNT&0x3FFF];
	FIFO[CNT&0x3FFF]=input;	 
	return result;
}
