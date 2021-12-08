//
//  codegen.h
//  ll1compiler
//
//  Created by Daniel D. Beatty on 12/3/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "quadtable.h"
#import "symtable.h"

@interface codegen : NSObject {
	quadtable *QUADS;
    symtable *myTable;
	unsigned code[1024];
	int count;
	int index;
	int negOne;
	int One;
	int zero;
	int memLength;
	int codeLength;
}

-(int) LTGTEqual:(int)a1 op2:(int)a2 offset:(int)a3 operation:(int)op;
-(int) LTEGTENotEqual:(int)a1 op2:(int)a2 offset:(int)a3 operation:(int)op;
-(int) AddSubMulDiv:(int)result op1:(int)a1 op2:(int)a2 operation:(int)op;
-(int) caseModulo:(int)result op1:(int)a1 op2:(int)a2;
-(int) NotCase:(int)result op1:(int)a1 op2:(int)a2;
-(int) AndCase:(int)result op1:(int)a1 op2:(int)a2;
-(int) OrCase:(int)result op1:(int)a1 op2:(int)a2;
-(int) jmp:(int)offset;
-(int) jeq:(int)offset op1:(int)a1 op2:(int)a2 ;
-(int) jfalse:(int)offset op1:(int)a1 op2:(int)a2 ;
-(int) assign:(int)source destination:(int)a2;
-(int) read:(int)destination;
-(int) write:(int)source;
-(int) readline:(int)destination;
-(int) writeline:(int)source;


-(void) setST:(symtable *)aTable;
-(void) setQT:(quadtable *)QT;
-(symtable *) getST;
-(quadtable *) getQT;

-(void) setPconstants;
-(int) firstSTPass;
-(int) secondSTPass;
-(int) firstQTPass;
-(void) genProgram;
-(void) passes:(quadtable *) QT withST:(symtable *)ST;
-(void) writeOutCode:(NSString *) fileName;



-(void) dealloc;
@end
