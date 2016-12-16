#line 1 "..\\my_lib\\vic.cpp"
#line 1 "..\\my_lib\\vic.h"
#line 1 "..\\my_lib\\type.h"















typedef unsigned char  byte;
typedef unsigned short ushort;
typedef unsigned long  ulong;
typedef unsigned int   uint;

#line 4 "..\\my_lib\\vic.h"
	
	class VIC{
		private:
			static ulong *base_addr;	
			static ulong *vect_addr;	
			static ulong *priority;	 	
			static const uint VIC_SIZE;
			enum{
			 	IRQStatus=0,
				FIQStatus=1,
				RawIntr=2,
				IntSelect=3,
				IntEnable=4,
				IntEnClr=5,
				SoftInt=6,
				SoftIntClr=7,
				Protection=8,
				SWPriorityMask=9,
				Addr=960
			};
			
			VIC();
			~VIC();
		public:
			
			
			enum INT_SRC{
			  	WDT_INT= 0		  	
				,SWI_INT= 1			
				,ARM_CORE0_INT= 2	
				,ARM_CORE1_INT=3	
				,TIMER0_INT= 4 		
				,TIMER1_INT= 5		
				,UART0_INT= 6		
				,UART1_INT= 7 		
				,PWM1_INT= 8		
				,I2C0_INT= 9
				,SPI0_INT= 10 
				,SSP0_INT= 10
				,SSP1_INT= 11
				,PLL_INT= 12		
				,RTC_INT= 13		
				,EINT0_INT= 14		
				,EINT1_INT= 15
				,EINT2_INT= 16
				,EINT3_INT= 17
				,ADC0_INT= 18		
				,I2C1_INT= 19
				,BOD_INT= 20		  
				,EMAC_INT= 21
				,USB_INT= 22
				,CAN_INT= 23
				,MCI_INT= 24
				,GPDMA_INT= 25		
				,TIMER2_INT= 26		
				,TIMER3_INT= 27
				,UART2_INT= 28
				,UART3_INT= 29
				,I2C2_INT= 30
				,I2S_INT= 31
			};
			
			static bool InstallIRQ(VIC::INT_SRC int_num,void* Handler,uint _prio);
			static void Init();
			static void ClearInt();
			
	};



#line 2 "..\\my_lib\\vic.cpp"

VIC::VIC(){}
VIC::~VIC(){}

bool VIC::InstallIRQ(VIC::INT_SRC int_num,void* Handler,uint prio){
	base_addr[IntEnClr] = 1 << int_num;	
    if ( int_num >= VIC_SIZE ){
		return false;
    }
    else{
		vect_addr[int_num] = (ulong)Handler;	
		priority[int_num] = prio;
		base_addr[IntEnable] = 1 << int_num;	
		return true;
    }	
}

void VIC::Init(){
	base_addr[IntEnClr] = 0xFFFFFFFF;
	base_addr[Addr] = 0;
	base_addr[IntSelect] = 0;

	for(uint i=0;i<VIC_SIZE;i++){
		vect_addr[i]=0;
		priority[i]=0xF;
	}
}

void VIC::ClearInt(){
	base_addr[Addr]=0;
}
ulong* VIC::base_addr = (ulong*)0xFFFFF000;
ulong* VIC::vect_addr = (ulong*)0xFFFFF100;
ulong* VIC::priority  = (ulong*)0xFFFFF200;
const uint VIC::VIC_SIZE = 32;
