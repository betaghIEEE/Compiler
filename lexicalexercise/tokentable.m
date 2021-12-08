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
    return [NSString stringWithCString:name];
}
-(int) location
{
    return location;
}
-(int) tokentype
{
    return tokentype;
}
-(int) indexOfToken
{
    return indexOfToken;
}
-(int) constants
{
    return constants;
}
-(int) myinteger
{
    return myinteger;
}
-(void) setName:(NSString *) S
{
    //[name release];
    strcpy (name , [S cString]);
    //[S retain];
    
}
-(void) setLocation:(int) value
{
    location = value;
}
-(void) setTokentype:(int) value
{
    tokentype = value;
}
-(void) setIndexOfToken:(int) value
{
    indexOfToken = value;
}
-(void) setConstants:(int) value
{
    constants = value;
}
-(void) setMyinteger:(int) value
{
    myinteger = value;
}

-(id) free 
{
	printf("ClassA free\n");
	//[name release];
	[super free];
}

@end
