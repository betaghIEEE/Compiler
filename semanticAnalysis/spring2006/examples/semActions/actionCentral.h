//
//  actionCentral.h
//  semActions
//
//  Created by Daniel Beatty on 3/29/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "actionStack.h"
#import "evalTypes.h"
#import "quads.h"
#import "quadUnit.h"
#import "symbolTable.h"
#import "symbols.h"

@interface actionCentral : NSObject {
	int a, b, c, d, e, f;
	int c1, c0;
	int nexta, nextb;
	int atemp, btemp;
	int aoff, boff;
	int dimensions;
//	int boffsets[10];
//	int aoffsets[10];
	int dimension[10];
	NSMutableArray *boffsets;
	NSMutableArray *aoffsets;
//	NSMutableArray *dimension;
	quads *imCode;
	actionStack *sas;
	symbolTable *myST;
	symbols *row;
	int sublistType;

}


-(void) sublist;
-(void) startDeclarations;
-(void) popTheStarter;
-(void) identifierEvaluation:(int)value;
//-(int) calculateAOffset;
//-(int) calculateBOffset;
//-(void) evaluation:(int) op;
//-(void) evalSublistA;
//-(void) evalSublistB;
-(NSMutableArray *) evalSublist;
-(NSMutableArray *) evalSublistA;
-(NSMutableArray *) evalSublistB;
-(void) nextTokenPush:(int) nt;
-(void) sublist;

-(id) initWithQuads: (quads *) codeBase
					stack:(actionStack *) workingStack
					symTable:(symbolTable *) sT;


@end
