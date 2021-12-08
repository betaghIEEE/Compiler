//
//  quadtable.h
//  malloctest
//
//  Created by Daniel D. Beatty on 11/26/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "quadtabletype.h"

@interface quadtable : NSObject {
	quadtabletype *qtable;
	int count;
	int index;
}
-(id) initWithLength:(unsigned)size ;
-(void) forSize:(int)size;
-(void) dealloc;

-(void) genquad:(int) op op1:(int)op1 op2:(int)op2 result:(int)result;
-(int) NQ;

-(int) operationAt:(int)anindex;
-(int) operand1At:(int)anindex;
-(int) operand2At:(int)anindex;
-(int) resultAt:(int)anindex;
-(int) index1aAt:(int)anindex;
-(int) index2aAt:(int)anindex;
-(int) index3aAt:(int)anindex;
-(int) index1bAt:(int)anindex;
-(int) index2bAt:(int)anindex;
-(int) index3bAt:(int)anindex;
-(int) index1cAt:(int)anindex;
-(int) index2cAt:(int)anindex;
-(int) index3cAt:(int)anindex;
-(int) locationAt:(int)anindex;
-(int) count;
-(int) index;

-(void) writeOutTable:(NSString *)fileName;

-(void) setOperation:(int)value at:(int)anindex;
-(void) setOperand1:(int)value at:(int)anindex;
-(void) setOperand2:(int)value at:(int)anindex;
-(void) setResult:(int)value at:(int)anindex;
-(void) setIndex1a:(int)value at:(int)anindex;
-(void) setIndex2a:(int)value at:(int)anindex;
-(void) setIndex3a:(int)value at:(int)anindex;
-(void) setIndex1b:(int)value at:(int)anindex;
-(void) setIndex2b:(int)value at:(int)anindex;
-(void) setIndex3b:(int)value at:(int)anindex;
-(void) setIndex1c:(int)value at:(int)anindex;
-(void) setIndex2c:(int)value at:(int)anindex;
-(void) setIndex3c:(int)value at:(int)anindex;
-(void) setLocation:(int)value at:(int)anindex;
-(void) setCount:(int)value;
-(void) setIndex:(int)value;

@end
