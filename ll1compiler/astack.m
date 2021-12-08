//
//  astack.m
//  ll1compiler
//
//  Created by Daniel D. Beatty on 11/24/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "astack.h"


@implementation astack
-(id)  initWithLength:(unsigned)size
{
	 //S = [[NSMutableArray alloc] initWithCapacity:size];
	 N = 0;
	 return self;
}

-(BOOL) empty
{
	if ( N <= 0 ) return YES;
	return NO;
}

-(void) push:(int) value
{
	S[N] = value;
	N++;
}

-(int) pop
{
	int value;
	int index = N -1;
	if ( index < 0 ) return 0;
	value = S[index];
	N--;
	return value;
}


@end
