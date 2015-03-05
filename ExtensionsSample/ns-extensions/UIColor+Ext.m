//
//  UIColor+Helper.m
//  SuperSport
//
//  Created by Kresimir Prcela on 04/04/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor(Ext)

+ (UIColor *)colorWithRGBA:(NSUInteger)color
{
    return [self colorWithRed:((color >> 24) & 0xFF) / 255.0f
                        green:((color >> 16) & 0xFF) / 255.0f
                         blue:((color >> 8) & 0xFF) / 255.0f
                        alpha:((color) & 0xFF) / 255.0f];
}

+ (UIColor *)colorWithR:(NSUInteger)r G:(NSUInteger)g B:(NSUInteger)b A:(NSUInteger)a
{
    return [self colorWithRed:r/255.0
                        green:g/255.0
                         blue:b/255.0
                        alpha:a/255.0];
}

@end
