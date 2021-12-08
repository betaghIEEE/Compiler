//
//  tokenHome.h
//  parsing
//
//  Created by Daniel Beatty on 2/19/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class symbolTable;

@interface tokenHome : NSObject {
	NSArray *tokens;
	int arrayToken;
	int progToken;
	int integerToken;
	int whenToken;
	int carrotToken;
	int rightBracketToken;
	int leftBracketToken;
	int sqRBracketToken;
	int sqLBracketToken;
	int rParenthesis;
	int lParenthesis;
	int assignToken;
	int eqToken;
	int neqToken;
	int moreToken;
	int lessToken;
	int moreEqToken;
	int lessEqToken;
	int plusToken;
	int minusToken;
	int multiplyToken;
	int divideToken;
	int colonToken;
	int semiColonToken;
	int andToken;
	int orToken;
	int modToken;
	int notToken;
	int commaToken;
	int pointerToken;
	int elseToken;
	int consToken;
	int idToken;
}

-(NSArray *) tokens;
-(int) arrayToken;
-(int) progToken;
-(int) integerToken;
-(int) whenToken;
-(int) carrotToken;
-(int) rightBracketToken;
-(int) leftBracketToken;
-(int) sqRBracketToken;
-(int) sqLBracketToken;
-(int) rParenthesis;
-(int) lParenthesis;
-(int) assignToken;
-(int) eqToken;
-(int) moreToken;
-(int) lessToken;
-(int) moreEqToken;
-(int) lessEqToken;
-(int) plusToken;
-(int) minusToken;
-(int) multiplyToken;
-(int) divideToken;
-(int) colonToken;
-(int) semiColonToken;
-(int) andToken;
-(int) orToken;
-(int) modToken;
-(int) notToken;
-(int) commaToken;
-(int) pointerToken;
-(int) elseToken;


-(int) consToken;
-(int) idToken;

-(BOOL) followSetS:(int) tokenType;
-(BOOL) followSetSL1:(int) tokenType;
-(BOOL) followSetID1:(int) tokenType;
-(BOOL) followSetIL1:(int) tokenType;
-(BOOL) followSetD2:(int) tokenType;
-(BOOL) followSetD1:(int) tokenType;

// Initialization via symbol Table
-(tokenHome *) initWithST:(symbolTable *) valueST;

@end
