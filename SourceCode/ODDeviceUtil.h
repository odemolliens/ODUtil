//
//  UIDeviceUtil.h
//  ostalgo
//
//  Created by Olivier Demolliens on 15/09/11.
//  Copyright 2011 ostalgo. All rights reserved.
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
