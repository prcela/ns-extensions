//
//  NSObject+Helper.m
//  SuperSport
//
//  Created by Kresimir Prcela on 03/04/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "NSObject+Ext.h"

@implementation NSObject(Ext)

- (NSString*)stringValueVerify
{
    if ([self isKindOfClass:[NSString class]])
    {
        return (NSString*)self;
    }
    return nil;
}

- (NSNumber*)numberValueVerify
{
    if ([self isKindOfClass:[NSNumber class]])
    {
        return (NSNumber*)self;
    }
    return nil;
}

- (BOOL)boolValueVerify
{
    if ([self isKindOfClass:[NSNumber class]])
    {
        return [(NSNumber*)self boolValue];
    }
    return 0;
}


@end
