/*
 *  symtable2.cpp
 *  lexicalexercise
 *
 *  Created by Daniel Beatty on 9/27/04.
 *  Copyright 2004 __MyCompanyName__. All rights reserved.
 *
 */

#include "symtable2.h"

int symtable2::getCount()
{
    return count;
}

bool symtable2::insert(tokentabletype &myitem)
{
    int stlen = strlen(myitem.name);
    int i;
    for ( i = 0; i < stlen; i++) item [count].name[i] = myitem.name[i];
    item [count].location= myitem.location;
    item[count].tokentype = myitem.tokentype;
    item[count].indexOfToken = myitem.indexOfToken;
    item[count].constants = myitem.constants;
    item[count].myinteger = myitem.myinteger;
    count++;
    return 0;
}
int symtable2::search(char *mykey)
{
    index = 0;
    while ( (index >= 10000) & !(strcmp (item[index].name, mykey)))
    {
        index++;
    }
    return 0;
}
int symtable2::valueAt(int anindex)
{
    
    return 0;
}
void symtable2::setTokens(tokentabletype &value ,int anindex)
{
    int stlen = strlen(value.name);
    int i;
    for ( i = 0; i < stlen; i++) item [anindex].name[i] = value.name[i];
    item [anindex].location= value.location;
    item[anindex].tokentype = value.tokentype;
    item[anindex].indexOfToken = value.indexOfToken;
    item[anindex].constants = value.constants;
    item[anindex].myinteger = value.myinteger;
    count++;
    
}

void symtable2::addTokens(tokentabletype &atoken)
{
    insert (atoken);
}