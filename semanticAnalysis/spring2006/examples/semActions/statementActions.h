//
//  statementActions.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "actionCentral.h"

@interface statementActions : actionCentral {
}
-(void) beginStatement;
-(void) endAssignment:(int) identifier;
-(void) endAssignment;;


//-(void) beginWhenCondition;
-(void) endWhenCondition;


-(void) beginElseStatement;
-(void) endElseStatement;

-(void) endCarrotCondition;
-(void) endCarrotExpression;



@end
