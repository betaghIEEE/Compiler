//
//  emulator.h
//  ll1compiler
//
//  Created by Daniel Beatty on 12/8/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface emulator : NSObject {
    unsigned    p[1024];
    int         reg[7];
    int         i, pc, n, sign;
    BOOL         halt;
}

-(unsigned) opcode:(int) i;
-(unsigned) rop1:(int) i;
-(unsigned) rop2:(int) i;
-(unsigned) mop:(int) i;
-(void) load:(int) pc;
-(void) store:(int) pc;
-(void) sub:(int) pc;
-(void) add:(int) pc;
-(void) dv:(int) pc;
-(void) mul:(int) pc;
-(void) beq:(int) i;
-(void) bne:(int) i;
-(void) b:(int) i;
-(void) ini:(int) pc;
-(void) oc:(int) pc;
-(void) comp:(int) pc;
-(void) oi:(int) pc;

@end
