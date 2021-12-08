//
//  syntax.h
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 10/16/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "lexical.h"

@interface syntax : NSObject {
	int lex;
	lexical *myLexAna;
}

-(BOOL) production_P;
-(BOOL) production_D1;
-(BOOL) production_D;
-(BOOL) production_D2;
-(BOOL) production_IL;
-(BOOL) production_IL1;
-(BOOL) production_Su;
-(BOOL) production_Suprime;
-(BOOL) production_Suprime2;
-(BOOL) production_S;
-(BOOL) production_Sprime;
-(BOOL) production_Sprime2;
-(BOOL) production_T;
-(BOOL) production_ID;
-(BOOL) production_IDprime ;
-(BOOL) production_E;
-(BOOL) production_Eprime ;
-(BOOL) production_EL;
-(BOOL) production_ELprime;
-(BOOL) production_C;
-(BOOL) production_Cprime;
-(BOOL) production_Cprime2;
-(BOOL) production_Cprime3;
-(BOOL) production_SL;
-(BOOL) production_SLprime;
@end
