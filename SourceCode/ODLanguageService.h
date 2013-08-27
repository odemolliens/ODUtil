//
//  LanguageService.h
//  company
//
//  Created by Olivier Demolliens on 25/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ODLanguageService : NSObject {

}

+(NSString*)getString:(NSString*)string withComment:(NSString*)comment;

+(NSString*)getString:(NSString*)string withComment:(NSString*)comment withParams:(NSArray*)params;

@end
