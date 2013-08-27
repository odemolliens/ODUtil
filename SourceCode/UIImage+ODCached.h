//
//  UIImage+ODCached.h
//  iVelo
//
//  Created by Olivier Demolliens on 28/08/13.
//  Copyright (c) 2013 Olivier Demolliens. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ODCached)

+(UIImage*)cacheDrawedImage:(UIImage* (^) (UIImage *imageToDraw))imgHandler withName:(NSString*)imageNa withCacheName:(NSString*)cacheName;

@end
