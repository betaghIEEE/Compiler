/*
 *  symtable2.h
 *  lexicalexercise
 *
 *  Created by Daniel Beatty on 9/27/04.
 *  Copyright 2004 __MyCompanyName__. All rights reserved.
 *
 */

#include <Carbon/Carbon.h>
#ifndef __SYMTABLE2_H__
#define __SYMTABLE2_H__
struct tokentabletype 
{
    char name[80];
    int location;
    int tokentype;
    int indexOfToken;
    int constants;
    int myinteger;
};

class symtable2 
{
private:
    tokentabletype item[10000];
    int count;
    int index;
public:
    int getCount();
    bool insert(tokentabletype &item);
    int search(char *mykey);
    int valueAt(int anindex);
    void setTokens(tokentabletype &value ,int anindex);
    void remove(int myindex);
    void removeToken(char *mykey);
    void addTokens(tokentabletype &atoken);
};

#endif
