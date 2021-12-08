//
//  actionCentral.m
//  semActions
//
//  Created by Daniel Beatty on 3/29/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "actionCentral.h"

@implementation actionCentral


-(void) popTheStarter
{
	[sas pop];
}

-(void) startDeclarations
{
	[sas push:0];
}



-(void) sublist
{
	[sas push:sublistType];
}

-(void) identifierEvaluation:(int)value
{
	[sas push:value];
}

-(void) nextTokenPush:(int) nt
{
	[sas push:nt];
}

/*
-(int) calculateAOffset
{
	row = [[myST table] objectAtIndex:a];
	int offset = 0;
	int tempMul, tempDim;
	int i,j;
	
	for ( i = 0; i < nexta; i++)
	{
		tempMul = 1;
		tempDim = nexta - i - 1;
		for ( j = 0 ; j < i; j++)
		{
			tempMul = tempMul * [row dimension][j];
		}
		offset += tempMul * aoffsets[tempDim];
	}
	
	return offset;
}

-(int) calculateBOffset
{
	row = [[myST table] objectAtIndex:b];
	int offset = 0;
	int tempMul, tempDim;
	int i,j;
	
	for ( i = 0; i < nextb; i++)
	{
		tempMul = 1;
		tempDim = nextb - i - 1;
		for ( j = 0 ; j < i; j++)
		{
			tempMul = tempMul * [row dimension][j];
		}
		offset += tempMul * boffsets[tempDim];
	}
	
	return offset;
}

-(void) evalSublistA
{
	nexta = 0;
	while ( ( atemp = [sas pop] ) != 0 )
	{
		aoffsets[nexta++] = atemp;
	}
	aoff = [self calculateAOffset];
	a = [sas pop];
}

-(void) evalSublistB
{
	nextb = 0;
	while ( ( btemp = [sas pop] ) != 0 )
	{
		boffsets[nextb++] = btemp;
	}
	boff = [self calculateBOffset];
	b = [sas pop];
}



*/
-(NSMutableArray *) reverse
{
	int i;
	NSMutableArray *reverseArray = [[NSMutableArray alloc]
				initWithCapacity:dimensions];
	NSNumber *reverseValue;
	for ( i = dimensions -1 ; i >= 0; i--)
	{
		reverseValue = [[NSNumber alloc] 
			initWithInt:dimension[i]];
		[reverseArray addObject: reverseValue];
		[reverseValue release];
	}
	return [reverseArray autorelease];
}

-(NSMutableArray *) evalSublist
{
	dimensions = 0;
	
	while ( ( atemp = [sas pop] ) != 0 )
	{
		dimension [dimensions++] = atemp;
	}
	
	return [self reverse];
}

-(NSMutableArray *) evalSublistA
{
	NSMutableArray *evaluated = [self evalSublist];
	a = [sas pop];
	return evaluated;
}

-(NSMutableArray *) evalSublistB
{
	NSMutableArray *evaluated = [self evalSublist];
	b = [sas pop];
	return evaluated;
}

/*
-(void) evalSublistB
{
	dimensions = 0;
	
	while ( ( btemp = [sas pop] ) != 0 )
	{
		workingNum = [[NSNumber alloc] 
				initWithInt:btemp];
		[dimensions addObject:workingNum];
		[workingNum release]; 
	}
	[boff release];
	boff = [self reverse:dimensions];
	b = [sas pop];
} */




-(id) initWithQuads: (quads *) codeBase
					stack:(actionStack *) workingStack
					symTable:(symbolTable *) sT
{
	[super init];
	myST = [sT retain];
	sas = [workingStack retain];
	imCode = [codeBase retain];
	a = b = c = d = e = 0;
	nexta = nextb = 0;
	aoff = boff = 0;
	sublistType = -2;
	return self;
}



-(void) dealloc 
{
	[myST release];
	[sas release];
	[imCode release];
	[super dealloc];
}

@end
