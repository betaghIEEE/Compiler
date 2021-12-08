//
//  frontend.m
//  ll1compiler
//
//  Created by Daniel Beatty on 11/17/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "frontend.h"
#import "tokentable.h"
#import "quaddef.h"

@implementation frontend




-(int) getNumericalToken
{
    //int tokenIndex = 0;
    int maxIndex = [S length];
    int value = 0;
    char c;
    NSString *token = [[NSString alloc] init];
    int tokenValue;
	char tokenChar[80];
	int i = 0;
    int flag = 0;
    while ((tokenindex < maxIndex) &&  flag == 0 )
    {
        c = [S characterAtIndex:(tokenindex)];
        switch (c) {
            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8': case '9': 
                tokenChar[i++] = c;
                tokenindex++;
                value = (value * 10) + ((int) c - 48);
                break;	
            case ' ': case '{': case '}': case '[': case ']': case ':':
            case '.': case '>': case '<': case '=': case '+':
            case '-': case '*': case '/': case ';':case '(':
			case ')': case ',': case EOF:  flag = 1;
                break;
            default: flag = 2;
        }
    }
	token  = [[NSString alloc] initWithCString:tokenChar length:i];
    tokenValue = [self evaluateNumConstant:token value:value];
    [token release];
    if (flag == 1) return tokenValue;
	if ( tokenindex >= maxIndex) return tokenValue;
    return 0;
}


-(int) getIdentifer
{
    //int tokenIndex = 0;
    int maxIndex = [S length];
    char c;
    NSString *token;
	char tokenChar[80];
    int tokenValue = 0;
    int flag = 0;
	int i = 0;
    while ((tokenindex < maxIndex) &&  flag == 0 )
    {
        c = [S characterAtIndex:(tokenindex)];
        switch (c) {
            case ' ': case '{': case '}': case '[': case ']': case ':':
            case '.': case '>': case '<': case '=': case '+':
            case '-': case '*': case '/': case ';':case '(':
			case ')': case ',': case EOF:  flag = 1;
                break;
            default: 
                tokenChar[i++] = c;
                tokenindex++;
        }
    }
	token  = [[NSString alloc] initWithCString:tokenChar length:i];
    tokenValue = [self evaluateIdentifier:token];
    [token release];
    if (flag == 1) return tokenValue;
	if ( tokenindex >= maxIndex ) return tokenValue;
    return 0;
}

-(int) getSpecialSymbol
{
    //int tokenIndex = 0;
    //int maxIndex = [Slocal length] - pos;
	int maxIndex = [S length];
    char c;
    NSString *token = [[NSString alloc] init];
    int tokenValue = 0;
	char tokenChar[80];
	int i = 0;
    int flag = 0;
    c = [S characterAtIndex:(tokenindex)];
    if ( (c == '<' ) || ( c == '>') || ( c == ':') || (c == '.') ) 
    {
		tokenChar[i++] = c;
        tokenindex++;
		if ( tokenindex < maxIndex) {
			c = [S characterAtIndex:(tokenindex)];
			if ( (c == '=') || (c == '>') || ( c == '.')) 
			{
				tokenChar[i++] = c;
				tokenindex++;
			}
		}
        token  = [[NSString alloc] initWithCString:tokenChar length:i];
        tokenValue = [self evaluateIdentifier:token];
        return tokenValue;
    }
	tokenindex++;
	tokenChar[i++] = c;
	token  = [[NSString alloc] initWithCString:tokenChar length:i];
    tokenValue = [self evaluateIdentifier:token];
    return tokenValue;
}

-(int) getToken
{
    //tokenindex = pos;
    int tokenValue = 0;
    int maxIndex = [S length];
   
    NSLog (@"Getting token");
    if ( tokenindex >= maxIndex) {
		[S release];
        if ([prog eof]) return 11;
        S = [[NSString alloc] initWithString:[prog readNextLine]];
        tokenindex = 0;
        maxIndex = [S length];
    }
	char c = [S characterAtIndex:(tokenindex)];
    //while ( tokenindex < maxIndex) {
        switch (c)
        {
            case ' ': tokenindex++;
                c = [S characterAtIndex:(tokenindex)];
                NSLog (@"In spaces");
                break;
            case '0': case '1': case '2': case '3': case '4':
            case '5': case '6': case '7': case '8':
            case '9': tokenValue = [self getNumericalToken];
                //tokenindex++;
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
            case 'R': tokenValue =  [self getIdentifer];
                NSLog (@"In identifiers and reserved words %c", c);
                //tokenindex++;
                break;
                // Special Symbols
            case '{': case '}': case '[': case ']': case ':':
            case '.': case '>': case '<': case '=': case '+':
            case '-': case '*': case '/': case ';':case '(':
			case ')': case ',': tokenValue =  [self getSpecialSymbol];
                //tokenindex++;
                //default:
        }
    //}
    return tokenValue;
    
}

-(frontend *) initWithName:(NSString *)filename
{
    tokenindex = 0;
    lex = 0;
    S = [[NSString alloc] init];
    prog = [[fileio alloc] init];
    [prog openFile:filename];
    [self initializeReservedWords];
	QUADS = [[quadtable alloc] init];
	[QUADS forSize:10000];
	SAS = [[astack alloc] initWithLength:(int)10000];
	S1 = [[astack alloc] initWithLength:10000];
	S2 = [[astack alloc] initWithLength:10000];
    return self;
}

