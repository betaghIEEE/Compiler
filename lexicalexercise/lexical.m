//
//  lexical.m
//  lexicalexercise
//
//  Created by Daniel Beatty on 10/1/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "lexical.h"


@implementation lexical

-(int) getToken
{
    NSString *tok = [[NSString alloc] init];
    
    char c = [S characterAtIndex:cp];
    [tok free];
    return tokenindex;
}


-(int) getIdrToken
{
    NSString *tok = [[NSString alloc] init];
    
    char c = [S characterAtIndex:cp];
    while ( (![self endOfS] & (([self inIdrChars]) || [self inNumChars])))
    {
        tok += c;
        cp++;
        c = [S characterAtIndex:cp];
    }
    tokenindex = [self evalIdr:tok];
    [tok free];
    return tokenindex;
}

-(int) getNumToken
{
    NSString *tok = [[NSString alloc] init];
    
    char c = [S characterAtIndex:cp];
    while ( (![self endOfS] && ([self inNumChars])))
    {
        tok += c;
        cp++;
        c = [S characterAtIndex:cp];
    }
    tokenindex = [self evalNum:tok];
    [tok dealloc];
    return tokenindex;
}

-(int) getSpsToken
{
    NSString *tok = [[NSString alloc] init];
    
    char c = [S characterAtIndex:cp];
    [tok dealloc];
    return tokenindex;
}

-(int) getNextS
{
    NSString *tok = [[NSString alloc] init];
    
    char c = [S characterAtIndex:cp];
    [tok dealloc];
    return tokenindex;
}

-(void) resetCounter
{
    cp = 0;
}

-(BOOL) endOfS
{
    if ( cp < [S length]) return YES;
    return NO;
}

-(int) evalNum:(NSString *) tok
{
    int i;
    
}

-(int) evalIdr:(NSString *) tok
{
}


@end
