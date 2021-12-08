//
//  symbolTable.m
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "symbolTable.h"
#import "symbols.h"
#import "tokenHome.h"

@implementation symbolTable
-(void) setTable:(NSMutableArray *) value
{
	[table autorelease];
	table = [value copy];
}
-(NSMutableArray *) table
{
	return table;
}

// Searching and adding methods
-(int) checkConstant: (NSString *) token
{
	NSEnumerator *tokenEnum = [table objectEnumerator];
	symbols *symbolRow;
	int tokenValue = 0;
	BOOL keepGoing = YES;
	
	while ( keepGoing ) 
	{
		if ( (symbolRow = [tokenEnum nextObject]) != nil) {
			if ( [[symbolRow tokenName] isEqualToString: token] ) {
				tokenValue = [symbolRow entryNumber];
				keepGoing == NO;
				return tokenValue;
			}
		} else {			
			symbolRow = [[symbols alloc] initWithString:token];
			[symbolRow setTokenType:102];
			tokenValue = [table count] + 1;
			[symbolRow setEntryNumber:tokenValue];
			[table addObject:symbolRow];
			keepGoing = NO;
			[symbolRow release];
		}
	}
	return tokenValue;
	
}

-(int) checkIdentifier: (NSString *) token
{
	NSEnumerator *tokenEnum = [table objectEnumerator];
	symbols *symbolRow;
	int tokenValue = 0;
	BOOL keepGoing = YES;
	
	while ( keepGoing ) 
	{
		if ( (symbolRow = [tokenEnum nextObject]) != nil) {
			if ( [[symbolRow tokenName] isEqualToString: token] ) {
				tokenValue = [symbolRow entryNumber];
				keepGoing == NO;
				return tokenValue;
			}
		} else {			
			symbolRow = [[symbols alloc] initWithString:token];
			[symbolRow setTokenType:101];
			tokenValue = [table count] + 1;
			[symbolRow setEntryNumber:tokenValue];
			[table addObject:symbolRow];
			keepGoing = NO;
			[symbolRow release];
			return tokenValue;
		}
	}
	return tokenValue;
	
}

-(int) gentemp 
{	
	symbols *symbolRow;
	int tokenValue = 0;
			symbolRow = [[symbols alloc] initWithString:@"temp"];
			[symbolRow setTokenType:101];
			tokenValue = [table count] + 1;
			[symbolRow setEntryNumber:tokenValue];
			[table addObject:symbolRow];
//			keepGoing = NO;
			[symbolRow release];
	return tokenValue;
}

// Initialize 

-(symbolTable *) initWithSet:(NSSet *) values
{
	[super init];
	NSEnumerator *rwEnum = [values objectEnumerator]; 
	NSString *rw;
	table = [[NSMutableArray alloc] initWithCapacity:100];
	symbols *workingElement;
	int count = 1;
	while ( ( rw = [rwEnum nextObject ] )!= nil) 
	{
	//	NSAutoreleasePool *rwPool = [[NSAutoreleasePool alloc] init];

		NSLog (@"Working on object");
		NSLog (rw);
		workingElement = [[symbols alloc] initWithString:rw];
		[workingElement setTokenType:count];
		[workingElement setEntryNumber:count++];
		[table addObject:workingElement];
		[workingElement release];
	//	[rwPool release];
	}
	//[rwEnum release];
	return self;
	
}


-(symbolTable *) initWithArray:(NSArray *) values
{
	[super init];
	NSEnumerator *rwEnum = [values objectEnumerator]; 
	NSString *rw;
	table = [[NSMutableArray alloc] initWithCapacity:100];
	symbols *workingElement;
	int count = 1;
	while ( ( rw = [rwEnum nextObject ] )!= nil) 
	{
	//	NSAutoreleasePool *rwPool = [[NSAutoreleasePool alloc] init];

		NSLog (@"Working on object");
		NSLog (rw);
		workingElement = [[symbols alloc] initWithString:rw];
		[workingElement setTokenType:count];
		[workingElement setEntryNumber:count++];
		[table addObject:workingElement];
		[workingElement release];
	//	[rwPool release];
	}
	//[rwEnum release];
	return self;
	
}

-(void) dealloc 
{
	[table release];
	[super dealloc];
}

@end