-(int) initializeReservedWords
{
    //tokentable *identifier = [myTable search:S];
    //tokentable *atoken; // = [[tokentable alloc] init];
    NSLog (@"Got spare token item");
    myTable = [[symtable alloc] init];
    NSLog (@"Got table of tokens");
    int count = 0;
    //NSString *S;// = [NSString alloc];
        NSLog (@"Allocated S");
        reservwords = [NSArray arrayWithObjects:@"program",@"array", @"integer", @"read", @"write", 
            @"rdln", @"wrln", @"when" , @"until", @"from", @"..", @"$", @"{", @"}", @"[", @"]", 
            @";", @",", @"(", @")", @":=", @"<", @">", @"=" , @"<=", @">=", @"<>",
                     @"+", @"-", @"*", @"/", @":", @"and", @"or" , @"not" , @"mod" ,
            nil];
        
        NSLog (@"Got an array of reserved words");
        int i;
        //[S release];
        for ( i = 0; i < 36; i++)
        {
            [S release];
            S = [reservwords objectAtIndex:i];
            [myTable setupNewItem];
            //atoken = [[tokentable alloc] init];
            [myTable setName:S at:i];
            [myTable setLocation:i at:i];
            [myTable setTokentype:i at:i];
            [myTable setIndexOfToken:i at:i];
            [myTable setConstants:0 at:i];
            [myTable setMyinteger:0 at:i];
			//NSLog (@"Processing reserved Word, %d with Karate Explosion.", i);
			[S release];
			S = [myTable getNameAt:i];
            //NSLog (@" A token's word is %s", S );
			//NSLog (@"Assigning reserved word %s", [S cString]);
            //[atoken release];
            
        }
        [S release];
        //for ( i = 0 ; i < 36; i++)
        //{
        //    NSLog(@"The reserved word %d is %s", i, [[myTable getNameAt:i] cString]);
        //}
		S = [[NSString alloc] initWithString:[prog readNextLine]];
		return 0;
        
        
}




-(int) evaluateIdentifier:(NSString *)myS
{
    //tokentable *identifier = [myTable search:S];
    //tokentable *atoken = [[tokentable alloc] init];
	int i;
	int identifier = [myTable searchByName:myS];
	
    //int count = [myTable count];
    if ( identifier == [myTable count])
    {
		i = [myTable setupNewItem];
		//atoken = [[tokentable alloc] init];
		[myTable setName:myS at:i];
		[myTable setLocation:(i-36) at:i];
		[myTable setTokentype:-1 at:i];
		[myTable setIndexOfToken:i at:i];
		[myTable setConstants:0 at:i];
		[myTable setMyinteger:0 at:i];
		[myTable setDimensionA:1 at:i];
		[myTable setDimensionB:1 at:i];
		[myTable setDimensionC:1 at:i];
                [myTable setIsArray:NO at:i];
        //[myTable setCount:(count+1)];
        return i;
    } 
	return identifier;
    
}

-(int) evaluateNumConstant:(NSString *)myS value:(int) value
{
	int i;
	int identifier = [myTable searchByName:myS];
	
    //int count = [myTable count];
    if ( identifier == [myTable count])
    {
		i = [myTable setupNewItem];
		//atoken = [[tokentable alloc] init];
		[myTable setName:myS at:i];
		[myTable setLocation:i at:i];
		[myTable setTokentype:(-2) at:i];
		[myTable setIndexOfToken:i at:i];
		[myTable setConstants:value at:i];
		[myTable setMyinteger:value at:i];
		[myTable setDimensionA:1 at:i];
		[myTable setDimensionB:1 at:i];
		[myTable setDimensionC:1 at:i];
                [myTable setIsArray:NO at:i];
        //[myTable setCount:(count+1)];
        return i;
    } 
	return identifier;
}



-(BOOL) production_P{
    lex = [self getToken];
	if ( [myTable getTokentypeAt:lex] == 0 )
	{
		lex = [self getToken];
		if ([self production_D1])
			if ( [myTable getTokentypeAt:lex] == 12 ) {
				lex = [self getToken];
				if ( [self production_SL] ) {
					if ([myTable getTokentypeAt:lex] == 13) { 
						lex = [self getToken];
						NSLog (@"The program is valid.");
						return YES;
					}
					
				} 
			}
	} 
		NSLog (@"The program is not valid.");
        return NO;
	
}

-(BOOL) production_D1{
    int toktype;
	[self semActionI0];
	if ([self production_IL]) 
	{
            toktype = [myTable getTokentypeAt:lex];
		if ( toktype  == 31 ) 
		{
                    lex = [self getToken];
                    if ([self production_D]) {
			NSLog (@"Acquired a declaration 1 and it is good");
			return YES;
                    }
		}
	} else {
		if ( [myTable getTokentypeAt:lex] == 12){ /*lex = [self getToken];*/ [SAS pop]; return YES;}
	}
	//NSLog (@"Acquired a declaration 1 and it is bad");
	return NO;
}

