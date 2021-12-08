//
//  codegen.m
//  ll1compiler
//
//  Created by Daniel D. Beatty on 12/3/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "codegen.h"
#import "codegendef.h"
#import "quaddef.h"
#import "fileio.h"

@implementation codegen
-(int) LTGTEqual:(int)a1 op2:(int)a2 offset:(int)a3 operation:(int)op
{
	unsigned step1;
	unsigned step2;
	unsigned step3;
	unsigned step4;
	unsigned step5;
	unsigned step6;
	unsigned step7;
	unsigned step8;
	unsigned step9;
	unsigned step10;
	unsigned step11;
	unsigned comparision;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + 6  * pow(2,10) +  a1;
	step2 = LOD * pow(2,16) + 2 * pow (2,13) + 6 * pow(2,10) + a2;
	step3 = CSUB * pow(2,16) + 1 * pow (2,13) + 2 * pow(2,10);
	if ( op == LT) comparision = negOne;
	else
		if ( op == GT ) comparision = One;
	else comparision = zero;
	step4 = LOD * pow(2,16) + 3 * pow (2,13) + comparision * pow(2,10);
	step5 = BEQ * pow(2,16) + 3 * pow (2,13) + 4;
	step6 = LOD * pow(2,16) + 4 * pow(2,13) + zero + 6 * pow(2,10); 
	step7 = STO * pow(2,16) + 4 * pow(2,13) + 6 * pow (2,10) + a3;
	step8 = BRN * pow(2,16) + 3;
	step9 = LOD * pow(2,16) + 4 * pow (2,13) + One + 6 * pow(2,10);
	step10 = STO * pow(2,16) + 4 * pow (2,13) + 6 * pow(2,10) + a3;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	code[index++] = step6;
	code[index++] = step7;
	code[index++] = step8;
	code[index++] = step9;
	code[index++] = step10;
	//code[index++] = step11;
	return index;
	
}


-(int) LTEGTENotEqual:(int)a1 op2:(int)a2 offset:(int)a3 operation:(int)op
{
	unsigned step1;
	unsigned step2;
	unsigned step3;
	unsigned step4;
	unsigned step5;
	unsigned step6;
	unsigned step7;
	unsigned step8;
	unsigned step9;
	unsigned step10;
	unsigned step11;
	unsigned comparision;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + 6  * pow(2,10) +  a1;
	step2 = LOD * pow(2,16) + 2 * pow (2,13) + 6 * pow(2,10) + a2;
	step3 = CSUB * pow(2,16) + 1 * pow (2,13) + 2 * pow(2,10);
	if ( op == LTE) comparision = One;
	else
		if ( op == GTE ) comparision = negOne;
	else comparision = zero;
	step4 = LOD * pow(2,16) + 3 * pow (2,13) + comparision * pow(2,10);
	step5 = BNE * pow(2,16) + 3 * pow (2,13) + 4;
	step6 = LOD * pow(2,16) + 4 * pow(2,13) + zero + 6 * pow(2,10); 
	step7 = STO * pow(2,16) + 4 * pow(2,13) + 6 * pow (2,10) + a3;
	step8 = BRN * pow(2,16) + 3;
	step9 = LOD * pow(2,16) + 4 * pow (2,13) + One + 6 * pow(2,10);
	step10 = STO * pow(2,16) + 4 * pow (2,13) + 6 * pow(2,10) + a3;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	code[index++] = step6;
	code[index++] = step7;
	code[index++] = step8;
	code[index++] = step9;
	code[index++] = step10;
	//code[index++] = step11;
	return index;
}


-(int) AddSubMulDiv:(int)result op1:(int)a1 op2:(int)a2 operation:(int)op
{
	unsigned step1;
	unsigned step2;
	unsigned step3;
	unsigned step4;
	unsigned step5;
	step1 = LOD * pow(2,16) + 1 * pow(2,13) + 6 * pow(2,10) + a1;
	step2 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,10) + a2;
	step3 = op * pow(2,16) + 1 * pow(2, 13) + 2 * pow (2,10);
	step4 = STO * pow(2,16) + 1 * pow(2,13) + 6 * pow (2,10) + result;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	return index;
	
}

