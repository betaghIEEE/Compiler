//
//  actionStack.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface actionStack : NSObject {
	int stack[100];
	int head;
}

-(int) pop;
-(void) push:(int) value;

@end
