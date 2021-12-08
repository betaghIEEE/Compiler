//
//  symtable3.m
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/27/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "symtable3.h"


@implementation symtable3
-(int) count
{
    return count;
}

-(BOOL) insert:(tokentable *) item
{
    if ( count < 10000 ) {
        strcpy (tokens[count].name, [[item name] cString]);
        tokens[count].constants = [item constants];
        tokens[count].indexOfToken = [item indexOfToken];
        tokens[count].location = [item location];
        tokens[count].myinteger = [item myinteger];
        tokens[count].tokentype = [item tokentype];
        count++;
    }
}

-(tokentable *) search:(NSString *) mykey
{
    int i;
    tokentable *smokingun = [[tokentable alloc] init];
    while ( (i < count) && !(strcmp(tokens[i].name, [mykey cString])))
    {
        i++;
    }
    if ( i <= count) return NULL;
    i--;
    [smokingun setConstants:tokens[i].constants];
    [smokingun setIndexOfToken:tokens[i].indexOfToken];
    [smokingun setLocation:tokens[i].location];
    [smokingun setMyinteger:tokens[i].myinteger];
    [smokingun setTokentype:tokens[i].tokentype];
    [smokingun setName:[NSString stringWithCString:tokens[i].name]];
    
    return (smokingun);
}

-(tokentable *) valueAt:(int) anindex
{
    
    tokentable *smokingun = [[tokentable alloc] init];
    int i = anindex;
    NSString *sendit = [[NSString alloc] initWithCString:tokens[i].name];
	NSLog (@"Setting value ");
    NSLog (sendit);
    [smokingun setConstants:tokens[i].constants];
    [smokingun setIndexOfToken:tokens[i].indexOfToken];
    [smokingun setLocation:tokens[i].location];
    [smokingun setMyinteger:tokens[i].myinteger];
    [smokingun setTokentype:tokens[i].tokentype];
    [smokingun setName:sendit];
    [sendit release];
    return smokingun;
}
-(void) setTokens:(tokentable *) value at:(int) anindex
{
    int i = anindex;
    strcpy (tokens[i].name, [[value name] cString]);
    tokens[i].constants = [value constants];
    tokens[i].indexOfToken = [value indexOfToken];
    tokens[i].location = [value location];
    tokens[i].myinteger = [value myinteger];
    tokens[i].tokentype = [value tokentype];
}

-(void) free 
{
	//[tokens release];
    for (int i = 0; i < 10000 ; i++) if (tokens[i] ) [tokens[i] free];
	[super free];
}

@end
