//
//  fileio.m
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 9/25/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "fileio.h"


@implementation fileio

- (NSString *) readNextLine
{
	char abuffer[80];
	fscanf(fp,"%s",abuffer);
	[myBuffer release];
	//myBuffer = [[NSString alloc] init];

	//int i = 0;

	int alength = strlen(abuffer);
	NSLog(@"Next line of length %d is allocated, %s",  alength, abuffer);
	int i;
	//if ( position == [nextLine length] ) return NULL;
	//if ( [myBuffer characterAtIndex:position] == '\n') position++;
	//NSLog (@"Examining the buffer at position %d.", position);
	
	myBuffer = [[NSString alloc] initWithCString:abuffer length:(alength) ];
//	for ( i = 0; i < alength; i++) nextLine += abuffer[i];
	//	nextLine += [ myBuffer characterAtIndex:position++];
	//	NSLog (@"The line and position %s, %d", nextLine, position);
	//}
		NSLog (@"Next Line is %s", [myBuffer cString]);
	return myBuffer;
	
}

- (void) writeNextLine: (NSString *) next
{
	//int length = [next length];
	if ( fp != 0 )
		fprintf (fp, [next cString]);
}

- (void) writeInt: (int) next
{
	//int length = [next length];
	if ( fp != 0 )
		fprintf (fp, " %d \t " , next);
}

- (void) writeEol
{
	if ( fp != 0 )
		fprintf (fp, "\n" );
}

-(void) openFile: (NSString *) fileName
{
	if (( fp = fopen ( [fileName cString], "r")) == NULL) 
	{
		printf ( "Can not open file %s", [fileName cString]);
		exit(1);
	}
	myBuffer = [[NSString alloc] init];
//	myBuffer = [[NSString alloc] initWithContentsOfFile:fileName];
//	NSLog ("%s", myBuffer);
//	[myBuffer retain];
	position = 0;
}

-(void) createFile: (NSString *) fileName
{
	if (( fp = fopen ( [fileName cString], "w")) == NULL) 
	{
		printf ( "Can not open file %s", [fileName cString]);
		exit(1);
	}
	myBuffer = [[NSString alloc] init];
	//	myBuffer = [[NSString alloc] initWithContentsOfFile:fileName];
	//	NSLog ("%s", myBuffer);
	//	[myBuffer retain];
	position = 0;
}

-(void) closeFile
{
	fclose (fp);
}

-(BOOL) eof 
{
    if ( fp != NULL) 
    {
        if (feof(fp)) return YES;
    }
    return NO;
}

-(void) dealloc
{
    if (fp) [self closeFile];
    if (myBuffer) [myBuffer release];
    [super dealloc];
}


@end
