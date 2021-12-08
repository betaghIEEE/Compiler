#import <Foundation/Foundation.h>
#import "symbols.h"
#import "symbolTable.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
//	symbolTable *st;
	symbols *symbolRow;
	NSString *token;
	int count = 0;
	
	NSArray *sample = [[NSArray alloc] initWithObjects:
				@"A",
				@"B",
				@"C",
				@"D",
				nil ];
	NSEnumerator *sampleEnum = [sample objectEnumerator];
	
	while ( ( token = [sampleEnum nextObject]) != nil) 
	{
			symbolRow = [[symbols alloc] init];
			[symbolRow setTokenType:count++];
			NSLog (@"Token type is %d", [symbolRow tokenType]);
			NSLog (@"Count is %d, and token is %s", count, [token cString]);
			[symbolRow release];
	}
	//[sampleEnum release];
	[sample release];
    [pool release];
    return 0;
}
