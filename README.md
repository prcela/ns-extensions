# ns-extensions
Helper methods that extends interface of iOS foundation classes like are NSArray, NSDictionary, NSDate, NSNotificationCenter, UIColor, UIImage and similar.

## Installation

Copy the ns-extensions folder to your project.

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

### NSDate extension

    NSString *today = [[NSDate new] localizedStringWithTimeFormat:@"dd.MM.yyyy."];
    NSLog(@"today is %@", today);
    
    NSInteger index = [[NSDate new] weekdayZeroBased];
    NSLog(@"If monday is first, today is %ld. day in week. ", (long)index);
    
    NSString *oneDateString = @"4.3.2015.";
    NSDate *oneDate = [NSDate dateFromString:oneDateString withFormat:@"dd.MM.yyyy."];
    NSLog(@"%@ was %ld. day in week", oneDateString, [oneDate weekdayZeroBased]);
    
### NSDictionary extension

    Person *person = [Person new];
    person.name = @"Toni";
    person.age = @(5);
    
    NSDictionary *dic = [NSDictionary dictionaryWithPropertiesOfObject:person];
    NSLog(@"Dictionary with properties of person object: %@", dic);

### NSNotificationCenter extension

    // one notification function for many notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onNotification)
                                                names:@[@"notifcation1",
                                                        @"notifcation2",
                                                        @"notifcation3"]
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notifcation2"
                                                        object:nil];
