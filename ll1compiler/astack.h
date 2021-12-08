//
//  astack.h
//  ll1compiler
//
//  Created by Daniel D. Beatty on 11/24/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface astack : NSObject {
	int S[10000];
	int N;
}
-(id)  initWithLength:(unsigned)size;

-(BOOL) empty;

-(void) push:(int) value;

-(int) pop;

@end
