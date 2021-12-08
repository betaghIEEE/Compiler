//
//  quadUnit.h
//  semActions
//
//  Created by Daniel Beatty on 3/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface quadUnit : NSObject {
	int op;
	int arg1;
	NSMutableArray *arg1Offset;
	int arg2;
	NSMutableArray *arg2Offset;
	int results;
	NSMutableArray *resultsOffset;
}

-(int) op;
-(int) arg1;
-(int) arg2;
-(int) results;
-(NSMutableArray *) arg1Offset;
-(NSMutableArray *) arg2Offset;
-(int) results;
-(NSMutableArray *) resultsOffset;


-(void) setOp:(int) value;
-(void) setArg1:(int) value;
-(void) setArg2:(int) value;
-(void) results:(int) value;
//-(void) setArg1Offset:(int) value;
//-(void) setArg2Offset:(int) value;

-(void) setArg1Offset:(NSMutableArray *) value;
-(void) setArg2Offset:(NSMutableArray *) value;

-(void) setResults:(int) value;
//-(void) setResultsOffset:(int) value;
-(void) setResultsOffset:(NSMutableArray *) value;


@end
