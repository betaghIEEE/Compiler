//
//  epsilonSet.h
//  parsing
//
//  Created by Daniel Beatty on 3/16/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class tokenHome;

@interface epsilonSet : NSObject {
	tokenHome *tokens;
	NSArray *declarations1;
	NSArray *declarations2;
	NSArray *identList1;
	NSArray *identifier1;
	NSArray *sublist1;
	NSArray *statement;

}

-(NSArray *)declarations1;
-(NSArray *)declarations2;
-(NSArray *)identList1;
-(NSArray *)identifier1;
-(NSArray *)sublist1;
-(NSArray *)statement;



@end
