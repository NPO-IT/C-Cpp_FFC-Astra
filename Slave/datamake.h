#include "type.h"
byte calc_parity (uint word,const uint& bit_size){
    uint result = 1; //?????
    for(uint i=0;i<bit_size;i++){
        if(word&1) result++;
        word>>=1;
    }
    return result & 1;
}
#define WORD16_SIGN 0x10000
#define FIRST16_WORD 0x2FFFF
#define LAST16_WORD  0x20000

void MakeTestData16(uint test_data18[3][20]){
    uint word=1;
    for(uint i=3;i<19;i++){
        test_data18[0][i]=word|WORD16_SIGN|(calc_parity(word,16)<<17);
        test_data18[1][i]=word|WORD16_SIGN|(calc_parity(word,16)<<17);
        test_data18[2][i]=word|WORD16_SIGN|(calc_parity(word,16)<<17);
        word<<=1;
    }
    for (uint i=0;i<3;i++){
       test_data18[0][i]=FIRST16_WORD;
       test_data18[1][i]=FIRST16_WORD;
       test_data18[2][i]=FIRST16_WORD;
    }
    test_data18[0][3]|=0x30000;
    test_data18[1][3]|=0x30000;
    test_data18[2][3]|=0x30000;

    test_data18[0][19]=LAST16_WORD;
    test_data18[1][19]=LAST16_WORD;
    test_data18[2][19]=LAST16_WORD;
}
#define WORD15_SIGN 0x8000
#define FIRST15_WORD 0x7FFF
#define LAST15_WORD 0
void MakeTestData15(uint test_data[3][20]){
    uint word=1;
    for(uint i=3;i<19;i++){
        test_data[0][i]=word|WORD15_SIGN;
        test_data[1][i]=word|WORD15_SIGN;
        test_data[2][i]=word|WORD15_SIGN;
        word<<=1;
    }
    for (uint i=0;i<3;i++){
       test_data[0][i]=FIRST15_WORD;
       test_data[1][i]=FIRST15_WORD;
       test_data[2][i]=FIRST15_WORD;
    }

    test_data[0][19]=LAST15_WORD;
    test_data[1][19]=LAST15_WORD;
    test_data[2][19]=LAST15_WORD;
}
//---------------------------------------
#define PM1 100
#define PM2 200
#define PM3 300
#define PM4 400

#define SHT1 500
#define SHT2 105
#define SHT3 205
#define SHT4 305

#define AB 405

#define U9P 505
#define U9M 110

#define ADC1 220
#define ADC2 330
#define ADC3 440
#define ADC4 511

#define CONTACT_BDC 0x2AA
//Заполняем данными аналоговыми
void MakeAnalogData(ushort* data){
    //РМ1
    data[0]=PM1;
    data[1]=PM1;
    //РМ2
    data[2]=PM2;
    data[3]=PM2;
    //РМ3
    data[4]=PM3;
    data[5]=PM3;
    //РМ4
    data[6]=PM4;
    data[7]=PM4;
    //ШТ1
    data[8]=SHT1;
    data[9]=SHT1;
    //ШТ2
    data[10]=SHT2;
    data[11]=SHT2;
    //ШТ3
    data[12]=SHT3;
    data[13]=SHT3;
    //ШТ4
    data[14]=SHT4;
    data[15]=SHT4;
    //AB
    data[16]=AB;
    data[17]=AB;
    //+9B
    data[18]=U9P;
    data[19]=U9P;
    //-9B
    data[20]=U9M;
    data[21]=U9M;
    //Цап1
    data[22]=ADC1;
    data[23]=ADC1;
    //Цап2
    data[24]=ADC2;
    data[25]=ADC2;
    //Цап3
    data[26]=ADC3;
    data[27]=ADC3;
    //Цап3
    data[28]=ADC4;
    data[29]=ADC4;
    //ИЭ1~ИЭ8 ОбновРВ ВКЛРВ НК
    data[30]=CONTACT_BDC;
}