-(int) caseModulo:(int)result op1:(int)a1 op2:(int)a2
{
    unsigned GE1 = index + 12;
    unsigned OUT = 14 + index;
    unsigned step1;
    unsigned step2;
    unsigned step3;
    unsigned step4;
    unsigned step5;
    unsigned step6;
    unsigned step7;
    unsigned step8;
    unsigned step9;
    unsigned step10;
    unsigned step11;
    unsigned step12;
    unsigned step13;
    unsigned step14;
    step1 = LOD * pow(2,16) + 0 * pow(2,13) + 6 * pow(2,13) + a1;
    step2 = LOD * pow(2,16) + 1 * pow(2,13) + 6 * pow(2,13) + a2;
    step3 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,13) + a1;
    step4 = LOD * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,13) + a2;
    step5 = CSUB * pow(2,16) + 3 * pow(2,13) + 2 * pow(2,13);
    step6 = LOD * pow(2,16) + 4 * pow(2,13) + 6 * pow(2,13) + negOne;
    step7 = BEQ * pow(2,16) + 4 * pow(2,13) + GE1;
    step8 = CDIV * pow(2,16) + 0 * pow(2,13) + 1 * pow(2,13) ;
    step9 = CMUL * pow(2,16) + 0 * pow(2,13) + 1 * pow(2,13);
    step10 = CSUB * pow(2,16) + 2 * pow(2,13) + 0 * pow(2,13);
    step11 = STO * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,13) + result;
    step12 = BRN * pow(2,16)  + OUT;
    step13 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,13) + zero;
    step14 = STO * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,13) + result;
    code[index++] = step1;
    code[index++] = step2;
    code[index++] = step3;
    code[index++] = step4;
    code[index++] = step5;
    code[index++] = step6;
    code[index++] = step7;
    code[index++] = step8;
    code[index++] = step9;
    code[index++] = step10;
    code[index++] = step11;
    code[index++] = step12;
    code[index++] = step13;
    code[index++] = step14;
    return index;
    
    
}

-(int) NotCase:(int)result op1:(int)a1 op2:(int)a2
{
	unsigned step1 = LOD * pow(2,16) + 1 * pow(2,13) + 6 * pow (2,10) + a1;
	unsigned step2 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow (2,10) + zero;
	unsigned step5 = CSUB * pow(2,16) + 1 * pow(2,13) + 2 * pow(2,10) ;
	unsigned step6 = BNE * pow(2,16) + index + 5 + 3;
	unsigned step7 = STO * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,10) + result;
	unsigned step8 = BRN * pow(2,16) + index + 7 + 3;
	unsigned step9 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow(2,10) + One;
	unsigned step10 = STO * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + result;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step5;
	code[index++] = step6;
	code[index++] = step7;
	code[index++] = step8;
	code[index++] = step9;
	code[index++] = step10;
	return index;
}

-(int) AndCase:(int)result op1:(int)a1 op2:(int)a2
{
	unsigned step1 = LOD * pow(2,16) + 1 * pow(2,13) + 6 * pow (2,10) + a1;
	unsigned step2 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow (2,10) + a2;
	unsigned step3 = CMUL * pow(2,16) + 1 * pow(2,13) + 2 * pow (2,10);
	unsigned step4 = LOD * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + zero;
	unsigned step5 = CSUB * pow(2,16) + 1 * pow(2,13) + 3 * pow(2,10) ;
	unsigned step6 = BEQ * pow(2,16) + index + 5 + 3;
	unsigned step7 = STO * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + result;
	unsigned step8 = BRN * pow(2,16) + index + 7 + 3;
	unsigned step9 = LOD * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + One;
	unsigned step10 = STO * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + result;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	code[index++] = step6;
	code[index++] = step7;
	code[index++] = step8;
	code[index++] = step9;
	code[index++] = step10;
	return index;
	
	
}

-(int) OrCase:(int)result op1:(int)a1 op2:(int)a2
{
	unsigned step1 = LOD * pow(2,16) + 1 * pow(2,13) + 6 * pow (2,10) + a1;
	unsigned step2 = LOD * pow(2,16) + 2 * pow(2,13) + 6 * pow (2,10) + a2;
	unsigned step3 = CADD * pow(2,16) + 1 * pow(2,13) + 2 * pow (2,10);
	unsigned step4 = LOD * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + zero;
	unsigned step5 = CSUB * pow(2,16) + 1 * pow(2,13) + 3 * pow(2,10) ;
	unsigned step6 = BEQ * pow(2,16) + index + 5 + 3;
	unsigned step7 = STO * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + result;
	unsigned step8 = BRN * pow(2,16) + index + 7 + 3;
	unsigned step9 = LOD * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + One;
	unsigned step10 = STO * pow(2,16) + 3 * pow(2,13) + 6 * pow(2,10) + result;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	code[index++] = step6;
	code[index++] = step7;
	code[index++] = step8;
	code[index++] = step9;
	code[index++] = step10;
	return index;
	
}

