//
//  decActions.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "actionCentral.h"



@interface decActions : actionCentral {
}

-(void) startArrayDimensions:(int) nt;
-(void) augmentIntegers;
-(void) augmentArrays;


@end
