//
//  ODDateUtil.h
//  ostalgo
//
//  Created by Olivier Demolliens on 30/04/11.
//  Copyright 2010 company. All rights reserved.
//

#import "ODDateUtil.h"


@implementation ODDateUtil


/* General Method */

+(NSDate*)getDateFromString:(NSString*)dateString
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; 
    
    return [dateFormatter dateFromString:dateString];
}


+(NSDate*)getDateFromStringNoTime:(NSString*)dateString
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-DD"];
    return [dateFormatter dateFromString:dateString];
}

+(NSDate*)getDateToMidnight:(NSDate*)date
{
	
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"yyyy-d-M";
	
	NSString* formattedTime = [formatter stringFromDate:date];
    
    NSDate *finalDate = [formatter dateFromString:formattedTime];
    [formatter release];
	return finalDate;
}


+(NSString*)getDate:(NSDate*)date withParams:(NSString*)strFormattedDate
{
    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
	dateFormatter.dateFormat = strFormattedDate;
    
    
	NSString *dateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	return dateString;
}

/*
 Get the string of the date and the time, used for the request at the server
 */

+(NSString*)getDateToString:(NSDate*)date
{
	return [[date description]substringToIndex:NUMBERDATEANDTIME];
}

/*
 Get the string of the date, used for the request at the server
 */

+(NSString*)getOnlyDateToString:(NSDate*)date
{
	return [[date description]substringToIndex:NUMBERDATE];
}

/*
 Get the nextDay
 */

+(NSDate*)getNextDay:(NSDate*)date
{
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	components.day = 1;
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	
	return newDate;
}

+(NSDate*)addAtThisDate:(NSDate*)date day:(NSInteger)numberOfDay
{
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	components.day = (int)numberOfDay;
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	
	return newDate;
}

/*
 Get the previousDay
 */

+(NSDate*)getPreviousDay:(NSDate*)date
{
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	components.day = -1;
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	
	return newDate;
}

/*
 Get the nextDay in string
 */

+(NSString*)getNextDayString:(NSDate*)date
{
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	components.day = 1;
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"d MMM"];
	
	NSString *newDateString = [outputFormatter stringFromDate:newDate];
	[outputFormatter release];
	
	return newDateString;
}

/*
 Get the previousDay in string
 */

+(NSString*)getPreviousDayString:(NSDate*)date
{
	NSDateComponents *components = [[[NSDateComponents alloc] init] autorelease];
	components.day = -1;
	NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
	
	NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
	[outputFormatter setDateFormat:@"d MMM"];
	
	NSString *newDateString = [outputFormatter stringFromDate:newDate];
	[outputFormatter release];
	
	return newDateString;
}


/*
 Get the classic format of a date (format : lundi 18 octobre 2010)
 */

+(NSString*)getFormatDateLiteral:(NSDate*)date
{
	
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
	[dateFormatter setDateStyle:NSDateFormatterFullStyle];
	NSString *dateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	return dateString;
}

+(NSString*)getFormatDate:(NSDate*)date
{
	
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	NSString *dateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	return dateString;
}


+(NSString*)getHoursDate:(NSDate*)date
{
	
	NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"HH-mm";
	
	NSString* formattedTime = [formatter stringFromDate:date];
	return [formattedTime autorelease];
}


/*
 Get the string of a date (format : 13:45)
 */

+(NSString*)getTimeDate:(NSDate*)date
{
    
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
	[dateFormatter setTimeStyle:kCFDateFormatterShortStyle];
	NSString *dateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	return dateString;
}

/*
 Get the string of a date and the time (format : lundi 18 octobre 2010 13h40)
 */

+(NSString*)getTimeAndDate:(NSDate*)date
{
	NSDateFormatter *dateFormatter= [[NSDateFormatter alloc]init];
	[dateFormatter setTimeStyle:kCFDateFormatterShortStyle];
	[dateFormatter setDateStyle:NSDateFormatterFullStyle];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
	NSString *dateString = [dateFormatter stringFromDate:date];
	[dateFormatter release];
	
	return dateString;
}

