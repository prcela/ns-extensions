//
//  NSString+Ext.m
//  MdmStory
//
//  Created by Kresimir Prcela on 12/02/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "NSString+Ext.h"

@implementation NSString(Ext)

- (NSString*)convertTimeFormatFrom:(NSString*)srcFormat to:(NSString*)dstFormat
{
	NSDateFormatter *formatter = [NSDateFormatter new];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
	[formatter setDateFormat:srcFormat];
	[formatter setLocale: [NSLocale currentLocale]];
    [formatter setTimeZone:localTimeZone];
	NSDate *date = [formatter dateFromString: self];
	[formatter setDateFormat: dstFormat];
	NSString *strTimeFormatted = [formatter stringFromDate: date];
	return strTimeFormatted;
}

@end
