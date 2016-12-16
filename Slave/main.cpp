#include "./../my_lib/pinsel.h"
#include "./../my_lib/fastport.h"
#include "./../my_lib/vic.h"
#include "./../my_lib/uart.h"
#include "./../my_lib/crc8.h"
#include "./../my_lib/crc16.h"
#include "./../my_lib/ssp.h"
 
#include "busprotocol.h"
#include "packdata.h"
#include "doublebufferushort.h"
#include "bdcstream.h"
#include "emcfifo.h"

#define _COP_DBG__
//----------------������� ������-----------------------

BUS *bus[3];	//����
//������ �����
//������� ������ ID
enum {COP_ID=18,BDC_ID=1,TEMP2_ID=52};
BDCPack bdc_query={BDC_ID,65,1,};    //��������� ����� ��� ����
BDCPack bdc2_query = {BDC_ID, 65, 1};

byte temp_query[4]={TEMP2_ID,0,0,0}; //������ �� ������������� ������
byte cop_query[4]={COP_ID};

//----------------������� ���������---------------------
UART *uart3,*uart2,*uart1;
SSP* ssp1;
FastPort P0,DIR6,DIR5,P4, DIR7;
const uint DIR6_VAL=1,DIR5_VAL=1<<12, DIR7_VAL=1<<3;

extern "C"{
	void UART1Handler() __irq;
	void UART2Handler() __irq;
	void UART3Handler() __irq;
}
#define DBG_0 1<<31
#define DBG_1 1<<4


//ushort send[8]; 
//------------------------------------------------
const ushort MAX_SCALE=450;
const ushort MIN_SCALE=63;

const unsigned char HASHYATP[32]={2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,0,1};


//���������� ������� ���-����� ����� ������� � �������
#define TRANSFER_SIZE 6
//80
//���������� ������
#define MAX_INDEX 160
//������� ������ ������ ��� ������� �������� 
struct MultyBuffer{
	ushort &index; //������, �� ���������!!!!! �� 0 ���� � 5������� ������ ������, �� �����  �����/������� 
	uint read; //����� ������� �� ������
	uint write;//����� ������� �� ������
	ushort data[2][MAX_INDEX][TRANSFER_SIZE] ;
};
//������ ��� ������ ������ ������� ������������� read[0],
ushort read[TRANSFER_SIZE]; 		//������ ������ �� ���������� SSP1
MultyBuffer SSP_BUF={read[0],0,1,};
//-----------������� �������� ��� ���������---------
//���� ��� ������
#define $MB_WriteBuf SSP_BUF.data[SSP_BUF.write]
//���� ��� ������
#define $MB_ReadBuf SSP_BUF.data[SSP_BUF.read]
#define $MB_Index SSP_BUF.index

//������ ���2
struct {
	byte addr;
	byte val;
}Temp2Num;
//������ ��� ������ �������
struct{
  	byte ULK_PWR;  		
	byte NI;
	byte BI;
	byte STATE;
}COPNum;

//������� ������ ������ ��� ���
DoubleBufferUshort *bdc_buf;
DoubleBufferUshort *bdc2_buf; //����������� ����� ��� ���2
//��������� �������� ������ � �������  ��� ���������� ����������
/*
255 ������� ��� ������ �������� �� ����� 
������ ������� ��� ����� �����/������� � ����� ������
�������� �� ������� ������� ��� ����� ������� � ������ ���������� ����������
*/
	const byte PROG_ANALOG_PACK[160]={

255,
0,16,1,17,2,18,3,19,
4,5,21,6,22,7,23,8,
24,9,10,11,12,13,14,15,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
0,16,1,17,2,18,3,19,
4,5,21,6,22,7,23,8,
24,9,10,11,12,13,14,15,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255,255,
255,255,255,255,255,255,255
	};
	//544 �����	 272 ���������� �����
	//20 ���� 18�(int) 3 ������ 2 ������ =480 ���� 
	//32 16 ���� ��� ���������� ���������� (short)	=64 �����
	const uint BDC_DATA_SIZE=272;
	ushort *analog_data;    // ����� ������ ���������� ���
	uint analog_data_count=0; // �������
	ushort *analog2_data; //������ ��� ���2
	uint analog2_data_count=0;
