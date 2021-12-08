//
//  quads.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "quads.h"
#import "quadUnit.h"
#import "evalTypes.h"

@implementation quads


-(void) genquad:(int) op
{
	quadUnit *newUnit = [[quadUnit alloc] init];
	[newUnit setOp:op];
	[quadTable addObject:newUnit];
	[newUnit release];
}


-(void) genquad:(int) op
			arg1:(int) arg1
			arg2:(int) arg2
			results: (int) result
{
	quadUnit *newUnit = [[quadUnit alloc] init];
	[newUnit setOp:op];
	[newUnit setArg1:arg1];
	[newUnit setArg2:arg2];
	[newUnit setResults:result];
	[quadTable addObject:newUnit];
	[newUnit release];
}


-(void) genquad:(int) op
			arg1:(int) arg1
			arg1Offset:(NSMutableArray *) arg1Offset
			arg2:(int) arg2
			arg2Offset:(NSMutableArray *) arg2Offset
			results: (int) result
			resultOffset:(NSMutableArray *) resultOffset
{
	quadUnit *newUnit = [[quadUnit alloc] init];
	[newUnit setOp:op];
	[newUnit setArg1:arg1];
	[newUnit setArg2:arg2];
	[newUnit setResults:result];
	[newUnit setArg1Offset:arg1Offset];
	[newUnit setArg2Offset:arg2Offset];
	[newUnit setResultsOffset:resultOffset];
	[quadTable addObject:newUnit];
	[newUnit release];
	
}


-(void) codeAt:(int) location
			results: (int) results
{
	quadUnit *workUnit = [quadTable objectAtIndex:location];
	[workUnit setResults:results];
}

-(int) nextQuad
{
	return [quadTable count];
}

-(void) printOutQuads
{
	int i = 0; 
	int count = [quadTable count];
	int op, arg1, arg2, results;
	quadUnit *workingQuad;
	for ( i = 0; i < count; i++)
	{
		workingQuad = [quadTable objectAtIndex:i];
		op = [workingQuad op];
		switch (op )
		{
			case jmp: printf( "Jump ");
				break;
			case jfalse: printf( "JFalse" );
				break;
			case jtrue: printf( "JFalse" );
				break;
			case neqType: printf( "neq" );
				break;
			case eqType: printf( "eq" );
				break;
			case moreEqType: printf( "more Eq" );
				break;
			case lessEqType: printf( "less Eq" );
				break;
			case moreType: printf( "more" );
				break;
			case lessType: printf( "less" );
				break;
			case addType: printf( "add" );
				break;
			case minusType: printf( "minus" );
				break;
			case multiplyType: printf( "multipy" );
				break;
			case divideType: printf( "Divide" );
				break;
			case modType: printf( "JFalse" );
				break;
			case assign: printf( "assign" );
				break;
			default: printf ("wtf");
		};
		arg1 = [workingQuad arg1];
		arg2 = [workingQuad arg2];
		results = [workingQuad results];
		printf ( " %d  %d   %d \n"  , arg1, arg2, results);
	}
}

-(id) init 
{
	[super init];
	quadTable = [[ NSMutableArray alloc] initWithCapacity:200];
	return self;
}


-(void) dealloc
{
	[quadTable release];
	[super dealloc];
}

@end
