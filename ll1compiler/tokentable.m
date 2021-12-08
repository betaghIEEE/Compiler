//
//  tokentable.m
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/22/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "tokentable.h"


@implementation tokentable


-(NSString *) name
{
    return [NSString stringWithCString:token.name];
}
-(int) location
{
    return token.location;
}
-(int) tokentype
{
    return token.tokentype;
}
-(int) indexOfToken
{
    return token.indexOfToken;
}
-(int) constants
{
    return token.constants;
}
-(int) myinteger
{
    return token.myinteger;
}
-(void) setName:(NSString *) S
{
    //[name release];
    strcpy (token.name , [S cString]);
    //[S retain];
    
}
-(void) setLocation:(int) value
{
    token.location = value;
}
-(void) setTokentype:(int) value
{
    token.tokentype = value;
}

-(void) setIndexOfToken:(int) value
{
    token.indexOfToken = value;
}

-(void) setConstants:(int) value
{
    token.constants = value;
}

-(void) setMyinteger:(int) value
{
    token.myinteger = value;
}

-(BOOL) alive
{
	return token.alive;
}

-(void) setAlive:(BOOL)value
{
	token.alive = value;
}


@end
