//
//  frontend.m
//  lexicalexercise
//
//  Created by Daniel Beatty on 9/22/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "frontend.h"


@implementation frontend


-(int) getNumericalToken:(NSString *)S pos:(unsigned)pos
{
	int tokenIndex = 0;
	int value = 0;
	char c;
	NSString *token;
	int flag = 0;
	while ((tokenIndex < [S length]) &&  flag == 0 )
	{
		c = [S characterAtIndex:(tokenIndex + (int) pos)];
		switch (c) {
		case '0': case '1': case '2': case '3': case '4':
		case '5': case '6': case '7': case '8': case '9': 
			token += c;
			tokenIndex++;
			value = (value * 10) + ((int) c - 48);
			break;	
		case ' ': case '{': case '}': case '[': case ']': case ':':
		case '.': case '>': case '<': case '=': case '+':
		case '-': case '*': case '/': case ';': case EOF:  flag = 1;
			break;
		default: flag = 2;
		}
	}
	if (flag == 1) return [self evaluateNumConstant:token value:value];
	return 0;
}

-(int) getIdentifer:(NSString *)S pos:(unsigned)pos
{
	int tokenIndex = 0;
	char c;
	NSString *token;
	int flag = 0;
	while ((tokenIndex < [S length]) &&  flag == 0 )
	{
		c = [S characterAtIndex:(tokenIndex + (int) pos)];
		switch (c) {
			case ' ': case '{': case '}': case '[': case ']': case ':':
			case '.': case '>': case '<': case '=': case '+':
			case '-': case '*': case '/': case ';': case EOF:  flag = 1;
				break;
			default: 
				token += c;
				tokenIndex++;
		}
	}
	if (flag == 1) return [self evaluateIdentifier:token];
	return 0;
}

-(int) getSpecialSymbol:(NSString *)S pos:(unsigned)pos
{
	int tokenIndex = 0;
	char c;
	NSString *token = [[NSString alloc] init];
	int flag = 0;
	c = [S characterAtIndex:(tokenIndex + (int) pos)];
	if ( (c == '<' ) || ( c == '>')) 
	{
		token += c;
		tokenIndex++;
		c = [S characterAtIndex:(tokenIndex + (int) pos)];
		if ( (c == '=') || (c == '>') ) token += c;
		return [self evaluateIdentifier:token];
	}
	token += c;
	return [self evaluateIdentifier:token];
}


-(int) getToken:(NSString *)S pos:(unsigned) pos
{
    int tokenindex = pos;
    char c = [S characterAtIndex:(tokenindex)];
	NSLog (@"Getting token");
	while ( tokenindex < [S length]) {
		switch (c)
		{
			case ' ': tokenindex++;
				c = [S characterAtIndex:(tokenindex)];
				NSLog (@"In spaces");
				break;
			case '0': case '1': case '2': case '3': case '4':
			case '5': case '6': case '7': case '8':
			case '9': return [self getNumericalToken:S pos:(tokenindex)];
				tokenindex++;
				NSLog (@"In numbers");
				break;
			case 'a': case 'b': case 'c': case 'd': case 'e':
			case 'f': case 'g': case 'h': case 'i': case 'j':
			case 'k': case 'l': case 'm': case 'n': case 'o':
			case 'p': case 'q': case 's': case 't': case 'u':
			case 'v': case 'w': case 'x': case 'r': case 'y': 
			case 'z':
			case 'A': case 'B': case 'C': case 'D': case 'E':
			case 'F': case 'G': case 'H': case 'I': case 'J':
			case 'K': case 'L': case 'M': case 'N': case 'O':
			case 'P': case 'Q': case 'S': case 'T': case 'U':
			case 'V': case 'W': case 'X': case 'Y': case 'Z':
			case 'R': [self getIdentifer:S pos:((unsigned)tokenindex)];
				NSLog (@"In identifiers and reserved words %c", c);
				tokenindex++;
				break;
        // Special Symbols
			case '{': case '}': case '[': case ']': case ':':
			case '.': case '>': case '<': case '=': case '+':
			case '-': case '*': case '/': case ';': return [self getSpecialSymbol:S pos:(tokenindex)];
				tokenindex++;
				//default:
		}
	}
    
}

-(int) initializeReservedWords
{
    //tokentable *identifier = [myTable search:S];
    tokentable *atoken; // = [[tokentable alloc] init];
	NSLog (@"Got spare token item");
    myTable = [[symtable3 alloc] init];
	NSLog (@"Got table of tokens");
    int count = 0;
    NSString *S;// = [NSString alloc];
	NSLog (@"Allocated S");
    reservwords = [NSArray arrayWithObjects:@"program",@"array", @"integer", @"read", @"write", 
		 @"rdln", @"wrln", @"when" , @"until", @"from", @"..", @"$", @"{", @"}", @"[", @"]", 
		@";", @",", @"(", @")", @":=", @"<", @">",@">", @"=" , @"<=", @">=", @"<>",
		@"+", @"-", @"*", @"/", @":", @"and", @"or" , @"not" , @"mod" ,
		nil];

	NSLog (@"Got an array of reserved words");
    int i;
	//[S release];
    for ( i = 0; i < 36; i++)
    {
        //[S release];
		S = [reservwords objectAtIndex:i];
		atoken = [[tokentable alloc] init];
        [atoken setName:S];
        [atoken setLocation:i];
        [atoken setTokentype:i];
        [atoken setIndexOfToken:i];
        [atoken setConstants:0];
        [atoken setMyinteger:0];
        NSLog (@" A token's word is %s", [[atoken name] cString]);
        //[myTable insert:atoken];
		[myTable insert: atoken];
		NSLog (@"Assigning reserved word %s", [S cString]);
		[atoken release];
        [S release];
    }
	
	for ( i = 0; i < 36; i++)
	{
		//[S release];
		S = [(tokentable *)[myTable valueAt:i] name];
		NSLog(@"%s ",[S cString]);
                [S release];
	}
	// [S release];
	//[reservwords release];
	//[reservwords dealloc];
}

-(frontend *) init
{
    [super init];
    [self initializeReservedWords];
    return self;
}

-(int) evaluateIdentifier:(NSString *)S
{
	tokentable *identifier = [myTable search:S];
	tokentable *atoken = [[tokentable alloc] init];
	int count = [myTable count];
	if ( identifier == NULL)
	{
            count = [myTable count];
		[atoken setName:S];
		[atoken setLocation:count];
		[atoken setTokentype:-1];
		[atoken setIndexOfToken:count];
		[atoken setConstants:0];
		[atoken setMyinteger:0];
		[myTable insert:atoken];
                //[myTable setCount:(count+1)];
                return count;
	} else return [identifier indexOfToken];
        
}

-(int) evaluateNumConstant:(NSString *)S value:(int) value
{
	tokentable *identifier = [myTable search:S];
	tokentable *atoken = [[tokentable alloc] init];
	int count = [myTable count];
	if ( identifier == NULL)
	{
		[atoken setName:S];
		[atoken setLocation:count];
		[atoken setTokentype:-2];
		[atoken setIndexOfToken:count];
		[atoken setConstants:value];
		[atoken setMyinteger:value];
		[myTable insert:atoken];
	}
}


-(symtable3 *) myTable
{
	return myTable;
}

-(void) setMyTable: (symtable3 *) aTable
{
	[myTable release];
	myTable = [aTable retain];
}

-(id) free 
{
	if (myTable) [myTable free];
	if (reservwords) [reservwords free];
	//[myTable dealloc];
	//[reservwords dealloc];
	[super free];
}

@end
