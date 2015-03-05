//
//  UIImage+Helper.m
//  SuperSport
//
//  Created by Kresimir Prcela on 07/05/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "UIImage+Ext.h"

@implementation UIImage(Ext)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
