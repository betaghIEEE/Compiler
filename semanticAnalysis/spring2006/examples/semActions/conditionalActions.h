//
//  conditionalActions.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "actionCentral.h"

@interface conditionalActions : actionCentral {

}

-(void) andAction;
-(void) orAction;
-(void) notAction;

@end
