//
//  syntax.m
//  lexicalexercise
//
//  Created by Daniel D. Beatty on 10/16/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "syntax.h"

@implementation syntax



-(BOOL) production_P{
	
	if ( lex == 0 )
	{
		lex = [myLexAna getToken];
		if ([self production_D1])
			if ( lex == 12 ) {
				lex = [myLexAna getToken];
				if ( [self production_SL] ) {
					if (lex == 13) { 
						lex = [myLexAna getToken];
						return YES;
					}
					else return NO;
				} else return NO;
			} else return NO;
	} else return NO;
	
}

-(BOOL) production_D1{
	if ([self production_IL]) 
	{
		if ( lex == 31 ) 
		{
			lex = [myLexAna getToken];
			return YES;
		}else return NO;
	} else if ( lex == 12){ lex = [myLexAna getToken]; return YES;}
	else return NO;
}

-(BOOL) production_D {
	if ( lex == 1) {
		lex = [myLexAna getToken];
		if ( lex == 14) 
		{
			lex = [myLexAna getToken];
			if ( lex == -2){
				lex = [myLexAna getToken];
				if ( [self production_D2] ) {
					if ( lex == 15) 
					{
						lex = [myLexAna getToken];
						if ( lex == 16 )
						{
							lex = [myLexAna getToken];
							if ( [self production_D1] ){
								return YES;
							} else return NO;
						} else return NO;
					} else return NO;
				} else return NO;
			} else return NO;
		} else return NO;
	} else if ( lex == 2 ) 
	{
		lex = [myLexAna getToken];
		if ( lex == 16 )
		{
			lex = [myLexAna getToken];
			if ( [self production_D1]) {
				return YES;
			} else return NO;
		} else return NO;
	} else return NO;
}

-(BOOL) production_D2{
	if ( lex == 17 )
	{
		if ( lex == -2 ) 
		{
			lex = [myLexAna getToken];
			if ( [ self production_D2] ){
				return YES;
			} else return NO;
		} else return NO;
	} else if ( lex == 15) {
		lex = [myLexAna getToken];
		return YES;
	} else return NO;
}

-(BOOL) production_IL{
	if ( lex == -1) 
	{
		lex = [myLexAna getToken];
		if ( [self production_IL1]) {
			return YES;
		} else return NO;
	} else return NO;
}

-(BOOL) production_IL1{
	if ( lex == 17) 
	{
		lex = [myLexAna getToken];
		if ( [self production_IL] ) {
			return YES;
		} else return NO;
	} else if ((lex == 19) || (lex == 31)) return YES;
	else return NO;
}

-(BOOL) production_Su{
	if ( lex == -1)
	{
		lex = [myLexAna getToken];
		if ( [self production_Suprime]) 
			return YES;
		else return NO;
	} else if ( lex == -2) {
		lex = [myLexAna getToken];
		if ( [self production_Suprime2]) 
			return YES;
		else return NO;
	}
	else return NO;
}

-(BOOL) production_Suprime{
	if ( lex == 17)
	{
		lex = [myLexAna getToken];
		if ( [self production_Su]) 
			return YES;
		else return NO;
	} else return NO;
}

-(BOOL) production_Suprime2{
	if ( lex == 17)
	{
		lex = [myLexAna getToken];
		if ( [self production_Su]) 
			return YES;
		else return NO;
	} else return NO;
}

-(BOOL) production_S {
	if ( lex == 12 ) {
		lex = [myLexAna getToken];
		if ( [self production_SL]) {
			if ( lex == 13) 
			{
				lex = [myLexAna getToken];
				if ( [self production_Sprime] )
				{
					return YES;
				} else return NO;
			} else return NO;
		} else return NO;
	} else if ( lex == 5 ){
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 6) {
		lex = [myLexAna getToken];
		return NO;
	} else if ( lex == 18 ) {
		lex = [myLexAna getToken];
		if ( [self production_IL] )
		{
			if ( lex == 19 ) 
			{
				lex = [myLexAna getToken];
				if ( [self production_Sprime2]) 
				{
					return YES;
				} else return NO;
			} else return NO;
		} else return NO;
	} else return NO;
}

-(BOOL) production_Sprime{
	if ( lex == 7 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_C] )
		{
			return YES;
		}
	} else if ( lex == 8 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_C] )
		{
			return YES;
		}
	} else if ( lex == -1 )
	{
		lex = [myLexAna getToken];
		if ( lex == 19 )
		{
			lex = [myLexAna getToken];
			if ( lex == 14 )
			{
				lex = [myLexAna getToken];
				if ( [self production_E] )
				{
					if ( lex == 10 )
					{
						lex = [myLexAna getToken];
						if ( [self production_E] )
						{
							if ( lex == 15)
							{
								lex = [myLexAna getToken];
								return YES;
							} else return NO;
						} else return NO;
					} else return NO;
				} else return NO;
			} else return NO;
		} else return NO;
	} else return NO;
	
}

