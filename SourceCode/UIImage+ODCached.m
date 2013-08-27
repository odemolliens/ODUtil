//
//  UIImage+ODCached.m
//  iVelo
//
//  Created by Olivier Demolliens on 28/08/13.
//  Copyright (c) 2013 Olivier Demolliens. All rights reserved.
//

#import "UIImage+ODCached.h"

#import "ODDeviceUtil.h"

#define kIMageCachePath @"imageCacheFolder"

@implementation UIImage (ODCached)


+(UIImage*)cacheDrawedImage:(UIImage* (^) (UIImage *imageToDraw))imgHandler withName:(NSString*)imageNa withCacheName:(NSString*)cacheName
{
    NSString *imageName = @"";
    NSString *realImageName = @"";
    
    if ([ODDeviceUtil isRetina]) {
        imageName = [NSString stringWithFormat:@"%@.png",cacheName];
        realImageName = [NSString stringWithFormat:@"%@@2x",imageNa];
    }else{
        imageName = [NSString stringWithFormat:@"%@.png",cacheName];
        realImageName = [NSString stringWithFormat:@"%@",imageNa];
    }
    
    
    
    NSString *libraryPath = [self libraryDirectory];
    
    NSString *cachePath = [libraryPath stringByAppendingPathComponent:kIMageCachePath];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:cachePath]) {
        [self createDirectory:kIMageCachePath atFilePath:libraryPath];
    }
    
    NSString *pngPath = [cachePath stringByAppendingPathComponent:imageName];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath: pngPath]) {
        
        NSData *data = [NSData dataWithContentsOfFile:pngPath];
        
        CGFloat scale = [ODDeviceUtil isRetina] ? 2.0:1.0;
        
        return [UIImage imageWithData:data scale:scale];
        
    }else{
        //Not exist, draw and write it in image cache folder.
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:realImageName ofType:@"png"];
        
        if (!filePath) {
            //NSLog(@"image doesn't exist in BUNDLE:%@",realImageName);
            return nil;
        }else{
            //NSLog(@"image exist in BUNDLE:%@",realImageName);
        }
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        CGFloat scale = [ODDeviceUtil isRetina] ? 1.0:1.0;
        
        
        UIImage *image = [UIImage imageWithData:data scale:scale];
        
        image = imgHandler(image);
        
        // Write image to PNG
        if([UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES]){
            
            if ([[NSFileManager defaultManager] fileExistsAtPath: pngPath]) {
                
                NSData *data = [NSData dataWithContentsOfFile:pngPath];
                
                CGFloat scale = [ODDeviceUtil isRetina] ? 2.0:1.0;
                
                return [UIImage imageWithData:data scale:scale];
            }else{
                return nil;
            }
        }else {
            //NSLog(@"save failed");
            return nil;
        }
    }
}

+ (NSString*) libraryDirectory
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+(void)createDirectory:(NSString *)directoryName atFilePath:(NSString *)filePath
{
    NSString *filePathAndDirectory = [filePath stringByAppendingPathComponent:directoryName];
    NSError *error;
    
    if (![[NSFileManager defaultManager] createDirectoryAtPath:filePathAndDirectory
                                   withIntermediateDirectories:NO
                                                    attributes:nil
                                                         error:&error])
    {
        NSLog(@"Create directory error: %@", error);
    }
}

@end
