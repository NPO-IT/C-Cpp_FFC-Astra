#include "../my_lib/fastport.h"
#include "../my_lib/uart.h"
#include "../my_lib/vic.h"
#include "../my_lib/pinsel.h"
#include "../my_lib/timer.h"						
#include "../my_lib/ssp.h"

#include "emc.h"

#include "secondstep.h"
#include "softwarecounter.h"
#include "skuttime.h"

 
#include "yalkpoll.h"
#include "../my_lib/crc8.h"
#include "../my_lib/crc16.h"
#include "maindef.h" //������ ����� ����� DMA ��������� � ���������

#include "fifo_emc.h"
#include "../my_lib/flash.h"

extern "C"{
	//void init_ssp();
	void UART1Handler() __irq;	//���������� ���������� ����1
	//void SSP1Handler() __irq;	
	void EINT2Handler() __irq;	//���������� ���������� �������������
	void UART2Handler() __irq;	//���������� ���������� ����2
	void UART0Handler() __irq;	//���������� ���������� ����0
};
//��������� ������� ������� � ���������� �������� � ������� ���������
void InitINT2(); 	//��������� ���������� �� ���� �� ���� P2[12] EINT2
bool SYNC=false;	//���� ��� �������������
byte buf_yalk[1];	//�����, ������������ � ������ ������ ������ ������ � �������� 32��� ��� �������� ��������� �� ������ ���
byte buff[20];
byte buff2[70];
byte NumberPacket=0,NumberPacket2=0,NumberPacket3=0;
char BDC2flag = 0;
unsigned int LKF3counter = 0;
unsigned char TestYALKFlag=0;
unsigned char CountTestYALK=0;
//������� �� ����� �� � ����� ���
ushort CalcFromCOPScale(uint max,uint min,uint val);
//�������� ������ ������������ ����������
void CalcSIN(byte* sin);
//-------------------------------------------------//				
//������ �����������
#define LKF_SIZE 11
#define DEF_VAL_LKF 575
/*
	���1,���2 - ���96-1
	���3	  - ���96-2 � ��� 38

	//������ ���38
	���5 ���6 ���7 ���8 
	���9 ���10 ���11 ���12
*/
SecondStepBase *LKF[LKF_SIZE];

//����� ����������
struct LKFOption{
	byte time0_chan;
	byte time1_chan;
	byte count_chan;
	byte contact_time;
};

static const LKFOption lkf0_opt={50,51,49,43};

struct {
	ushort lkf_frames; 				//������� ������ 100��
	ushort TIME_SEC;   				//����� � ��������
	ushort okf_frames; 				//������� ������ ���	8���
	SKUTTime *time_contact;	   	//���������� �����
} TheTime={0,0,0};
//========����� ��� ����������� ������ �������======
#define COP_LKF				1
#define COP_POWER			0
#define COP_NI				57
#define COP_BI				50
#define COP_NI_SIGN			58
#define COP_BI_SIGN			51
#define COP_TRANS_SIGN		32

/*
	������� ����������� � ���� ����������� ������� 
	� ������������ �������� � �������� �� �������� (���������?)
	� �������� ���������� ������� � ������� ������
*/
//8 ������ � ������ DMA USB
byte FRAME[8][FRAME_SIZE] __attribute__((at(DMA_SRC)));  //����� �������� ��� 
FastPort P0=GetFastPort(PORT_0),P4=GetFastPort(PORT_4);

const unsigned char NumberChannel[100]=
{
	33,	32,	31,	30,	37,	36,	35,	34,	3,	2,
	1,	0,	7,	6,	5,	15,	14,	13,	12,	11,
	10,	9,	8,	54,	55,	56,	57,	53,	88,	87,
	86,	49,	48,	47,	46,	16,	17,	18,	19,	20,
	21,	22,	23,	89,	63,	62,	61,	60,	59,	58,
	42,	43,	44,	45,	38,	39,	40,	41,	4,	67,
	66,	65,	64,	71,	24,	25,	26,	27,	28,	29,
	85,	84,	91,	50,	51,	52,	70,	69,	68,	76,
	77,	78,	79,	72,	73,	74,	75,	90,	92,	93,
	94,	95,	96,	97,	98,	99,	80,	81,	82,	83 
};

const unsigned char NumberContactChannel[100]=
{
	42,	43,	44,	45,	38,	39,	40,	41,	4,	67,
	66,	65,	64,	71,	24,	25,	26,	27,	28,	29,
	85,	84,	91,	50,	51,	52,	70,	69,	68,	76,
	77,	78,	79,	72,	73,	74,	75,	90,	92,	93,
	94,	95,	96,	97,	98,	99,	80,	81,	82,	83, 
	33,	32,	31,	30,	37,	36,	35,	34,	3,	2,
	1,	0,	7,	6,	5,	15,	14,	13,	12,	11,
	10,	9,	8,	54,	55,	56,	57,	53,	88,	87,
	86,	49,	48,	47,	46,	16,	17,	18,	19,	20,
	21,	22,	23,	89,	63,	62,	61,	60,	59,	58
};

const unsigned char HASHYATP[32]={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,0,1};

//��� ������� ��� ������������ UART ������� �� ��������� � �������� ����� �� 6 ������ �����
const byte HASH6BIT[]=  {
0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,

0x1,0x41,0x21,0x61,0x11,0x51,0x31,0x71,0x9,0x49,
0x29,0x69,0x19,0x59,0x39,0x79,0x5,0x45,0x25,0x65
,0x15,0x55,0x35,0x75,0xD,0x4D,0x2D,0x6D,0x1D,
0x5D,0x3D,0x7D,0x3,0x43,0x23,0x63,0x13,0x53,0x33,
0x73,0xB,0x4B,0x2B,0x6B,0x1B,0x5B,0x3B,0x7B,
0x7,0x47,0x27,0x67,0x17,0x57,0x37,0x77,0xF,0x4F,
0x2F,0x6F,0x1F,0x5F,0x3F,0x7F,
};

unsigned char TempModeTable[64];								 //������ ��� �������� ������� ������ ������� ��� 
//(0: 4-� ��������� 0-140 ��; 1: 4-� ��������� 0-240 ��; 2: 3-� ��������� 0-140 ��; 3: 3-� ��������� 0-240 ��; 4: ���������) 
unsigned char CalibrQueryYALK1[4]={42,80,82,23};
unsigned char CalibrQueryYALK2[4]={43,80,82,81};

//�������� � ������� ���� �� ������ ������
#define CurrentFrame(chan,val) FRAME[FRM_CNT][chan]=HASH6BIT[val]
//#define NextFrame(chan,val){uint tmp=FRM_CNT+1; if(tmp==8) tmp=0; FRAME[tmp][chan]=HASH6BIT[val];}
#define NextFrame(chan,val) (((FRM_CNT+1)==8)?FRAME[0][chan]:FRAME[FRM_CNT+1][chan])=HASH6BIT[val]
#define TargetFrame(target,chan,val) FRAME[target][chan]=HASH6BIT[val]
#define CurrentFrameBothFlow(chan,val) FRAME[FRM_CNT][chan]=FRAME[FRM_CNT][chan+40]=HASH6BIT[val]
#define TargetFrameBothFlow(target,chan,val) FRAME[target][chan]=FRAME[target][chan+40]=HASH6BIT[val]
// $ ������� "��� �����������"
#define $CurrentFrame(chan,val) FRAME[FRM_CNT][chan]=val
#define $NextFrame(chan,val) (((FRM_CNT+1)==8)?FRAME[0][chan]:FRAME[FRM_CNT+1][chan])=val
#define $TargetFrame(target,chan,val) FRAME[target][chan]=val
//��������� ���������� ��������� !!! ��� ������� �� ������ ����� ������
UART *uart1,*uart2; 
SSP* ssp1;

