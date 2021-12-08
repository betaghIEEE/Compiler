//
//  headProductions.h
//  parsing
//
//  Created by Daniel Beatty on 2/14/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class tokenHome;
@class symbolTable;
@class lexical;
// @class semanticActions;

@interface headProductions : NSObject {
	tokenHome *homeToken;
	symbolTable *sT;
	lexical *myLex;
	//semanticActions *semActions;
}

-(BOOL) program;
-(BOOL) declarations;
-(BOOL) declarations1;
-(BOOL) declarations2;
-(BOOL) identList;
-(BOOL) identList1;
-(BOOL) identifier;
-(BOOL) identifier1;
-(BOOL) expression;
-(BOOL) condition;
-(BOOL) sublist;
-(BOOL) sublist1;
-(BOOL) statement;
-(BOOL) statement1;
-(BOOL) statement2;
-(BOOL) statement3;

-(headProductions *) initWithTokens:(tokenHome *) tokenValues
						sT:(symbolTable *) valueST
						lexAnalyzer:(lexical *) valueLex;
//						semantics:(semanticActions *) semValues ;

@end
