#ifndef YALK_POLL_H
#define YALK_POLL_H
 /*
 ����� �� ����������� � ���!!! ����������!
 */
struct PollingNumber{
	byte analog;
	byte contact;
	byte lkf;
	byte chan;
};
//PROG_POLL_LKF
//��������� ������ ���96
//---------------
uint PPLL_COUNT=10;

#define CLC_POLL_SIZE  160
/*
80 Umin
81 Umax
82 U���������
*/	  
struct CLCPoll{
	byte ID;
	byte analog;
	byte contact;
	byte crc8;
	byte lkf;
	byte chan;
	byte writemode;			//1-������ � ���� ������ ������, 2-������ � ���� ������ ����������, 0-����� � ������ � ����������
};
#define CLC96_1 0
#define CLC96_2 1
	
	#define CT_ID 0x34	  //����� ������ ������������� �������������� ���1
	#define CLC2_ID 43  //����� ������ ���������� ����������� ���96-2
	#define CLC1_ID 42    //����� ������ ���������� ����������� ���96-1

/*static const*/ CLCPoll clcpolltable[2][CLC_POLL_SIZE]={
//---- ��������� ������ ��� ���96-1 ----//
42,78,82,20,0,21,2,
42,32,82,44,255,255,0,
42,31,82,7,0,0,1,
42,30,82,243,1,1,1,
42,37,82,91,1,2,1,
42,36,82,175,1,3,1,	 
42,35,82,1,1,4,1,	
42,34,82,245,1,5,1,
42,3,82,221,1,6,1,			 
42,2,82,41,1,7,1,
42,1,82,4,1,8,1,
42,0,82,240,1,9,1,
42,7,82,94,1,10,1,
42,72,82,78,1,11,1,
42,5,82,135,1,12,1,
42,15,82,105,0,8,1,			 
42,14,82,157,1,14,1,
42,13,82,176,1,15,1,
42,12,82,68,1,16,1,
42,11,82,234,1,17,1,
42,10,82,30,1,18,1,
42,9,82,51,1,19,1,
42,8,82,199,1,20,1,
42,53,82,53,1,21,1,
42,79,82,224,1,22,1,
42,56,82,117,1,27,1,
42,57,82,129,0,16,1,
42,34,82,245,1,25,1,
42,73,82,186,1,26,1,			 
42,80,80,117,1,23,1,			 
42,81,82,227,0,24,1,			
42,49,82,182,255,255,0,		 
42,80,48,206,0,13,1,
42,47,16,234,1,31,1,
42,80,80,117,1,32,2,		   	 
42,59,82,88,1,33,0,			
42,17,42,43,255,255,0,
42,80,43,103,1,48,1,				 
42,80,80,117,1,36,0,					  		  
42,58,82,172,1,37,2,					   
42,21,65,249,255,255,0,
42,80,80,117,1,49,1,			 
42,31,18,58,1,40,0,
42,80,24,241,255,255,0,	   
42,63,25,12,1,34,0,
42,81,26,103,1,43,2,
42,35,41,19,1,44,0,
42,80,80,117,1,45,0,						
42,34,4,45,1,38,0,		
42,2,64,8,255,255,0,
42,1,71,178,1,39,0,
42,80,80,117,1,41,0,			
42,44,82,152,1,42,0,
42,45,82,108,255,255,0,
42,5,27,50,1,52,1,
42,15,28,75,1,53,1,		 
42,66,82,160,1,46,0,						
42,38,82,118,1,47,0,
42,80,80,117,1,56,1,			 
42,67,82,84,1,54,1,
42,80,82,23,255,255,0,
42,80,80,117,1,59,1,			  
42,80,80,117,1,60,1,			  
42,82,82,206,255,255,0,
42,80,80,117,255,255,0,		  
42,80,80,117,1,63,1,	   		  
42,82,82,206,255,255,0,
42,34,82,245,255,255,0,
42,80,82,23,0,63,1,		  
42,80,82,23,1,55,1,
42,81,82,227,0,28,1,
42,80,80,117,1,28,1,			  
42,81,33,72,1,13,1,	   
42,80,74,237,255,255,0,	   
42,80,29,4,254,255,0,	   
42,80,80,117,0,19,2,			  
42,80,60,179,0,17,2,		 
42,80,80,117,255,255,0,		  
42,80,75,220,1,35,2,	   
42,80,80,117,255,255,0,		  
42,78,82,20,0,21,2,		  
42,32,82,44,255,255,0,
42,31,82,7,0,32,1,		   
42,30,82,243,1,1,1,
42,37,82,91,1,2,1,
42,36,82,175,1,3,1,
42,35,82,1,1,4,1,
42,34,82,245,1,5,1, 
42,3,82,221,1,6,1,
42,2,82,41,1,7,1,
42,1,82,4,1,8,1,
42,0,82,240,1,9,1,
42,7,82,94,1,10,1,
42,72,82,78,1,11,1,
42,5,82,135,1,12,1,
42,15,82,105,0,40,1,
42,14,82,157,1,14,1,
42,13,82,176,1,15,1,
42,12,82,68,1,16,1,
42,11,82,234,1,17,1,
42,10,82,30,1,18,1,
42,9,82,51,1,19,1,
42,8,82,199,1,20,1,
42,53,82,53,1,21,1,
42,79,82,224,1,22,1,
42,56,82,117,1,27,1,
42,57,82,129,0,48,1,
42,34,82,245,1,25,1,
42,73,82,186,1,26,1,
42,80,80,117,1,23,1,			
42,81,82,227,0,56,1,		
42,49,82,182,255,255,0,
42,80,48,206,0,13,1,
42,47,16,234,1,31,1,
42,80,80,117,1,32,2,			 
42,59,82,88,1,33,0,		  
42,17,42,43,255,255,0,
42,80,43,103,1,48,1,
42,80,80,117,1,36,0,			 
42,58,82,172,1,37,2,
42,21,65,249,255,255,0,
42,80,80,117,1,49,1,			  
42,31,18,58,1,40,0,
42,80,24,241,255,255,0,			
42,63,25,12,1,34,0,
42,81,26,103,1,43,2,
42,35,41,19,1,44,0,				 
42,80,80,117,1,45,0,					
42,34,4,45,1,38,0,
42,2,64,8,255,255,0,
42,1,71,178,1,39,0,
42,80,80,117,1,41,0,			 
42,44,82,152,1,42,0,
42,45,82,108,255,255,0,
42,5,27,50,1,52,1,
42,15,28,75,1,53,1,
42,66,82,160,1,46,0,		   				
42,38,82,118,1,47,0,
42,80,80,117,1,56,1,			  
42,67,82,84,1,54,1,
42,80,82,23,255,255,0,
42,80,80,117,1,59,1,			  
42,80,80,117,1,60,1,			  
42,82,82,206,255,255,0,
42,80,80,117,255,255,0,		  
42,80,80,117,1,63,1,			  
42,80,80,117,255,255,0,		  
42,34,82,245,255,255,0,
42,80,82,23,255,255,0,
42,80,82,23,1,55,1,
42,81,82,227,0,28,1,
42,80,80,117,1,28,1,			  
42,81,33,72,1,13,1,   	    
42,80,74,237,255,255,0,	   
42,80,29,4,254,255,0,					
42,80,80,117,0,19,2,			  
42,80,60,179,0,17,2,	 
42,80,80,117,255,255,0,		  
42,80,75,220,1,35,2,					
42,80,80,117,255,255,0,		  
//----��������� ������ ��� ���96-2 � �����������----//
43	,	36	,	82	,	233	,	2	,	63	,	1,			//1-PG1,-	
0	,	0	,	0	,	75	,	255	,	255	,	0,			
43	,	0	,	82	,	182	,	2	,	5	,	1,	 		//2-PG4,-
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	10	,	48	,	129	,	2	,	11	,	1,	 		//3-PR7,��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	33	,	19	,	146	,	2	,	20	,	0,	 		//4-��3,��4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	37	,	82	,	29	,	2	,	25	,	0,	 		//5-������2��
0	,	0	,	0	,	75	,	255	,	255	,	0, 
43	,	63	,	82	,	157	,	2	,	4	,	1,	 		//6-����
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	15	,	82	,	47	,	2	,	9	,	1,	  		//7-PR1
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	55	,	4	,	114	,	2	,	15	,	1,			//8-PR8, ������3��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	20	,	66	,	24	,	2	,	24	,	0,	 		//9-��1, ������5��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	59	,	41	,	12	,	2	,	39	,	0,	 		//10-PG3, ��2
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	48	,	0,	  		//11-PG1,��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	60	,	18	,	2	,	21	,	0,	 		//12-PG4,����
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	54	,	16	,	1	,	2	,	27	,	0,	 		//13-PR3,���
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	32	,	82	,	106	,	2	,	23	,	0,	 		//14-������1��,-
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	35	,	82	,	71	,	2	,	1	,	1,	 		//15-PG6
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	1	,	82	,	66	,	2	,	6	,	1,			//16-PG7  
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	12	,	58	,	0	,	2	,	10	,	1,		  	//17-PG9,��1
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	57	,	61	,	82	,	2	,	18	,	0,   		//18-PG11,��2
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	22	,	13	,	210	,	2	,	26	,	0,		  	//19-��2,������2��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	45	,	82	,	42	,	2	,	41	,	0,			//20-��6					  
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	67	,	155	,	2	,	56	,	1,	 		//21-PG1,������4��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	37	,	0,   		//22-PG4					  
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	44	,	48	,	7	,	2	,	43	,	1,			//23-��4,��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	31	,	19	,	77	,	2	,	52	,	0,			//24-PG5,��4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	34	,	82	,	179	,	2	,	57	,	0,   		//25-PR6
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	7	,	82	,	24	,	2	,	7	,	1,   		//26-PR4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	11	,	47	,	24	,	2	,	12	,	1,			//27-PR2,��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	56	,	42	,	114	,	2	,	19	,	0,   		//28-PG12,��4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	23	,	38	,	74	,	2	,	30	,	0,		   	//29-��3,��2
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	80	,	82	,	81	,	2	,	42	,	0,			//30-0�
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	60	,	1,			//31-PG1,��3
52	,	0	,	0	,	191	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	53	,	0,	 		//32-PG4,-
0	,	0	,	0	,	75	,	255	,	255	,	0,			 
43	,	39	,	16	,	155	,	2	,	59	,	1,			//33-��5,���			  
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	30	,	82	,	181	,	2	,	55	,	0,	 	 	//34-PR5   
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	3	,	82	,	155	,	2	,	3	,	1,			//35-������3��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	5	,	82	,	193	,	2	,	8	,	1,			//36-PG8
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	8	,	14	,	130	,	2	,	14	,	1,			//37-PG10,������1�� 
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	49	,	43	,	128	,	2	,	22	,	0,	  		//38-PG2,���
81	,	81	,	0	,	72	,	255	,	255	,  	0,
43	,	81	,	40	,	134	,	2	,	31	,	0,		   	//39-6,2�, ��1
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	82	,	82	,	136	,	2	,	45	,	0,			//40-����. ������
0	,	0	,	0	,	75	,	255	,	255	,	0,			///////////////////////////////////////////
43	,	36	,	82	,	233	,	2	,	63	,	1,	  		//41-PG1,-
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	5	,	1,	  		//42-PG4,-
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	10	,	48	,	129	,	2	,	11	,	1,	  		//43-PR7,��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	33	,	19	,	146	,	2	,	20	,	0,	  		//44-��3,��4
0	,	30	,	0	,	72	,	255	,	255	,	0,
43	,	37	,	82	,	29	,	2	,	25	,	0,	  		//45-������2��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	63	,	82	,	157	,	2	,	4	,	1,	  		//46-����
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	15	,	82	,	47	,	2	,	9	,	1,	  	 	//47-PR1
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	55	,	4	,	114	,	2	,	15	,	1,	  		//48-PR8, ������3��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	20	,	66	,	24	,	2	,	24	,	0,	  		//49-��1, ������5��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	59	,	41	,	12	,	2	,	39	,	0,	  		//50-PG3,��2						 
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	48	,	0,   	  	//51-PG1, ��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	60	,	18	,	2	,	21	,	0,	  		//52-PG4, ����
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	54	,	16	,	1	,	2	,	27	,	0,	  		//53-PR3,���
0	,	0	,	0	,	75	,	255	,	255	,  	0,
43	,	32	,	82	,	106	,	2	,	23	,	0,	  		//54-������1��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	35	,	82	,	71	,	2	,	1	,	1,	  		//55-PG6
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	1	,	82	,	66	,	2	,	6	,	1,	 		//56-PG7	   
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	12	,	58	,	0	,	2	,	10	,	1,	  		//57-PG9,��1
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	57	,	61	,	82	,	2	,	18	,	0,	  		//58-PG11,��2
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	22	,	13	,	210	,	2	,	26	,	0,	  		//59-��2,������2��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	45	,	82	,	42	,	2	,	41	,	0,	  		//60-��6				 
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	67	,	155	,	2	,	56	,	1,	  	  	//61-PG1,������4��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	37	,	0,	  		//62-PG4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	44	,	48	,	7	,	2	,	43	,	1,	  		//63-��4,��3
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	31	,	19	,	77	,	2	,	52	,	0,	   		//64-PG5,��4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	34	,	82	,	179	,	2	,	57	,	0,	   		//65-PR6
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	7	,	82	,	24	,	2	,	7	,	1,	  		//66-PR4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	11	,	47	,	24	,	2	,	12	,	1,		 	//67-PR2,��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	56	,	42	,	114	,	2	,	19	,	0,   		//68-PG12,��4
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	23	,	38	,	74	,	2	,	30	,	0,  		//69-��3,��2
0	,	0	,	0	,	75	,	255	,	255	,	0,   
43	,	80	,	82	,	81	,	2	,	42	,	0,   		//70-0�
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	36	,	46	,	108	,	2	,	60	,	1,	 		//71-PG1,��3
52	,	1	,	0	,	75	,	255	,	255	,	0,
43	,	0	,	82	,	182	,	2	,	53	,	0,	  		//72-PG4,-
0	,	0	,	0	,	75	,	255	,	255	,	0,	   
43	,	39	,	16	,	155	,	2	,	59	,	1,	 		//73-��5,���		
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	30	,	82	,	181	,	2	,	55	,	0,  	 	//74-PR5
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	3	,	82	,	155	,	2	,	3	,	1,	 		//75-������3��
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	5	,	82	,	193	,	2	,	8	,	1,			//76-PG8
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	8	,	14	,	130	,	2	,	14	,	1,			//77-PG10,������1��  
0	,	0	,	0	,	75	,	255	,	255	,	0,
43	,	49	,	43	,	128	,	2	,	22	,	0,		 	//78-PG2,���
81	,	81	,	0	,	72	,	255	,	255	,	0,
43	,	81	,	40	,	134	,	2	,	31	,	0,		   	//79-6,2�, ��1
0	,	0	,	0	,	75	,	255	,	255	,  	0,
43	,	82	,	82	,	136	,	2	,	45	,	0,			//80-���� ������
0	,	0	,	0	,	75	,	255	,	255	,	0
};						

