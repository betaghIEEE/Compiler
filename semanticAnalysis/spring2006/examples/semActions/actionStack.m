//
//  actionStack.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "actionStack.h"


@implementation actionStack

-(id) init 
{
	[super init];
	head = 0;
	return self;
}



-(int) pop
{
	if ( head >= 0 )
		if ( head < 100 )
			return stack[--head ];
	return -1;
}

-(void) push:(int) value
{
	if ( head >= 0 ) 
		if ( head < 100 ) 
			stack[head++] = value;
}

@end
