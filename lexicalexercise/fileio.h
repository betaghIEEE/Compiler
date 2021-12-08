//
//  fileio.h
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 9/25/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//#import <stdio.h>

@interface fileio : NSObject {
	FILE *fp;
	NSString *myBuffer;
	int position;
}

- (NSString *) readNextLine;
- (void) writeNextLine: (NSString *) next;
-(void) openFile: (NSString *) fileName;
-(void) closeFile;
-(id) free;

@end
