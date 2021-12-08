//
//  headProduction.m
//  parsing
//
//  Created by Daniel Beatty on 2/14/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "headProductions.h"

#import "tokenHome.h"
#import "symbolTable.h"
#import "lexical.h"

@implementation headProductions
-(BOOL) program
{
	if ([myLex nextToken] == [homeToken programToken]/* nt = prog */ )
	{
		[myLex lex]; 
		if ( [myLex nextToken] == [homeToken lParenthesisToken]/* nt = ( */ )
		{
			[myLex lex];
			if ( [self identList] /* IL */ )
			{
				if ( [myLex nextToken] == [homeToken rParenthesisToken] )
				{
					[myLex lex];
					if ( [self declarations1] /* D1 */ ) 
					{
						if ( [myLex nextToken] == [homeToken leftBracketToken] /* nt = '{' */ )
						{
							[myLex lex];
							if ( [self statement]/* S */ )
							{
								if ( [myLex nextToken] == [homeToken rightBracketToken]/* nt = '}'*/ ) 
								{
									[myLex lex];
									if (  [myLex nextToken] == [homeToken pointer]/*nt = '->' */)
									{
										[myLex lex];
										if ( [myLex nextToken] == [homeToken lParenthesisToken] /* nt = '(' */ )
										{
											[myLex lex];
											if ( [self identList] /* IL */ ) 
												if ( [myLex nextToken] == [homeToken rParenthesisToken]/* nt = ')' */ )
												{
													[myLex lex];
													// test for end of program
													// Done
												}
										}
									}
								}
							}	
						}
					}
				}
			}
		}
	}
	return NO;
}

-(BOOL) declarations
{
// p(d, [array, '[', cons, d2, ']', (;), d1]).
// p(d, [integer, (;), d1]).
	if ( [myLex nextToken] == [homeToken arrayToken] ) 
	{
		[myLex lex];
		if ( [myLex nextToken] == [homeToken sqBracketToken])
		{
			[myLex lex];
			if ( [myLex nextToken] == [homeToken consToken] )
			{
				[myLex lex];
				if ( [myLex nextToken] == [homeToken commaToken] )
				{
					[myLex lex];
				} else {
					// Comma Error Message
					return NO;
				}
			}else {
					// Constant Error Message
					return NO;
			}
		}	else {
			// Error Square Bracket Message
			return NO;
		}
	} else if ( [myLex nextToken] == [homeToken integerToken] )
	{
		[myLex lex]; 
		if ( [myLex nextToken] == [homeToken colonToken]) {
			[myLex lex];
			if ( [self declarations2] )
				return YES;
			else
				return NO;
		} else {
			// Colon Error Message
			return NO;
		}
		
	} else 
	{
		// Array or Integer Error Message
		return NO;
	}
	
}

-(BOOL) declarations1
{
// p(d1, [il, :, d]).
// p(d1, [epsilon]).

	if ( [self identList] )
		if ( [myLex nextToken] == [homeToken colonToken] )
		{
			[myLex lex];
			if ( [self declarations] )
				return YES;
			else
				return NO;
		}  else
		{
			// Appropriate error message
			return NO;
		}
	else if ( [myLex nextToken] /* in follow set */)
		return YES;
	else 
		return NO;

}

-(BOOL) declarations2
{
//p(d2, [ (','), cons, d2]).
//p(d2, [epsilon]).

	if ( [myLex nextToken] == [homeToken commaToken] ) 
	{
		[myLex lex];
		if ( [myLex nextToken] == [homeToken consToken] ) 
		{
			if ( [self declarations2] ) return YES;
		}
	} else if ( [myLex nextToken] /* in Follow set */ )
	{
		return YES;
	} else {
		// Constant or follow set error message
		return NO;
	}
}

-(BOOL) identList
{
// p(il, [id, il1]).
	if ( [self identifier] )
	{
		if ( [self identList1] )
			return YES;
//		else return NO;
	} 
	return NO;
}

-(BOOL) identList1
{
// p(il1, [ (','), il]).
// p(il1, [epsilon]).

	if ( [myLex nextToken] == [homeToken commaToken] )
	{
		[myLex lex];
		if ( [self identList1] ) return YES;
		return NO;
	} else if ( [myLex nextToken] /* in follow set */ )
		return YES;
	else 
		// comma and follow set expectations
	return NO;
}

-(BOOL) identifier
{	
// p(id, [var, ida]).
	if ( [myLex nextToken] == [homeToken idToken])
	{
		[myLex lex]; 
		if ( [self identList1] ) return YES;
		else return NO;
	}
	// Identifier expected 
	return NO;
}

-(BOOL) identifier1
{
// p(ida, ['[', sublist, ']']).
// p(ida, [epsilon]).
	if ( [ myLex nextToken ] == [homeToken sqLBrackToken] )
	{
		[myLex lex];
		if ( [self sublist1] )
			if ( [self nextToken ] == [homeToken sqRBrackToken] )
				return YES;
			else
			{
				// error right square bracket token
				return NO;
			}
		else 
			return NO;
	} else if ( [myLex nextToken] /* next set of identfier 1.*/ )
		return YES;
	else // Error message for both left square brackets, and follow sets
	return NO;

}

-(BOOL) expression
{
	if ( [myLex nextToken] == [homeToken plusToken]){
	// p(e, [+, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken minusToken] ) {
	// p(e, [-, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken multiplyToken] ) {
	// p(e, [*, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken divideToken] ) {
	// p(e, [/, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken modToken] ){
	// p(e, [mod, e, e]). 
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken consToken] )  {
	// p(e, [cons]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [self identifier] ) {
	// p(e, [id]).
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else   // Expected expression first set.
	return NO;
}

