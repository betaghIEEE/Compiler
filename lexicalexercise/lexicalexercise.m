#import <Foundation/Foundation.h>
#import "frontend.h"
#import "fileio.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // insert code here...
    NSLog(@"Hello, World!");
	fileio *iowork = [[fileio alloc] init];
	NSLog (@"Got the file IO Started");
	frontend *compiler = [[frontend alloc] init];
	NSLog (@"Got the front end started");
	[iowork openFile:@"duffus.strange"];
	NSString *S = [[NSString alloc]init];
	NSLog (@"String allocated");
	S = [iowork readNextLine];
	NSLog (@"Line read");
	[compiler getToken:S pos:0];
	NSLog (@"Token acquired");
	[iowork closeFile];
    [pool release];
    return 0;
}
