#ifndef __SYMTABLETYPE__
#define __SYMTABLETYPE__

typedef struct symtabletype
{
    char name[80];
    int location;
    int tokentype;
    BOOL alive;
    BOOL temporary;
    int regmem;
    int indexOfToken;
    int constants;
    int myinteger;
	int dimensionA;
	int dimensionB;
	int dimensionC;
        int isArray;
} symtabletype;

#endif