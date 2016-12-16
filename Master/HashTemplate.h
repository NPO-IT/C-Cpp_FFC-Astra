#ifndef  _TEMPLATE_HASH_H_
#define  _TEMPLATE_HASH_H_
template <int HASH_SIZE, typename HASH_TYPE,typename VALUE_TYPE>
class HashTable{
    private:
    const HASH_TYPE* const table;
    public:
        HashTable(const void* const table_ptr);
        const HASH_TYPE CalcHash(const VALUE_TYPE& val)const;
};

template <int HASH_SIZE, typename HASH_TYPE,typename VALUE_TYPE>
HashTable<HASH_SIZE,HASH_TYPE,VALUE_TYPE>::HashTable(const void* const table_ptr):table((HASH_TYPE*)table_ptr){}

template <int HASH_SIZE, typename HASH_TYPE,typename VALUE_TYPE>
const HASH_TYPE HashTable<HASH_SIZE,HASH_TYPE,VALUE_TYPE>::CalcHash(const VALUE_TYPE& val)const{
    if(val<HASH_SIZE) return table[val];
    else return table[0];
}
#endif
