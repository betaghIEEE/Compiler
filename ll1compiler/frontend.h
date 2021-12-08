//
//  frontend.h
//  ll1compiler
//
//  Created by Daniel Beatty on 11/17/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "symtable.h"
#import "symtabletype.h"
// #import "tokentable.h"
#import "fileio.h"
#import "quadtable.h"
#import "astack.h"

@interface frontend : NSObject {
    NSString *S;
	quadtable *QUADS;
	astack *SAS;
	astack *S1;
	astack *S2;
    int tokenindex;
    fileio *prog;
    symtable *myTable;
    NSArray *reservwords;
    int lex;
}


-(int) getNumericalToken;

-(int) getIdentifer;

-(int) getSpecialSymbol;

-(frontend *) initWithName:(NSString *)filename;

-(int) initializeReservedWords;

-(int) getToken;

-(quadtable *) getQUADS;

-(symtable *) getTable;

-(int) evaluateIdentifier:(NSString *)S;

-(int) evaluateNumConstant:(NSString *)S value:(int) value;

-(void) outputQuadTable:(NSString *) fileName;

-(BOOL) production_P;
-(BOOL) production_D1;
-(BOOL) production_D;
-(BOOL) production_D2;
-(BOOL) production_IL;
-(BOOL) production_IL1;
-(BOOL) production_Su;
-(BOOL) production_Suprime;
-(BOOL) production_Suprime2;
-(BOOL) production_S;
-(BOOL) production_Sprime;
-(BOOL) production_Sprime2;
-(BOOL) production_T;
-(BOOL) production_ID;
-(BOOL) production_IDprime ;
-(BOOL) production_E;
-(BOOL) production_Eprime ;
-(BOOL) production_EL;
-(BOOL) production_ELprime;
-(BOOL) production_C;
-(BOOL) production_Cprime;
-(BOOL) production_Cprime2;
-(BOOL) production_Cprime3;
-(BOOL) production_SL;
-(BOOL) production_SLprime;

-(void) semActionG0;
-(void) semActionG1;
-(void) semActionG2;
-(void) semActionG3;
-(void) semActionG4:(int)value;
-(void) semActionG5;
-(void) semActionG6;
-(void) semActionG7;
-(void) semActionH;
-(void) semActionH1:(int)op;
-(void) semActionH2:(int)op;
-(void) semActionI;
-(void) semActionW1;
-(void) semActionX0:(int)opValue;
-(void) semActionG1;
-(void) semActionW2;
-(void) semActionXnot;
-(void) semActionI0;
-(void) semActionI1:(int)A ;
-(void) semActionI2:(int) value;
-(void) semActionI3:(int)value;
-(void) semActionI4:(int)anindex;
-(void) semActionI5:(int)value;
-(void) semActionI7;
-(void) semActionI8;
-(void) semActionI9;

@end
