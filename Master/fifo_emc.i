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
#line 1 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


















 




 
#line 36 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 69 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 104 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 138 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"




 
#line 155 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 166 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 177 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 

















 
#line 203 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

























 























































































































































































 


 




 





 



 






	
 





 


 


 



 


 










 





 
#line 489 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 498 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 507 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 515 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 523 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 531 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"



	
 
#line 554 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 574 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 594 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 614 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 639 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 662 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 680 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 698 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 715 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 732 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 742 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 752 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 762 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 770 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 783 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 796 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 827 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 843 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 




 
#line 857 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 868 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"






#line 887 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"
  	
#line 900 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 914 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"
  	
#line 927 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 950 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 964 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


 
#line 982 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 






 







 





 






 






 




 



 






 
#line 1053 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 1079 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

 
#line 1087 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"

#line 1095 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"






 
#line 1117 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"





#line 1134 "C:\\Program Files\\KEIL\\ARM\\Inc\\Philips\\lpc23xx.h"


























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
