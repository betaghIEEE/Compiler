//
//  symtable.h
//  frontend
//
//  Created by Daniel Beatty on 11/15/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "symtabletype.h"

@interface symtable : NSObject {
    symtabletype table[10000];
    int count;
    int index;
    
}
-(int) count;
-(BOOL) insert:(symtabletype *) item;
-(int) searchByName: (NSString *)mykey;
-(int) searchByIndex: (int ) key;
-(void) setToken: (symtabletype *) value at:(int) anindex;
-(int) getIndex;
-(int) setupNewItem;
-(int) genTemp;
-(void) setName:(NSString *) value at:(int) anindex;
-(void) setLocation:(int) value at:(int) anindex;
-(void) setTokentype:(int) value at:(int) anindex;
-(void) setAlive:(BOOL) value at:(int) anindex;
-(void) setTemporary:(BOOL) value at:(int) anindex;
-(void) setRegmem:(int) value at:(int) anindex;
-(void) setIndexOfToken:(int) value at:(int) anindex;
-(void) setConstants:(int) value at:(int) anindex;
-(void) setMyinteger:(int) value at:(int) anindex;
-(void) setDimensionA:(int) value at:(int) anindex;
-(void) setDimensionB:(int) value at:(int) anindex;
-(void) setDimensionC:(int) value at:(int) anindex;
-(void) setIsArray:(BOOL) value at:(int)anindex;


-(NSString *) getNameAt:(int) anindex;
-(int) getLocationAt:(int) anindex;
-(int) getTokentypeAt:(int) anindex;
-(BOOL) getAliveAt:(int) anindex;
-(BOOL) getTemporaryAt:(int) anindex;
-(int) getRegmemAt:(int) anindex;
-(int) getIndexOfTokenAt:(int) anindex;
-(int) getConstantsAt:(int) anindex;
-(int) getMyintegerAt:(int) anindex;
-(int) getDimensionAAt:(int) anindex;
-(int) getDimensionBAt:(int) anindex;
-(int) getDimensionCAt:(int) anindex;
-(BOOL) getIsArrayAt:(int) anindex;


@end
