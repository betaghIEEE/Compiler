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
@class followSet;
// @class semanticActions;
@class epsilonSet;
@class decActions;
@class evalActions;
@class statementActions;
@class conditionalActions;
@class quads;
@class actionStack;

@interface headProductions : NSObject {
	tokenHome *homeToken;
	symbolTable *sT;
	lexical *myLex;
	//semanticActions *semActions;
	followSet *meFollow;
	NSMutableString *wasExpecting;
	epsilonSet *specialList;
	
	evalActions *evaluate;
	decActions *declare;
	statementActions *state;
	conditionalActions *test;
	quads *imCode;
	actionStack *sas;
	
	int nt;
	int ntType;
	int expectingCount;
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
-(void) expectingList:(NSArray *) list;
-(void) expectedInt:(int) type;
-(void) expectedLine;
-(NSMutableString *) wasExpecting;
-(void) lex;

-(quads *) imCode;
-(actionStack *) sas;

-(headProductions *) initWithTokens:(tokenHome *) tokenValues
						sT:(symbolTable *) valueST
						lexAnalyzer:(lexical *) valueLex;
//						semantics:(semanticActions *) semValues ;

@end
