//
//  UIDeviceUtil.m
//  ostalgo
//
//  Created by Olivier Demolliens on 15/09/11.
//  Copyright 2011 ostalgo. All rights reserved.
//

#import "ODDeviceUtil.h"

@implementation ODDeviceUtil

+(BOOL)isAnIphoneFive
{
   CGSize screenSize = [[UIScreen mainScreen] bounds].size;
   
   if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
      if (screenSize.height > 480.0f) {
         return YES;
      } else {
         return NO;
      }
   } else {
     return NO;
   }
}

+(float)deviceSystemVersion
{
   return [[[UIDevice currentDevice]systemVersion]floatValue];
}

+(BOOL)isAnIphoneOrIpod
{
   if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
      return YES;
   }else{
      return NO;
   }
}

+(BOOL)isRetina
{
   BOOL isRetina = NO;
   
   if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
      CGFloat scale = [[UIScreen mainScreen] scale];
      if (scale > 1.0) {
         isRetina = YES;
      }
   }
   
   return isRetina;
}

+(BOOL)isAnIpad
{
   if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
      return YES;
   }else{
      return NO;
   }
}

+(NSString*)regionFormat
{
   return [NSString stringWithFormat:@"%@",[[NSLocale currentLocale] localeIdentifier]];
}


+(NSString*)userLanguage
{
   NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
   NSArray* languages = [defs objectForKey:@"AppleLanguages"];
   return [NSString stringWithFormat:@"%@",[languages objectAtIndex:0]];
}

@end