//DIR1 Rs485
FastPort DIR1=GetFastPort(PORT_0),DIR2=GetFastPort(PORT_0);
const uint DIR1_VAL=1<<17;
const uint DIR2_VAL=1<<19;
//"�������" ������ ��� ���96
struct FastQuery{
	byte  ID;
	byte analog;
	byte contact;
	byte crc8;
};
//����� � ��. ���. ���. ��� ������ �������� �� ����������� ������
//---������������� �����������

//���������� ��e����� �� ������� ���� ����������!!!
uint PRG_CNT=0,FRM_CNT=0,cnt63=0,count=0;

//ssp ������
ushort ssp_empty[8]={0,0,0,0,0,0,0,0};
ushort ssp_empty2[8] ={0,0,0,0,0,0,0,0};
ushort ssp_sync[8]={0,0,223932,9189,13,0,223932,9189};  //crc16  0xB77D
ushort ssp_read[8]={0,0,0,0,0,400,450,500};

	void UART0_Init()
{
	U0LCR  |= 0x80;			//��������� ������ � �������� ��������
	U0DLM = 0;
	U0DLL = 1;			    //������������� ������� 4800000
	U0LCR  = 0x03;		    //8 ���
	U0FCR = 0x47;			//���������� �� �������� 4 ����
	U0IER = 0x1;			//��������� ���������� �� �������� 4 ����
}

	void UART0_Send(const unsigned char* buffer,int bufSize)
{
	int i=0;
	FIO2SET|=1<<10;					//������������� ���� DIR0	
	while (i<bufSize)
	{
	U0THR = buffer[i];
	while ((U0LSR&0x20)==0);
	i++;
	}
}

void UART0_Read(unsigned char* buffer,int bufsize)
{
	int i=0;
	for (i=0;i<bufsize;i++) buffer[i]=U0RBR;
}

void UART2_Read(unsigned char* buffer,int bufsize)
{
	int i=0;
	for (i=0;i<bufsize;i++) buffer[i]=U2RBR;
}
	
