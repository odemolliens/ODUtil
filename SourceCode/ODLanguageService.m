//
//  LanguageService.m
//  company
//
//  Created by Olivier Demolliens on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "ODLanguageService.h"

@implementation ODLanguageService

+(NSString*)getString:(NSString*)key withComment:(NSString*)comment
{
    
	NSString *myString = NSLocalizedString(key, comment);
	return myString;
    
}

+(NSString*)getString:(NSString*)key withComment:(NSString*)comment withParams:(NSArray*)params
{
    
	char *argList = (char*)malloc(sizeof(NSString *) * [params count]);
	[params getObjects:(id*)argList];

	NSString* myString = [[NSString alloc]initWithFormat:NSLocalizedString(key, comment) arguments:argList];
	
	free(argList);
	[myString autorelease];
	
	return myString;
    
}

@end
