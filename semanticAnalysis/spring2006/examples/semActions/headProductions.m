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
#import "symbols.h"
#import "lexical.h"
#import "followSet.h"
#import "epsilonSet.h"
#import "evalTypes.h"

#import "evalActions.h"
#import "decActions.h" 
#import "conditionalActions.h"
#import "statementActions.h"

@implementation headProductions
-(BOOL) program
{
	[self lex];
	if (ntType == [homeToken progToken]/* nt = prog */ )
	{
		[self lex]; 
		if ( ntType == [homeToken lParenthesis]/* nt = ( */ )
		{
			[self lex];
			if ( [self identifier] /* IL */ )
			{
				// [declare input];
				if ( ntType == [homeToken rParenthesis] )
				{
					[self lex];
					[declare startDeclarations];
					if ( [self declarations1] /* D1 */ ) 
					{
					
						[declare popTheStarter];
						if ( ntType == [homeToken leftBracketToken] /* nt = '{' */ )
						{
							[self lex];
							if ( [self statement]/* S */ )
							{
								if ( ntType == [homeToken rightBracketToken]/* nt = '}'*/ ) 
								{
									[self lex];
									if (  ntType == [homeToken pointerToken]/*nt = '->' */)
									{
										[self lex];
										if ( ntType == [homeToken lParenthesis] /* nt = '(' */ )
										{
											[self lex];
											if ( [self identifier] /* IL */ ) 
												if ( ntType == [homeToken rParenthesis]/* nt = ')' */ )
												{
													// [state output];
													[self lex];
													// test for end of program
													// Done
													return YES;
												} else
												{
													[self expectedInt: [homeToken rParenthesis] ];
													[self expectedLine];
												}
										} else {
											// expecting '(' symbol
											[self expectedInt:[homeToken lParenthesis]];
											[self expectedLine];
											return NO;
										}
									} else {
										// expecting pointer operator 
										[self expectedInt:[homeToken pointerToken]];
										[self expectedLine];
										return NO;
									}
								}  else {
									// Expecting right bracket
									[self expectedInt:[homeToken rightBracketToken]];
									[self expectedLine];
									return NO;
								}
							} return NO;	
						} else {
								//  Expect left bracket
								[self expectedInt:[homeToken leftBracketToken]];
								[self expectedLine];
								return NO;
						}
					} else return NO;
				}  else {
					// expected right parenthesis
					[self expectedInt:[homeToken rParenthesis]];
					[self expectedLine];
				}
			} else return NO;
		} else { 
			// expected left parenthesis
			[self expectedInt:[homeToken lParenthesis]];
			[self expectedLine];
			return NO;
		}
	} else {
		// expected prog reserved word
		[self expectedInt:[homeToken progToken]];
		[self expectedLine];
		return NO;
	}
	return NO;
}

-(BOOL) declarations
{
// p(d, [array, '[', cons, d2, ']', (;), d1]).
// p(d, [integer, (;), d1]).
	if ( ntType == [homeToken arrayToken] ) 
	{
		[self lex];
		if ( ntType == [homeToken sqLBracketToken])
		{
			[self lex];
			if ( ntType == [homeToken consToken] )
			{
				[declare startArrayDimensions:nt];
				[self lex];
				if ( [self declarations2] ) {
					if ( ntType == [homeToken sqRBracketToken] )
					{
						[self lex];
						if ( ntType == [homeToken semiColonToken] ) 
						{
							[declare augmentArrays];
							[declare startDeclarations];
							[self lex];
							if ( [self declarations1] ) return YES;
							else return NO;
						} else {
							[self expectedInt:[homeToken semiColonToken]];
							[self expectedLine];
							return NO;
						}
					} else {
						// Right Square Bracket expected.
							[self expectedInt:[homeToken sqRBracketToken]];
							[self expectedLine];
						return NO;
					}
				} else return NO;
				
			}else {
					// Constant Error Message
					[self expectedInt:[homeToken consToken]];
					[self expectedLine];
					return NO;
			}
		}	else {
			// Error Square Bracket Message
			[self expectedInt:[homeToken sqLBracketToken]];
			[self expectedLine];
			return NO;
		}
	} else if ( ntType == [homeToken integerToken] )
	{
// p(d, [integer, (;), d1]).
		[declare augmentIntegers];
		[self lex]; 
		if ( ntType == [homeToken semiColonToken]) {
			[declare startDeclarations];
			[self lex];
			if ( [self declarations1] )
				return YES;
			else
				return NO;
		} else {
			// semiColon Error Message
			[self expectedInt:[homeToken semiColonToken]];
			[self expectedLine];
			return NO;
		}
		
	} else 
	{
		// Array or Integer Error Message
		// return NO;
		[self expectedInt:[homeToken arrayToken]];
		[self expectedInt:[homeToken semiColonToken]];
		[self expectedLine];
	}
	return NO;
}