-(BOOL) condition
{
	if ( [myLex nextToken] == [homeToken lessToken]){
	// p(c, [<, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken moreToken] ) {
	//	p(c, [>, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken lessEqToken] ){
	// p(c, [<=, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken moreEqToken] ){
	// p(c, [>=, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken eqToken] ){
	// p(c, [neq, e, e]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken neqToken] ){
	// p(c, [and, c, c]).
		[myLex lex];
		if ( [self expression ] )
			if ( [self expression ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken andToken] ){
	// p(c, [and, c, c]).
		[myLex lex];
		if ( [self condition ] )
			if ( [self condition ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken orToken] ){
	// p(c, [or, c, c]).
		[myLex lex];
		if ( [self condition ] )
			if ( [self condition ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else if ( [myLex nextToken ] == [homeToken notToken] ){
	// p(c, [not, c]).
		[myLex lex];
		if ( [self condition ] )
			if ( [self condition ] )
				return YES;
			else 
				return NO;
		else 
			return NO;
	}
	else  // Expected condition first set.
	return NO;
}

-(BOOL) sublist
{
// sublist ::== E sublist1
	if ( [self expression] )
		if ( [self sublist1] )
			return YES;

	return NO;
}

-(BOOL) sublist1
{
// sublist1 ::== , sublist
// sublist1 ::== epsilon

	if ( [myLex nextToken] == [homeToken commaToken] ) {
		if ( [self sublist ] ) return YES;
		else return NO;
	}
	else if ( [myLex nextToken ] /* in follow set */ ) 
		return YES;
	else // Error expected follow set or comma
	return NO;
}

/*
S ::== := Id E ; S.
S ::== { S } S3 .
S ::==  epsilon
*/

-(BOOL) statement
{
	if ( [myLex nextToken ] == [homeToken assignToken] )
	{
		[myLex lex];
		if ( [self expression ] ) 
			if ( [myLex nextToken ] == [homeToken colonToken] ) {
				[myLex lex];
				if ( [self statement ] )
					return YES;
				else 
					return NO;
			} else 
			{
				// Error: Colon Expected
				return NO;
			}
		else return NO;
	} else if ( [myLex nextToken ] == [homeToken rightBracketToken] )
	{ // S ::== { S } S3 .
		[ myLex lex];
		if ( [self statement] ) 
			if ( [myLex nextToken ] == [homeToken leftBracketToken] )
			{
				[myLex lex];
				if ( [self statement3] ) 
					return YES;
			}
			else {
				// Expected a left bracket
				return NO;
			}
		else return NO;
		
	} else if ( [myLex nextToken ] /* in follow set */ )
	{ // S ::==  epsilon
		return YES;
	} else // Error expected assign, rightBracket or follow set
	return NO;
}

-(BOOL) statement1
{
	// S1 ::== else { S } ; S
	if ( [ myLex nextToken ] == [homeToken elseToken] )
	{
		[myLex lex];
		if ( [ myLex nextToken ] == [homeToken rightBracketToken] )
		{
			[myLex lex];
			if ( [self statement] )
				if ( [ myLex nextToken ] == [homeToken leftBracketToken] )
				{
					[myLex lex];
					if ( [ myLex nextToken ] == [homeToken semiColonToken] )
					{
						[myLex lex];
						if ( [self statement])
							return YES;
						else 
							return NO;
					} else {
						// Error expected a semiColon
						return NO;
					}
				} else {
					// Error expected a left Bracket Token
					return NO;
				}
		} else {
			// Error expected a right bracket token
			return NO;
		}
	} else if ( [myLex nextToken ] == [homeToken semiColonToken] ) {	
		// S1 ::== ; S
		[myLex lex];
		if ( [self statement] )
			return YES;
		else return NO;
	}
}

-(BOOL) statement2
{
	if ( [self condition ] )
	{ // S2 ::== C ; S
	} else if ( [self expression ] )  {
		// S2 ::== E ; S
		if ( [myLex nextToken ] == [homeToken colonToken] ) 
		{
			[myLex lex];
			if ( [self statement] ) return YES;
			else return NO;
		} else {
			// Expected colon
			return NO;
		}
	} return NO;
}

-(BOOL) statement3
{
	if ( [myLex nextToken] == [homeToken whenToken] ) {
	// S3 ::== when C S1
		
	}
	else if ( [myLex nextToken] == [homeToken carrotToken] ) {
	// S3 ::== ^ when S2
		[myLex lex];
		if ( [myLex nextToken] == [homeToken whenToken] ) {
			[myLex lex];
			if ( [self statement2] ) return YES;
		} else {
			// Expected a When token
			return NO;
		}
	} else {
		// Expected a When or Carrot token
	}
	return NO;
}


-(headProductions *) initWithTokens:(tokenHome *) tokenValues
						sT:(symbolTable *) valueST
						lexAnalyzer:(lexical *) valueLex
{
	[super init];
	homeToken = [tokenValues retain];
	sT = [valueST retain];
	myLex = [valueLex retain];
//	semActions = NULL;
	return self;
}

/*
-(headProductions *) initWithTokens:(tokenHome *) tokenValues
						sT:(symbolTable *) valueST
						lexAnalyzer:(lexical *) valueLex
						semantics:(semanticActions *) semValues 
{
	[super init];
	homeToken = [tokenValues retain];
	sT = [valueST retain];
	myLex = [value retain];
	semActions = [semValues retain];
	return self;
} */

-(void) dealloc
{
	[homeToken release];
	[sT release];
	[myLex release];
//	[semActions release];
	[super dealloc];
	
}

@end
