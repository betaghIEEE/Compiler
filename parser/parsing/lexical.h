//
//  lexical.h
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class codeSource;
@class symbolTable;

@interface lexical : NSObject {
	codeSource *myFile;
	symbolTable *st;
	int nextToken;
	NSString *nextTokenName;
}
-(int) nextToken;
-(void) lex;
-(void) alphaNumeric;
-(void) numeric; 
-(void) equalToken;
-(void) setMyCode:(codeSource *) codeSource;
-(codeSource *) getMyCode;
-(BOOL) stateHandler:(int) inputType;

-(symbolTable *) st;
-(void) setSt: (symbolTable *) value;

-(NSString *) nextTokenName ;
-(void) setNextTokenName:(NSString *) value;



// Initializers
-(lexical *) initWithCodeSource:(codeSource *) myFile; 
-(lexical *) initWithCodeSource:(codeSource *) myFile
					symbolTable:(symbolTable *) aSt;
-(lexical *) initWithSymbolTable:(symbolTable *) aSt; 

@end
