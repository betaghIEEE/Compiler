#ifndef __TOKENTABLETYPE_H_
#define __TOKENTABLETYPE_H

typedef struct tokentabletype 
{
    char name[80];
    int location;
    int tokentype;
    int indexOfToken;
    int constants;
    int myinteger;
}tokentabletype;
#endif __TOKENTABLETYPE_H_
