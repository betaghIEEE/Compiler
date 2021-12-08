//
//  epsilonSet.m
//  parsing
//
//  Created by Daniel Beatty on 3/16/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "epsilonSet.h"
#import "tokenHome.h"

@implementation epsilonSet

-(NSArray *)declarations1
{
	return declarations1;
}

-(NSArray *)declarations2
{
	return declarations2;
}

-(NSArray *)identList1
{
	return identList1;
}

-(NSArray *)identifier1
{
	return identifier1;
}

-(NSArray *)sublist1
{
	return sublist1;
}

-(NSArray *)statement
{
	return statement;
}

-(id) init 
{
	[super init];
	tokens = [[tokenHome alloc] init];
	
	declarations1 = [[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens idToken]],
					[NSNumber numberWithInt: [tokens leftBracketToken]],
					nil
					];
	declarations2 = [[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens commaToken]], 
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					nil
					];
	identList1 =	[[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens commaToken]],
					[NSNumber numberWithInt: [tokens colonToken]], 
					[NSNumber numberWithInt: [tokens rParenthesis]],
					nil
					];
	identifier1	=	[[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens sqLBracketToken]],
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
					nil
					];
	sublist1 =		[[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens commaToken]],
					[NSNumber numberWithInt: [tokens sqRBracketToken]],
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil
					];
	statement =		[[NSArray alloc] initWithObjects:
					[NSNumber numberWithInt:[tokens assignToken]],
					[NSNumber numberWithInt:[tokens leftBracketToken]],
					[NSNumber numberWithInt: [tokens rightBracketToken]],
					nil
					];
	
	return self;
}


-(void) dealloc 
{
	[declarations1 release];
	[declarations2 release];
	[identList1 release];
	[sublist1 release];
	[identifier1 release];
	[statement release];
	[tokens release];
	[super dealloc];
}


@end
