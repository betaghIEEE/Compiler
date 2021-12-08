//
//  symbolTable.h
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface symbolTable : NSObject {
	NSMutableArray *table;
}
-(void) setTable:(NSMutableArray *) value;
-(NSMutableArray *) table;

// Searching and adding methods
-(int) checkConstant: (NSString *) token;
-(int) checkIdentifier: (NSString *) token;

// Initialize 

-(symbolTable *) initWithSet:(NSSet *) values;


@end
