//
//  lexical.h
//  lexicalexercise
//
//  Created by Daniel Beatty on 10/1/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface lexical : NSObject {
    NSArray *reservedWords;
    NSArray *idrChars;
    NSArray *numChars;
    NSArray *spsChars;
    NSString *S;
    unsigned cp;
    FILE fp;
    int tokenindex;
    int iot;
}

-(int) getToken;
-(int) getIdrToken;
-(int) getNumToken;
-(int) getSpsToken;
-(int) getNextS;
-(void) resetCounter;
-(BOOL) endOfS;

@end
