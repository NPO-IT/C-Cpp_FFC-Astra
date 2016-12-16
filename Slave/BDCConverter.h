#ifndef _BDCCOnverter_H
#define _BDCCOnverter_H

#include "type.h"
class BDCConverter{
    private:
       uint data_18[3][20];
       ushort data_16[4][20];
       static const ushort HASH_TABLE[64];
    public:
        BDCConverter();
        ~BDCConverter();
        void SetAddr(const uint *const data,const uint &num);
        void SetAddr(const ushort *const data,const uint &num);
        const ushort* GetAddr(const uint &num);
        void Convert();
};

#endif