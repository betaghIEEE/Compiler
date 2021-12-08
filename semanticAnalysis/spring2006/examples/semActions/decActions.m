//
//  decActions.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "decActions.h"

@implementation decActions

-(void) startArrayDimensions:(int) nt
{
	[sas push:0];
	[sas push:nt];
}

-(void) augmentIntegers
{
	a = [sas pop];
	while ( a != 0 ) 
	{
		row = [[myST table] objectAtIndex:a -1 ];
		[row setDataType:integerType];
		a = [sas pop];
	}
}

-(void) augmentArrays
{
	int i;
	a = [sas pop];
	dimensions = 0;
	while ( a != 0 ) 
	{
		//[dimensions addObject:[NSNumber numberWithInt:a]];
		dimension[dimensions++] = a;
		a = [sas pop];
	}
	
	a = [sas pop];
	while ( a != 0 ) 
	{
		//[[[myST table] objectAtIndex:a] setDataType: arrayType];
		//[[[myST table] objectAtIndex:a] setDimensionsRev: dimensions];
		row = [[myST table] objectAtIndex:a];
		[row setDataType:arrayType];
		[row setDimensions:dimensions];
		for ( i = 0; i < dimensions; i++) 
		{
			[row dimension][i] = dimension[dimensions -1 -i];
		}
		a = [sas pop];
	}
	//[dimensions release];
}

@end
