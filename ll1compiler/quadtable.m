//
//  quadtable.m
//  malloctest
//
//  Created by Daniel D. Beatty on 11/26/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "quadtable.h"
#import "fileio.h"

@implementation quadtable

-(id) initWithLength:(unsigned)size 
{
	[super init];
	[self forSize:size];
	index = 0;
	count = 0;
	return self;
}

-(void) forSize:(int)size
{
	qtable = (quadtabletype *)malloc(sizeof(quadtabletype) * size);
}

-(void) dealloc
{
	free(qtable);
	[super dealloc];
}


-(void) genquad:(int) op op1:(int)op1 op2:(int)op2 result:(int)result
{
	index = count;
	[self setOperation:op at:index];
	[self setOperand1:op1 at:index];
	[self setOperand2:op2 at:index];
	[self setResult:result at:index];
	[self setIndex1a:0 at:index];
	[self setIndex2a:0 at:index];
	[self setIndex3a:0 at:index];
	[self setIndex1b:0 at:index];
	[self setIndex2b:0 at:index];
	[self setIndex3b:0 at:index];
	[self setIndex1c:0 at:index];
	[self setIndex2c:0 at:index];
	[self setIndex3c:0 at:index];
	
	count++;
}

-(int) NQ
{
	return count;
}

-(void) writeOutTable:(NSString *)fileName
{
	fileio *output = [[fileio alloc] init];
	[output createFile:fileName];
	NSNumber *valueOp;
	NSNumber *valueOp1;
	NSNumber *valueOp2;
	NSNumber *valueResult;
	NSNumber *valueIndex1a;
	NSNumber *valueIndex2a;
	NSNumber *valueIndex3a;
	NSNumber *valueIndex1b;
	NSNumber *valueIndex2b;
	NSNumber *valueIndex3b;
	NSMutableString *buildingString;
	
	int i = 0;
	for ( i = 0; i < count; i++)
	{
		[output writeInt:[self operationAt:i]];
		[output writeInt:[self operand1At:i]];
		[output writeInt:[self operand2At:i]];
		[output writeInt:[self resultAt:i]];
		[output writeInt:[self index1aAt:i]];
		[output writeInt:[self index2aAt:i]];
		[output writeInt:[self index3aAt:i]];
		[output writeInt:[self index1bAt:i]];
		[output writeInt:[self index2bAt:i]];
		[output writeInt:[self index3bAt:i]];
		[output writeInt:[self index1cAt:i]];
		[output writeInt:[self index2cAt:i]];
		[output writeInt:[self index3cAt:i]];
		[output writeEol];
	}
	[output closeFile];
	[output release];
}

-(int) operationAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->operation;
}

-(int) operand1At:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->operand1;
}

-(int) operand2At:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->operand2;
}

-(int) resultAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->result;
}

-(int) index1aAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index1a;
}

-(int) index2aAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index2a;
}

-(int) index3aAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index3a;
}

-(int) index1bAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index1b;
}

-(int) index2bAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index2b;
}

-(int) index3bAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index3b;
}

-(int) index1cAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index1c;
}

-(int) index2cAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index2c;
}

-(int) index3cAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->index3c;
}

-(int) locationAt:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	return quadptr->location;
}

-(int) count
{
	return count;
}

-(int) index
{
	return index;
}


-(void) setOperation:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->operation = value;
}

-(void) setOperand1:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->operand1 = value;
}

-(void) setOperand2:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->operand2 = value;
}

-(void) setResult:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->result = value;
}

-(void) setIndex1a:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index1a = value;
}

-(void) setIndex2a:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index2a = value;
}

-(void) setIndex3a:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index3a = value;
}

-(void) setIndex1b:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index1b = value;
}

-(void) setIndex2b:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index2b = value;
}

-(void) setIndex3b:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index3b = value;
}

-(void) setIndex1c:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index1c = value;
}

-(void) setIndex2c:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index2c = value;
}

-(void) setIndex3c:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->index3c = value;
}

-(void) setLocation:(int)value at:(int)anindex
{
	quadtabletype *quadptr = (qtable +( sizeof(quadtabletype) * anindex));
	quadptr->location = value;
}


-(void) setCount:(int)value
{
	count = value;
}

-(void) setIndex:(int)value
{
	index = value;
}

@end