int main(){
	/*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*
		  ��������� ���������
	?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*?*/
	//-------�����--------
	SCS|=1;					//������� �����
	P0=GetFastPort(PORT_0);	//������� DBG_0
	P0[DIR]|=DBG_0;
	P4=GetFastPort(PORT_4);	//DBG_1
	P4[DIR]|=DBG_1;
	DIR6=GetFastPort(PORT_2); //RS485 ����1
	DIR6[DIR]|=DIR6_VAL;
	DIR5=GetFastPort(PORT_2); //Rs485 ����0
	DIR5[DIR]|=DIR5_VAL;
	DIR7=GetFastPort(PORT_2); //RS485 ����2
	DIR7[DIR]|=DIR7_VAL;
	
	InitEMC();//��
	//--------UART-------------
	PREPARE_UART
	/*	8 ��� ���� �������� ��� 
		��� �������� ��������
		���������� �� 8 ������ � �������
		�������� 4,8 ���
	*/
	UARTOption u_opt={0,0,1,3,7|2<<6};
	//uart2 
	uart2=UART::Get(2);
	uart2->Init(&u_opt);
	//����
	PINSEL::Set(0,10,func_01);			//Tx
	PINSEL::Set(0,11,func_01);			//Rx
	VIC::InstallIRQ(VIC::UART2_INT,(void*)UART2Handler,0);

	//uart1
	u_opt.fcr|=(3<<6);
	uart1=UART::Get(1);
	uart1->Init(&u_opt);
	PINSEL::Set(0,15,func_01);	 //Tx
	PINSEL::Set(0,16,func_01);	 //Rx
	VIC::InstallIRQ(VIC::UART1_INT,(void*)UART1Handler,1);
	
	//uart3
	uart3=UART::Get(3);
	uart3->Init(&u_opt);
	PINSEL::Set(0,0,func_10);	 //Tx
	PINSEL::Set(0,1,func_10);	 //Rx
	VIC::InstallIRQ(VIC::UART3_INT,(void*)UART3Handler,1);
	
	//--------SSP-----------
	PREPARE_SSP
	/*16 ��� ����� SPI SLAVE �������� 7,68 ���*/
	
	//10 bit ssp   7,68 MHz 
	const SSPOption ssp_opt={
	   0xF,0,0,8,0,0,1,0,0,0
	};
	ssp1=SSP::Get(1);
	ssp1->Init(&ssp_opt);
	//����
	PINSEL::Set(0,6,func_10);  //ssel1
	PINSEL::Set(0,7,func_10);  //sck1
	PINSEL::Set(0,8,func_10);  //mosi1
	PINSEL::Set(0,9,func_10);  //miso1
	
	/*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&
	  ������������� �������� ������
	&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*/
	uint cnt=0;
	for (uint i=0;i<MAX_INDEX;i++){
		SSP_BUF.data[SSP_BUF.read][i][0]=cnt;
		SSP_BUF.data[SSP_BUF.write][i][0]=cnt;
		cnt++;
	}
	//������� ���

//-------------------����----------------------------//
 	bus[0]= new BUS(DIR5,DIR5_VAL,uart1);
	bus[1]= new BUS(DIR6,DIR6_VAL,uart2);
	bus[2]= new BUS(DIR7, DIR7_VAL, uart3);
	//---------------------------------------
	//������� CRC ��� ��������
	bdc_query.crc16=CalcCRC16((byte*)&bdc_query,6);
	bdc2_query.crc16=CalcCRC16((byte*)&bdc2_query, 6);///////////////////////////////////////////////////////////////////////////////-----------------------------------------
	
	cop_query[3]=CalcCRC8(cop_query,3);
	
	//�������� ������ ������ �������
	const PowerCellData cop_data={444,200,400,7};

	//----------------------���----------------------------
	//������
	//������ ���
	BDCStream16 stream1;
	BDCStream16 stream2;
	
	uint bdc_save;
	ushort *bdc_ptr=(ushort*)&bdc_save;
	//�������������� ������ 
	bdc_buf=new DoubleBufferUshort(new ushort[BDC_DATA_SIZE*2],BDC_DATA_SIZE);
	
	//��������� �������� ��� ��� ���2
	bdc2_buf = new DoubleBufferUshort(new ushort[BDC_DATA_SIZE*2],BDC_DATA_SIZE);
	BDCStream16 stream3;
	BDCStream16 stream4;
	uint bdc2_save;
	ushort *bdc2_ptr=(ushort*)&bdc2_save;
	
	SSP_BUF.index=0;	
	
	#ifdef __SYNC_OFF__
		$MB_Index=0;
	#endif

	ssp1->ClearRxFIFO();

	WDCLKSEL=1;                     
	WDTC=480000;                     	          //������������ ������ 25 ��                     	
	WDMOD=3;                       	
	WDFEED = 0xAA;					
  WDFEED = 0x55;

//&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&*&//
//-------------------�������� ����----------------//
	while(1){
		P0[SET]|=DBG_0;
		P0[CLR]|=DBG_0;	
		int place;
		//���� �������
		#ifndef __SYNC_OFF__	
		ssp1->Read(read,TRANSFER_SIZE);

		#endif
		
		//����� ����� ������ ��� ������ 		   
		if(++$MB_Index>=MAX_INDEX){
			$MB_Index=0;  //��������
			//����������� ������
			uint tmp=SSP_BUF.read;
			SSP_BUF.read=SSP_BUF.write;
			SSP_BUF.write=tmp;
			//����� ��������� ����!
			//CLEAR_TICK
		}
		P4[SET]|=1<<4;
		
		//----------�� ������ ������� ��������---------//
		//100/50��
		switch(SSP_BUF.index){
		//-----------����������� ------------------
			//���!
			case 3:{
				//������ �� �����������
				Temp2Num.addr=78;
				Temp2Num.val=79;
				//100�� �������
		
				bus[0]->SendQuery(temp_query,4);
				//NextTempQuery(temp_query);
				temp_query[1]=read[1];
				temp_query[1]&=0x1F;
				temp_query[2]=read[2];
				temp_query[3]=CalcCRC8(temp_query,3);

				WDFEED = 0xAA;					
				WDFEED = 0x55;
				break;	
			}
			//����������� ���!
			case 83:{
				Temp2Num.addr=158;
			   	Temp2Num.val=159;
		
				bus[0]->SendQuery(temp_query,4);
				//NextTempQuery(temp_query);
				temp_query[1]=read[1];
				temp_query[1]&=0x1F;
				temp_query[2]=read[2];
				temp_query[3]=CalcCRC8(temp_query,3);  

				WDFEED = 0xAA;					
				WDFEED = 0x55;
			 	break;
			}
//--------------------------������ �������--------------------//
			//����������� ��� ��������!
			case 70:{//100��
				//��������� ������ ��� ��������
				
				COPNum.ULK_PWR=70;
				COPNum.NI=71;
				COPNum.BI=72;
				COPNum.STATE=73;
				#ifdef _COP_DBG__
					//���������� �������� � ������ �������
					$MB_WriteBuf[COPNum.ULK_PWR][4]=0; 	//ULK_PWR
					$MB_WriteBuf[COPNum.NI][4]=0; 			//NI
					$MB_WriteBuf[COPNum.BI][4]=0;			//answ->BI;	//BI
					$MB_WriteBuf[COPNum.STATE][4]=7;		//answ->STATE; 	//STATE!
				#endif  
				//��������� ������ � ��
			//	cop_query[2]=50;
				cop_query[2]=read[3];
				cop_query[3]=CalcCRC8(cop_query,3);
				bus[0]->SendQuery(cop_query,4);
				break;
			}
			case 150:{

				//��������� ������ ��� ��������
				COPNum.ULK_PWR=150;
				COPNum.NI=151;
				COPNum.BI=152;
				COPNum.STATE=153;
				#ifdef _COP_DBG__
					//���������� �������� � ������ �������
					$MB_WriteBuf[COPNum.ULK_PWR][4]=0; 	//ULK_PWR
					$MB_WriteBuf[COPNum.NI][4]=0; 			//NI
					$MB_WriteBuf[COPNum.BI][4]=0;			//answ->BI;	//BI
					$MB_WriteBuf[COPNum.STATE][4]=7;		//answ->STATE; 	//STATE!
				#endif  
				//��������� ������ � ��
				cop_query[2]=50;
				cop_query[3]=CalcCRC8(cop_query,3);
				bus[0]->SendQuery(cop_query,4);
				break;
			}

		//---------------------���-------------------------
			case 0:{
				bdc_buf->Switch(); //����������� ������
				stream1.SetData((uint*)bdc_buf->GetForReadBuf(120));
				stream2.SetData((uint*)bdc_buf->GetForReadBuf(120));
				//������� ������� ����������� ���������� ������
				//�������� ��������
				stream1.ClearCount();
				stream2.ClearCount();
				//���������� ���������
				analog_data=bdc_buf->GetForReadBuf(32);
		
				bus[1]->SendQuery(&bdc_query,sizeof(BDCPack));
				analog_data_count=0;
				break;
			}
			case 80:{
				bdc_buf->Switch();
				stream1.SetData((uint*)bdc_buf->GetForReadBuf(120));
				stream2.SetData((uint*)bdc_buf->GetForReadBuf(120));

				stream1.ClearCount();
				stream2.ClearCount();
				
				//���������� ���������
				analog_data=bdc_buf->GetForReadBuf(32);
				analog_data_count=0;				
				bus[1]->SendQuery(&bdc_query,sizeof(BDCPack));
				break;
			}
			//-----------------------------------------------------����� ����������� ��� ��� ���2 �� ����-3---------------------------------------------
			case 40:{
				bdc2_buf->Switch(); //����������� ������
				stream3.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				stream4.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				//������� ������� ����������� ���������� ������
				//�������� ��������
				stream3.ClearCount();
				stream4.ClearCount();
				//���������� ���������
				analog2_data=bdc2_buf->GetForReadBuf(32);
		
				bus[2]->SendQuery(&bdc2_query,sizeof(BDCPack));
				analog2_data_count=0;
				break;
			}
			case 120:{
				bdc2_buf->Switch();
				stream3.SetData((uint*)bdc2_buf->GetForReadBuf(120));
				stream4.SetData((uint*)bdc2_buf->GetForReadBuf(120));

				stream3.ClearCount();
				stream4.ClearCount();
				
				//���������� ���������
				analog2_data=bdc2_buf->GetForReadBuf(32);
				analog2_data_count=0;				
				bus[2]->SendQuery(&bdc2_query,sizeof(BDCPack));
				break;
			}
		}
		//8��� ���� ���� 
		//----------------------���--------------------
		//������
		if(PROG_ANALOG_PACK[$MB_Index]!=255){
			$MB_WriteBuf[$MB_Index][4]=analog_data[PROG_ANALOG_PACK[$MB_Index]];
		
		}
		
		//�����
		bdc_ptr[0]=stream1.GetHash();
		bdc_ptr[1]=stream2.GetHash();
		$MB_WriteBuf[$MB_Index][0]=bdc_ptr[0]; //1 �����
		$MB_WriteBuf[$MB_Index][1]=bdc_ptr[1]; //2 �����
		
		bdc2_ptr[0]=stream3.GetHash();
		bdc2_ptr[1]=stream4.GetHash();
			//���2 �����
		bdc_save=ReadWriteFifo(bdc_save);
		
		place = $MB_Index;
			if ((place-40)<0) place=160+place;	
			//����������� ����� + ���2
		$MB_WriteBuf[$MB_Index][2]=bdc_ptr[0];
		$MB_WriteBuf[place-40][3]=bdc2_ptr[0];//bdc_ptr[1];
		$MB_WriteBuf[place-40][5]=bdc2_ptr[1];

/*���������� �������� � ����� � ����������� ��������� �������, ������ ����� �� ������ ������ ���1��(1) � ���2(1)
		//���� ���� � ���� ������ ���2********************
		if (read[4] != 0) {
			place = $MB_Index;
			if ((place-40)<0) place=160+place;
			bdc2_ptr[0]=stream3.GetHash();
			bdc2_ptr[1]=stream4.GetHash();
			//���2 �����
			
			//$MB_WriteBuf[place-40][2]=bdc2_ptr[0]; 
			//$MB_WriteBuf[place-40][3]=bdc2_ptr[1];
			
			bdc_save=ReadWriteFifo(bdc_save);
			
			//����������� ����� + ���2
			$MB_WriteBuf[$MB_Index][2]=bdc_ptr[0];
			$MB_WriteBuf[$MB_Index][3]=bdc2_ptr[0];//bdc_ptr[1];
			//������ ������ ���� ������ ������ ����� ���2
			$MB_WriteBuf[$MB_Index][5]=bdc2_ptr[1];
			
		}
		//���� ���� � ������� ������ ���1��********************
		else {
			bdc_save=ReadWriteFifo(bdc_save);
			//����������� �����
			$MB_WriteBuf[$MB_Index][2]=bdc_ptr[0];
			$MB_WriteBuf[$MB_Index][3]=bdc_ptr[1];
		}
		
*/
		
		//����� ����� ������������
		#ifndef __SYNC_OFF__
			ssp1->Send($MB_ReadBuf[SSP_BUF.index],TRANSFER_SIZE);
		#endif
		
	} 
	return 0; 
}