-(int) jmp:(int)offset
{
	unsigned step1;
	 step1 = BRN * pow(2,16) + offset;
	 code[index++] = step1;
	 return index;
}


-(int) jeq:(int)offset op1:(int)a1 op2:(int)a2 
{
	unsigned step1;
	unsigned step2;
	unsigned step3;
	unsigned step4;
	unsigned step5;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + a1 + 6 * pow(2,10);
	step2 = LOD * pow(2,16) + 1 * pow (2,13) + a2 + 6 * pow(2,10);
	step3 = CSUB * pow(2,16) + 1 * pow (2,13) + 2 * pow(2,10);
	step4 = LOD * pow(2,16) + 3 * pow (2,13) + zero + 6 * pow (2,10);
	step5 = BEQ * pow(2,16) + 3 * pow (2,13) + offset + 6 * pow(2,10);
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	return index;
}


-(int) jfalse:(int)offset op1:(int)a1 op2:(int)a2 
{
	unsigned step1;
	unsigned step2;
	unsigned step3;
	unsigned step4;
	unsigned step5;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + a1 + 6 * pow(2,10);
	step2 = LOD * pow(2,16) + 1 * pow (2,13) + a2 + 6 * pow(2,10);
	step3 = CSUB * pow(2,16) + 1 * pow (2,13) + 2 * pow(2,10);
	step4 = LOD * pow(2,16) + 3 * pow (2,13) + zero + 6 * pow (2,10);
	step5 = BNE * pow(2,16) + 3 * pow (2,13) + offset + 6 * pow (2,10) ;
	code[index++] = step1;
	code[index++] = step2;
	code[index++] = step3;
	code[index++] = step4;
	code[index++] = step5;
	return index;
}


-(int) assign:(int)source destination:(int)a2
{
	unsigned step1;
	unsigned step2;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + source + 6  * pow(2,10);
	step2 = STO * pow(2,16) + 1 * pow (2,13) + a2 + 6 * pow(2,10);
	code[index++] = step1;
	code[index++] = step2;
	return index;
}


-(int) read:(int)destination
{
	unsigned step1;
	unsigned step2;
	step1 = INI * pow(2,16) + 1 * pow (2,13);
	step2 = STO * pow(2,16) + 1 * pow (2,13) + destination + 6 * pow(2,10);
	code[index++] = step1;
	code[index++] = step2;
	return index;
}


-(int) write:(int)source
{
	unsigned step1;
	unsigned step2;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + source + 6 * pow(2,10);
	step2 = OCH * pow(2,16) + 1 * pow (2,13) ;
	code[index++] = step1;
	code[index++] = step2;
	return index;
}


-(int) readline:(int)destination
{
	unsigned step1;
	unsigned step2;
	step1 = NLNI * pow(2,16) + 1 * pow (2,13);
	step2 = STO * pow(2,16) + 1 * pow (2,13) + destination + 6 * pow(2,10);
	code[index++] = step1;
	code[index++] = step2;
	return index;
}


-(int) writeline:(int)source
{
	unsigned step1;
	unsigned step2;
	step1 = LOD * pow(2,16) + 1 * pow (2,13) + source + 6 * pow(2,10);
	step2 = NLNO * pow(2,16) + 1 * pow (2,13) ;
	code[index++] = step1;
	code[index++] = step2;
	return index;
}

-(void) setST:(symtable *)aTable
{
	[myTable release];
	myTable = aTable;
	[myTable retain];
}

-(void) setQT:(quadtable *)QT
{
	[QUADS release];
	QUADS = QT;
	[QUADS retain];
}

-(symtable *) getST
{
	return myTable;
}
-(quadtable *) getQT
{
	return QUADS;
}

