//
//  symbols.m
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "symbols.h"


@implementation symbols

-(void) setTokenName:(NSString *) value
{
	[tokenName autorelease];
	tokenName = [value copy]; 
}

-(NSString *) tokenName
{
	return tokenName;
}

-(void) setTokenType:(int) value
{
	tokenType = value;
}

-(int) tokenType
{
	return tokenType;
}

-(void) setEntryNumber:(int) value
{
	entryNumber = value;
}

-(int) entryNumber
{
	return entryNumber;
}

-(void) setMemoryLocation:(int) value
{
	memoryLocation = value;
}

-(int) memoryLocation
{
	return memoryLocation;
}

-(id) init
{
	[super init];
	tokenName = [[NSString alloc] init];
	tokenType = 0;
	entryNumber = 0; 
	memoryLocation = 0;
	return self;
}

-(symbols *) initWithString:(NSString *) value
{
	[super init];
	tokenName = [value copy];
	tokenType = 0;
	entryNumber = 0; 
	memoryLocation = 0;

	
	return self;
	
}

-(void) dealloc 
{
	[tokenName release];
	[super dealloc];
}


@end
