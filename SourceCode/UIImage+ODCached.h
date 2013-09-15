//
//  UIImage+ODCached.h
//  iVelo
//
//  Created by Olivier Demolliens on 28/08/13.
//  Copyright (c) 2013 Olivier Demolliens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ODCached)

/** manual load image **/
+(UIImage*)imageWithName:(NSString*)imageNa;

/** load from cache folder **/
+(UIImage*)imageFromLibraryWithName:(NSString*)imageNa;

+(UIImage*)imageFromLibraryWithoutResolution:(NSString*)imageNa;

/** load with drawed image **/
+(UIImage*)cacheDrawedNewImage:(UIImage* (^)(void))imgHandler withName:(NSString*)imageNa withCacheName:(NSString*)cacheName;

/** load with existing image**/
+(UIImage*)cacheDrawedImage:(UIImage* (^) (UIImage *imageToDraw))imgHandler withName:(NSString*)imageNa withCacheName:(NSString*)cacheName;

@end
