//
//  symbols.h
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface symbols : NSObject {
	NSString *tokenName;
	int tokenType;
	int entryNumber;
	int memoryLocation;
}
-(void) setTokenName:(NSString *) value;
-(NSString *) tokenName;
-(void) setTokenType:(int) value;
-(int) tokenType;
-(void) setEntryNumber:(int) value;
-(int) entryNumber;
-(void) setMemoryLocation:(int) value;
-(int) memoryLocation;
-(symbols *) initWithString:(NSString *) value;


@end