-(BOOL) production_D {
	if ( [myTable getTokentypeAt:lex] == 1) {
		lex = [self getToken];
		if ( [myTable getTokentypeAt:lex] == 14) 
		{
			lex = [self getToken];
			if ( [myTable getTokentypeAt:lex] == -2){
                            [self semActionI3:lex];
				lex = [self getToken];
				if ( [self production_D2] ) {
                                    [self semActionI4:lex];
					if ( [myTable getTokentypeAt:lex] == 15) 
					{
						lex = [self getToken];
						if ( [myTable getTokentypeAt:lex] == 16 )
						{
							lex = [self getToken];
							if ( [self production_D1] ){
								//NSLog (@"Acquired an array declaration and it is good");
								return YES;
							} 
						} 
					}
				}
			} 
		}
	} else if ( [myTable getTokentypeAt:lex] == 2 ) 
	{
            [self semActionI1:0];
		lex = [self getToken];
		if ( [myTable getTokentypeAt:lex] == 16 )
		{
			lex = [self getToken];
			if ( [self production_D1]) {
				//NSLog (@"Acquired an integer declaration and it is good");
				return YES;
			} 
		} 
	} 
	//NSLog (@"Acquired a declaration and it is bad");
	return NO;
}

-(BOOL) production_D2{
	if ( [myTable getTokentypeAt:lex] == 17 )
	{
		lex = [self getToken];
		if ( [myTable getTokentypeAt:lex] == -2 ) 
		{
            [self semActionI2:lex];
			lex = [self getToken];
			if ( [ self production_D2] ){
				NSLog (@"Acquired a declaration 2 and it is good");
				return YES;
			} 
		} 
	} else if ( [myTable getTokentypeAt:lex] == 15) {
		//lex = [self getToken];
		//NSLog (@"Acquired a declaration 2 and it is good");
		return YES;
	}  return NO;
}

-(BOOL) production_IL{
    //int toktype = [myTable getTokentypeAt:lex];
	//if ( toktype == (-1)) 
	if ( [self production_ID] )
	{
            //[self semActionI2:lex];
		//lex = [self getToken];
		if ( [self production_IL1]) {
                    //NSLog (@"Acquired a identifier list and it is good");
			return YES;
		} 
	} 
	NSLog (@"Failed to acquire a declaration and it is bad");
	return NO;
}

-(BOOL) production_IL1{
	if ( [myTable getTokentypeAt:lex] == 17) 
	{
		lex = [self getToken];
		if ( [self production_IL] ) {
			return YES;
		} 
	} else {
		if (([myTable getTokentypeAt:lex] == 19) || ([myTable getTokentypeAt:lex] == 31))
			//NSLog (@"Acquired a identifier list 1 and it is good");
			return YES;
	}
	NSLog (@"Acquired a identifer list 1 and it is good");
	return NO;
}

-(BOOL) production_Su{
	if ( [myTable getTokentypeAt:lex] == -1)
	{
            [self semActionI2:lex];
            lex = [self getToken];
		if ( [self production_Suprime]) 
			return YES;
        } else if ( [myTable getTokentypeAt:lex] == -2) {
            [self semActionI2:lex];
            lex = [self getToken];
			if ( [self production_Suprime2]) {
				//NSLog (@"Acquired a sub list and it is good");
				return YES;
			}
		
		}
	NSLog (@"Acquired a sub list and it is good");
	return NO;
}

-(BOOL) production_Suprime{
	if ( [myTable getTokentypeAt:lex] == 17)
	{
            lex = [self getToken];
			if ( [self production_Su]) {
				//NSLog (@"Acquired a sublist prime and it is good");
				return YES;
			}
		
	} else {
		if ( [myTable getTokentypeAt:lex] == 15) return YES;
	}
		
		return NO;
}

-(BOOL) production_Suprime2{
	if ( [myTable getTokentypeAt:lex] == 17)
	{
            lex = [self getToken];
			if ( [self production_Su]) {
				//NSLog (@"Acquired a sublist prime 2 and it is good");
				return YES;
			}
	} else {
		if ( [myTable getTokentypeAt:lex] == 15) return YES;
	}
	//NSLog (@"Acquired a sublist 2 and it is good");
	return NO;
}

-(BOOL) production_S {
	if ( [myTable getTokentypeAt:lex] == 12 ) {
            [self semActionG7];
            lex = [self getToken];
		if ( [self production_SL]) {
			if ( [myTable getTokentypeAt:lex] == 13) 
			{
				lex = [self getToken];
				if ( [self production_Sprime] )
				{
					//NSLog (@"Acquired a statement and it is good");
					return YES;
				} 
			} 
		} 
	} else if ( [myTable getTokentypeAt:lex] == 5 ){
		//NSLog (@"Acquired a read statement  and it is good");
		[self semActionH2:RDLN];
            lex = [self getToken];
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 6) {
		//NSLog (@"Acquired a write statement and it is good");
            lex = [self getToken];
            [self semActionH2:WTLN];
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 18 ) {
            [self semActionI0];
		lex = [self getToken];
		if ( [self production_IL] )
		{
			if ( [myTable getTokentypeAt:lex] == 19 ) 
			{
				//[self semActionI8];
				lex = [self getToken];
				if ( [self production_Sprime2]) 
				{
					//NSLog (@"Acquired a statement and it is good");
					return YES;
				} 
			}
		} 
	}  
	//NSLog (@"Failed to acquire a statement and it is bad");
	return NO;
}

