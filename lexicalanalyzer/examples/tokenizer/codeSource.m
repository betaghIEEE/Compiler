//
//  codeSource.m
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "codeSource.h"


@implementation codeSource



-(void) setStartOfToken:(int) value
{
	startOfToken = value;
}

-(int) startOfToken
{
	return startOfToken;
}

-(void) setCurrentPosition:(int) value
{
	currentPosition = value;
}
  
-(int) currentPosition
{
	return currentPosition;
}

-(char) getCurrentCharacter
{
	char currentCharacter;
	currentCharacter = [block characterAtIndex:currentPosition];
	return currentCharacter;
}

-(void) nextCharacter
{
	currentPosition++;
}

-(NSString *) getString
{
	NSRange tokenRange;
	NSString *tokenString; // = [NSString alloc];
	int lastCharacter = currentPosition;
	tokenRange.length = lastCharacter - startOfToken;
	tokenRange.location = startOfToken;
//	unichar *blockPointer = blocks + startOfToken;
//	NSString *aString = [[NSString alloc] 
//					initWithCharacters:blockPointer
//									length: length];
	NS_DURING
		tokenString = [block substringWithRange:tokenRange];
		//[tokenString autorelease];
		startOfToken = lastCharacter;
	NS_HANDLER
		NSLog (@"Could substring the block.");
	NS_ENDHANDLER
	return tokenString;
}

-(NSString *) block
{
	return block;
}

-(void)  setBlock:(NSString *) value
{
	[block autorelease];
	block = [value copy];
}

-(BOOL) endOfBlock
{
	if ( currentPosition >= [block length] )
		return YES;
	return NO;
}

-(id) init 
{
	[super init];
	block = [[NSString alloc] init];
	return self;
}


-(codeSource *) initWithFileName:(NSString *) fileName
{
	NS_DURING
/*
	block = [NSData alloc];
	[block initWithContentsOfFile:fileName];
	blocks = [block bytes];
*/
	block = [[NSString alloc] initWithContentsOfFile:fileName];
	NS_HANDLER
	NSLog (@"Some thing failed to get the block from file");
	exit(5);
	NS_ENDHANDLER
	return self;
}

-(codeSource *) initWithNSData:(NSData *) fileBlock
{
	[super init];
	NS_DURING
	block = [[NSString alloc] initWithData:fileBlock];
	NS_HANDLER
		NSLog (@"Could initialize code source with NSData.");
	NS_ENDHANDLER
	return self;
}

-(void) dealloc
{
	[block release];
	[super dealloc];
}

@end
