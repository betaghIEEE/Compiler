//
//  quads.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class quadUnit;

@interface quads : NSObject {
//	int nextQuad;
	NSMutableArray *quadTable;
}

-(void) genquad:(int) op;
-(void) genquad:(int) op
			arg1:(int) arg1
			arg2:(int) arg2
			results: (int) result;
-(void) genquad:(int) op
			arg1:(int) arg1
			arg1Offset:(NSMutableArray *) arg1Offset
			arg2:(int) arg2
			arg2Offset:(NSMutableArray *) arg2Offset
			results: (int) result
			resultOffset:(NSMutableArray *) resultOffset;
-(void) codeAt:(int) location
			results: (int) results;
-(int) nextQuad;

@end