int main(){
	//------------���������----------------//
	SCS|=1;		   //������� �����
	VIC::Init();		//!!!!!������������� ������� ����������

	//��������� DMA
	PCONP|= (1 << 29);
   	GPDMA_CONFIG=1;
	while ( !(GPDMA_CONFIG & 0x1) );
	GPDMA_CH0_DEST= DMA_DST;

	GPDMA_INT_TCCLR = 0x01;
	GPDMA_INT_ERR_CLR = 0x01;

	GPDMA_CH0_CTRL = (0x0 << 12) | (0x0<< 15)|(0<<18)|(0<<21)| (1 << 26)|(1<<31);	
	GPDMA_CH0_CFG = (0x01 << 11)|(0x0 << 6)|(1<<15)|(1<<14);

	// -------UART-------------
	PREPARE_UART_PTR			//	3 ��� THRE
	const UARTOption u_opt={0,0,1,3,7|(3<<6)};
	uart1=UART::Get(1);
	uart1->Init(&u_opt);
	
	//���� UART
	PINSEL::Set(0,15,func_01);   //Tx
	PINSEL::Set(0,16,func_01);	//Rx
	//���� DIR0 485 ���� 0
	DIR1[DIR]|=DIR1_VAL;
	PINSEL::Set(0,17,func_00);
	//�����������

	//��������� ������ ������ ������ ������� ���
	//��� ��� ���
	for (int i=0;i<=29;i++) TempModeTable[i]=1;				//4-� ��������� ����� 0-240 ��
	TempModeTable[30]=5;									//���������� ��������
	TempModeTable[31]=6;									//���������� �������

	//��� ���
	for (int i=32;i<=51;i++) TempModeTable[i]=1;				//4-� ��������� ����� 0-240 ��
	for (int i=52;i<=61;i++) TempModeTable[i]=4;			//���������
	TempModeTable[62]=5;									//���������� ��������
	TempModeTable[63]=6;									//���������� �������
	
	//����������� UART0, ������� ������������ ��� ����� ������ � �������� ������������, ������������� �� RS-485
	FIO0DIR|=1<<2;							//TXD0 ��� �����
	FIO2DIR|=1<<10;							//P2.10 (���� DIR) ��� �����
	PINSEL0|=(1<<4)|(1<<6);					//P0.2 ��� TXD0, P0.3 ��� RXD0
	UART0_Init();
	VICVectAddr6 = (unsigned long)UART0Handler;     //��������� ����� ����������� ����������
  VICVectPriority6 = 0;
	VICIntEnable|=1<<6;
	
	//UART2
	uart2=UART::Get(2);
	uart2->Init(&u_opt);
	
	//????
	PINSEL::Set(0,10,func_01);
	PINSEL::Set(0,11,func_01);
	
	DIR2[DIR]|=DIR2_VAL;
	//??????????
	
	//---------- SSP0 -----------------									   //��� ����� � ����
	PREPARE_SSP_PTR
	//ssp0 �� ����������!!!
	SSP* ssp0=SSP::Get(0);
	const SSPOption s0_opt={
		7,
		1,
		0,
		0xC,
		0,
		0,
		0,
		0,
		0,
		2
	};
	ssp0->Init(&s0_opt);
	
//	PINSEL::Set(0,17,func_10);
	PINSEL::Set(0,18,func_10);
   //---------- SSP1 -----------------									  //��� ����� � �������
	ssp1=SSP::Get(1);
	// 12,8 ���
	const SSPOption s1_opt={0xF,0,0,10,0,0,0,0,SSP::ROR,0};
	ssp1->Init(&s1_opt);
	//VIC::InstallIRQ(VIC::SSP1_INT,(void*)SSP1Handler,1);
	
	PINSEL::Set(0,6,func_10);  //ssel1
	PINSEL::Set(0,7,func_10);  //sck1
	PINSEL::Set(0,8,func_10);  //mosi1
	PINSEL::Set(0,9,func_10);  //miso1

	//���� �� ������� ��� ���������������������
	P0[DIR]|=1<<22;
	P0[DIR]|=1;
	//������������� � ����
	InitINT2();
	//������� ������
	InitEMC();
//&*&*&*&&*&*&*&*&*&&*&*&*&*&*&*&&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&//
//-------------------------------------������-----------------------------------------------//
//&*&*&*&&*&*&*&*&*&&*&*&*&*&*&*&&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&//


//----------------------------------------------------------//
//-----------------------����������-------------------------//
//----------------------------------------------------------//
	LKF[0]=new SecondStep4POS(new ushort[128],64);
	LKF[1]=new SecondStep4POS(new ushort[128],64);
	LKF[2]=new SecondStep4POS(new ushort[128],64);
	
	//���38 ���������� �� ���-�������
	//������ �����
	LKF[3]=new BDCStreamAddr(new ushort[40],20); //1
	LKF[4]=new BDCStreamAddr(new ushort[40],20); //2
   	LKF[5]=new BDCStreamAddr(new ushort[40],20); //3
	LKF[6]=new BDCStreamAddr(new ushort[40],20); //4
	//������ �����
	LKF[7]=new BDCStreamAddr(new ushort[40],20); //1
	LKF[8]=new BDCStreamAddr(new ushort[40],20); //2
   	LKF[9]=new BDCStreamAddr(new ushort[40],20); //3
	LKF[10]=new BDCStreamAddr(new ushort[40],20);//4
//------------------------------------------------------------------------

int i;
byte buf[14];
//��������� ��� 0 ����� �� ���-1(��� ���)
DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<DELAY485;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
uart1->Read(buf,14);

for (i=0;i<10000;i++);

DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<DELAY485;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
uart1->Read(buf,14);

for (i=0;i<10000;i++);

DIR1[SET]|=DIR1_VAL;
uart1->Send(CalibrQueryYALK1,4);
for (i=0;i<DELAY485;i++);
DIR1[CLR]|=DIR1_VAL;
for (i=0;i<1500;i++);
if (uart1->Read(buf,14)) MIN_SCALE1=(buf[12]|(buf[13]<<8));

//��������� ��� 0 ����� �� ���-2(���)
DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<DELAY485;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
uart2->Read(buf,14);

for (i=0;i<10000;i++);

DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<DELAY485;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
uart2->Read(buf,14);

for (i=0;i<10000;i++);

DIR2[SET]|=DIR2_VAL;
uart2->Send(CalibrQueryYALK2,4);
for (i=0;i<DELAY485;i++);
DIR2[CLR]|=DIR2_VAL;
for (i=0;i<1500;i++);
if (uart2->Read(buf,14)) MIN_SCALE2=(buf[12]|(buf[13]<<8));  

VIC::InstallIRQ(VIC::UART1_INT,(void*)UART1Handler,2);						//���������� �� ������ 14 ���� �� ������ ���
VIC::InstallIRQ(VIC::UART2_INT,(void*)UART2Handler,2);						//���������� �� ������ 14 ���� �� ��� � ������������� ������


//��� ������������� ����� ������������ ������ ������� �������������� �� ��������!

//������ ��������� �������� � ����������
	for(uint i=0;i<64;i++){
		LKF[0]->Write(i,MIN_SCALE1);
		LKF[1]->Write(i,MIN_SCALE1);
		LKF[2]->Write(i,MIN_SCALE2);
	}
	//������� ����� ���
	//1024 ������ 63 �����
	LKF[0]->Write(62,1023);
	LKF[1]->Write(62,1023);
	LKF[2]->Write(62,1023); 

	//1024 ������� 62 �����
	LKF[0]->Write(61,1023);
	LKF[1]->Write(61,1023);
	LKF[2]->Write(61,1023);

	LKF[0]->Write(45,960);			 //���������� ��� - 448
	LKF[0]->Write(60,576);			 //���������� ��� - 64
	
	LKF[0]->Switch();
	LKF[1]->Switch();
	LKF[2]->Switch();
	for(uint i=0;i<64;i++){
		LKF[0]->Write(i,MIN_SCALE1);
		LKF[1]->Write(i,MIN_SCALE1);
		LKF[2]->Write(i,MIN_SCALE2);
	}
	//������� ����� ���
	//1024 ������ 63 �����
	LKF[0]->Write(62,1023);
	LKF[1]->Write(62,1023);
	LKF[2]->Write(62,1023);
	//1024 ������� 62 �����
	LKF[0]->Write(61,1023);
	LKF[1]->Write(61,1023);
	LKF[2]->Write(61,1023);

	LKF[0]->Write(45,960);			 //���������� ��� - 448
	LKF[0]->Write(60,576);			 //���������� ��� - 64

	LKF[0]->Switch();
	LKF[1]->Switch();
	LKF[2]->Switch();
//----------------------------------------------------------------------//
//-------------------------- ����� ��� ---------------------------------//
//----------------------------------------------------------------------//
	
	for(int i=0;i<8;i++){
		for(int j=0;j<FRAME_SIZE-1;j++){
			FRAME[i][j]=HASH6BIT[0];
		}
		//---  I �����	-----//
		//������ 
		for(uint j=0;j<80;j++)
			FRAME[i][j]=HASH6BIT[0];
		//��������
		FRAME[i][CHAN_19_I]=HASH6BIT[SIN[0]];
		FRAME[i][CHAN_39_I]=HASH6BIT[HALF_SCALE];
		FRAME[i][CHAN_40_I]=HASH6BIT[HALF_SCALE];
		FRAME[i][CHAN_30_I]=HASH6BIT[SIN[i]];
	//------------ II ����� -----------//
		//������

		//��������
		FRAME[i][CHAN_19_II]=HASH6BIT[SIN[0]];
		FRAME[i][CHAN_39_II]=HASH6BIT[HALF_SCALE];
		FRAME[i][CHAN_40_II]=HASH6BIT[HALF_SCALE];
		FRAME[i][CHAN_30_II]=HASH6BIT[SIN[i]];
	}
	
	//-----������� ������� --------//
	//�����
	TheTime.time_contact=new SKUTTime();
	//-----------------------------//
	//��������
	uint LKF_COUNT=0;//������������� ���������  12,5 �� 640
	int dat=0;
	FRM_CNT=0; //������� ������ 0..7
	//����� �������� ������/�������� ������ �����������
	CLCPollClear(); //CLC - Cell of Local Commutator (������ ���������� ������������)

//&*&*&*&&*&*&*&*&*&&*&*&*&*&*&*&&*&*&*&*&*&*&*&*&*&*&*&*&*&*&//
//----------------������� ����----------------------------//	
//--------------------------------------------------------//
//&*&*&*&&*&*&*&*&*&&*&*&*&*&*&*&&*&*&*&*&*&*&*&*&*&*&*&*&*&*&//	


FIO0DIR|=1<<26;
	LOOP{
		//-- �������������� � ����������� ����������� -----//
		/*
			���� ������ �� ��������
			ssp_read[0] - ����� ������ ������ 0..159
			ssp_read[2] - 2 8-�� ������ ������� ������� �������� ���������� ���
			ssp_read[3] - 2 8-�� ������ ������� ������� �������� ���������� ��� ��� �����������
			ssp_read[4] - ������ ��������� ��������(���,���,����������� ) �������� ������� ������ 
		*/		
		ssp1->Send(ssp_empty,6);
		ssp1->Read(ssp_read,6);
		
		//����������� ������� ������/�������� ������ �����������
		CLCPollNext(); //���������� �� ��������� ������

		//---������� ������ �� ������ ----//
		//���96-1
		FIO0SET|=0xA0000;
		
		uart1->Send(CLCPoll2Query(CLC96_1),4);
		uart2->Send(CLCPoll2Query(CLC96_2),4);
		
		/*
		U1THR = CLCPoll2Query(CLC96_1)[0];	 
		U2THR = CLCPoll2Query(CLC96_2)[0];
		while ((U1LSR & 1<<5) == 0)
		//������
		U1THR = CLCPoll2Query(CLC96_1)[1];	 
		U2THR = CLCPoll2Query(CLC96_2)[1];
		while ((U1LSR & 1<<5) == 0)
		U1THR = CLCPoll2Query(CLC96_1)[2];	 
		U2THR = CLCPoll2Query(CLC96_2)[2];
		while ((U1LSR & 1<<5) == 0)
		U1THR = CLCPoll2Query(CLC96_1)[3];	 
		U2THR = CLCPoll2Query(CLC96_2)[3];
		*/
		
		DIR1[CLR]|=DIR1_VAL;
		LC_WriteAnalog(LKF[1],35,TheTime.TIME_SEC);
		//������ � LKF ��������� "��������" ��� ������
		
		for(uint i=0;i<3;i++){
			if(DB_IsRead(LKF[i])){
				DB_Switch(LKF[i]);		
			}
		}
		/*
		if(DB_IsRead(LKF[0])) DB_Switch(LKF[0]);
		if(DB_IsRead(LKF[1])) DB_Switch(LKF[1]);
		if(DB_IsRead(LKF[2])) DB_Switch(LKF[2]);
*/
		
		DIR2[CLR]|=DIR2_VAL;
		
		//��� ������� � maindef.h 
//-----------------�������� ������ �� ��������----------------------------------------
		switch(ssp_empty[0]){
		//--------����������� � �������� � ���3-----------
			case TEMP_VAL (79,LKF[1],ssp_read[4]);
			case TEMP_ADDR(78,LKF[1],ssp_read[4]);
			//50�� ����������!!!!
			case TEMP_VAL ((80+79),LKF[1],ssp_read[4]);
			case TEMP_ADDR((80+78),LKF[1],ssp_read[4]);
	    //--------������� �������� � ���1------------------	
			case TEMP_COUNT_NEXT(63,clcpolltable[CLC96_2][61]);
			//50��
			case TEMP_COUNT_NEXT((63+80),clcpolltable[CLC96_2][61+80]);
	    //--------�����--------------------------
	   		//����������
			//���������� ��������
		//---------������ �� ����� �������-------
			//----------����������------------
			//100��
			case COP_DATA_ANALOG(70,LKF[1],0,ssp_read[4]);	 //������� 27�
			case COP_DATA_ANALOG(71,LKF[1],57,ssp_read[4]);	 //��
			case COP_DATA_ANALOG(72,LKF[1],50,ssp_read[4]);	 //��-2 =) (�������� ��������)
			//50��
			case COP_DATA_ANALOG(150,LKF[1],0,ssp_read[4]);  //������� 27�
			case COP_DATA_ANALOG(151,LKF[1],57,ssp_read[4]);  //��
			case COP_DATA_ANALOG(152,LKF[1],50,ssp_read[4]);  //��
			//-----------���������--------------//	
			case COP_DATA_STATE(73,LKF[1],58,51,32,ssp_read[4]); 
			case COP_DATA_STATE(153,LKF[1],58,51,32,ssp_read[4]);
		//-------------���!!!! ���������� ���������-------------------------//	
			//��1
			case BDC_ANALOG(1,LKF[0],1,ssp_read[4]);
			case BDC_ANALOG(2,LKF[0],17,ssp_read[4]);
			case BDC_ANALOG(81,LKF[0],33,ssp_read[4]);
			case BDC_ANALOG(82,LKF[0],49,ssp_read[4]);
			//��2
			case BDC_ANALOG(3,LKF[0],4,ssp_read[4]);
			case BDC_ANALOG(4,LKF[0],20,ssp_read[4]);
			case BDC_ANALOG(83,LKF[0],36,ssp_read[4]);
			case BDC_ANALOG(84,LKF[0],52,ssp_read[4]);
			//��3
			case BDC_ANALOG(5,LKF[0],3,ssp_read[4]);
			case BDC_ANALOG(6,LKF[0],19,ssp_read[4]);
			case BDC_ANALOG(85,LKF[0],35,ssp_read[4]);
			case BDC_ANALOG(86,LKF[0],51,ssp_read[4]);
			//��4
			case BDC_ANALOG(7,LKF[0],7,ssp_read[4]);
			case BDC_ANALOG(8,LKF[0],23,ssp_read[4]);
			case BDC_ANALOG(87,LKF[0],39,ssp_read[4]);
			case BDC_ANALOG(88,LKF[0],55,ssp_read[4]);
			//---------------------------------------//
			//��1
			case BDC_ANALOG(10,LKF[0],2,ssp_read[4]);
			case BDC_ANALOG(11,LKF[0],18,ssp_read[4]);
			case BDC_ANALOG(90,LKF[0],34,ssp_read[4]);
			case BDC_ANALOG(91,LKF[0],50,ssp_read[4]);
			//��2
			case BDC_ANALOG(12,LKF[0],6,ssp_read[4]);
			case BDC_ANALOG(13,LKF[0],22,ssp_read[4]);
			case BDC_ANALOG(92,LKF[0],38,ssp_read[4]);
			case BDC_ANALOG(93,LKF[0],54,ssp_read[4]);
			//��3
			case BDC_ANALOG(14,LKF[0],10,ssp_read[4]);
			case BDC_ANALOG(15,LKF[0],26,ssp_read[4]);
			case BDC_ANALOG(94,LKF[0],42,ssp_read[4]);
			case BDC_ANALOG(95,LKF[0],58,ssp_read[4]);
			//��4
			case BDC_ANALOG(16,LKF[0],9,ssp_read[4]);
			case BDC_ANALOG(17,LKF[0],25,ssp_read[4]);
			case BDC_ANALOG(96,LKF[0],41,ssp_read[4]);
			case BDC_ANALOG(97,LKF[0],57,ssp_read[4]);
			//---------------------------------------//			
			//AB
			case BDC_ANALOG(9,LKF[0],12,ssp_read[4]);
			case BDC_ANALOG(89,LKF[0],44,ssp_read[4]);
			//---------------------------------------//			
			//+9B
			case BDC_ANALOG(18,LKF[0],21,ssp_read[4]);
			case BDC_ANALOG(98,LKF[0],53,ssp_read[4]);
		    //---------------------------------------//			
			//-9B
			case BDC_ANALOG(19,LKF[0],5,ssp_read[4]);
			case BDC_ANALOG(99,LKF[0],37,ssp_read[4]);
		    //---------------------------------------//			
			//���1
			case BDC_ANALOG(20,LKF[0],11,ssp_read[4]);
			case BDC_ANALOG(100,LKF[0],43,ssp_read[4]);
			//���2
			case BDC_ANALOG(21,LKF[0],15,ssp_read[4]);
			case BDC_ANALOG(101,LKF[0],47,ssp_read[4]);
			//���3
			case BDC_ANALOG(22,LKF[0],27,ssp_read[4]);
			case BDC_ANALOG(102,LKF[0],59,ssp_read[4]);
			//���4
			case BDC_ANALOG(23,LKF[0],14,ssp_read[4]);
			case BDC_ANALOG(103,LKF[0],46,ssp_read[4]);
			//����������
			case 24:{
				//��1
				LC_WriteContact(LKF[0],0,IE1(ssp_read[4]));
				//��2
				LC_WriteContact(LKF[0],2,IE2(ssp_read[4]));
				//��3
				LC_WriteContact(LKF[0],4,IE3(ssp_read[4]));
				//��4
				LC_WriteContact(LKF[0],6,IE4(ssp_read[4]));
				//��5
				LC_WriteContact(LKF[0],8,IE5(ssp_read[4]));
				//��6
				LC_WriteContact(LKF[0],10,IE6(ssp_read[4]));
				//��7
				LC_WriteContact(LKF[0],12,IE7(ssp_read[4]));
				//��8
				LC_WriteContact(LKF[0],14,IE8(ssp_read[4]));
				//����� ��
				LC_WriteContact(LKF[0],7,RefreshPB(ssp_read[4]));
				//��� ��
				LC_WriteContact(LKF[0],11,SwitchUPPB(ssp_read[4]));
				//��9
				LC_WriteContact(LKF[0],15,NK9(ssp_read[4]));
				//������� 29 �����
				//DB_WriteElem(LKF[0],28,ssp_read[4]);
				break;
			}
			case 104:{
				//��1
				LC_WriteContact(LKF[0],32,IE1(ssp_read[4]));
				//��2
				LC_WriteContact(LKF[0],34,IE2(ssp_read[4]));
				//��3
				LC_WriteContact(LKF[0],36,IE3(ssp_read[4]));
				//��4
				LC_WriteContact(LKF[0],38,IE4(ssp_read[4]));
				//��5
				LC_WriteContact(LKF[0],40,IE5(ssp_read[4]));
				//��6
				LC_WriteContact(LKF[0],42,IE6(ssp_read[4]));
				//��7
				LC_WriteContact(LKF[0],44,IE7(ssp_read[4]));
				//��8
				LC_WriteContact(LKF[0],46,IE8(ssp_read[4]));
				//����� ��
				LC_WriteContact(LKF[0],39,RefreshPB(ssp_read[4]));
				//��� ��
				LC_WriteContact(LKF[0],43,SwitchUPPB(ssp_read[4]));
				//��9
				LC_WriteContact(LKF[0],47,NK9(ssp_read[4]));
				//������� 30 �����
				//DB_WriteElem(LKF[0],29,ssp_read[4]);
				break;
			}
			//--------�����----------------//
			case TIME(45 ,LKF[2],lkf0_opt,TheTime);
			case TIME(125,LKF[2],lkf0_opt,TheTime);	
		}
	
		//!!!������� ������ � ��� ���� ������!!!!! ������� �� ������� ���������!!!
		//!!!��� ��������� ����� ������� � ������� ���!!!
		//������� ������������� c �������
		if (++ssp_empty[0]==POLLING_SIZE){
			ssp_empty[0]=0;
		}
		
		// ������������ 19 ������ ����� �������� LKF  
 		if(++LKF_COUNT==640)
		{
			LKF_COUNT=0;
			CurrentFrameBothFlow(CHAN_19_I,SIN[3]);
		} 
		if (LKF_COUNT==3) TargetFrameBothFlow(7,CHAN_19_I,SIN[0]);
		
		byte tmp_val; 				//��� ������� �������
		//
		uint SAVE_LKF_INT=0;
		byte *SAVE_LKF=(byte*)&SAVE_LKF_INT; 	//���������� �����������
		
		//���1 8��� �� ��� ����� ��� ��� 50 ��
		if (!(FRM_CNT&1)){ //������ ����� 0, 2, 4, 6
			GetNextLKFHash(LKF[0],SAVE_LKF[0]);
			const byte* lkf0=GetLKF(SAVE_LKF[0]);
			//���1
			//�������
			$CurrentFrame(4,lkf0[0]);
			$CurrentFrame(24,lkf0[1]);
			//��������� ���� �.�.  ������ ��������� ��������� �� >=8 ��� ������
			$TargetFrame(FRM_CNT+1,4,lkf0[2]);
			$TargetFrame(FRM_CNT+1,24,lkf0[3]);	
		}
		//���2
		GetNextLKFHash(LKF[1],SAVE_LKF[1]);
		const byte* lkf1=GetLKF(SAVE_LKF[1]);
		$CurrentFrame(5,lkf1[0]);
		$CurrentFrame(15,lkf1[1]);
		$CurrentFrame(25,lkf1[2]);
		$CurrentFrame(35,lkf1[3]);

		//���3
	  	GetNextLKFHash(LKF[2],SAVE_LKF[2]);
		const byte* lkf2=GetLKF(SAVE_LKF[2]);
		$CurrentFrame(6,lkf2[0]);
		$CurrentFrame(16,lkf2[1]);
		$CurrentFrame(26,lkf2[2]);
		$CurrentFrame(36,lkf2[3]);
		
		SAVE_LKF[3]=FRAME[FRM_CNT][9]&63;						//��������� � ������ ������� ��������		   

	 //---------------�������� ���--------------------------//
		/*
		�������� ����� ���:
		bdc8_bit_index[0] 1-1|2-1
		bdc8_bit_index[1] 3-1|4-1
		bdc8_bit_index[2] 1-2|2-2
		bdc8_bit_index[3] 3-2|4-2
		����������� ����� ��� ��� ���2:
		bdc8_bit_index[4] 1-1|2-1
		bdc8_bit_index[5] 3-1|4-1
		bdc8_bit_index[6] 1-2|2-2
		bdc8_bit_index[7] 3-2|4-2
		*/

		/*

		*/

		const byte *bdc8_bit_index=(byte*)ssp_read;	 //������� ������� ��� ���
		const byte *bdc_levels;	  //������ ��� ��� ���
		// ������ �����																						   
		{
			
			bdc_levels=GetLKF(bdc8_bit_index[0]);	 //8 ���
			//��������� ������� �� �������
			//1-1
			$CurrentFrame(13,bdc_levels[3]);
			$CurrentFrame(33,bdc_levels[2]);
			//2-1
			$CurrentFrame(3,bdc_levels[1]);
			$CurrentFrame(23,bdc_levels[0]);

			bdc_levels=GetLKF(bdc8_bit_index[1]);	 //8 ���
			//��������� ������� �� �������
			//3-1
			$CurrentFrame(11,bdc_levels[3]);
			$CurrentFrame(31,bdc_levels[2]); 
			//4-1						
			$CurrentFrame(8,bdc_levels[1]);
			$CurrentFrame(28,bdc_levels[0]);
					 
		}
		//������ �����
		{
			bdc_levels=GetLKF(bdc8_bit_index[2]);
			//��������� ������� �� �������
			//1-2
			$CurrentFrame(12,bdc_levels[3]);
			$CurrentFrame(32,bdc_levels[2]);
			//2-2
			$CurrentFrame(2,bdc_levels[1]);
			$CurrentFrame(22,bdc_levels[0]);

			bdc_levels=GetLKF(bdc8_bit_index[3]);	 //8 ���
			//��������� ������� �� �������
			//3-2
			$CurrentFrame(1,bdc_levels[3]);
			$CurrentFrame(21,bdc_levels[2]);
			//4-2						
			$CurrentFrame(14,bdc_levels[1]);
			$CurrentFrame(34,bdc_levels[0]);
		}
		//-------------------����������� ���	 -------------------------------
		// ������ �����
		{
			
			bdc_levels=GetLKF(bdc8_bit_index[4]);	 //8 ���
			//��������� ������� �� �������
			//1-1
			$CurrentFrame(40+13,bdc_levels[3]);
			$CurrentFrame(40+33,bdc_levels[2]);
			//2-1
			$CurrentFrame(40+3,bdc_levels[1]);
			$CurrentFrame(40+23,bdc_levels[0]);

			bdc_levels=GetLKF(bdc8_bit_index[5]);	 //8 ���
			//��������� ������� �� �������
			//3-1
			$CurrentFrame(40+11,bdc_levels[3]);
			$CurrentFrame(40+31,bdc_levels[2]);
			//4-1						
			$CurrentFrame(40+8,bdc_levels[1]);
			$CurrentFrame(40+28,bdc_levels[0]);		 
		}
		//������ �����
		{
			bdc_levels=GetLKF(bdc8_bit_index[6]);
			//��������� ������� �� �������
			//1-2
			$CurrentFrame(40+12,bdc_levels[3]);
			$CurrentFrame(40+32,bdc_levels[2]);
			//2-2
			$CurrentFrame(40+2,bdc_levels[1]);
			$CurrentFrame(40+22,bdc_levels[0]);

			bdc_levels=GetLKF(bdc8_bit_index[7]);	 //8 ���
			//��������� ������� �� �������
			//3-2
			$CurrentFrame(40+1,bdc_levels[3]);
			$CurrentFrame(40+21,bdc_levels[2]);
			//4-2						
			$CurrentFrame(40+14,bdc_levels[1]);
			$CurrentFrame(40+34,bdc_levels[0]);
		}		
				
		//------------��������� � ������ ������	--------------------
		//��������� � ������ ����� ����� 4 ����� ���1,���2,���3,������� ��������
		SAVE_LKF_INT=ReadWriteFifo(SAVE_LKF_INT);
		
		//--------------------����������� ����� ����������-----------//
//--------------------���1 �� ��� ����� -----------------------------
		if(!(FRM_CNT&1)){ //������ ����� 0, 2, 4, 6
			const byte* saved_lkf0=GetLKF(SAVE_LKF[0]);
			//���1
			//�������
			$CurrentFrame(40+4, saved_lkf0[0]);
			$CurrentFrame(40+24, saved_lkf0[1]);
			//��������� ���� ��� ������ ��������� ��������� �� >=8 ��� ������
			$TargetFrame(FRM_CNT+1,40+4, saved_lkf0[2]);
			$TargetFrame(FRM_CNT+1,40+24,saved_lkf0[3]);	
		}

		if (BDC2flag==0) 
//--------------------���2------------------------------------//-------------------------------------------------------------------------------------------------
		{
		const byte* saved_lkf1=GetLKF(SAVE_LKF[1]);

		$CurrentFrame(40+5,saved_lkf1[0]);
		$CurrentFrame(40+15,saved_lkf1[1]);
		$CurrentFrame(40+25,saved_lkf1[2]);
		$CurrentFrame(40+35,saved_lkf1[3]);
//--------------------���3-------------------------------------//------------------------------------------------------------------------------------------------------
		const byte* saved_lkf2=GetLKF(SAVE_LKF[2]);
	
		$CurrentFrame(40+6, saved_lkf2[0]);
		$CurrentFrame(40+16, saved_lkf2[1]);
		$CurrentFrame(40+26, saved_lkf2[2]);
		$CurrentFrame(40+36, saved_lkf2[3]);
		}
else 
		{
			
			bdc_levels=GetLKF(bdc8_bit_index[10]);	 //8 ���
			//��������� ������� �� �������
			//1-1
			$CurrentFrame(40+5,bdc_levels[3]);
			$CurrentFrame(40+25,bdc_levels[2]);
			//2-1
			$CurrentFrame(40+15,bdc_levels[1]);
			$CurrentFrame(40+35,bdc_levels[0]);

			bdc_levels=GetLKF(bdc8_bit_index[11]);	 //8 ���
			//��������� ������� �� �������
			//3-1
			$CurrentFrame(40+6,bdc_levels[3]);
			$CurrentFrame(40+26,bdc_levels[2]);
			//4-1						
			$CurrentFrame(40+16,bdc_levels[1]);
			$CurrentFrame(40+36,bdc_levels[0]);		 
		}
if (LKF3counter>128000) //
		$CurrentFrame(40+9, SAVE_LKF[3]);	  //����������� ������� ��������
	else
LKF3counter++;
	
	
		//-------------����	 ----------
		while(!SYNC);
		
		SYNC=false;
		GPDMA_CH0_SRC = (ulong)FRAME[FRM_CNT];	
		GPDMA_CH0_CTRL |= (FRAME_SIZE);	
		GPDMA_CH0_CFG |= 0x01;
		//������������� �� ��������� ���� ��� ������������ ��� ���������	  
		if(++FRM_CNT==8) FRM_CNT=0;
	}
   	return 0;
}
//��������� ������ ��� ���96-1(�������)
//������� ��������� ������ ��������� � ������� ����������
static const byte PROG_POLL1[]={
	0,7,9,10,
	17,19,20,27,30,
	37,40,50,60,67,77
};