+(NSDate*)dateWithoutGmtUser:(NSDate*)date
{
    NSTimeZone* sourceTimeZone = [NSTimeZone systemTimeZone];
    NSTimeZone* destinationTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"+0000"];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:date];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:date];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* destinationDate = [[[NSDate alloc] initWithTimeInterval:interval sinceDate:date] autorelease];
	return destinationDate;
}

+(NSDate*)dateWithGmtUser:(NSDate*)date
{
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"+0000"];
    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:date];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:date];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    NSDate* destinationDate = [[[NSDate alloc] initWithTimeInterval:interval sinceDate:date] autorelease];
    
    return destinationDate;
}


+(NSDate*)getDateDuration:(NSInteger)value
{
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setMinute:value];
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDate *date = [gregorian dateFromComponents:comps];
	[comps release];
    [gregorian release];
	return date;
}

+(NSString*)getHourFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"HH";
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(NSString*)getDayFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"DD";
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(NSString*)getYearFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"yyyy";
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(NSString*)getMonthFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"M";
    
    NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(NSString*)getSecondFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Minute
	formatter.dateFormat = @"ss";
	NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(NSString*)getMinuteFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Minute
	formatter.dateFormat = @"mm";
	NSString *value = [formatter stringFromDate:date];
    [formatter release];
	return value;
}

+(int)getIntHourFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"HH";
    
    int value = [[formatter stringFromDate:date]intValue];
    [formatter release];
	return value;
}

+(int)getIntMinuteFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Minute
	formatter.dateFormat = @"mm";
    int value = [[formatter stringFromDate:date]intValue];
    [formatter release];
	return value;
}

+(NSString*)getHourAndMinuteFromDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    
    //Hour
	formatter.dateFormat = @"HH";
    
    NSString *hour = [formatter stringFromDate:date];
    
    //Minute
	formatter.dateFormat = @"mm";
	NSString *minute = [formatter stringFromDate:date];
    
    [formatter release];
	return [NSString stringWithFormat:@"%@:%@",hour,minute];
}


/*
 Convert a quantity of second in this format (15 h 5 min)
 */

+(NSString*)getSecondToTime:(int)second
{
	NSString *time;
	
	time = [NSString stringWithFormat:@"%i h %i min",(second/60/60), (second/60) - (second/60/60)*60];
	
	return time;
}


+(BOOL)date:(NSDate*)date isBetweenDate:(NSDate*)beginDate andDate:(NSDate*)endDate
{
    if ([date compare:beginDate] == NSOrderedAscending)
        return NO;
	
    if ([date compare:endDate] == NSOrderedDescending) 
        return NO;
	
    return YES;
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

+ (NSInteger)hoursBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSHourCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSHourCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSHourCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference hour];
}


+(BOOL)day:(NSDate*)date1 isLaterThanOrEqualTo:(NSDate*)date2 {
	return !([date1 compare:date2] == NSOrderedAscending);
}


+(NSString*)getDuration:(NSInteger)value
{
	NSDateComponents *comps = [[NSDateComponents alloc] init];
	[comps setMinute:value];
	NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDate *date = [gregorian dateFromComponents:comps];
	[comps release];
    [gregorian release];
	return [ODDateUtil getTimeDate:date];
}

+(NSDecimalNumber*)addDuration:(NSDate*)date
{
	NSCalendar *gregorian =[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *comps = [gregorian components:( NSHourCalendarUnit |  NSMinuteCalendarUnit) fromDate:date];
	
	NSDecimalNumber *newDuration = (NSDecimalNumber*)[NSDecimalNumber numberWithFloat:(comps.hour*60 + comps.minute)];
	[gregorian release];
    return newDuration;
}

@end
