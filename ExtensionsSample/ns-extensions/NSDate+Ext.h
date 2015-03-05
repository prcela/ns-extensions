//
//  NSDate+Ext.h
//  MdmStory
//
//  Created by Kresimir Prcela on 12/02/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(Ext)
+ (NSDate *)dateWithISO8601String:(NSString *)dateString;
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;

- (NSInteger)weekdayZeroBased;
- (NSString*)localizedStringWithTimeFormat: (NSString*)format;
- (NSString*)stringWithRFC3339Format;
@end