//���������� ���������� UART
void UART1Handler() __irq{
	//P0[SET]|=1<<10;
	//uint status=uart1->GetIntStatus();
	//������ �������� � �������� ��� ������
	/*if(status&4){	 */
		byte buf[14];
		
		buf[0]=U1RBR;
		buf[1]=U1RBR;
		buf[2]=U1RBR;
		buf[3]=U1RBR;
		buf[4]=U1RBR;
		buf[5]=U1RBR;
		buf[6]=U1RBR;
		buf[7]=U1RBR;
		buf[8]=U1RBR;
		buf[9]=U1RBR;
		buf[10]=U1RBR;
		buf[11]=U1RBR;
		buf[12]=U1RBR;
		buf[13]=U1RBR;
		
if (TestYALKFlag==0)
		{
			//������ �������
			CurrentFrame(PROG_POLL1[0],buf[0]);
			CurrentFrame(PROG_POLL1[1],buf[1]);
			CurrentFrame(PROG_POLL1[2],buf[2]);
			CurrentFrame(PROG_POLL1[3],buf[3]);
			CurrentFrame(PROG_POLL1[4],buf[4]);	
			CurrentFrame(PROG_POLL1[5],buf[5]);
			CurrentFrame(PROG_POLL1[6],buf[6]);
			CurrentFrame(PROG_POLL1[7],buf[7]);		  
			CurrentFrame(PROG_POLL1[8],buf[8]);
			CurrentFrame(PROG_POLL1[9],buf[9]);
			CurrentFrame(PROG_POLL1[10],buf[10]);
			CurrentFrame(PROG_POLL1[11],buf[11]);
			CurrentFrame(PROG_POLL1[12],((buf[0]>>6)&0x3)|((buf[1]>>4)&0xC)|((buf[2]>>2)&0x30));
			CurrentFrame(PROG_POLL1[13],((buf[3]>>6)&0x3)|((buf[4]>>4)&0xC)|((buf[5]>>2)&0x30));
			CurrentFrame(PROG_POLL1[14],((buf[6]>>6)&0x3)|((buf[7]>>4)&0xC)|((buf[8]>>2)&0x30));
			//������ ���������
			if($CLCPoll(CLC96_1,lkf)<254){
					ushort tmp_val=(buf[12]|(buf[13]<<8));
					
					if ($CLCPoll(CLC96_1,lkf)==0){
						if ($CLCPoll(CLC96_1,writemode)==1) LC_WriteAnalog(LKF[0],$CLCPoll(CLC96_1,chan),tmp_val)
						else LC_WriteContact(LKF[0],$CLCPoll(CLC96_1,chan),tmp_val>>9);		
					}
					//ne zatirat' temperaturnie kanali
					else if($CLCPoll(CLC96_1,writemode)==1) {
						LC_WriteAnalog(LKF[$CLCPoll(CLC96_1,lkf)],$CLCPoll(CLC96_1,chan),tmp_val);
					}
					else{
						DB_WriteElem(LKF[$CLCPoll(CLC96_1,lkf)],$CLCPoll(CLC96_1,chan),tmp_val);
					}
			}
			else if ($CLCPoll(CLC96_1,lkf)==254)					   //�������� ����������� �� 1-�� �� 0-�� ��� ������� ���
			{
				if ((buf[13] & 0x02) == 0) TheTime.TIME_SEC = 0;	   //��������� ������� �� ������� ���
			}
		 if ($CLCPoll(CLC96_1,chan)==36)					  //������������ ����� 52-�� ������ ������ ��� ��� ����� ���1�� � ���2 ///���� ��� 2 ������� ��������, ���� ��������� �� 1//
			{
				if ((buf[13] & 0x02) == 0) BDC2flag=1;
				else BDC2flag = 0;
			}
		}
		else
		{
			buf[13]=buf[13] | ((YALKTestPollTable[CountTestYALK].analogchan & 63)<<2);	//���������� ������� ����� ������ ����������� ���������� ���������
			buf[11]=(buf[11] & 63) | (YALKTestPollTable[CountTestYALK].analogchan & 0xC0);		//���������� ������� 2 ���� ������ ����������� ���������� ���������
			UART0_Send(buf,14);				//���������� �������� ���������� 14 ���� ���������� �� ���
			CountTestYALK++;
			if (CountTestYALK>=160) CountTestYALK=0;
 			uint delay=50;
			while(--delay);
			FIO2CLR|=1<<10;					//���������� ���� DIR0
		}

	VICVectAddr=0x0;
}

