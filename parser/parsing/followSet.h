//
//  followSet.h
//  parsing
//
//  Created by dabeatty on 2/20/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class tokenHome;

@interface followSet : NSObject {
	NSSet *program;
	NSSet *declaration;
	NSSet *declaration1;
	NSSet *declaration2;
	NSSet *identList;
	NSSet *identList1;
	NSSet *identifier;
	NSSet *identifier1;
	NSSet *expression;
	NSSet *condition;
	NSSet *sublist;
	NSSet *sublist1;
	NSSet *statement;
	NSSet *statement1;
	NSSet *statement2;
	NSSet *statement3;
	tokenHome *tokens;
	
}
-(BOOL) inProgram:(int) value;
-(BOOL) inDeclarations:(int) value;
-(BOOL) inDeclarations1:(int) value;
-(BOOL) inDeclarations2:(int) value;
-(BOOL) inIdentList:(int) value;
-(BOOL) inIdentList1:(int) value;
-(BOOL) inIdentifier:(int) value;
-(BOOL) inIdentifier1:(int) value;
-(BOOL) inExpression:(int) value;
-(BOOL) inCondition:(int) value;
-(BOOL) inSublist:(int) value;
-(BOOL) inSublist1:(int) value;
-(BOOL) inStatement:(int) value;
-(BOOL) inStatement1:(int) value;
-(BOOL) inStatement2:(int) value;
-(BOOL) inStatement3:(int) value;

-(BOOL) inProduction:(int) value 
				whichSet:(NSSet *)  whichSet;

@end
