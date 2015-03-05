//
//  UIColor+Helper.h
//  SuperSport
//
//  Created by Kresimir Prcela on 04/04/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>

@interface UIColor(Ext)

+ (UIColor *)colorWithRGBA:(NSUInteger)color;
+ (UIColor *)colorWithR:(NSUInteger)r G:(NSUInteger)g B:(NSUInteger)b A:(NSUInteger)a;

@end