-(BOOL) production_Sprime{
	if ( [myTable getTokentypeAt:lex] == 7 ) 
	{
            [self semActionG0];
		lex = [self getToken];
		if ( [self production_C] )
		{
                    [self semActionG1];
			//NSLog (@"Acquired a when statement and it is good");
			return YES;
		}
	} else if ( [myTable getTokentypeAt:lex] == 8 ) 
	{
            [self semActionG3];
		lex = [self getToken];
		if ( [self production_C] )
		{
                    [self semActionG2];
			//NSLog (@"Acquired a until statement and it is good");
			return YES;
		}
	} else if ( [myTable getTokentypeAt:lex] == -1 )
	{
            [self semActionG4:lex];
		lex = [self getToken];
		if ( [myTable getTokentypeAt:lex] == 9 )
		{
			lex = [self getToken];
			//if ( [myTable getTokentypeAt:lex] == 9 ) {
			//	lex = [self getToken];
				if ( [myTable getTokentypeAt:lex] == 14 )
				{
					lex = [self getToken];
					if ( [self production_E] )
					{
						[self semActionG5];
						if ( [myTable getTokentypeAt:lex] == 10 )
						{
							lex = [self getToken];
							if ( [self production_E] )
							{
								[self semActionG6];
								if ( [myTable getTokentypeAt:lex] == 15)
								{
									lex = [self getToken];
									//NSLog (@"Acquired a id from statement and it is good");
									return YES;
								}	
							} 
						} 
					} 
				}
			//}
			
		} 
	}
	NSLog (@"Failed to acquired a statement and it is bad");
	return NO;
	
}