-(BOOL) declarations1
{
// p(d1, [il, :, d]).
// p(d1, [epsilon]).

	if ( [self identList] )
		if ( ntType == [homeToken colonToken] )
		{
			//[declare nextTokenPush:nt];
			[self lex];
			if ( [self declarations] )
				return YES;
			else
				return NO;
		}  else
		{
			// Appropriate error message
			[self expectedInt:[homeToken colonToken]];
			[self expectedLine];
			return NO;
		}
	else if ( [meFollow inDeclarations1: ntType ] ) {
		return YES;
	}
	else 
		return NO;

}

-(BOOL) declarations2
{
//p(d2, [ (','), cons, d2]).
//p(d2, [epsilon]).

	if ( ntType == [homeToken commaToken] ) 
	{
		[self lex];
		if ( ntType == [homeToken consToken] ) 
		{
			[declare nextTokenPush:nt];
			[self lex];
			if ( [self declarations2] ) return YES;
		}
	}  else if ( [meFollow inDeclarations2: ntType ] ) return YES;
	else {
		// Constant or follow set error message
		[self expectingList:[specialList declarations2]];
		return NO;
	}
	return NO;
}

-(BOOL) identList
{
// p(il, [id, il1]).
	if ( ntType == [homeToken idToken] )
	{
		[declare nextTokenPush:nt];
		[self lex];
		if ( [self identList1] )
			return YES;
	} 
	return NO;
}

-(BOOL) identList1
{
// p(il1, [ (','), il]).
// p(il1, [epsilon]).

	if ( ntType == [homeToken commaToken] )
	{
		[self lex];
		if ( [self identList] ) return YES;
		return NO;
	} else if ( [meFollow inIdentList1: ntType] ) return YES;
	else 
		// comma and follow set expectations
	[self expectingList:[specialList identList1]];
	return NO;
}

-(BOOL) identifier
{	
// p(id, [var, ida]).
	if ( ntType == [homeToken idToken])
	{
		[declare nextTokenPush:nt];
		[self lex]; 
		if ( [self identifier1] ) return YES;
		else return NO;
	}
	// Identifier expected 
	/*
	[self expectedInt:[homeToken idToken]];
	[self expectedLine]; 
	*/
	return NO;
}

-(BOOL) identifier1
{
// p(ida, ['[', sublist, ']']).
// p(ida, [epsilon]).
	if ( [ myLex nextToken ] == [homeToken sqLBracketToken] )
	{
		[state startDeclarations];
		[self lex];
		if ( [self sublist] )
			if ( ntType == [homeToken sqRBracketToken] ) {
				[state sublist]; 
				[self lex];
				return YES;
			} else
			{
				// error right square bracket token
				[self expectedInt:[homeToken sqRBracketToken]];
				[self expectedLine];
				return NO;
			}
		else 
			return NO;
	} else if ( [meFollow inIdentifier1: ntType]  ) return YES;
	else // Error message for both left square brackets, and follow sets
	[self expectingList:[specialList identifier1]];
	return NO;

}

