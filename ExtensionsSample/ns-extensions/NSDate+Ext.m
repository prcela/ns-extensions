//
//  NSDate+Ext.m
//  MdmStory
//
//  Created by Kresimir Prcela on 12/02/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "NSDate+Ext.h"

@implementation NSDate(Ext)

+ (NSDate *)dateWithISO8601String:(NSString *)dateString
{
    if (!dateString) return nil;
    if ([dateString hasSuffix:@"Z"])
    {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }
    
    static NSDateFormatter *_isoFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _isoFormatter = [NSDateFormatter new];
        [_isoFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    });

    NSDate *date = [_isoFormatter dateFromString:dateString];
    return date;
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat
{
    static NSDateFormatter *_dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dateFormatter = [NSDateFormatter new];
    });
    
    [_dateFormatter setDateFormat:dateFormat];
    NSDate *date = [_dateFormatter dateFromString:dateString];
    return date;
}

- (NSInteger)weekdayZeroBased
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * comp = [calendar components:NSWeekdayCalendarUnit fromDate:self];
    return ((comp.weekday + 5) % 7); //switch from sun to mon as the first week day
}



-(NSString*)localizedStringWithTimeFormat: (NSString*)format
{
	NSDateFormatter *formatter = [NSDateFormatter new];
	[formatter setDateFormat: format];
	[formatter setLocale: [NSLocale currentLocale]];
	[formatter setTimeZone: [NSTimeZone localTimeZone]];
	NSString *strTimeFormatted = [formatter stringFromDate: self];
	return strTimeFormatted;
}

- (NSString*)stringWithRFC3339Format
{
    return [self localizedStringWithTimeFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
}




@end
