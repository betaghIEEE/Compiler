//
//  tokenHome.m
//  parsing
//
//  Created by Daniel Beatty on 2/19/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "tokenHome.h"


@implementation tokenHome
-(int) arrayToken
{
	return arrayToken;
}

-(int) progToken
{
	return progToken;
}

-(int) integerToken
{
	return integerToken;
}

-(int) whenToken
{
	return whenToken;
}

-(int) carrotToken
{
	return carrotToken;
}

-(int) rightBracketToken
{
	return rightBracketToken;
}

-(int) leftBracketToken
{
	return leftBracketToken;
}

-(int) sqRBracketToken
{
	return sqRBracketToken;
}

-(int) sqLBracketToken
{
	return sqLBracketToken;
}

-(int) rParenthesis
{
	return rParenthesis;
}

-(int) lParenthesis
{
	return lParenthesis;
}

-(int) assignToken
{
	return assignToken;
}

-(int) eqToken
{
	return eqToken;
}

-(int) moreToken
{
	return moreToken;
}

-(int) lessToken
{
	return lessToken;
}

-(int) moreEqToken
{
	return moreEqToken;
}

-(int) lessEqToken
{
	return lessEqToken;
}

-(int) plusToken
{
	return plusToken;
}

-(int) minusToken
{
	return minusToken;
}

-(int) multiplyToken
{
	return multiplyToken;
}

-(int) divideToken
{
	return divideToken;
}

-(int) colonToken
{
	return colonToken;
}

-(int) semiColonToken
{
	return semiColonToken;
}

-(int) andToken
{
	return andToken;
}

-(int) orToken
{
	return orToken;
}

-(int) modToken
{
	return modToken;
}

-(int) notToken
{
	return notToken;
}

-(int) commaToken
{
	return commaToken;
}

-(int) pointerToken
{
	return pointerToken;
}

-(int) elseToken
{
	return elseToken;
}


-(int) consToken
{
	return consToken;
}

-(int) idToken
{
	return idToken;
}

// Initialization via symbol Table
-(id) init 
{
	int count = 0;
	[super init];
	tokens = [[NSArray alloc] initWithObjects:@"prog",
						@"array", @"integer", @"->",
						@"when", @"else",
						@"^",
						@"{", @"}", @"[", @"]", @";", @"," , @"(", @")",
						@":=", @"<",@">", @"eq", @"neq", @"<=", @">=",
						@"+", @"-", @"*", @"/", @":",
						@"and", @"or", @"not", @"mod",
						nil ]; 
	progToken = count++;
	arrayToken = count++;
	integerToken = count++;
	pointerToken = count++;
	whenToken = count++;
	elseToken = count++;
	carrotToken = count++;
	leftBracketToken = count++;
	rightBracketToken = count++;
	sqLBracketToken = count++;
	sqLBracketToken = count++;
	semiColonToken = count++;
	commaToken = count++;
	rParenthesis = count++;
	lParenthesis = count++;
	assignToken = count++;
	lessToken = count++;
	moreToken = count++;
	eqToken = count++;
	neqToken = count++;
	lessEqToken = count++;
	moreEqToken = count++;
	plusToken = count++;
	minusToken = count++;
	multiplyToken = count++;
	divideToken = count++;
	colonToken = count++;
	andToken = count++;
	orToken = count++;
	notToken = count++;
	modToken = count++;
	idToken = 101;
	consToken = 102;
	return self;

}

-(tokenHome *) initWithST:(symbolTable *) valueST
{
	[super init];
	// elements readin from the symbol table
	return self;

}

-(void) dealloc 
{
	[tokens release];
	[super dealloc];
}


@end
