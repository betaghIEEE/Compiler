//
//  conditionalActions.m
//  semActions
//
//  Created by Daniel Beatty on 3/19/06.
//  Copyright 2006 Texas Tech University. All rights reserved.
//

#import "conditionalActions.h"

@implementation conditionalActions

-(void) andAction
{
	a = [sas pop];
	b = [sas pop];
	c = [imCode nextQuad];
	d = [myST gentemp];
	[imCode genquad: (int) jfalse
				arg1: b
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) jfalse
				arg1: a
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) trueType ];
	[imCode genquad: (int) jmp
				arg1: d
				arg2: 0
				results: 0 ];
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) falseType ];
	[imCode codeAt: c
			results: c + 4 ];
	[imCode codeAt: c + 1
			results: c + 4 ];
	[imCode codeAt: c + 3
			results: c + 5 ];
	
	
}

-(void) orAction
{
	a = [sas pop];
	b = [sas pop];
	c = [imCode nextQuad];
	d = [myST gentemp];
	[imCode genquad: (int) jtrue
				arg1: b
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) jtrue
				arg1: a
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) falseType ];
	[imCode genquad: (int) jmp
				arg1: d
				arg2: 0
				results: 0 ];
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) trueType ];
	[imCode codeAt: c
			results: c + 4 ];
	[imCode codeAt: c + 1
			results: c + 4 ];
	[imCode codeAt: c + 3
			results: c + 5 ];
}

-(void) notAction
{
//	a = [sas pop];
	b = [sas pop];
	c = [imCode nextQuad];
	d = [myST gentemp];
	[imCode genquad: (int) jtrue
				arg1: b
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) trueType ];
	[imCode genquad: (int) jmp
				arg1: d
				arg2: 0
				results: 0 ];
	
	[imCode genquad: (int) assign
				arg1: d
				arg2: 0
				results: (int) falseType ];
	[imCode codeAt: c
			results: c + 3 ];
	[imCode codeAt: c + 1
			results: c + 3 ];
	[imCode codeAt: c + 2
			results: c + 4 ];
}


@end