-(BOOL) production_Sprime2{
	if ([myTable getTokentypeAt:lex] == 18 )
	{
		[self semActionI0];
		lex = [self getToken];
		if ( [self production_EL] ){
            
			if ([myTable getTokentypeAt:lex] == 19){
				lex = [self getToken];
				if ( [myTable getTokentypeAt:lex] == 20 )
				{
					[self semActionI7];
					lex = [self getToken];
					//NSLog (@"Acquired a statement prime 2 and it is good");
					return YES;
				}
			} 
		} 		
	} else if ( [myTable getTokentypeAt:lex] == 3 )
	{
		lex = [self getToken];
            [self semActionH1:READ];
		//NSLog (@"Acquired a statement prime 2 and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 4 )
	{
            lex = [self getToken];
            [self semActionH1:WRITE];
		//NSLog (@"Acquired a statement prime and it is good");
		return YES;
	}  
	//NSLog (@"Failed to acquired a statement and it is bad");
	return NO;
}

-(BOOL) production_T {
	if ( [self production_ID] ){ 
		//NSLog (@"Acquired another identifier and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 11 ) 
	{
		lex = [self getToken];
		//NSLog (@"Acquired the end of file character has been seen and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == -2 ) 
	{
            [self semActionI2:lex];
		lex = [self getToken];
		//NSLog (@"Acquired another constant has been acquired and it is good");
		return YES;
	}
	//NSLog (@"Failed to acquired a terminal and it is bad");
	return NO;
}

-(BOOL) production_ID {
	int idlex = lex;
	if ( ([myTable getTokentypeAt:lex]) == -1 )
	{
            //[self semActionI2:lex];
		lex = [self getToken];
		if ( [self production_IDprime] )
		{
			[self semActionI2:idlex];
			//NSLog (@"Acquired an identifier and it is good");
			return YES;
		} 
	}
	//NSLog (@"Failed acquired an identifier and it is bad"); 
	return NO;
}

-(BOOL) production_IDprime {
	if ( [myTable getTokentypeAt:lex] == 14 ) 
	{
		[self semActionI0];
		lex = [self getToken];
		if ( [self production_Su] )
		{
			if ( [myTable getTokentypeAt:lex] == 15 )
			{
				lex = [self getToken];
				//NSLog (@"Acquired an identifier prime and it is good");
				return YES;
			} 
		} 
	} else {
		if ( ([myTable getTokentypeAt:lex] == 10) || ([myTable getTokentypeAt:lex] == 15) ||  ([myTable getTokentypeAt:lex] == 17) || ([myTable getTokentypeAt:lex] == 19) || ([myTable getTokentypeAt:lex] == 31)) return YES;
	}
	//NSLog (@"Failed acquired an identifier prime and it is bad");
	return NO;
}

-(BOOL) production_E {
	if ( [myTable getTokentypeAt:lex] == 18 ) {
		[self semActionW1];
		lex = [self getToken];
		if ( [self production_EL] )
		{
			if ( [myTable getTokentypeAt:lex] == 19 )
			{
				[self semActionW2];
				lex = [self getToken];
				if ( [myTable getTokentypeAt:lex] == 18 ) 
				{
					[self semActionW1];
					lex = [self getToken];
					if ( [self production_EL] ) 
					{
						if ( [myTable getTokentypeAt:lex] == 19 ) 
						{
							lex = [self getToken];
							if ( [self production_Eprime] )
							{
								//NSLog (@"Acquired an expression and it is good");
								return YES;
							} 
						} 
					} 
				} 
			} 
		} 
	}
	else 
	{
		if ( [self production_T] ) {
			//NSLog (@"Acquired an expression and it is good");
		return YES;
		} 
	}
	//NSLog (@"Failed acquired an expression and it is bad");
	return NO;
}

-(BOOL) production_Eprime {
	if ( [myTable getTokentypeAt:lex] == 27 ) 
	{
		[self semActionX0:ADD];
		lex = [self getToken];
		//NSLog (@"Acquired an add and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 28) 
	{
		[self semActionX0:SUB];
		lex = [self getToken];
		//NSLog (@"Acquired a subtraction and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 29 )
	{
		[self semActionX0:MUL];
		lex = [self getToken];
		//NSLog (@"Acquired a multiplication and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 30 )
	{
		[self semActionX0:DIV];
		lex = [self getToken];
		//NSLog (@"Acquired a division and it is good");
		return YES;
	} else if ( [myTable getTokentypeAt:lex] == 35 )
	{
		[self semActionX0:MOD];
		lex = [self getToken];
		//NSLog (@"Acquired a modulo and it is good");
		return YES;
	} else 
	return NO;
}

-(BOOL) production_EL {
	if ( [self production_E] )
	{
		if ( [self production_ELprime] ) 
		{
			//NSLog (@"Acquired an expression list and it is good");
			return YES;
		} 
	} else { 
		if ( ([myTable getTokentypeAt:lex] == 19) ) {
			//NSLog (@"Acquired an expression list and it is good");
			return YES;
		}
	}
	//NSLog (@"Failed to acquired an expression list  and it is bad");
	return NO;
}

-(BOOL) production_ELprime {
	if ( [myTable getTokentypeAt:lex] == 17 ) 
	{
		lex = [self getToken];
		if ( [self production_EL] ) 
		{
			//NSLog (@"Acquired an expression list prime and it is good");
			return YES;
		} else return NO;
	} else 
	{ 
		if (([myTable getTokentypeAt:lex] == 11) || ([myTable getTokentypeAt:lex] == -1) || ([myTable getTokentypeAt:lex] == -2) || ([myTable getTokentypeAt:lex] == 19))
			return YES;
	}
	//NSLog (@"Failed to acquired an expression list prime  and it is bad");
	return NO;
}

-(BOOL) production_C {
	if ( [myTable getTokentypeAt:lex] == 18 ) 
	{
		[self semActionW1];
		lex = [self getToken];
		if ( [self production_EL] )
		{
			if ( [myTable getTokentypeAt:lex] == 19 )
			{
				[self semActionW2];
				lex = [self getToken];
				if ( [myTable getTokentypeAt:lex] == 18 ) 
				{
					lex = [self getToken];
					[self semActionW1];
					if ( [self production_EL] )
					{
						if ( [myTable getTokentypeAt:lex] == 19 )
						{
							lex = [self getToken];
							if ( [self production_Cprime2]){
								//NSLog (@"Acquired a condition and it is good");
								return YES;
							} 
						} 
					} 
				} 
			} 
		} 
	} 
	NSLog (@"Failed to acquired a condition and it is bad");
	return NO;
}

-(BOOL) production_Cprime {
	if ( [myTable getTokentypeAt:lex] == 16 ) 
	{
		lex = [self getToken];
		if ( [self production_C] )
		{
			if ([self production_Cprime2])
			{
				//NSLog (@"Acquired a condition prime and it is good");
				return YES;
			} 
		} 
	}  else 
	{
		if (([myTable getTokentypeAt:lex] == 13 ) || ([myTable getTokentypeAt:lex] == 32 ) || ([myTable getTokentypeAt:lex] == 33 ) || ([myTable getTokentypeAt:lex] == 34 ))
			return YES;
	}
	NSLog (@"Failed acquired a condition and it is good");
	return NO;

}

-(BOOL) production_Cprime2 {
	if ( [myTable getTokentypeAt:lex] == 21 )
	{
		lex = [self getToken];
            [self semActionX0:LT];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition less than and it is good");
			return YES;
		} 
	} else if ( [myTable getTokentypeAt:lex] == 22 )
	{
		[self semActionX0:GT];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition greater than and it is good");
			return YES;
		} 
	} else if ( [myTable getTokentypeAt:lex] == 23 )
	{
		[self semActionX0:EQU];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition equals and it is good");
			return YES;
		} 
	} else if ( [myTable getTokentypeAt:lex] == 24 )
	{
		[self semActionX0:LTE];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition less than or equals and it is good");
			return YES;
		} 
	} else if ( [myTable getTokentypeAt:lex] == 25 )
	{
		[self semActionX0:GTE];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition greater than or equals and it is good");
			return YES;
		} 
	} else 
        {
            if ( [myTable getTokentypeAt:lex] == 26 )
            {
		[self semActionX0:NEQ];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition not equals and it is good");
			return YES;
		} 
            }  
        }
	//NSLog (@"Failed to acquired a condition and it is bad");
	return NO;
}

