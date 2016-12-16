#line 1 "..\\my_lib\\Flash.cpp"
#line 1 "..\\my_lib\\Flash.H"






















extern "C" {



 
int SetState  (unsigned char*, unsigned short,int  );




 
int GetState  (int  );
}





int EraseSector  (	unsigned short  );















typedef void (*IAP)(unsigned int [], unsigned int []);	
														

#line 2 "..\\my_lib\\Flash.cpp"





static IAP p_IAP = (IAP)0x7FFFFFF1;					
														





static unsigned char SectorState[0x1000] __attribute__((at(0x0007D000)));






int EraseSector  (	unsigned short CLK  )
{
  unsigned int Command[5], Result[5];

  
  Command[0] = 50;
  Command[1] = 27;
  Command[2] = 27;
  __disable_irq();;
  p_IAP(Command, Result);
  __enable_irq();;
  if (Result[0] != 0) return 0; 

  
  Command[0] = 52;
  Command[1] = 27;
  Command[2] = 27;
  Command[3] = CLK;
  __disable_irq();;
  p_IAP(Command, Result);
  __enable_irq();;
  if (Result[0] != 0) return 0;
  
  return 1; 
}



int GetState  (	int number )
{
  return (unsigned int)(SectorState[number]);
}





int SetState  (	unsigned char *_State, unsigned short CLK,int size  )
{
  char Buffer[256];
  int i;
  unsigned int Command[5], Result[5];

	for (i=0;i<size;i++)
	{
		Buffer[i]=_State[i];
	}


  
  Command[0] = 50;
  Command[1] = 27;
  Command[2] = 27;
  __disable_irq();;
  p_IAP(Command, Result);
  __enable_irq();;
  if (Result[0] != 0) return 0; 

  
  Command[0] = 51;
  Command[1] = (unsigned int)(SectorState);
  Command[2] = (unsigned int)Buffer;
  Command[3] = 256;
  Command[4] = CLK;
  __disable_irq();;
  p_IAP(Command, Result);
  __enable_irq();;
  if (Result[0] != 0) return 0;

  
  Command[0] = 56;
  Command[1] = (unsigned int)(SectorState);
  Command[2] = (unsigned int)(Buffer);
  Command[3] = sizeof(_State);
  __disable_irq();;
  p_IAP(Command, Result);
  __enable_irq();;
  if (Result[0] != 0) return 0;

  return 1;

}