-(void) setPconstants
{
	NSString *myS = @"-1";
	int i;
	int identifier = [myTable searchByName:myS];
	if ( identifier >= [myTable count] )
	{
		i = [myTable setupNewItem];
		//atoken = [[tokentable alloc] init];
		[myTable setName:myS at:i];
		[myTable setLocation:i at:i];
		[myTable setTokentype:-1 at:i];
		[myTable setIndexOfToken:i at:i];
		[myTable setConstants:-1 at:i];
		[myTable setMyinteger:-1 at:i];
		[myTable setDimensionA:1 at:i];
		[myTable setDimensionB:1 at:i];
		[myTable setDimensionC:1 at:i]; 
		negOne = i;
	} else negOne = identifier;
        NSLog (@"Negitive One is located in memory at %d", negOne); 
	
	myS = @"1";
	identifier = [myTable searchByName:myS];
	if ( identifier >= [myTable count] )
	{
		i = [myTable setupNewItem];
		//atoken = [[tokentable alloc] init];
		[myTable setName:myS at:i];
		[myTable setLocation:i at:i];
		[myTable setTokentype:-1 at:i];
		[myTable setIndexOfToken:i at:i];
		[myTable setConstants:1 at:i];
		[myTable setMyinteger:1 at:i];
		[myTable setDimensionA:1 at:i];
		[myTable setDimensionB:1 at:i];
		[myTable setDimensionC:1 at:i];
		One = i;
	} else One = identifier;
        NSLog (@"One is located in memory at %d", One);
	
	myS = @"0";
	identifier = [myTable searchByName:myS];
	if ( identifier >= [myTable count] )
	{
		i = [myTable setupNewItem];
		//atoken = [[tokentable alloc] init];
		[myTable setName:myS at:i];
		[myTable setLocation:i at:i];
		[myTable setTokentype:-1 at:i];
		[myTable setIndexOfToken:i at:i];
		[myTable setConstants:0 at:i];
		[myTable setMyinteger:0 at:i];
		[myTable setDimensionA:1 at:i];
		[myTable setDimensionB:1 at:i];
		[myTable setDimensionC:1 at:i];
		zero = i;
	} else zero = identifier;
        NSLog (@"Zero is located in memory at %d", zero);
}

-(int) firstSTPass
{
	int i;
	int dimA;
	int dimB;
	int dimC;
	int size;
	int limit = [myTable count];
	int location = 0;
        NSLog (@"Value of Limit, %d", limit);
	for ( i = 36; i < limit; i++)
	{
		dimA = [myTable getDimensionAAt:i];
		dimB = [myTable getDimensionBAt:i];
		dimC = [myTable getDimensionCAt:i];
		size = dimA * dimB * dimC;
		[myTable setLocation:location at:i];
		location +=  size;
                //NSLog (@"Size = %d and location = %d ", size, location);
                
		
	}
	memLength = location +1;
	NSLog (@"Memory Length is , %d", memLength);
	return location;
}

-(int) secondSTPass
{
	int location = codeLength;
	int limit = [myTable count];
	int i;
	for ( i = 36; i < limit; i++)
	{
		location = [myTable getLocationAt:i];
		location += codeLength;
		code[location] = [myTable getConstantsAt:i];
		[myTable setLocation:location at:i];
		
		
	}
	//memLength = location;
	return location;
}

-(int) firstQTPass 
{
	int i;
	int limit = [QUADS count];
	int quadType;
	int location = 0;
        NSLog (@"Quad Value of Limit, %d", limit);
	for ( i = 0; i < limit; i++)
	{
		quadType = [QUADS operationAt:i];
		switch (quadType)
		{
			case LT: case GT: case EQU: 
			case LTE: case GTE: case NEQ: 
				[QUADS setLocation:location at:i];
				location += 10;
				break;
			case ADD: case SUB: case MUL: case DIV:
				[QUADS setLocation:location at:i];
				location += 5;
				break;
			case AND: case OR: case NOT: 
				[QUADS setLocation:location at:i];
				location += 10;
				break;
			case JMP: 
				[QUADS setLocation:location at:i];
				location += 1;
				break;
			case JEQ: case JFALSE:
				[QUADS setLocation:location at:i];
				location += 5;
				break;
			case ASSIGN: case READ: case WRITE:
			case RDLN: case WTLN: 
				[QUADS setLocation:location at:i];
				location += 2;
				break;
		}
                
                //NSLog (@"Index = %d and location = %d ", i, location);
	}
	codeLength = location + 1;	
	NSLog (@"Code Length is , %d", codeLength);
	return location;
}



