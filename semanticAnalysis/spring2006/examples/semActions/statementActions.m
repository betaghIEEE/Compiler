//
//  statementActions.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "statementActions.h"

@implementation statementActions


-(void) beginStatement
{
	[sas push:[imCode nextQuad]];
	[imCode genquad:(int) jmp];
}


-(void) endAssignment:(int) identifier
{
	b = [sas pop];
	a = identifier;
	[imCode genquad:(int) assign
			arg1: b
			arg2: 0
			results: a ]; 
}


-(void) endAssignment
{
	
	b = [sas pop];
	boffsets = nil;
	if ( ( sublistType ) == b )
		boffsets = [self evalSublistB];
	a = [sas pop];  // E2's value
	aoffsets = nil;
	if ( ( sublistType ) == a)
		aoffsets = [self evalSublistA];
	
	[imCode genquad:(int) assign
			arg1: b
			arg1Offset: boffsets
			arg2: 0
			arg2Offset: 0
			results: a 
			resultOffset: aoffsets ]; 
}




-(void) endWhenCondition
{
	a = [sas pop]; // Conditional result
	b = [sas pop]; // end of statement
	c = [sas pop]; // beginning of the statement (at the jump).
	[imCode genquad:(int) jtrue
			arg1: a
			arg2: 0
			results: c + 1 ];
	[imCode codeAt:c
			results: b +1 ];
	[imCode codeAt:b
			results: [imCode nextQuad] ];
}



-(void) beginElseStatement
{
	a = [sas pop]; // Conditional result
	b = [sas pop]; // end of statement
	c = [sas pop]; // beginning of the statement (at the jump).
	[imCode genquad:(int) jtrue
			arg1: a
			arg2: 0
			results: c + 1 ];
	[imCode codeAt:c
			results: b +1 ];
	[sas push:b];
}

-(void) endElseStatement
{
	b = [sas pop];
	[imCode codeAt:b
		results: [imCode nextQuad]];
}


-(void) endCarrotCondition
{
	c = [sas pop]; // Results of conditional
	b = [sas pop]; // Jump coordinates after statement
	a = [sas pop]; // Jump coordinates before statement
	
	
	[imCode codeAt:a
			results: b +1 ];
	[imCode codeAt:b
			results: [imCode nextQuad] ];
	[imCode genquad:(int) jtrue
			arg1: c
			arg2: 0
			results: a + 1 ];
}

-(void) endCarrotExpression
{
	b = [sas pop]; // Results of expression
	boffsets = nil;
	if ( ( sublistType) == b) 
		boffsets = [self evalSublistB];
	f = [sas pop]; // Jump coordinates after statement
	a = [sas pop]; // Jump coordinates before statement
	c = [myST gentemp];

	
	[imCode genquad:(int) assign
			arg1: b
			arg1Offset:boffsets
			arg2: 0
			arg2Offset:nil
			results: c 
			resultOffset: nil ];
	d = [imCode nextQuad];
	[imCode genquad:(int) jmp
			arg1: 0
			arg2: 0
			results: 0 ];
	[imCode genquad:(int) minusType
			arg1: c
			arg2: c1
			results: c ];
	e = [myST gentemp];
	[imCode genquad:(int) lessEqType
			arg1: c
			arg2: c0
			results: e ];
	[imCode genquad:(int) jtrue
			arg1: e
			arg2: 0
			results: a + 1 ];
	[imCode codeAt:a
			results: f + 1 ];
	[imCode codeAt: f
			results: d + 1 ];
	[imCode codeAt: d
			results: d + 2 ];
}




@end
