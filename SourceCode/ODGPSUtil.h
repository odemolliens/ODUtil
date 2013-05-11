//
//  ODGPSUtil.h
//  ostalgo
//
//  Created by Olivier Demolliens on 30/04/11.
//  Copyright 2010 company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define kActionSheetGPSGoogleMaps @"Google Maps"
#define kActionSheetGPSNavigon @"Navigon"
#define kActionSheetGPSTomTom @"TomTom"
#define kActionSheetGPSPlans @"Apple Maps"

@interface ODGPSUtil : NSObject {

	
}

//Old version (ios<6)
+(void)showMapWithStart:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat;

//Apple Maps App
+(void)showMapWithAppleMaps:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat;

//TomTom App
+(BOOL)tomtomAppsInstalled;
+(void)showMapWithTomTom:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat withTitle:(NSString*)title;

//GoogleMaps App
+(BOOL)googleMapsAppsInstalled;
+(void)showMapWithGoogleMaps:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat;

//Navigon App
+(BOOL)navigonAppsInstalled;
+(void)showMapWithNavigon:(MKMapView*)mapView ToGo:(NSDecimalNumber*)eLongi and:(NSDecimalNumber*)eLat withTitle:(NSString*)title;


//ActionSheet
+ (UIActionSheet*)getActionbar:(UIViewController*)ctrl withTitle:(NSString*)title andCancelButtonTitle:(NSString*)cancelButton;

@end