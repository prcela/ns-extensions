//
//  ViewController.h
//  ExtensionsSample
//
//  Created by Kresimir Prcela on 05/03/15.
//  Copyright (c) 2015 100kas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

@interface Person : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSNumber *age;
@end