-(BOOL) production_Cprime3 {
	if ( [myTable getTokentypeAt:lex] == 32 ){
		[self semActionX0:AND];
                lex = [self getToken];
                if ( [self production_Cprime] )
                {
					NSLog (@"Acquired a condition AND and it is good");
                    return YES;
                } 
	} else if ( [myTable getTokentypeAt:lex] == 33 ){
		[self semActionX0:OR];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			//NSLog (@"Acquired a condition OR and it is good");
			return YES;
		} 
	} else 
        {
            if ( [myTable getTokentypeAt:lex] == 34 ){
		[self semActionXnot];
		lex = [self getToken];
		if ( [self production_Cprime] )
		{
			NSLog (@"Acquired a condition NOT and it is good");
			return YES;
		} 
            }
		}
	//NSLog (@"Failed to acquired a condition and it is bad");
	return NO;
}

-(BOOL) production_SL {
	if ( [self production_S])
	{
		if ( [self production_SLprime] ) 
		{
			//NSLog (@"Acquired a statement list and it is good");
			return YES;
		} 
	} 
	NSLog (@"failed to acquired a statement list it is bad");
	return NO;
}

-(BOOL) production_SLprime{
	if ( [myTable getTokentypeAt:lex] == 16) {
		lex = [self getToken];
            [self production_SL];
		//NSLog (@"Acquired a statement list prime and it is good");
		return YES;
	} else {
		if ([myTable getTokentypeAt:lex] == 13) {
			//NSLog (@"Acquired a statement list and it is good");
			return YES; 
		}
	}
	NSLog (@"Failed to acquired a statement list and it is bad");
	return NO;
}


-(void) semActionG0
{
	
	int a = [SAS pop]; // Work quad 
	 int b = [SAS pop]; // Start Quad
	int NQ = [QUADS NQ];
	 [QUADS setResult:NQ+1 at:b];  // Establish jump to condition
         [QUADS genquad:JMP op1:nil op2:nil result:nil];
	 [SAS push:NQ];  // Preserve Next Quad
	 [SAS push:a];  // Preserve work quad
	 
}

-(void) semActionG1
{
	
	 int c = [SAS pop];  // Condition result
	 int b = [SAS pop];  // Work End Quad
	 int d = [SAS pop];  //  Work Quad
	 int NQ = [QUADS NQ];  // Preserve Next Quad
	 [QUADS genquad:(int)JEQ op1:c op2:0 result:d];  // Conditional jump
	 [QUADS setResult: (NQ+1) at:b];  // Set Exit to jump after test
	 
}

-(void) semActionG2
{
	
	 int c = [SAS pop]; // Condition Result
	 int a = [SAS pop] + 1; // Work quad
	 [QUADS genquad:(int)JEQ op1:c op2:0 result:a];
	
}

-(void) semActionG3
{
		
	int a = [SAS pop];  // Work Quad
	int b = [SAS pop];	// Start Quad
	int NQ = [QUADS NQ];
	[QUADS setResult:NQ at:b];
	[SAS push:a];
		 
}

-(void) semActionG4:(int)value
{
	 [SAS push:value];  // push id 
}

-(void) semActionG5
{
	 int c = [SAS pop];  // result of right hand expression
	int d = [SAS pop];  // id 
	int b = [SAS pop];	 // work quad
	int a = [SAS pop];	// start quad
	 int NQ= [QUADS NQ];
	 int e = NQ;
         int one = [self evaluateIdentifier:@"1"];
	 [QUADS genquad:ADD op1:d op2:one result: d];
         NQ= [QUADS NQ];
         e = NQ;
	 [QUADS genquad:JMP op1:nil op2:nil result:nil];
	 NQ = [QUADS NQ];
	 [QUADS setResult:(NQ) at:a];	// Make start quad jump to this test
	 [QUADS genquad:ASSIGN op1:c op2:nil result:d];
	 [SAS push:e];  // Preserve end of work jump
	 [SAS push:d];  // Preserve id
	 [SAS push:b];	// Preserve work quad
	 
}

-(void) semActionG6
{
	int a = [SAS pop];	// Expression result
	 int b = [SAS pop];  // work jump point
	 int d = [SAS pop]; // identifier
	 int e = [SAS pop]; // test jump point
	 int NQ = [QUADS NQ];
         int one = [self evaluateIdentifier:@"1"];
	 
	 [QUADS setResult:NQ at:e];
	 int g = [myTable genTemp];  // temporary variable
	 [QUADS genquad:LTE op1:d op2:a result:g];
	 [QUADS genquad:JEQ op1:g op2:one result:b];
	 
}

-(void) semActionG7
{
    int a = [QUADS NQ];
    [QUADS genquad:JMP op1:nil op2:nil result:nil];
    int b = a + 1;
    [SAS push:a];  // Preserve Start Quad
    [SAS push:b];  // Preserve Work Quad
}

-(void) semActionH
{
}

-(void) semActionI
{
}


-(void) semActionI0
{
    
	[SAS push:0];
    
}

