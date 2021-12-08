//
//  followSet.m
//  parsing
//
//  Created by dabeatty on 2/20/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "followSet.h"
#import "tokenHome.h"


@implementation followSet

-(BOOL) inProgram:(int) value
{
	
	return [self inProduction:value whichSet: program ];
}

-(BOOL) inDeclarations:(int) value
{
	
	return [self inProduction:value whichSet: declaration ];
}

-(BOOL) inDeclarations1:(int) value
{
	
	return [self inProduction:value whichSet: declaration1 ];
}

-(BOOL) inDeclarations2:(int) value
{
	
	return [self inProduction:value whichSet: declaration2 ];
}

-(BOOL) inIdentList:(int) value
{
	
	return [self inProduction:value whichSet: identList ];
}

-(BOOL) inIdentList1:(int) value
{
	
	return [self inProduction:value whichSet: identList1 ];
}

-(BOOL) inIdentifier:(int) value
{
	
	return [self inProduction:value whichSet: identifier ];
}

-(BOOL) inIdentifier1:(int) value
{
	
	return [self inProduction:value whichSet: identifier1 ];
}

-(BOOL) inExpression:(int) value
{
	
	return [self inProduction:value whichSet: expression ];
}

-(BOOL) inCondition:(int) value
{
	
	return [self inProduction:value whichSet: condition ];
}

-(BOOL) inSublist:(int) value
{
	
	return [self inProduction:value
				whichSet: sublist ];
}

-(BOOL) inSublist1:(int) value
{
	
	return [self inProduction:value
				whichSet: sublist1 ];
}

-(BOOL) inStatement:(int) value
{
	return [self inProduction:value
				whichSet: statement ];
}

-(BOOL) inStatement1:(int) value
{
	return [self inProduction:value
				whichSet: statement1 ];
}

-(BOOL) inStatement2:(int) value
{
	return [self inProduction:value
				whichSet: statement2 ];
}

-(BOOL) inStatement3:(int) value
{
	return [self inProduction:value
				whichSet: statement3 ];
}

-(BOOL) inProduction:(int) value 
				whichSet:(NSSet *)  whichSet
{
	NSEnumerator *tokenEnum = [whichSet objectEnumerator];
	NSNumber *tokenTypes; 
	BOOL keepGoing = YES;
	while (keepGoing)
	{
		if ( (tokenTypes = [tokenEnum nextObject]) != nil )
		{
			if ( [tokenTypes intValue] == value ) return YES;
		} else keepGoing = NO;
	}
	return NO;
}
				

