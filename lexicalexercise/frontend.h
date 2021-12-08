//
//  frontend.h
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/22/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "tokentable.h"
#import "symtable3.h"

@interface frontend : NSObject {
    symtable3 *myTable;
	NSArray *reservwords;
    int tokenId;
}
//-(frontend *) init;

-(symtable3 *) myTable;

-(void) setMyTable: (symtable3 *) aTable;

-(int) initializeReservedWords;

-(int) getToken:(NSString *)S pos:(unsigned) pos;

-(int) evaluateIdentifier:(NSString *)S;

-(int) evaluateNumConstant:(NSString *)S value:(int) value;

-(id) free;
@end
