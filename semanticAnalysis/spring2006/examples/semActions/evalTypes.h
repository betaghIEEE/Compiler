/*
 *  evalTypes.h
 *  semActions
 *
 *  Created by Daniel Beatty on 3/26/06.
 *  Copyright 2006 Texas Tech University. All rights reserved.
 *
 */

//#include <Carbon/Carbon.h>

typedef enum semTypes {subListType, addType, 
						minusType, multiplyType, 
						divideType, modType, lessType, 
						moreType, lessEqType, moreEqType,
						eqType, neqType, jfalse, jtrue, jmp,
						assign, trueType, falseType } semTypes;
