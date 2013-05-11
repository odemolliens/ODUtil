//
//  ODDeviceUtil.h
//  ostalgo
//
//  Created by Olivier Demolliens on 30/04/11.
//  Copyright 2010 company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODDeviceUtil : NSObject

+(float)deviceSystemVersion;
+(BOOL)isAnIphoneOrIpod;
+(BOOL)isAnIpad;
+(BOOL)isRetina;
+(BOOL)isAnIphoneFive;
+(NSString*)regionFormat;
+(NSString*)userLanguage;

@end
