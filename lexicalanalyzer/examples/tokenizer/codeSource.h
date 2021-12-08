//
//  codeSource.h
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface codeSource : NSObject {
	int startOfToken;
	int currentPosition;
	NSString *block;
//	unichar *blocks;
}
-(void) nextCharacter;
-(NSString *) getString;
-(void) setStartOfToken:(int) value;
-(int) startOfToken;
-(void) setCurrentPosition:(int) value;  
-(int) currentPosition;
-(char) getCurrentCharacter;
-(BOOL) endOfBlock;
-(void)  setBlock:(NSString *) value;
-(NSString *) block;

-(codeSource *) initWithNSData:(NSData *) fileBlock;
-(codeSource *) initWithFileName:(NSString *) fileName;

@end
