//
//  evalActions.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "evalActions.h"


@implementation evalActions



-(void) evaluation:(int) op
{
	aoffsets = nil;
	boffsets = nil;
	c = [myST gentemp];
	a = [sas pop];  // E2's value
	
	if (  (sublistType ) == a)
		aoffsets = [self evalSublistA];
	
	b = [sas pop];	// E1's value
	if ( (sublistType ) == b)
		boffsets = [self evalSublistB];
	
	
	[imCode genquad: op
			arg1: b
			arg1Offset:aoffsets
			arg2: a
			arg2Offset:boffsets
			results: c 
			resultOffset: nil
			];
	[sas push: c];
}

-(void) constantEvaluation:(int) value
{
	[sas push:value];
}

-(void) identifierEvaluation:(int) value
{
	[sas push:value];
}

-(void) addEvaluation
{
	[self evaluation:(int) addType];
}


-(void) minusEvaluation
{
	[self evaluation:(int) minusType];
}


-(void) multiplyEvaluation
{
	[self evaluation:(int) multiplyType];
}

-(void) divideEvaluation
{
	[self evaluation:(int) divideType];
}

-(void) modEvaluation
{
	[self evaluation:(int) modType];
}



-(void) lessEvaluation
{
	[self evaluation:(int) lessType];
}

-(void) moreEvaluation
{
	[self evaluation:(int) moreType];
}

-(void) lessEqEvaluation
{
	[self evaluation:(int) lessEqType];
}

-(void) moreEqEvaluation
{
	[self evaluation:(int) moreEqType];
}

-(void) eqEvaluation
{
	[self evaluation:(int) eqType];
}

-(void) neqEvaluation
{
	[self evaluation:(int) neqType];
}

-(void) gotID:(int) identifier
{
	[sas push:identifier];
}

-(void) gotSublist
{
	[sas push:0];
}

-(void) endOfSublist
{
	[sas push:(int) subListType];
}





@end
