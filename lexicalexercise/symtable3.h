//
//  symtable3.h
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/27/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#include "tokentabletype.h"
#import "tokentable.h"

@interface symtable3 : NSObject {
    tokentabletype tokens[10000];
    int count;
    int index;
}

-(int) count;
//-(BOOL) insert:(tokentabletype *) item;
-(BOOL) insert:(tokentable *) item;
-(tokentable *) search:(NSString *) mykey;
-(tokentable *) valueAt:(int) anindex;
-(void) setTokens:(tokentable *) value at:(int) anindex;
-(void) dealloc;
@end
