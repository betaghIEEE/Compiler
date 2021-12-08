//
//  symttable.m
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 9/23/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "symttable.h"


@implementation symttable

-(symttable *) init 
{
	self = [super init];
	if (self) {
		count = 0;
		//tokens = [[NSMutableArray alloc] init]; //[NSMutableArray arrayWithCapacity:100];
            //tokens = malloc( 10000 * sizeof(tokentable));
		NSLog (@"Initializing Table");
	}
}

-(int) count
{
	return count;
}

-(BOOL) insert:(tokentable *) item
{
	NSString *s = [item name];
	if ( [self search:s] == NULL ) {
		tokens[count] = *item ;
		index = count - 1;
	}
	
}

-(tokentable *) search:(NSString *) mykey
{
	index = 0;
	while ( (index < count) && ( [[[tokens objectAtIndex:index] name] compare:mykey] != NSOrderedSame ))
	{
		index++;
	}
	if ( (index < count) && ( [[[tokens objectAtIndex:index] name] compare:mykey] == NSOrderedSame ))
		return (tokentable *)[tokens objectAtIndex:index];
	return NULL;
}

-(void) remove:(int) myindex
{
	[tokens removeObjectAtIndex:myindex];
}

-(void) removeToken:(NSString *) mykey
{
	index = [[self search:mykey] indexOfToken];
	[self remove:index];
}

-(tokentable *) valueAt:(int) anindex
{
	return (tokentable *)[tokens objectAtIndex:anindex];
}

-(void) setTokens:(tokentable *) value at:(int) anindex
{
	[tokens insertObject:value atIndex:(unsigned)(anindex)];
}

-(void) addTokens:(tokentable *) atoken
{
	[tokens addObject: atoken];
}

-(void) free 
{
    for (int i = 0; i < 10000; i++) if (tokens[i]) [tokens[i] free];
    [super free];
}

@end
