//
//  ViewController.m
//  ExtensionsSample
//
//  Created by Kresimir Prcela on 05/03/15.
//  Copyright (c) 2015 100kas. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Ext.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self arraySamples];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