-(void) semActionI1:(int)A 
{
    
     int b = [SAS pop];
     while ( b != 0 )
     {
         [myTable setMyinteger:A at:b];
         b = [SAS pop];
	 }
    
}

-(void) semActionI2:(int) value
{
     int a;
     a = value;
     [SAS push:a];
}

-(void) semActionI3:(int)value
{
     [SAS push:0];
     [SAS push:value];
}

-(void) semActionI4:(int)anindex
{
    
	 int i = 2;
	 int j,k;
	 int limit;
	 int tempdim[3];
	 int dim[3];
         int value;
     int a = [SAS pop];
     int b;
	 // Acquire the dimensions of the array
     while ( a != 0 )
     {
         tempdim[i--] = a;
         a = [SAS pop];
         
	 }
	 for ( j = 0; j < 3; j++)
	 {
		 dim[j] = 1;
		 }
	 i++;
	 k = 0;
	 for ( j = i; j < 3; j++)
	 {
             value = [myTable getConstantsAt:tempdim[j]];
		 dim[k++] = value;
		 }
	 
     b = [SAS pop];
	 limit = i;
	 // Assign the array dimensions to each of the items
	 // Default value for each dimension is one.
	 while ( b != 0 )
	 {
		 [myTable setDimensionA:dim[0] at:b];
		 [myTable setDimensionB:dim[1] at:b];
		 [myTable setDimensionC:dim[2] at:b];
                 [myTable setIsArray:YES at:b];
		 b = [SAS pop];
	 }
     
}

-(void) semActionI5:(int)value
{
    
     [self semActionI2:value];
     
}


-(void) semActionI7
{
    
     int A = [SAS pop];
     int B;
	 int NQ;
	 astack *AS1 = [[astack alloc] init];
	 astack *AS2 = [[astack alloc] init];
	 [AS2 push: 0]; 
	 // Acquire Result stack
     while ( A != 0 )
     {
         B = A;
		 if ( [myTable getIsArrayAt:A] )
		 {
			 if ( ![SAS empty])
				 A = [SAS pop];
			 else 
				 A = 0;
			 [AS2 push: 0];
			 while ( A != 0 )
			 {
				 [AS2 push:A];
				 if ( ![SAS empty])
					 A = [SAS pop];
				 else 
					 A = 0;
			 }
		 }
		 [AS2 push:B];
		 if ( ![SAS empty])
			 A = [SAS pop];
			else 
			A = 0;
     }
	 [AS1 push: 0];
	 if ( ![SAS empty])
		 A = [SAS pop];
	else 
		A = 0;
	// Acquire Identifiers for storage
	 while ( A != 0 )
	 {
         B = A;
		 if ( [myTable getIsArrayAt:A] ){
			 if ( ![SAS empty])
				 A = [SAS pop];
			 else 
				 A = 0;
			 [AS1 push: 0];
			 while ( A != 0 )
			 {
				 [AS1 push:A];
				 if ( ![SAS empty])
					 A = [SAS pop];
				 else 
					 A = 0;
			 }
		 }
		 
		 [AS1 push:B];
		 if ( ![SAS empty])
			 A = [SAS pop];
		 else 
			 A = 0;
	 }
     A = [AS1 pop];
     B = [AS2 pop];
     while ( (![AS1 empty]) & (![AS2 empty])  )
     {
		 NQ = [QUADS NQ];
         [QUADS genquad:ASSIGN op1:B op2:nil result:A];
		 if ( [myTable getIsArrayAt:A] ){
			 A = [AS1 pop];
			 if ( A != 0 )
			 {
				 [QUADS setIndex1c:A at:NQ];
				 A = [AS1 pop];
				 if ( A != 0 )
				 {
					 [QUADS setIndex2c:A at:NQ];
					 A = [AS1 pop];
					 if ( A != 0 )
					 {
						 [QUADS setIndex3c:A at:NQ];
						 A = [AS1 pop];
					 }
				 }
			 }
		 }
		 
		 if ( [myTable getIsArrayAt:B] ){
			 B = [AS2 pop];
			 if ( B != 0 )
			 {
				 [QUADS setIndex1a:B at:NQ];
				 B = [AS2 pop];
				 if ( B != 0 )
				 {
					 [QUADS setIndex2a:B at:NQ];
					 B = [AS2 pop];
					 if ( B != 0 )
					 {
						 [QUADS setIndex3a:B at:NQ];
						 B = [AS2 pop];
					 }
				 }
			 }
		 }
         if (![AS1 empty]) A = [AS1 pop];
			else
				A =0;
         if( ![AS2 empty]) B = [AS2 pop];
		 else
			 B = 0;
	 }
     [AS1 release];
	 [AS2 release];
     
}

-(void) semActionI8
{
    
	int A = [SAS pop];
	int B;
	[S1 push:0];
	while ( A != 0 )
	{
		[S1 push:A];
		A = [SAS pop];
	}
	[SAS push:0];
	
	
}

