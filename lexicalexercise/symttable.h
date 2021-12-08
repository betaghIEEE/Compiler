//
//  symttable.h
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 9/23/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "tokentable.h"
#include "tokentabletype.h"

@interface symttable : NSObject {
	//NSMutableArray *tokens;
    tokentable tokens[10000];
	int index;
	int count;
}

-(symttable *) init;

-(int) count;
-(symttable *) init;
-(BOOL) insert:(tokentable *) item;
-(tokentable *) search:(NSString *) mykey;
-(tokentable *) valueAt:(int) anindex;
-(void) setTokens:(tokentable *) value at:(int) anindex;
-(void) remove:(int) myindex;
-(void) removeToken:(NSString *) mykey;
-(void) addTokens:(tokentable *) atoken;
-(id) free;

@end
