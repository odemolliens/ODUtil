//
//  ODDateUtil.h
//  ostalgo
//
//  Created by Olivier Demolliens on 30/04/11.
//  Copyright 2010 company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Split date util
#define NUMBERDATEANDTIME 19
#define NUMBERDATE 10


@interface ODDateUtil : NSObject

//Methods - Return NSString
+(NSString*)getHourFromDate:(NSDate*)date;
+(NSString*)getMinuteFromDate:(NSDate*)date;
+(NSString*)getSecondFromDate:(NSDate*)date;
+(NSString*)getHourAndMinuteFromDate:(NSDate*)date;
+(NSString*)getDayFromDate:(NSDate*)date;
+(NSString*)getFormatDateLiteral:(NSDate*)date;
+(NSString*)getFormatDate:(NSDate*)date;
+(NSString*)getTimeDate:(NSDate*)date;
+(NSString*)getTimeAndDate:(NSDate*)date;
+(NSString*)getPreviousDayString:(NSDate*)date;
+(NSString*)getNextDayString:(NSDate*)date;
+(NSString*)getSecondToTime:(int)second;
+(NSString*)getDateToString:(NSDate*)date;
+(NSString*)getOnlyDateToString:(NSDate*)date;
+(NSString*)getDuration:(NSInteger)value;
+(NSString*)getDate:(NSDate*)date withParams:(NSString*)strFormattedDate;
+(NSString*)getMonthFromDate:(NSDate*)date;
+(NSString*)getYearFromDate:(NSDate*)date;


//Methods - Return integer
+(int)getIntHourFromDate:(NSDate*)date;
+(int)getIntMinuteFromDate:(NSDate*)date;

//Methods - Return NSDate
+(NSDate*)getDateFromString:(NSString*)dateString;
+(NSDate*)getDateFromStringNoTime:(NSString*)dateString;

+(NSDate*)dateWithGmtUser:(NSDate*)date;
+(NSDate*)dateWithoutGmtUser:(NSDate*)date;

+(NSDate*)getDateToMidnight:(NSDate*)date;
+(NSDate*)getNextDay:(NSDate*)date;
+(NSDate*)getPreviousDay:(NSDate*)date;
+(NSDate*)addAtThisDate:(NSDate*)date day:(NSInteger)numberOfDay;
+(NSDate*)addAtThisDate:(NSDate*)date minutes:(NSInteger)minutes;
+(NSDate*)getDateDuration:(NSInteger)value;


//Methods - Return BOOL
+(BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate;
+(BOOL)day:(NSDate*)date1 isLaterThanOrEqualTo:(NSDate*)date2;

//Methods - Return NSInteger
+(NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+(NSInteger)hoursBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+(NSInteger)secondBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+(NSDecimalNumber*)addDuration:(NSDate*)date;

@end