struct YALKTestPoll
{
	unsigned char ID;
	unsigned char analog;
	unsigned char contact;
	unsigned char analogchan;
	unsigned char contactchan;
};

struct YALKTestPoll YALKTestPollTable[160]={				//��������� ������ ������� ���-96 � ������ �������� ���-96
	42,	33,	42,255,255,   //1 				   
	42,	32,	43,255,255,	  //2
	42,	31,	44,	0,	50,	  //3
	42,	30,	45,	1,	51,	  //4
	42,	37,	38,	2,	52,	  //5
	42,	36,	39,	3,	53,	  //6
	42,	35,	40,	4,	54,	  //7
	42,	34,	41,	5,	55,	  //8
	42,	3,	4,	6,	56,	  //9
	42,	2,	67,	7,	57,	  //10
	42,	1,	66,	8,	58,	  //11
	42,	0,	65,	9,	59,	  //12
	42,	7,	64,	10,	60,	  //13
	42,	6,	71,	11,	61,	  //14
	42,	5,	24,	12,	62,	  //15
	42,	15,	25,	13,	63,	  //16
	42,	14,	26,	14,	64,	  //17
	42,	13,	27,	15,	65,	  //18
	42,	12,	28,	16,	66,	  //19
	42,	11,	29,	17,	67,	  //20
	42,	10,	85,	18,	68,	  //21
	42,	9,	84,	19,	69,	  //22
	42,	8,	91,	20,	70,	  //23
	42,	54,	50,	21,	71,	  //24
	42,	55,	51,	22,	72,	  //25
	42,	56,	52,	23,	73,	  //26
	42,	57,	70,	24,	74,	  //27
	42,	53,	69,	25,	75,	  //28
	42,	88,	68,	26,	76,	  //29
	42,	87,	76,	27,	77,	  //30
	42,	86,	77,	28,	78,	  //31
	42,	49,	78,	29,	79,	  //32
	42,	48,	79,	30,	80,	  //33
	42,	47,	72,	31,	81,	  //34
	42,	46,	73,	32,	82,	  //35
	42,	16,	74,	33,	83,	  //36
	42,	17,	75,	34,	84,	  //37
	42,	18,	90,	35,	85,	  //38
	42,	19,	92,	36,	86,	  //39
	42,	20,	93,	37,	87,	  //40
	42,	21,	94,	38,	88,	  //41
	42,	22,	95,	39,	89,	  //42
	42,	23,	96,	40,	90,	  //43
	42,	89,	97,	41,	91,	  //44
	42,	63,	98,	42,	92,	  //45
	42,	62,	99,	43,	93,	  //46
	42,	61,	80,	44,	94,	  //47
	42,	60,	81,	45,	95,	  //48
	42,	59,	82,	46,	96,	  //49
	42,	58,	83,	47,	97,	  //50
	42,	42,	33,	48,	98,	  //51
	42,	43,	32,	49,	99,	  //52
	42,	44,	31,	50,	0,	  //53
	42,	45,	30,	51,	1,	  //54
	42,	38,	37,	52,	2,	  //55
	42,	39,	36,	53,	3,	  //56
	42,	40,	35,	54,	4,	  //57
	42,	41,	34,	55,	5,	  //58
	42,	4,	3,	56,	6,	  //59
	42,	67,	2,	57,	7,	  //60
	42,	66,	1,	58,	8,	  //61
	42,	65,	0,	59,	9,	  //62
	42,	64,	7,	60,	10,	  //63
	42,	71,	6,	61,	11,	  //64
	42,	24,	5,	62,	12,	  //65
	42,	25,	15,	63,	13,	  //66
	42,	26,	14,	64,	14,	  //67
	42,	27,	13,	65,	15,	  //68
	42,	28,	12,	66,	16,	  //69
	42,	29,	11,	67,	17,	  //70
	42,	85,	10,	68,	18,	  //71
	42,	84,	9,	69,	19,	  //72
	42,	91,	8,	70,	20,	  //73
	42,	50,	54,	71,	21,	  //74
	42,	51,	55,	72,	22,	  //75
	42,	52,	56,	73,	23,	  //76
	42,	70,	57,	74,	24,	  //77
	42,	69,	53,	75,	25,	  //78
	42,	68,	88,	76,	26,	  //79
	42,	76,	87,	77,	27,	  //80
	42,	77,	86,	78,	28,	  //81
	42,	78,	49,	79,	29,	  //82
	42,	79,	48,	80,	30,	  //83
	42,	72,	47,	81,	31,	  //84
	42,	73,	46,	82,	32,	  //85
	42,	74,	16,	83,	33,	  //86
	42,	75,	17,	84,	34,	  //87
	42,	90,	18,	85,	35,	  //88
	42,	92,	19,	86,	36,	  //89
	42,	93,	20,	87,	37,	  //90
	42,	94,	21,	88,	38,	  //91
	42,	95,	22,	89,	39,	  //92
	42,	96,	23,	90,	40,	  //93
	42,	97,	89,	91,	41,	  //94
	42,	98,	63,	92,	42,	  //95
	42,	99,	62,	93,	43,	  //96
	42,	80,	61,	94,	44,	  //97
	42,	81,	60,	95,	45,	  //98
	42,	82,	59,	96,	46,	  //99
	42,	83,	58,	97,	47,	  //100
	42,	82,	82,	98,	48,
	42,	82,	82,	99,	49,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
	42,	82,	82,255,255,
};														
//const CLCPoll* clc_poll=clcpolltable;
uint clc_poll_count=0;
#define $CLCPoll(prog_num,field) clcpolltable[prog_num][clc_poll_count].field
#define CLCPoll2Query(prog_num)((byte*)(&clcpolltable[prog_num][clc_poll_count]))
//#define CLCPollNext() if(++clc_poll_count==CLC_POLL_SIZE) clc_poll_count=0
#define CLCPollNext() if(++clc_poll_count==CLC_POLL_SIZE) clc_poll_count=0
#define CLCPollClear() clc_poll_count=0


byte temp1_table[32][4]={
52, 0, 0, 191,
52, 1, 0, 75,
52, 2, 0, 102,
52, 3, 0, 146,
52, 4, 0, 60,
52, 5, 0, 200,
52, 6, 0, 229,
52, 7, 0, 17,
52, 8, 0, 136,
52, 9, 0, 124,
52, 10, 0, 81,
52, 11, 0, 165,
52, 12, 0, 11,
52, 13, 0, 255,
52, 14, 0, 210,
52, 15, 0, 38,
52, 16, 0, 209,
52, 17, 0, 37,
52, 18, 0, 8,
52, 19, 0, 252,
52, 20, 0, 82,
52, 21, 0, 166,
52, 22, 0, 139,
52, 23, 0, 127,
52, 24, 0, 230,
52, 25, 0, 18,
52, 26, 0, 63,
52, 27, 0, 203,
52, 28, 0, 101,
52, 29, 0, 145,
52, 30, 0, 188,
52, 31, 0, 72	
};
byte temp1_count=0;
#define Temp1Next if(++temp1_count==32) temp1_count=0
#endif

