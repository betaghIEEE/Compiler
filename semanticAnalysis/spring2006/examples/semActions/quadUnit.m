//
//  quadUnit.m
//  semActions
//
//  Created by Daniel Beatty on 3/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "quadUnit.h"


@implementation quadUnit

-(int) op
{
	return op;
}

-(int) arg1
{
	return arg1;
}

-(int) arg2
{
	return arg2;
}

-(NSMutableArray *) arg1Offset
{
	return arg1Offset;
}

-(NSMutableArray *) arg2Offset
{
	return arg2Offset;
}

-(int) results
{
	return results;
}


-(NSMutableArray *) resultsOffset
{
	return resultsOffset;
}



-(void) setOp:(int) value
{
	op = value;
}

-(void) setArg1:(int) value
{
	arg1 = value;
}

-(void) setArg2:(int) value
{
	arg2 = value;
}

-(void) results:(int) value
{
	results = value;
}

-(void) setArg1Offset:(NSMutableArray *) value
{
	[arg1Offset release];
	if ( value != nil )
		arg1Offset = [value retain];
	else arg1Offset = nil;
}

-(void) setArg2Offset:(NSMutableArray *) value
{
	[arg2Offset release];
	if ( value != nil )
		arg2Offset = [value retain];
	else arg2Offset = nil;
}


-(void) setResults:(int) value
{
	results = value;
}

-(void) setResultsOffset:(NSMutableArray *) value
{
	[resultsOffset release];
	if ( value != nil )
		resultsOffset = [value retain];
	else resultsOffset = nil;
}

-(id) init
{
	[super init];
	op = 0;
	arg1 = 0;
	arg2 = 0;
	results = 0;
	arg1Offset = nil;
	arg2Offset = nil;
	resultsOffset = nil;
	
	
	return self;
}

-(void) dealloc
{
	if (arg1Offset != nil ) [arg1Offset release];
	if (arg2Offset != nil ) [arg2Offset release];
	if (resultsOffset != nil ) [resultsOffset release];
	[super dealloc];
}

@end
