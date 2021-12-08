//
//  tokentable.h
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/22/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface tokentable : NSObject {
    //NSString *name;
    char name[80];
    int location;
    int tokentype;
    int indexOfToken;
    int constants;
    int myinteger;
}


-(NSString *) name;
-(int) location;
-(int) tokentype;
-(int) indexOfToken;
-(int) constants;
-(int) myinteger;
-(void) setName:(NSString *) S;
-(void) setLocation:(int) value;
-(void) setTokentype:(int) value;
-(void) setIndexOfToken:(int) value;
-(void) setConstants:(int) value;
-(void) setMyinteger:(int) value;
-(id) free;


@end