//-------------����������� ���������� � ������� ��������� ������-------------//
void UART3Handler() __irq{
	//���2 �� ����
	byte* buf = (byte*)bdc2_buf->GetForWriteBuf(4);
	uart3->Read(buf, 8);
	VIC::ClearInt();
}
void UART2Handler() __irq{
	//���
	byte* buf=(byte*)bdc_buf->GetForWriteBuf(4);
	uart2->Read(buf,8);	
	VIC::ClearInt();
}
//������ �������!!! � �����������
void UART1Handler() __irq{
	byte buf[14];
	uart1->Read(buf,14);
	//� ��� ��� � ��� ������? =)
	switch(bus[0]->GetID()){
		case COP_ID : {
			COPAnswer *answ=(COPAnswer*)buf;
			//ushort ulk_pwr=buf[13];
		    $MB_WriteBuf[COPNum.ULK_PWR][4]=answ->ULK_PWR; 	//ULK_PWR
			$MB_WriteBuf[COPNum.NI][4]=answ->NI; 			//NI
			$MB_WriteBuf[COPNum.BI][4]=answ->BI;			//answ->BI;	//BI
			$MB_WriteBuf[COPNum.STATE][4]=answ->STATE;		//answ->STATE; 	//STATE!
			break;
		}
		case TEMP2_ID: {
			$MB_WriteBuf[Temp2Num.val][4]=*((ushort*)(buf+2));
			$MB_WriteBuf[Temp2Num.addr][4]=HASHYATP[buf[1]&0x1F];
			break;
		}	
	};
	VIC::ClearInt();
}