ushort CalcFromCOPScale(uint max,uint min,uint val){
	uint ret_val=(max-min)*val;
	ret_val>>=10;
	return ret_val+min;
}

//������ ������ 
void CalcSIN(uint max,uint min,byte* sin){
	//10 �������� � 6
	max>>=3;
	min>>=3;
	const uint delta=max-min;
	//0%
	sin[0]=min;
	sin[7]=min;
	//100%
	sin[3]=max;
	sin[4]=max;
	//33%
	sin[1]=((delta*42)>>7)+min;
	sin[6]=sin[1];
	//66%
	sin[2]=((delta*84)>>7)+min;
	sin[5]=sin[2];
}

void SSP1Handler()__irq{
	byte ssp_read[8];
	VICVectAddr=0x0;	
}

void InitINT2(){
	PINSEL::Set(2,12,func_01);
	VIC::InstallIRQ(VIC::EINT2_INT,(void*)EINT2Handler,1);	
	IO2_INT_EN_R = 1<<12;
    EXTMODE = 1<<2;	
    EXTPOLAR =0;
}

void EINT2Handler() __irq{
	
	if (TestYALKFlag==0) SYNC=true;					 //������� ����� ������ ���
	else											 //���� ��������� � ������ ����� ���, �� ���������� ������� ������ ���
	{
		buff[0]=42;
		buff[1]=YALKTestPollTable[CountTestYALK].analog;
		buff[2]=YALKTestPollTable[CountTestYALK].contact;				
		buff[3]=CalcCRC8(buff,3);
			
		DIR1[SET]|=DIR1_VAL;
		uart1->Send(buff,4);				//���������� ������ ������ ���
		uint delay=50;
		while(--delay);
		DIR1[CLR]|=DIR1_VAL;			//���������� ���� DIR1
	}

	EXTINT=1<<2;
	VICVectAddr=0x0;
}

