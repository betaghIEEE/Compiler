#import <Foundation/Foundation.h>
#import "frontend.h"
#import "codegen.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
	int tokenLex;
	//NSString *sourceName = [[NSString alloc] initWithCString:argv[1]];
	//frontend *front = [[frontend alloc] initWithName:sourceName ];
	frontend *front = [[frontend alloc] initWithName:@"matrix.txt" ];
	codegen *machineCode = [[codegen alloc] init];
	//while ( (tokenLex = [front getToken]) != 11)
	//	NSLog (@"%d is the token", tokenLex);
    if ([front production_P]) {
		[front outputQuadTable:@"duffus.quads"];
		[machineCode passes: [front getQUADS] withST:[front getTable]];	
		[machineCode writeOutCode:@"prog.dat"];
	}
	//[front release];
    [pool release];
    return 0;
}
