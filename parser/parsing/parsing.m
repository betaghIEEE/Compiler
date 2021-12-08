#import <Foundation/Foundation.h>
#import "tokenHome.h"
#import "lexical.h"
#import "symbolTable.h"
#import "headProductions.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
	tokenHome *homeToken;
	codeSource *blocks;
	lexical *myLex;
	symbolTable *myST;
	headProductions *productions;
	NSString *filename;
	
	homeToken = [[tokenHome alloc] init];
	myST = [[symbolTable alloc] initWithArray:[homeToken tokens]];
	blocks = [[ codeSource alloc] initWithFile:filename];
	myLex = [[ lexical alloc] initWithCodeSource:blocks
						symbolTable:myST ];
	productions = [[ headProductions alloc] initWithTokens:homeToken
									sT:myST
									lexAnalyzer:myLex
					];
	[productions program];
    [pool release];
    return 0;
}
