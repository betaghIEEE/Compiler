#import <Foundation/Foundation.h>
#import "lexical.h"
#import "symbols.h"
#import "symbolTable.h"
#import "codeSource.h"


int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!  Beginning Compilation");
	lexical *lexAnalyzer;
	symbolTable *mySt;
	codeSource *myFile;  
	NSSet *reservedWords = [[NSSet alloc] initWithObjects:@"prog",
						@"array", @"integer", @"->",
						@"when", @"else",
						@"^",
						@"{", @"}", @"[", @"]", @";", @"," , @"(", @")",
						@":=", @"<",@">", @"eq", @"neq", @"<=", @">=",
						@"+", @"-", @"*", @"/", @":",
						@"and", @"or", @"not", @"mod",
						nil ]; 
	myFile  = [[codeSource alloc] initWithFileName:
			@"test.txt"];


	mySt = [[symbolTable alloc] initWithSet:reservedWords];
	
///	[st initWithSet:reservedWords];
	lexAnalyzer = [[lexical alloc] initWithCodeSource: myFile
					symbolTable:mySt
					];

	[lexAnalyzer lex];
	//NSLog ( [lexAnalyzer nextTokenName]);
	NSLog ( @"Token identifier %d", [lexAnalyzer nextToken] );
	while ( [lexAnalyzer nextToken] != 0 ) 
	{
		[lexAnalyzer lex];
		//NSLog ( [lexAnalyzer nextTokenName]);
		NSLog ( @"Token identifier %d", [lexAnalyzer nextToken] );
	}

	NSLog (@"\n");
	NSLog ([myFile block]);
	[lexAnalyzer release];
	[mySt release];
	[myFile release];
	[reservedWords release];
    [pool release];
    return 0;
}
