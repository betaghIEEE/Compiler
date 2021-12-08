#import <Foundation/Foundation.h>

#import "tokenHome.h"
#import "lexical.h"
#import "symbolTable.h"
#import "headProductions.h"
#import "codeSource.h"
#import "quads.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
		tokenHome *homeToken;
	codeSource *blocks;
	lexical *myLex;
	symbolTable *myST;
	headProductions *productions;
	NSString *filename = @"test.txt";
	BOOL goodProgram;
	
	homeToken = [[tokenHome alloc] init];
	myST = [[symbolTable alloc] initWithArray:[homeToken tokens]];
	blocks = [[ codeSource alloc] initWithFileName:filename];
	myLex = [[ lexical alloc] initWithCodeSource:blocks
						symbolTable:myST ];
	productions = [[ headProductions alloc] initWithTokens:homeToken
									sT:myST
									lexAnalyzer:myLex
					];
	NSLog (@"Completed allocating the head production");
/*	[myLex lex];
	NSLog (@"Token identifier %d", [myLex nextToken] );
	while ( [myLex nextToken] != 0 ) 
	{
		NSLog ( @"Token identifier %d = %s", [myLex nextToken], 
					[[ [[myST table] objectAtIndex:[myLex nextToken] - 1] tokenName] cString] 
					);
		//if ( [myLex nextToken] <= 31 )
		//NSLog ( @"Token is identified as %s ", [[[[myST table] objectAtIndex:[myLex nextToken]] name] cString] );
		
		[myLex lex];
	}
	*/
	goodProgram = [productions program];
	if ( goodProgram ) {
		NSLog (@"Completed the program without errors" );
//			[[productions quads] printOutQuads];
		}
		else
		NSLog (@"Completed the program with an error, %s", 
			[[productions wasExpecting] cString]);
	
	[productions release];
	[myLex release];
	[myST release];
	[blocks release];
	[homeToken release];
    [pool release];
    return 0;
}
