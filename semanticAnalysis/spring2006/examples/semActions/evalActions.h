//
//  evalActions.h
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "actionCentral.h"


@interface evalActions : actionCentral {
}

-(void) addEvaluation;
-(void) minusEvaluation;
-(void) multiplyEvaluation;
-(void) divideEvaluation;
-(void) modEvaluation;
-(void) constantEvaluation:(int)value;
-(void) identifierEvaluation:(int)value;
-(void) lessEvaluation;
-(void) moreEvaluation;
-(void) lessEqEvaluation;
-(void) moreEqEvaluation;
-(void) eqEvaluation;
-(void) neqEvaluation;


@end
