//
//  lexical.m
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "lexical.h"
#import "codeSource.h"
#import "symbolTable.h"


@implementation lexical

-(int) nextToken
{
	return nextToken;
}


-(BOOL) stateHandler:(int) inputType
{
	BOOL keepGoing;
			switch ( inputType )
		{
			case 1:
				[self alphaNumeric];
				keepGoing = NO;
				nextToken = [st checkIdentifier:nextTokenName];
				break;
			case 2:
				[self numeric];
				nextToken = [st checkConstant:nextTokenName];
				keepGoing = NO;
				break;
			case 3:
				[myFile nextCharacter];
				[self setNextTokenName:[myFile getString]];
				nextToken = [st checkIdentifier:nextTokenName];
				keepGoing = NO;
				break;
			case 4:
				[myFile nextCharacter];
				[self equalToken];
				nextToken =  [st checkIdentifier:nextTokenName];
				keepGoing = NO;
				break;
			case 5:
				[myFile nextCharacter];
				[self setNextTokenName:[myFile getString]];
				nextToken =  [st checkIdentifier:nextTokenName];
				keepGoing = NO;
				break;
			case 10:
				[myFile nextCharacter];
				[self setNextTokenName:[myFile getString]];
				nextToken = 1;
				keepGoing = YES;
				break;
			default: 
				keepGoing = NO;
				nextToken = 0;
				
		}
	return keepGoing;
}

-(void) lex
{
	char workingChar;
	int inputType = 0;
	BOOL keepGoing = YES;
	
	while (keepGoing) {
	NSAutoreleasePool *lexPool = [[NSAutoreleasePool alloc] init];
		if ( [myFile endOfBlock] == NO ) {
			workingChar = [myFile getCurrentCharacter];
			if ( (workingChar >= 'A' && workingChar <= 'Z') || 
				(workingChar >= 'a' && workingChar <= 'z'))
					inputType = 1;
			else if ( (workingChar >= '0' && workingChar <= '9') )
				inputType = 2;
			else if ( (workingChar == '{') ||
					( workingChar == '}') ||
					( workingChar == '[' ) ||
					( workingChar == ']' ) ||
					( workingChar == ';' ) ||
					( workingChar == '(' ) ||
					( workingChar == ')' ) ||
					( workingChar == '+' ) ||
					( workingChar == '-' ) ||
					( workingChar == '*' ) ||
					( workingChar == '/' ) ||
					( workingChar == ',' ) ) 
						inputType = 3;
				else if ( ( workingChar == ':' ) ||
						( workingChar == '<' ) ||
						( workingChar == '>' ) ) 
					inputType = 4;
				else if ( ( workingChar == '=' ) )
					inputType = 5;
				else 
					inputType = 10;
				} else 
				{	
					inputType = 0;
				}
		keepGoing = [self stateHandler:inputType];
//		NSLog (nextTokenName);
		[lexPool release];
	}
}

-(void) alphaNumeric
{
	char workingChar;
	int inputType;
	BOOL keepGoing = YES;
	
	while (keepGoing) {
		
		[myFile nextCharacter];
		workingChar = [myFile getCurrentCharacter];
		if ( (workingChar >= 'A' && workingChar <= 'Z') || 
			(workingChar >= 'a' && workingChar <= 'z'))
			inputType = 1;
		else if ( (workingChar >= '0' && workingChar <= '9') )
			inputType = 2;
		else inputType = 3;
		switch (inputType) {
			case 1:	keepGoing = YES;
				break;
			case 2:	keepGoing = YES;
				break;
			default: 
				[self setNextTokenName:[myFile getString]] ;
				keepGoing = NO;
		}
	}
}

-(void) numeric
{
	char workingChar;
	int inputType;
	BOOL keepGoing = YES;
	
	while (keepGoing) {
		[myFile nextCharacter];
		workingChar = [myFile getCurrentCharacter];
		if ( (workingChar >= '0' && workingChar <= '9') )
			{
				inputType = 2;
				keepGoing = YES;
			}
			else
			{ 
				inputType = 3;
				[self setNextTokenName:[myFile getString]];
				keepGoing = NO;
			}
		
	}
}



 
-(void) equalToken
{
	char workingChar;
	
	workingChar = [myFile getCurrentCharacter];
	if ( workingChar == '=' )
	{
		[myFile nextCharacter];
	} 
		[self setNextTokenName: [myFile getString]];
	
}

// Accessor Methods

-(void) setMyCode:(codeSource *) codeSource
{
//	if (myFile != nil) [myFile release];
	if ( myFile != codeSource ) {
		[myFile release];
		myFile = [codeSource retain];
	}
	
}

-(codeSource *) getMyCode
{
	return myFile;
}


-(symbolTable *) st
{
	return st;
}

-(void) setSt: (symbolTable *) value
{
	if ( value != st) 
	{
		[st autorelease];
		st = [value retain];
	}
}



-(NSString *) nextTokenName 
{
	return nextTokenName;
}

-(void) setNextTokenName:(NSString *) value
{
	if ( nextTokenName != value)
	{
		[value autorelease];
		nextTokenName = [value retain];
	}
} 


// Initializer 
-(lexical *) initWithCodeSource:(codeSource *) codeSource
{
	myFile  = [codeSource retain];
//	st = [[symbolTable alloc] init];
	nextToken = 0;
	
//	nextTokenName = [[NSString alloc] init];
	[super init];
	return self;	
}


-(lexical *) initWithCodeSource:(codeSource *) codeSource
					symbolTable:(symbolTable *) aSt
{
	myFile  = [codeSource retain];
	st = [aSt retain];
	
	nextTokenName = [[NSString alloc] init];
	nextToken = 0;
	[super init];
	return self;	
}
					
-(lexical *) initWithSymbolTable:(symbolTable *) aSt
{
	myFile  = [[codeSource alloc]  init];
	st = [aSt retain];
	nextTokenName = [[NSString alloc] init];
	nextToken = 0;
	[super init];
	return self;	
}


-(void) dealloc 
{
	[myFile release];
//	[st release];
//	[nextTokenName release];
	[super dealloc];
}

@end