-(BOOL) expression
{
	if ( ntType == [homeToken plusToken]){
	// p(e, [+, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate addEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken minusToken] ) {
	// p(e, [-, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate minusEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken multiplyToken] ) {
	// p(e, [*, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate multiplyEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken divideToken] ) {
	// p(e, [/, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate divideEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken modToken] ){
	// p(e, [mod, e, e]). 
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate modEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken consToken] )  {
	// p(e, [cons]).
		[evaluate constantEvaluation:nt];
		[self lex];
		return YES;
	}
	else if ( [self identifier] ) {
	// p(e, [id]).
		return YES;
	}
	else   // Expected expression first set.
	[self expectedInt:[homeToken plusToken]];
	[self expectedInt:[homeToken minusToken]];
	[self expectedInt:[homeToken multiplyToken]];
	[self expectedInt:[homeToken divideToken]];
	[self expectedInt:[homeToken modToken]];
	[self expectedInt:[homeToken consToken]];
	return NO;
}

-(BOOL) condition
{
	if ( ntType == [homeToken lessToken]){
	// p(c, [<, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate lessEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken moreToken] ) {
	//	p(c, [>, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate moreEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken lessEqToken] ){
	// p(c, [<=, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate lessEqEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken moreEqToken] ){
	// p(c, [>=, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate moreEqEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken eqToken] ){
	// p(c, [neq, e, e]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate eqEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken neqToken] ){
	// p(c, [and, c, c]).
		[self lex];
		if ( [self expression ] )
			if ( [self expression ] ) {
				[evaluate neqEvaluation];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken andToken] ){
	// p(c, [and, c, c]).
		[self lex];
		if ( [self condition ] )
			if ( [self condition ] ) {
				[test andAction];
				return YES;}
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken orToken] ){
	// p(c, [or, c, c]).
		[self lex];
		if ( [self condition ] )
			if ( [self condition ] ) {
				[test orAction];
				return YES; }
			else 
				return NO;
		else 
			return NO;
	}
	else if ( ntType == [homeToken notToken] ){
	// p(c, [not, c]).
		[self lex];
		if ( [self condition ] ) {
				[test andAction];
			return YES; }
		else 
			return NO;
	}
	else  // Expected condition first set.
	[self expectedInt:[homeToken notToken]];
	[self expectedInt:[homeToken andToken]];
	[self expectedInt:[homeToken orToken]];
	[self expectedInt:[homeToken neqToken]];
	[self expectedInt:[homeToken eqToken]];
	[self expectedInt:[homeToken moreEqToken]];
	[self expectedInt:[homeToken lessEqToken]];
	[self expectedInt:[homeToken moreToken]];
	[self expectedInt:[homeToken lessToken]];
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

	if ( ntType == [homeToken commaToken] ) {
		if ( [self sublist ] ) return YES;
		else return NO;
	}
	else if ( [meFollow inSublist1: ntType]  ) return YES;
	else // Error expected follow set or comma
	[self expectingList:[specialList sublist1]];
	return NO;
}

/*
S ::== := Id E ; S.
S ::== { S } S3 .
S ::==  epsilon
*/

-(BOOL) statement
{
	if ( ntType == [homeToken assignToken] )
	{
		[self lex];
		if ( [self identifier] )
			if ( [self expression ] ) 
				if ( ntType == [homeToken semiColonToken] ) {
					[state endAssignment]; 
					[self lex];
					if ( [self statement ] )
						return YES;
					else 
						return NO;
				} else 
				{
					// Error: semiColon Expected
				[self expectedInt:[homeToken semiColonToken]];
				[self expectedLine];
					return NO;
				}
			else return NO;
		else return NO;
	} else if ( ntType == [homeToken leftBracketToken] )
	{ // S ::== { S } S3 .
		[state beginStatement];
		[ self lex];
		if ( [self statement] ) 
			if ( ntType == [homeToken rightBracketToken] )
			{
				[self lex];
				if ( [self statement3] ) 
					return YES;
			}
			else {
				// Expected a left bracket
				[self expectedInt:[homeToken rightBracketToken]];
				[self expectedLine];
				return NO;
			}
		else return NO;
		
	} else if ( [meFollow inStatement: ntType]  ) return YES; // S ::==  epsilon
	else // Error expected assign, rightBracket or follow set
	[self expectingList:[specialList statement]];
	return NO;
 return NO;	
	
}

