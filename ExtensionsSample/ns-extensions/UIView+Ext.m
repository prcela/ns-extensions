//
//  UIView+Ext.m
//  ExtensionsSample
//
//  Created by Kresimir Prcela on 09/03/15.
//  Copyright (c) 2015 100kas. All rights reserved.
//

#import "UIView+Ext.h"
#import <UIKit/UIGraphics.h>
#import <QuartzCore/QuartzCore.h>

@implementation UIView(Ext)

- (UIImage*) renderToImage
{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
