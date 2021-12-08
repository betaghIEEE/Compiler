//
//  symtable.m
//  frontend
//
//  Created by Daniel Beatty on 11/15/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "symtable.h"
#import "tokentable.h"

@implementation symtable
-(int) count
{
    return count;
}

-(BOOL) insert:(symtabletype *) item
{
    index = count;
    table[index].location = item->location;
    table[index].tokentype = item->tokentype;
    table[index].alive = item->alive;
    table[index].temporary = item->temporary;
    table[index].regmem = item->regmem;
    table[index].indexOfToken = item->indexOfToken;
    table[index].constants = item->myinteger;
    count++;
}

-(BOOL) insertAtoken:(tokentable *) item
{/*
    index = count;
    table[index].location = [item location];
    table[index].tokentype = [item tokentype];
    table[index].alive = [item alive];
    table[index].temporary = [item temporary];
    table[index].regmem = [item regmem];
    table[index].indexOfToken = [item indexOfToken];
    table[index].constants = [item myinteger]; */
    count++;
}

-(int) searchByName: (NSString *)mykey
{
    //symtabletype *retitem;
    int i = 0;
    BOOL notrue = YES;
    while ( (i < count) & notrue)
    {
        if ( strcmp ([mykey cString], table[i].name) == 0) return i;
		i++;
    }
	return i;
}

-(int) searchByIndex: (int ) key
{
    symtabletype *retitem;
    int i = 0;
    BOOL notrue = YES;
    while ( (i < count) & notrue)
    {
        if ( key == table[i].indexOfToken) return i;
        i++;
    }
}

-(void) setToken: (symtabletype *) value at:(int) anindex
{
    if ( (anindex >= 0 ) & (anindex < count)) {
        table[anindex].location = value->location;
        table[anindex].tokentype = value->tokentype;
        table[anindex].alive = value->alive;
        table[anindex].temporary = value->temporary;
        table[anindex].regmem = value->regmem;
        table[anindex].indexOfToken = value->indexOfToken;
        table[anindex].constants = value->myinteger;
    }
}

-(void) getTokenAt:(symtabletype *) value  at:(int) anindex
{
    if ( (anindex >= 0 ) & (anindex < count)) {
        value->location = table[anindex].location;
        value->tokentype = table[anindex].tokentype;
		value->alive = table[anindex].alive;
		value->temporary = table[anindex].temporary;
        value->regmem = table[anindex].regmem;
        value->indexOfToken = table[anindex].indexOfToken;
        value->myinteger = table[anindex].constants ;
    }
}


-(int) setupNewItem
{
    index = count;
    count++;
    return index;
}


-(int) genTemp
{
	index = count;
	NSString *tempName = [[NSString alloc] initWithString:@"temp"];
	[self setName:tempName at:index];
	[self setLocation:index at:index];
	[self setTokentype:(-3) at:index];
	[self setIndexOfToken:index at:index];
	[self setTemporary:YES at:index];
        [self setIsArray:NO at:index];
        [self setDimensionA:1 at:index];
        [self setDimensionB:1 at:index];
        [self setDimensionC:1 at:index];
	count++;
	return index;
	
}


-(void) setName:(NSString *) value at:(int) anindex
{
    strcpy (table[anindex].name, [value cString]);
}

-(void) setLocation:(int) value at:(int) anindex
{
    table[anindex].location = value;
}

-(void) setTokentype:(int) value at:(int) anindex
{
    table[anindex].tokentype = value;
}

-(void) setAlive:(BOOL) value at:(int) anindex
{
    table[anindex].alive = value;
}

-(void) setTemporary:(BOOL) value at:(int) anindex
{
    table[anindex].temporary = value;
}

-(void) setRegmem:(int) value at:(int) anindex
{
    table[anindex].regmem = value;
}

-(void) setIndexOfToken:(int) value at:(int) anindex
{
    table[anindex].indexOfToken = value;
}

-(void) setConstants:(int) value at:(int) anindex
{
    table[anindex].constants = value;
}

-(void) setMyinteger:(int) value at:(int) anindex
{
    table[anindex].myinteger = value;
}


-(void) setDimensionA:(int) value at:(int) anindex
{
	table[anindex].dimensionA = value;
}

-(void) setDimensionB:(int) value at:(int) anindex
{
	table[anindex].dimensionB = value;
}

-(void) setDimensionC:(int) value at:(int) anindex
{
	table[anindex].dimensionC = value;
}


-(void) setIsArray:(BOOL) value at:(int)anindex
{
    table[anindex].isArray = value;
}

-(NSString *) getNameAt:(int) anindex
{
    NSString *value ;
	value = [[NSString alloc] initWithCString:(table[anindex].name)];
    return value;
}

-(int) getLocationAt:(int) anindex
{
    int value = table[anindex].location;
    return value;
}

-(int) getTokentypeAt:(int) anindex
{
    int value = table[anindex].tokentype;
    return value;
}

-(BOOL) getAliveAt:(int) anindex
{
    BOOL value = table[anindex].alive;
    return value;
}

-(BOOL) getTemporaryAt:(int) anindex
{
    BOOL value = table[anindex].temporary;
    return value;
}

-(int) getRegmemAt:(int) anindex
{
    int value = table[anindex].regmem;
    return value;
}

-(int) getIndexOfTokenAt:(int) anindex
{
    int value = table[anindex].indexOfToken;
    return value;
}

-(int) getConstantsAt:(int) anindex
{
    int value = table[anindex].constants;
    return value;
}

-(int) getMyintegerAt:(int) anindex
{
    int value = table[anindex].myinteger;
    return value;
}

-(int) getIndex 
{
	return index;
}

-(int) getDimensionAAt:(int) anindex
{
	int value = table[anindex].dimensionA;
	return value;
}

-(int) getDimensionBAt:(int) anindex
{
	int value = table[anindex].dimensionB;
	return value;
}

-(int) getDimensionCAt:(int) anindex
{
	int value = table[anindex].dimensionC;
	return value;
}


-(BOOL) getIsArrayAt:(int) anindex
{
    BOOL value = table[anindex].isArray;
    return value;
}

@end