-(BOOL) statement1
{
	// S1 ::== else { S } ; S
	if ( [ myLex nextToken ] == [homeToken elseToken] )
	{
		[self lex];
		if ( [ myLex nextToken ] == [homeToken leftBracketToken] )
		{
			[state beginElseStatement];
			[self lex];
			if ( [self statement] )
				if ( [ myLex nextToken ] == [homeToken rightBracketToken] )
				{
					[self lex];
					if ( [ myLex nextToken ] == [homeToken semiColonToken] )
					{
						[state endElseStatement];
						[self lex];
						if ( [self statement])
							return YES;
						else 
							return NO;
					} else {
						// Error expected a semiColon
						[self expectedInt:[homeToken semiColonToken]];
						[self expectedLine];
						return NO;
					}
				} else {
					// Error expected a left Bracket Token
					[self expectedInt:[homeToken leftBracketToken]];
					[self expectedLine];
					return NO;
				}
		} else {
			// Error expected a right bracket token
			[self expectedInt:[homeToken rightBracketToken]];
			[self expectedLine];
			return NO;
		}
	} else if ( ntType == [homeToken semiColonToken] ) {	
		// S1 ::== ; S
		[state endWhenCondition];
		[self lex];
		if ( [self statement] )
			return YES;
		else return NO;
	}
	[self expectedInt:[homeToken elseToken]];
	[self expectedInt:[homeToken semiColonToken]];
	[self expectedLine];
	return NO;

}

-(BOOL) statement2
{
	if ( ntType == [homeToken whenToken]) { // S2 ::== when C ; S
		if ( [self condition ] )
		{ 
			if ( ntType == [homeToken semiColonToken] )
			{
				[state endCarrotCondition];
				[self lex];
				if ( [self statement] ) return YES;
				else return NO;
			} else {
				// expected a semi colon
				[self expectedInt:[homeToken semiColonToken]];
				[self expectedLine];
				return NO;
			}
		} else return NO;
	} else if ( [self expression ] )  { // S2 ::== E ; S
		if ( ntType == [homeToken semiColonToken] ) 
		{
			[state endCarrotExpression];
			[self lex];
			if ( [self statement] ) return YES;
			else return NO;
		} else {
			// Expected semiColon
			[self expectedInt:[homeToken semiColonToken]];
			[self expectedLine];
			return NO;
		}
	} 
	return NO;
}

-(BOOL) statement3
{
	if ( ntType == [homeToken whenToken] ) {
	// S3 ::== when C S1
		[state beginStatement];
		[self lex];
		if ( [self condition] ) 
		{
			if ( [self statement1 ] ) return YES;
			else return NO;
		}
		else return NO;
	}
	else if ( ntType == [homeToken carrotToken] ) {
	// S3 ::== ^ when S2
		[self lex];
		if ( [self statement2] ) return YES;
			else return NO;
	} else {
		// Expected a When or Carrot token
		[self expectedInt:[homeToken whenToken]];
		[self expectedInt:[homeToken carrotToken]];
		
		[self expectedLine];


	}
	return NO;
}


-(void) expectedInt:(int) type
{		
	int expectedValue;
	NSString *actualToken;
		if ( expectingCount > 0 )
			[wasExpecting appendString: @", " ];
	expectedValue = type;
	if ( expectedValue <= 31 )
			actualToken = [(symbols *) [[sT table] objectAtIndex:(type -1) ] tokenName];
	else if ( expectedValue == 101 ) actualToken = @"a constant type ";
	else if ( expectedValue == 102 ) actualToken = @"an identifier type";
	else actualToken = @"What the hell is this?";
		[wasExpecting appendString: actualToken ];
		expectingCount++;

}