-(id) init 
{
	[super init];
/*
	program = [[ NSSet alloc] initWithSet: 
				[tokens eof],
				nil];
*/
	tokens = [[tokenHome alloc] init];
	declaration = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens leftBracketToken]],
					nil];
	declaration1 = [[ NSSet alloc] initWithObjects:  
					[NSNumber numberWithInt: [tokens leftBracketToken]],
					nil];
	declaration2 = [[ NSSet alloc] initWithObjects:  
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					nil];
	identList = [[ NSSet alloc] initWithObjects:  
					[NSNumber numberWithInt: [tokens colonToken]], 
					[NSNumber numberWithInt: [tokens rParenthesis]],
					nil];
	identList1 = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens colonToken]], 
					[NSNumber numberWithInt: [tokens rParenthesis]],
					nil];
	identifier = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens commaToken]], 
					[NSNumber numberWithInt: [tokens colonToken]], 
					[NSNumber numberWithInt: [tokens rParenthesis]],
					[NSNumber numberWithInt: [tokens plusToken]],
					[NSNumber numberWithInt: [tokens minusToken]],
					[NSNumber numberWithInt: [tokens multiplyToken]],
					[NSNumber numberWithInt: [tokens divideToken]],
					[NSNumber numberWithInt: [tokens modToken]],
					[NSNumber numberWithInt: [tokens idToken]],
					[NSNumber numberWithInt: [tokens consToken]],
					[NSNumber numberWithInt: [tokens semiColonToken]],
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens commaToken]], 
					[NSNumber numberWithInt: [tokens moreToken]],
					[NSNumber numberWithInt: [tokens lessToken]],
					[NSNumber numberWithInt: [tokens moreEqToken]],
					[NSNumber numberWithInt: [tokens lessEqToken]],
					[NSNumber numberWithInt: [tokens neqToken]],
					[NSNumber numberWithInt: [tokens eqToken]],
					[NSNumber numberWithInt: [tokens andToken]],
					[NSNumber numberWithInt: [tokens orToken]],
					[NSNumber numberWithInt: [tokens notToken]],
					[NSNumber numberWithInt: [tokens elseToken]],
					nil];
	identifier1 = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens commaToken]], 
					[NSNumber numberWithInt: [tokens colonToken]], 
					[NSNumber numberWithInt: [tokens rParenthesis]],
					[NSNumber numberWithInt: [tokens plusToken]],
					[NSNumber numberWithInt: [tokens minusToken]],
					[NSNumber numberWithInt: [tokens multiplyToken]],
					[NSNumber numberWithInt: [tokens divideToken]],
					[NSNumber numberWithInt: [tokens modToken]],
					[NSNumber numberWithInt: [tokens idToken]],
					[NSNumber numberWithInt: [tokens consToken]],
					[NSNumber numberWithInt: [tokens semiColonToken]],
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens commaToken]], 
					[NSNumber numberWithInt: [tokens moreToken]],
					[NSNumber numberWithInt: [tokens lessToken]],
					[NSNumber numberWithInt: [tokens moreEqToken]],
					[NSNumber numberWithInt: [tokens lessEqToken]],
					[NSNumber numberWithInt: [tokens neqToken]],
					[NSNumber numberWithInt: [tokens eqToken]],
					[NSNumber numberWithInt: [tokens andToken]],
					[NSNumber numberWithInt: [tokens orToken]],
					[NSNumber numberWithInt: [tokens notToken]],
					[NSNumber numberWithInt: [tokens elseToken]],
					nil];
	expression = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens plusToken]],
					[NSNumber numberWithInt: [tokens minusToken]],
					[NSNumber numberWithInt: [tokens multiplyToken]],
					[NSNumber numberWithInt: [tokens divideToken]],
					[NSNumber numberWithInt: [tokens modToken]],
					[NSNumber numberWithInt: [tokens idToken]],
					[NSNumber numberWithInt: [tokens consToken]],
					[NSNumber numberWithInt: [tokens semiColonToken]],
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens commaToken]], 
					[NSNumber numberWithInt: [tokens moreToken]],
					[NSNumber numberWithInt: [tokens lessToken]],
					[NSNumber numberWithInt: [tokens moreEqToken]],
					[NSNumber numberWithInt: [tokens lessEqToken]],
					[NSNumber numberWithInt: [tokens neqToken]],
					[NSNumber numberWithInt: [tokens eqToken]],
					[NSNumber numberWithInt: [tokens andToken]],
					[NSNumber numberWithInt: [tokens orToken]],
					[NSNumber numberWithInt: [tokens notToken]],
					[NSNumber numberWithInt: [tokens elseToken]],
					nil];
	condition = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens moreToken]],
					[NSNumber numberWithInt: [tokens lessToken]],
					[NSNumber numberWithInt: [tokens moreEqToken]],
					[NSNumber numberWithInt: [tokens lessEqToken]],
					[NSNumber numberWithInt: [tokens neqToken]],
					[NSNumber numberWithInt: [tokens eqToken]],
					[NSNumber numberWithInt: [tokens andToken]],
					[NSNumber numberWithInt: [tokens orToken]],
					[NSNumber numberWithInt: [tokens notToken]],
					[NSNumber numberWithInt: [tokens elseToken]],
					[NSNumber numberWithInt: [tokens semiColonToken] ],
					nil];
	sublist = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil];
	sublist1 = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil];
	statement = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil];
	statement1 = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil];
	statement2 = [[ NSSet alloc] initWithObjects: 
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil];
	statement3 = [[ NSSet alloc] initWithObjects: nil];

	return self;
}

-(void) dealloc
{
	[program release];
	[declaration release];
	[declaration1 release];
	[declaration2 release];
	[identList release];
	[identList1 release];
	[identifier release];
	[identifier1 release];
	[expression release];
	[condition release];
	[sublist release];
	[sublist1 release];
	[statement release];
	[statement1 release];
	[statement2 release];
	[statement3 release];
	[tokens release];
	[super dealloc];
}


@end