-(BOOL) production_Sprime2{
	if (lex == 18 )
	{
		lex = [myLexAna getToken];
		if ( [self production_EL] ){
			if (lex == 19){
				lex = [myLexAna getToken];
				if ( lex == 20 )
				{
					lex = [myLexAna getToken];
					return YES;
				} else return NO;
			} else return NO;
		} else return NO;
		
	} else if ( lex == 3 )
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 4 )
	{
		lex = [myLexAna getToken];
		return YES;
	} else return NO;
}

-(BOOL) production_T {
	if ( [self production_ID] ){ 
		return YES;
	} else if ( lex == 11 ) 
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == -2 ) 
	{
		lex = [myLexAna getToken];
		return YES;
	}
	else return NO;
}

-(BOOL) production_ID {
	if ( lex == -1 )
	{
		lex = [myLexAna getToken];
		if ( [self production_IDprime] )
		{
			return YES;
		} else return NO;
	} else return NO;
}

-(BOOL) production_IDprime {
	if ( lex == 14 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_Su] )
		{
			if ( lex == 15 )
			{
				lex = [myLexAna getToken];
				return YES;
			} else return NO;
		} return NO;
	} else if ( (lex == 10) || (lex == 15) ||  (lex == 17) || (lex == 19) ) return YES;
	return NO;
}

-(BOOL) production_E {
	if ( lex == 18 ) {
		lex = [myLexAna getToken];
		if ( [self production_EL] )
		{
			if ( lex == 19 )
			{
				lex = [myLexAna getToken];
				if ( lex == 18 ) 
				{
					lex = [myLexAna getToken];
					if ( [self production_EL] ) 
					{
						if ( lex == 19 ) 
						{
							lex = [myLexAna getToken];
							if ( [self production_Eprime] )
							{
								return YES;
							} else return NO;
						} else return NO;
					} else return NO;
				} else return NO;
			} else return NO;
		} return NO;
	}
	else if ( [self production_T] ) {
		return YES;
	} else
	return NO;
}

-(BOOL) production_Eprime {
	if ( lex == 27 ) 
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 28) 
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 29 )
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 30 )
	{
		lex = [myLexAna getToken];
		return YES;
	} else if ( lex == 35 )
	{
		lex = [myLexAna getToken];
		return YES;
	} else 
	return NO;
}

-(BOOL) production_EL {
	if ( [self production_E] )
	{
		if ( [self production_ELprime] ) 
		{
			return YES;
		} else return NO;
	} else if ( (lex == 19) ) {
		return YES;
	} else 
	return NO;
}

-(BOOL) production_ELprime {
	if ( lex == 17 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_EL] ) 
		{
			return YES;
		} else return NO;
	} else
	return NO;
}

-(BOOL) production_C {
	if ( lex == 18 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_EL] )
		{
			if ( lex == 19 )
			{
				lex = [myLexAna getToken];
				if ( lex == 18 ) 
				{
					lex = [myLexAna getToken];
					if ( [self production_EL] )
					{
						if ( lex == 19 )
						{
							lex = [myLexAna getToken];
							if ( [self production_Cprime2]){
								return YES;
							} else return NO;
						} else return NO;
					} else return NO;
				} else return NO;
			} else return NO; 
		} return NO;
	} else 
	return NO;
}

-(BOOL) production_Cprime {
	if ( lex == 16 ) 
	{
		lex = [myLexAna getToken];
		if ( [self production_C] )
		{
			if ([self production_Cprime2])
			{
				return YES;
			} else return NO;
		} else return NO;
	} else return NO;

}

-(BOOL) production_Cprime2 {
	if ( lex == 21 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 22 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 23 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 24 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 25 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 26 )
	{
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else 
	return NO;
}

-(BOOL) production_Cprime3 {
	if ( lex == 32 ){
	lex = [myLexAna getToken];
	if ( [self production_Cprime] )
	{
		return YES;
	} else return NO;
	} else if ( lex == 33 ){
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else if ( lex == 34 ){
		lex = [myLexAna getToken];
		if ( [self production_Cprime] )
		{
			return YES;
		} else return NO;
	} else return NO;
}

-(BOOL) production_SL {
	if ( [self production_S])
	{
		if ( [self production_SLprime] ) 
		{
			return YES;
		} else return NO;
	} else
	return NO;
}

-(BOOL) production_SLprime{
	if ( lex == 16) {
		lex = [myLexAna getToken];
		return YES;
	} else if (lex == 13) return YES; 
	else return NO;
}





@end