-(void) expectingList:(NSArray *) list
{
//	[wasExpecting release];
//	wasExpecting = [[NSMutableString alloc] initWithString:@"Was expecting " ];		
	int expectedValue;
	NSString *actualToken;
	NSEnumerator *enumList = [list objectEnumerator];
	NSNumber *listItem;
	
	listItem = [enumList nextObject];
	
	expectedValue = [listItem intValue];
	if ( (expectedValue <= 31) & (expectedValue > 0))
			actualToken = [(symbols *) [[sT table] objectAtIndex:(expectedValue -1) ] tokenName];
	else if ( expectedValue == 101 ) actualToken = @"a constant type ";
	else if ( expectedValue == 102 ) actualToken = @"an identifier type";
	else actualToken = @"What the hell is this?";
	[wasExpecting appendString: actualToken ];
	
	while ( listItem = [enumList nextObject] )
	{
		[wasExpecting appendString: @", " ];
		expectedValue = [listItem intValue];
	if ( (expectedValue <= 31) & (expectedValue > 0))
			actualToken = [(symbols *) [[sT table] objectAtIndex:(expectedValue -1) ] tokenName];
		else if ( expectedValue == 101 ) actualToken = @"an identifier type ";
		else if ( expectedValue == 102 ) actualToken = @"a constant type";
		else actualToken = @"What the hell is this?";
		[wasExpecting appendString: actualToken ];
	}
	
	[self expectedLine];
}

-(void) expectedLine
{
	[wasExpecting appendString: @"but not what was given."];
	int characterNumber = [myLex getCharacterNumber];
	[wasExpecting appendString: @" at character number "];
	[wasExpecting appendString: [[NSNumber numberWithInt:characterNumber] stringValue] ];
}

-(NSMutableString *) wasExpecting
{
	return wasExpecting;
}

-(void) lex 
{
	[myLex lex];
	nt = [myLex nextToken];
	if ( (nt > 0 ) && ( nt <= ([[sT table] count]  )  ) )
		ntType = [(symbols *) [[sT table] objectAtIndex:(nt -1) ] tokenType];
	else ntType = 0;
}


-(quads *) imCode 
{
	return imCode;
}

-(actionStack *) sas
{
	return sas;
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
	wasExpecting = [[NSMutableString alloc] initWithString:@"Was expecting " ];
	specialList = [[epsilonSet alloc] init];
	meFollow = [[followSet alloc] init];
	expectingCount = 0;
	imCode = [[quads alloc] init];
	sas = [[actionStack alloc] init];
	evaluate = [[evalActions alloc] initWithQuads:imCode
									stack: sas
									symTable:sT];
	state = [[statementActions alloc] initWithQuads:imCode
									stack: sas
									symTable:sT];
	declare = [[decActions alloc] initWithQuads:imCode
									stack: sas
									symTable:sT];
	test = [[conditionalActions alloc] initWithQuads:imCode
									stack: sas
									symTable:sT];
	
	return self;
}

-(headProductions *) initWithTokens:(tokenHome *) tokenValues
						sT:(symbolTable *) valueST
						lexAnalyzer:(lexical *) valueLex
						state:(statementActions *) workingState
						evaluator:(evalActions *) evaluator
						declaration:(decActions *) variables
						conditional:(conditionalActions *) testingStatements
						quadCode:(quads *) quadCode
						stack:(actionStack *) workingStack
{
	[super init];
	homeToken = [tokenValues retain];
	sT = [valueST retain];
	myLex = [valueLex retain];
//	semActions = NULL;
	wasExpecting = [[NSMutableString alloc] initWithString:@"Was expecting " ];
	specialList = [[epsilonSet alloc] init];
	meFollow = [[followSet alloc] init];
	expectingCount = 0;
	imCode = [quadCode retain];
	sas = [workingStack retain];
	evaluate = [evaluator retain];
	declare = [variables retain];
	state = [workingState retain];
	test = [testingStatements retain];
	
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
	[specialList release];
	[meFollow release];
	[super dealloc];
	
}

@end
