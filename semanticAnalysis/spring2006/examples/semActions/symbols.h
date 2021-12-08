//
//  symbols.h
//  tokenizer
//
//  Created by Daniel Beatty on 1/26/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum setOfDataTypes {integerType, arrayType};
typedef enum setOfDataTypes setOfDataTypes;

@interface symbols : NSObject {
	NSString *tokenName;
	int tokenType;
	int entryNumber;
	int memoryLocation;
	int dimension[10];
	int dimensions;
	int dataType;
}
-(void) setTokenName:(NSString *) value;
-(NSString *) tokenName;
-(void) setTokenType:(int) value;
-(int) tokenType;
-(void) setEntryNumber:(int) value;
-(int) entryNumber;
-(void) setMemoryLocation:(int) value;
-(int) memoryLocation;
-(int *) dimension;
-(int) dimensions;
-(void) setDimensions:(int)value;
-(setOfDataTypes) dataType;
-(void) setDataType:(setOfDataTypes) value;


@end
