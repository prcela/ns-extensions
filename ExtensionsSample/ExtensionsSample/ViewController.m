//
//  ViewController.m
//  ExtensionsSample
//
//  Created by Kresimir Prcela on 05/03/15.
//  Copyright (c) 2015 100kas. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Ext.h"
#import "NSDate+Ext.h"
#import "NSString+Ext.h"
#import "NSDictionary+Ext.h"
#import "NSNotificationCenter+Ext.h"
#import "UIView+Ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self arraySamples];
    [self dateSamples];
    [self dictionarySample];
    [self notificationsSample];
    [self viewSample];
}

- (void) arraySamples
{
    NSArray *sampleArray = @[@{@"name":@"Tom", @"sex":@"m", @"age":@(14)},
                             @{@"name":@"Bob", @"sex":@"m", @"age":@(10)},
                             @{@"name":@"Tom", @"sex":@"m", @"age":@(20)},
                             @{@"name":@"Ana", @"sex":@"f", @"age":@(25)}];
    
    NSArray *toms = [sampleArray filteredArrayMatchingFormat:@"name = 'Tom'"];
    NSLog(@"Toms: %@", toms);
    
    NSDictionary *firstAna = [sampleArray findFirstMatchingFormat:@"name = 'Ana'"];
    NSLog(@"First Ana: %@", firstAna);
    
    NSArray *older = [sampleArray filteredArrayMatchingFormat:@"age > 11"];
    NSLog(@"Older: %@", older);
    
    NSArray *sorted = [sampleArray sortedArrayByKey:@"age" ascending:YES];
    NSLog(@"Sorted by age: %@", sorted);
    
    NSArray *grouped = [sampleArray groupByKey:@"sex"];
    NSLog(@"Grouped by sex: %@", grouped);
    
}

- (void) dateSamples
{
    NSString *today = [[NSDate new] localizedStringWithTimeFormat:@"dd.MM.yyyy."];
    NSLog(@"today is %@", today);
    
    NSInteger index = [[NSDate new] weekdayZeroBased];
    NSLog(@"If monday is first, today is %ld. day in week. ", (long)index);
    
    NSString *oneDateString = @"4.3.2015.";
    NSDate *oneDate = [NSDate dateFromString:oneDateString withFormat:@"dd.MM.yyyy."];
    NSLog(@"%@ was %ld. day in week", oneDateString, [oneDate weekdayZeroBased]);
    
    NSString *differentFormat = [oneDateString convertTimeFormatFrom:@"dd.MM.yyyy." to:@"dd-MM-yyyy"];
    NSLog(@"Different format: %@", differentFormat);
}

- (void) dictionarySample
{
    Person *person = [Person new];
    person.name = @"Toni";
    person.age = @(5);
    
    NSDictionary *dic = [NSDictionary dictionaryWithPropertiesOfObject:person];
    NSLog(@"Dictionary with properties of person object: %@", dic);
}

- (void) notificationsSample
{
    // one notification function for many notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onNotification)
                                                names:@[@"notifcation1",
                                                        @"notifcation2",
                                                        @"notifcation3"]
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifcation2"
                                                        object:nil];
}

- (void) onNotification
{
    NSLog(@"notified.");
}

- (void) viewSample
{
    UIImage *image = [self.view renderToImage];
    NSLog(@"Rendered image size is %g x %g", image.size.width, image.size.height);
}

@end


@implementation Person

@end