//���3 ���1,���2,���3; ������
static const byte PROG_POLL2[]={
	40+7,40+17,40+19
};
void UART2Handler() __irq{
	//;
	//uint status=uart2->GetIntStatus()>>1;
	static byte cnt=0;
	//������ ��������
	//if(status&2){
	byte buf[14];
	
		buf[0]=U2RBR;
		buf[1]=U2RBR;
		buf[2]=U2RBR;
		buf[3]=U2RBR;
		buf[4]=U2RBR;
		buf[5]=U2RBR;
		buf[6]=U2RBR;
		buf[7]=U2RBR;
		buf[8]=U2RBR;
		buf[9]=U2RBR;
		buf[10]=U2RBR;
		buf[11]=U2RBR;
		buf[12]=U2RBR;
		buf[13]=U2RBR;

		switch($CLCPoll(CLC96_2,ID)){
			case CLC2_ID:{
				//��������� 
				uint next=(((FRM_CNT+1)==8)?0:FRM_CNT+1);

				CurrentFrame(PROG_POLL2[0],buf[0]);
				TargetFrame(next,PROG_POLL2[0],buf[1]);

				CurrentFrame(PROG_POLL2[1],buf[2]);
				TargetFrame(next,PROG_POLL2[1],buf[3]);

				CurrentFrame(PROG_POLL2[2],buf[4]);
				TargetFrame(next,PROG_POLL2[2],buf[5]);	  	 
		
				ushort val=buf[12]|(buf[13]<<8);
				if($CLCPoll(CLC96_2,lkf)!=255){
					ushort tmp_val=(buf[12]|(buf[13]<<8));
					if($CLCPoll(CLC96_2,writemode)!=1){
						DB_WriteElem(LKF[2],$CLCPoll(CLC96_2,chan),tmp_val);
					}
					else{
						LC_WriteAnalog(LKF[2],$CLCPoll(CLC96_2,chan),tmp_val);
					}	
				}	   
				
				break;
			}	  
			//��������� �����������
			case CT_ID:{
				ushort temp_val=~(buf[2]|(buf[3]<<8));
				//P0[SET]|=1<<22;	
				//�����
				byte addr=buf[1];
				addr=~HASHYATP[addr];

				LC_WriteContact(LKF[2],12,addr);  
				LC_WriteContact(LKF[2],13,(addr>>1));
				LC_WriteContact(LKF[2],14,(addr>>2));
				LC_WriteContact(LKF[2],15,(addr>>3));
				LC_WriteContact(LKF[2],16,(addr>>4)); 
				LC_WriteContact(LKF[2],17,(((addr&0x1F)==31)?0:1));
				//��������� ��������� ������ �����������
				//��������
				LC_WriteContact(LKF[2],0,(temp_val)); 
				LC_WriteContact(LKF[2],1,(temp_val>>1));
				LC_WriteContact(LKF[2],2,(temp_val>>2));
				LC_WriteContact(LKF[2],3,(temp_val>>3));
				LC_WriteContact(LKF[2],4,(temp_val>>4));
				LC_WriteContact(LKF[2],5,(temp_val>>5));
				LC_WriteContact(LKF[2],6,(temp_val>>6));
				LC_WriteContact(LKF[2],7,(temp_val>>7));
				LC_WriteContact(LKF[2],8,(temp_val>>8));
				LC_WriteContact(LKF[2],9,(temp_val>>9));
				LC_WriteContact(LKF[2],10,(temp_val>>10));
				LC_WriteContact(LKF[2],11,(temp_val>>11));	 
				//P0[CLR]|=1<<22;
				break;
			}
		}	
	VICVectAddr=0x0;
}