-(void) semActionI9
{
    
    int i = 2;
    int j,k;
    int limit;
    int tempdim[3];
    int dim[3];
    int value;
    int a = [SAS pop];
    int b;
    // Acquire the dimensions of the array
    while ( a != 0 )
    {
        tempdim[i--] = a;
        a = [SAS pop];
        
    }
    for ( j = 0; j < 3; j++)
    {
        dim[j] = 0;
    }
    i++;
    k = 0;
    for ( j = i; j < 3; j++)
    {
        dim[k++] = value;
    }
    [SAS push:0];
    for ( j = 0; j < k; j++)
        [SAS push: dim[j]];
}

-(void) semActionW1
{
	[self semActionI0];
}

-(void) semActionW2
{
    int a = [SAS pop];
	int b;
    [S1 push:0];
    while ( a != 0)
    {
		b = a;
         if ( [myTable getIsArrayAt:a] ) 
         {
             a = [SAS pop];
             while ( a != 0)
             {
                 [S1 push:a];
                 a = [SAS pop];
             }
         }
		 [S1 push:b];
         a = [SAS pop];
    }
}

-(void) semActionX0:(int)opValue
{
	int A;
    int aIndices[3];
    int bIndices[3];
    int aCount;
    int bCount;
    int j;
	int B;
	int c;
        int NQ;
	if (![SAS empty])
		A = [SAS pop];
	[S2 push:0];
	while ( A != 0 )
     {
		B = A;
            if ( [myTable getIsArrayAt:A] ) {
                if (![SAS empty])
                    A = [SAS pop];
                [S2 push:0];
                while ( A != 0 )
                {
                    [S2 push:A];
                    if (![SAS empty])
                        A = [SAS pop];
                    else
                        A = 0;
                }
            }
		[S2 push:B];
		 if (![SAS empty])
			 A = [SAS pop];
		 else
			 A = 0;
     }
	//[SAS push:0];
     A = [S1 pop];
     B = [S2 pop];
     while ( ![S1 empty] & ![S2 empty] & (A != 0) & (B != 0) )
     {
		 c = [myTable genTemp];
         NQ = [QUADS NQ];
         [QUADS genquad:opValue op1:A op2:B result:c];
		 if ( [myTable getIsArrayAt:A] ){
			 A = [S1 pop];
			 if ( A != 0 )
			 {
				 [QUADS setIndex1a:A at:NQ];
				 A = [S1 pop];
				 if ( A != 0 )
				 {
					 [QUADS setIndex2a:A at:NQ];
					 A = [S1 pop];
					 if ( A != 0 )
					 {
						 [QUADS setIndex3a:A at:NQ];
						 A = [S1 pop];
					 }
				 }
			 }
		 }
		 
		 if ( [myTable getIsArrayAt:B] ){
			 B = [S2 pop];
			 if ( B != 0 )
			 {
				 [QUADS setIndex1b:B at:NQ];
				 B = [S2 pop];
				 if ( B != 0 )
				 {
					 [QUADS setIndex2b:B at:NQ];
					 B = [S2 pop];
					 if ( B != 0 )
					 {
						 [QUADS setIndex3b:B at:NQ];
						 B = [S2 pop];
					 }
				 }
			 }
		 }
         [SAS push:c];
         A = [S1 pop];
         B = [S2 pop];
	 }
}



-(void) semActionXnot
{
	 int a = [S1 pop];
	 int c;
	 while ( a != 0 )
	 {
		 c = [myTable genTemp];
		 [QUADS genquad:NOT op1:a op2:nil result:c];
		 [SAS push:c];
		 a = [S1 pop];
		 }
}

-(void) semActionH1:(int)op
{     
	int A;
	int NQ;
	int bIndices[3];
	int i;
	for ( i = 0; i < 3; i++) bIndices[i] = 0;
	if ( ![SAS empty])
		A = [SAS pop];
	else 
		A = 0;
	while ( A != 0 )
	{
		NQ = [QUADS NQ];
		[QUADS genquad:op op1:nil op2:nil result:A];
		//[AS1 push:A];
		i = 0;
		if ( [myTable getIsArrayAt:A] ){
			if ( ![SAS empty])
				A = [SAS pop];
			else 
				A = 0;
			while ( A != 0 )
			{
				bIndices[i++] = A;
				if ( ![SAS empty])
					A = [SAS pop];
				else 
					A = 0;
			}
			i--;
			if ( i >= 0 )
				[QUADS setIndex1c:bIndices[i--] at:NQ];
			if ( i >= 0 )
				[QUADS setIndex2c:bIndices[i--] at:NQ];
			if ( i >= 0 )
				[QUADS setIndex3c:bIndices[i--] at:NQ];
		}
		if ( ![SAS empty])
			A = [SAS pop];
		else 
			A = 0;
	}
}

-(void) semActionH2:(int)op
{
	[QUADS genquad:op op1:nil op2:nil result:0];
}


-(void) outputQuadTable:(NSString *) fileName
{
	[QUADS writeOutTable:fileName];
}

// Add getQuadTable and getSymTable

-(quadtable *) getQUADS
{
	return QUADS;
}

-(symtable *) getTable
{
	return myTable;
}


-(void) dealloc
{
	if (S) 	[S release];
	if (myTable) [myTable release];
	if (reservwords) [reservwords release];
	
	if (prog) [prog release];
    [super dealloc];
}

@end
