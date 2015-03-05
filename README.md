# ns-extensions
Helper methods that extends interface of NSObject classes.

### NSArray extension

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