void UART0Handler() __irq				//����������, ���� ������ ������ �� �������� ����������
{			
	int Status=U0IIR&0xE;		
	UART0_Read(buff,4);					//�������� 4 ����� � �������
	if (buff[0]==45)				//��������� � ����� �������� ���
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			if (buff[2]==1)			    //��������� � ����� ������ ������ ������ ��� � �������� 32 ��� (��� �������� ���)
			{
				VICIntEnClr=(1<<7)|(1<<16)|(1<<28);		//��� ����� ��������� ��� ���������� ����� UART0	
			}
			else if (buff[2]==0)
			{
				VICIntEnable=(1<<6)|(1<<7)|(1<<16)|(1<<28);
			}
			DIR1[SET]|=DIR1_VAL;
			uart1->Send(buff,4);				//���������� ������ ������ ���

			if ((U1LSR&1)!=0)buf_yalk[0]=U1RBR;	//��������� ������ ������ �� ������ ���

			UART0_Send(buf_yalk,1);			//���������� �������� ���������� ������ ���������

 			uint delay=25;
			while(--delay);
			DIR1[CLR]|=DIR1_VAL;			//���������� ���� DIR1
			FIO2CLR|=1<<10;					//���������� ���� DIR0
		}
	}
	else if (buff[0]==44)					
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			if (buff[2]==1) TestYALKFlag=1;	  //��������� � ����� �������� ���-96
			if (buff[2]==0) TestYALKFlag=0;
		}	
	}
	else if (buff[0]==52)				//��������� � ����� �������� ���
	{
		if (CalcCRC8(buff,3)==buff[3])
		{
			VICIntEnClr=(1<<16)|(1<<7)|(1<<28);			

			DIR2[SET]|=DIR2_VAL;
			uart2->Send(buff,4);				//���������� ������ ������ ���
			uint delay=50;
			while(--delay);
			DIR2[CLR]|=DIR2_VAL;

			while ((U2LSR&1)==0);
			UART2_Read(buff2,14);

			UART0_Send(buff2,14);			//���������� �������� ���������� ������ ���������

 			delay=50;
			while(--delay);
			FIO2CLR|=1<<10;					//���������� ���� DIR0
		}
	}
	else if ((buff[0]==175)&&(NumberPacket==0))					//�������� ����� �� 12 ����
	{
		 for (int i=0;i<4;i++) buff2[i]=buff[i];
		 NumberPacket=1;
	}
	else if (NumberPacket!=0)
	{
		if (NumberPacket==1)
		{
			for (int i=0;i<4;i++) buff2[i+4]=buff[i];
			NumberPacket=2;
		}
		else if (NumberPacket==2)
		{
			for (int i=0;i<4;i++) buff2[i+8]=buff[i];
			NumberPacket=0;							
			if (CalcCRC8(buff2,11)==buff2[11])
				if ((buff2[1]&2)!=0) 
				{					
					FIO0SET|=1<<26;				
					DIR1[SET]|=DIR1_VAL;
					uart1->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR1[CLR]|=DIR1_VAL;			//���������� ���� DIR1
					FIO0CLR|=1<<26;
				}
				else 
				{
					FIO0SET|=1<<26;
					DIR2[SET]|=DIR2_VAL;
					uart2->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR2[CLR]|=DIR2_VAL;			//���������� ���� DIR1
					FIO0CLR|=1<<26;
				}	
		}
	}
	else if ((buff[0]==176)&&(NumberPacket3==0))					//�������� ����� �� 12 ����
	{
		 for (int i=0;i<4;i++) buff2[i]=buff[i];
		 NumberPacket3=1;
	}
	else if (NumberPacket3!=0)
	{
		if (NumberPacket3==1)
		{
			for (int i=0;i<4;i++) buff2[i+4]=buff[i];
			NumberPacket3=2;
		}
		else if (NumberPacket3==2)
		{
			for (int i=0;i<4;i++) buff2[i+8]=buff[i];
			NumberPacket3=0;							
			if (CalcCRC8(buff2,11)==buff2[11]){
				if ((buff2[1]&2)!=0) 
				{					
					FIO0SET|=1<<26;				
					DIR1[SET]|=DIR1_VAL;
					uart1->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR1[CLR]|=DIR1_VAL;			//���������� ���� DIR1
					FIO0CLR|=1<<26;
				}
				else 
				{
					FIO0SET|=1<<26;
					DIR2[SET]|=DIR2_VAL;
					uart2->Send(buff2,12);
					uint delay=50;
					while(--delay);
					DIR2[CLR]|=DIR2_VAL;			//���������� ���� DIR1
					FIO0CLR|=1<<26;
				}	
			}
		}
	}		
	else if ((buff[0]==27)&&(NumberPacket2==0))										 //���� ������ ����� �� ��������� ����� ������ ������� ���(������ 68 ����)
	{		
		for (int i=0;i<4;i++) buff2[i]=buff[i];
		NumberPacket2=1;
	}			 
	else if (NumberPacket2!=0)
	{
		switch (NumberPacket2)
		{
			case 1: for (int i=0;i<4;i++) buff2[i+4]=buff[i]; NumberPacket2=2; break;
			case 2: for (int i=0;i<4;i++) buff2[i+8]=buff[i]; NumberPacket2=3; break;
			case 3: for (int i=0;i<4;i++) buff2[i+12]=buff[i]; NumberPacket2=4; break;
			case 4: for (int i=0;i<4;i++) buff2[i+16]=buff[i]; NumberPacket2=5; break;
			case 5: for (int i=0;i<4;i++) buff2[i+20]=buff[i]; NumberPacket2=6; break;
			case 6: for (int i=0;i<4;i++) buff2[i+24]=buff[i]; NumberPacket2=7; break;
			case 7: for (int i=0;i<4;i++) buff2[i+28]=buff[i]; NumberPacket2=8; break;
			case 8: for (int i=0;i<4;i++) buff2[i+32]=buff[i]; NumberPacket2=9; break;
			case 9: for (int i=0;i<4;i++) buff2[i+36]=buff[i]; NumberPacket2=10; break;
			case 10: for (int i=0;i<4;i++) buff2[i+40]=buff[i]; NumberPacket2=11; break;
			case 11: for (int i=0;i<4;i++) buff2[i+44]=buff[i]; NumberPacket2=12; break;
			case 12: for (int i=0;i<4;i++) buff2[i+48]=buff[i]; NumberPacket2=13; break;
			case 13: for (int i=0;i<4;i++) buff2[i+52]=buff[i]; NumberPacket2=14; break;
			case 14: for (int i=0;i<4;i++) buff2[i+56]=buff[i]; NumberPacket2=15; break;
			case 15: for (int i=0;i<4;i++) buff2[i+60]=buff[i]; NumberPacket2=16; break;
			case 16: 
				{
					for (int i=0;i<4;i++) buff2[i+64]=buff[i];
					NumberPacket2=0;
					if (CalcCRC16(buff2,66)==(buff2[66]|(buff2[67]<<8)))
					{
						EraseSector((unsigned short)(Clk_CPU));			 //ochishaem sector flash pamyati
						if (SetState(buff2+1, (unsigned short)(Clk_CPU), 64)==1) 
						{
							for (int i=0;i<3;i++) buff[i]=27;
							buff[3]=CalcCRC8(buff,3);
							UART0_Send(buff,4);							 //���������� �������������
							uint delay=50;
							while(--delay);
							FIO2CLR|=1<<10;								 //���������� DIR0
							for (int i=0;i<64;i++) TempModeTable[i]=buff2[i+1];
						}	
					}
				}
		}		  
	}
		
		 	
	VICVectAddr=0;
}
