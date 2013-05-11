//
//  GoogleApiUtil.m
//  ostalgo
//
//  Created by user on 25/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ODGPSUtil.h"
#import "ODDeviceUtil.h"

@implementation ODGPSUtil



#pragma ios sdk compability 4x 5x to 6x

+(void)showMapWithStart:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat
{
    if ([ODDeviceUtil deviceSystemVersion]<6.0f) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f"
                                                                          ,mapView.userLocation.location.coordinate.latitude,mapView.userLocation.location.coordinate.longitude,[eLat floatValue],[eLongi floatValue]]]];
    }else{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f"
                                                                          ,mapView.userLocation.location.coordinate.latitude,mapView.userLocation.location.coordinate.longitude,[eLat floatValue],[eLongi floatValue]]]];
    }
	
}



#pragma mark Apple Maps App

+(void)showMapWithAppleMaps:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"http://maps.apple.com/maps?saddr=%f,%f&daddr=%f,%f"
                                                                      ,mapView.userLocation.location.coordinate.latitude,mapView.userLocation.location.coordinate.longitude,[eLat floatValue],[eLongi floatValue]]]];
}

#pragma mark Google Maps App

+(BOOL)googleMapsAppsInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:
            [NSURL URLWithString:@"comgooglemaps://"]];
}

+(void)showMapWithGoogleMaps:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"comgooglemaps://?saddr=%f,%f&daddr=%f,%f"
                                                                      ,mapView.userLocation.location.coordinate.latitude,mapView.userLocation.location.coordinate.longitude,[eLat floatValue],[eLongi floatValue]]]];
}

#pragma mark Navigon App
+(BOOL)navigonAppsInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:
            [NSURL URLWithString:@"navigon://"]];
}

+(void)showMapWithNavigon:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat withTitle:(NSString*)title
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"navigon://coordinate/%@/%f/%f",title,[eLongi floatValue],[eLat floatValue]]]];
}

#pragma mark TomTom App

+(BOOL)tomtomAppsInstalled
{
    return [[UIApplication sharedApplication] canOpenURL:
            [NSURL URLWithString:@"tomtomhome://"]];
}

+(void)showMapWithTomTom:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat withTitle:(NSString*)title
{
    NSString *reformatedTitle = [title stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"tomtomhome:geo:action=show&lat=%f&long=%f&name=%@",[eLat floatValue],[eLongi floatValue],reformatedTitle]]];
}

+ (UIActionSheet*)getActionbar:(UIViewController*)ctrl withTitle:(NSString*)title andCancelButtonTitle:(NSString*)cancelButton
{
    BOOL haveGoogleMaps =false;
    BOOL haveTomTom = false;
    BOOL haveNavigon = false;
    BOOL haveOldIos = false;
    
    UIActionSheet *actionSheet;
    
    if([self googleMapsAppsInstalled]){
        haveGoogleMaps = true;
    }
    
    if([self tomtomAppsInstalled]){
        haveTomTom = true;
    }
    
    if([self navigonAppsInstalled]){
        haveNavigon = true;
    }
    
    if ([ODDeviceUtil deviceSystemVersion]<6.0f)
    {
        haveOldIos = true;
    }
    
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    
    if (haveOldIos) {
        [tempArray addObject:kActionSheetGPSGoogleMaps];
    }
    
    if (!haveOldIos && haveGoogleMaps) {
        [tempArray addObject:kActionSheetGPSGoogleMaps];
    }
    
    if(!haveOldIos){
        [tempArray addObject:kActionSheetGPSPlans];
    }
    
    if (haveNavigon) {
        [tempArray addObject:kActionSheetGPSNavigon];
    }
    
    if(haveTomTom){
        [tempArray addObject:kActionSheetGPSTomTom];
    }
    
    actionSheet = [[[UIActionSheet alloc] initWithTitle:title delegate:ctrl cancelButtonTitle:nil destructiveButtonTitle:[cancelButton capitalizedString] otherButtonTitles:nil]autorelease];
    
    for (NSString *str in tempArray) {
        [actionSheet addButtonWithTitle:str];
    }
    
    [tempArray release];
    
    return actionSheet;
}

@end