-(void) genProgram
{
	//[self firstSTPass];
	//[self setPconstants];
	int limit = [QUADS count];
	count = 0;
	int i;
	int op, op1, op2, result, offsetA, offsetB, offsetC;
	int a, b, c;
	for ( i = 0; i < limit; i++)
	{
		a = [QUADS operand1At:i];
		b = [QUADS operand2At:i]; 
		c = [QUADS resultAt:i];
		op = [QUADS operationAt:i];
		offsetA = [myTable getDimensionAAt:a] * [QUADS index1aAt:i];
		offsetA += [myTable getDimensionBAt:a] * [QUADS index2aAt:i];
		offsetA += [myTable getDimensionCAt:a] * [QUADS index3aAt:i];
		offsetB = [myTable getDimensionAAt:b] * [QUADS index1bAt:i];
		offsetB += [myTable getDimensionBAt:b] * [QUADS index2bAt:i];
		offsetB += [myTable getDimensionCAt:b] * [QUADS index3bAt:i];
		offsetC = [myTable getDimensionAAt:c] * [QUADS index1cAt:i];
		offsetC += [myTable getDimensionBAt:c] * [QUADS index2cAt:i];
		offsetC += [myTable getDimensionCAt:c] * [QUADS index3cAt:i];
		
		op1 = [myTable getLocationAt:a] + offsetA ;
		op2 = [myTable getLocationAt:b] + offsetB;
		result = [myTable getLocationAt:c] + offsetC;
		
		switch (op)
		{
			case JMP: 
                            result = [QUADS locationAt:c];
                            count = [self jmp:result];
				break;
			case JEQ: 
                            result = [QUADS locationAt:c];
				 count = [self jeq:result op1:op1 op2:op2 ];
				break;
			case JFALSE: 
                            result = [QUADS locationAt:c];
                            count = [self jfalse:result op1:op1 op2:op2 ];
				break;
			case ASSIGN:
				 count = [self assign:op1 destination:result];
				break;
			case ADD:
				 count = [self AddSubMulDiv:result op1:op1 op2:op2 operation:CADD];
				break;
			case SUB:
				 count = [self AddSubMulDiv:result op1:op1 op2:op2 operation:CSUB];
				break;
			case MUL:
				 count = [self AddSubMulDiv:result op1:op1 op2:op2 operation:CMUL];
				break;
			case DIV:
				 count = [self AddSubMulDiv:result op1:op1 op2:op2 operation:CDIV];
				break;
			case MOD:
                            count = [self caseModulo:result op1:op1 op2:op2];
				break;
			case LT: 
				 count = [self LTGTEqual:op1 op2:op2 offset:result operation:LT];
				break;
			case GT: 
				count = [self LTGTEqual:op1 op2:op2 offset:result operation:GT];
				break;
			case EQU: 
				 count = [self LTGTEqual:op1 op2:op2 offset:result operation:EQU];
				break;
			case LTE: 
				count = [self LTEGTENotEqual:op1 op2:op2 offset:result operation:LTE];
				break;
			case GTE: 
				count = [self LTEGTENotEqual:op1 op2:op2 offset:result operation:GTE];
				break;
			case NEQ: 
				 count = [self LTEGTENotEqual:op1 op2:op2 offset:result operation:NEQ];
				break;
			case AND: 
				 count = [self AndCase:result op1:op1 op2:op2];
				break;
			case OR: 
				 count = [self OrCase:result op1:op1 op2:op2];
				break;
			case NOT:
				 count = [self NotCase:result op1:op1 op2:op2 ];
				break;
			case READ:
                            count = [self read:result ];
                            break;
			case WRITE:
                            count = [self write:result ];
                            break;
			case RDLN:
                            count = [self readline:result ];
                            break;
			case WTLN:
                            count = [self writeline:result ];
                            break;
		}
                //NSLog (@"This line's code is %x ", code[index -1]);
	}
	code[index++] = HLT * pow(2,16);
        count++;
	for ( i = 0; i < count + memLength ; i++)
		NSLog(@"Instruction %d = %x", i, code[i]);
	
}

-(void) passes:(quadtable *) QT withST:(symtable *)ST
{
	[self setST:ST];
	[self setQT:QT];
        NSLog (@"Acquired ST in codegen");
	[self setPconstants];
        NSLog (@"Perminent Constants Set for 0, 1, -1   ");
	[self firstSTPass];
        NSLog (@"Finished ST First Pass");
	[self firstQTPass];
        NSLog (@"Finished first Quad Pass");
	[self secondSTPass];
        NSLog (@"Finished Second ST");
	[self genProgram];
        NSLog (@"Generated Program");
	
	[myTable release];
	[QUADS release];
}

-(void) writeOutCode:(NSString *) fileName
{
    fileio *output = [[fileio alloc] init];
    [output createFile:fileName];
    int i;
    for ( i = 0; i < count + memLength; i++)
    {
        [output writeInt:code[i] ];
        [output writeEol];
    }
    [output closeFile];
    [output release];
    
}

-(void) dealloc
{
	[myTable release];
	[QUADS retain];
	[super dealloc];
}

@end
