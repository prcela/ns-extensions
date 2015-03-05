//
//  NSArray.m
//  SuperSport
//
//  Created by Kresimir Prcela on 17/04/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray(Ext)

- (id) findObjectByClass:(Class)aClass
{
    for (NSObject *object in self)
	{
		if ([object isKindOfClass:aClass])
		{
			return object;
		}
	}
	return nil;
}

- (NSUInteger) indexOfObjectByClass:(Class)aClass
{
    for (NSUInteger i=0; i<self.count; i++)
	{
        if ([self[i] isKindOfClass:aClass])
        {
            return i;
        }
	}
	return NSNotFound;
}


- (NSArray*)filteredArrayMatchingFormat:(NSString *)format, ...
{
    va_list alist;
    va_start(alist, format);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:alist];
    va_end(alist);
    
    return [self filteredArrayUsingPredicate:predicate];
}


- (id)findFirstMatchingFormat:(NSString *)format, ...
{
    va_list alist;
    va_start(alist, format);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:alist];
    va_end(alist);
    
    for (NSUInteger idx=0; idx<[self count]; idx++)
    {
        id obj = self[idx];
        if ([predicate evaluateWithObject:obj])
        {
            return obj;
        }
    }
    return nil;
}

- (id) findByKey:(NSString*)key unsignedIntegerValue:(NSUInteger)value
{
    for (NSObject *obj in self)
    {
        id v = [obj valueForKey:key];
        if (v && [v unsignedIntegerValue] == value)
        {
            return obj;
        }
    }
    return nil;
}

- (id) findByKey:(NSString*)key integerValue:(NSUInteger)value
{
    for (NSObject *obj in self)
    {
        id v = [obj valueForKey:key];
        if (v && [v integerValue] == value)
        {
            return obj;
        }
    }
    return nil;
}

- (id) findByKey:(NSString*)key stringValue:(NSString*)value
{
    for (NSObject *obj in self)
    {
        id v = [obj valueForKey:key];
        if (v && [v isEqualToString:value])
        {
            return obj;
        }
    }
    return nil;
}

- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key integerValue:(NSUInteger)value
{
    for (NSUInteger idx=0; idx<[self count]; idx++)
    {
        NSObject *obj = self[idx];
        id v = [obj valueForKey:key];
        if (v && [v integerValue] == value)
        {
            return idx;
        }
    }
    return NSNotFound;
}

- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key stringValue:(NSString*)value
{
    for (NSUInteger idx=0; idx<[self count]; idx++)
    {
        NSObject *obj = self[idx];
        id v = [obj valueForKey:key];
        if (v && [v isEqualToString:value])
        {
            return idx;
        }
    }
    return NSNotFound;
}

- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key numberValue:(NSNumber*)value
{
    for (NSUInteger idx=0; idx<[self count]; idx++)
    {
        NSObject *obj = self[idx];
        id v = [obj valueForKey:key];
        if (v && [v isEqualToNumber:value])
        {
            return idx;
        }
    }
    return NSNotFound;
}


- (NSUInteger)indexOfFirstMatchingFormat:(NSString *)format, ...
{
    va_list alist;
    va_start(alist, format);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:alist];
    va_end(alist);
    
    for (NSUInteger idx=0; idx<[self count]; idx++)
    {
        id obj = self[idx];
        if ([predicate evaluateWithObject:obj])
        {
            return idx;
        }
    }
    return NSNotFound;
}



NSInteger sortDicsByInt(id id1, id id2, void *context)
{
    NSDictionary *s1 = id1;
    NSDictionary *s2 = id2;
    NSString *key = (__bridge NSString *)(context);
    NSInteger i1 = [s1[key] integerValue];
    NSInteger i2 = [s2[key] integerValue];
    
    if (i1 > i2) {
        return NSOrderedDescending;
    }
    
    if (i1 < i2) {
        return NSOrderedAscending;
    }
    return NSOrderedSame;
}

NSInteger sortDicsByString(id id1, id id2, void *context)
{
    NSDictionary *s1 = id1;
    NSDictionary *s2 = id2;
    NSString *key = (__bridge NSString *)(context);
    
    return [s1[key] compare:s2[key]];
}

- (NSArray*) sortedArrayByKey:(NSString*)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:@[sortDesc]];
}


- (NSArray*) sortedArrayByStringKey:(NSString*)key
{
    return [self sortedArrayUsingFunction:sortDicsByString context:(__bridge void *)(key)];
}

- (NSArray*) sortedArrayByIntegerKey:(NSString*)key
{
    return [self sortedArrayUsingFunction:sortDicsByInt context:(__bridge void *)(key)];
}

- (NSArray*) inGroupsOf:(NSInteger)ctPerGroup
{
    NSInteger totalCount = self.count;
    NSInteger currentIndex = 0;
    
    NSMutableArray* splitArray = [NSMutableArray array];
    
    while (currentIndex<totalCount) {
        NSRange range = NSMakeRange(currentIndex, MIN(ctPerGroup, totalCount-currentIndex));
        NSArray* subArray = [self subarrayWithRange:range];
        [splitArray addObject:subArray];
        currentIndex += ctPerGroup;
    }
    return splitArray;
}

- (NSMutableArray*)groupByKey:(NSString*)key
{
    NSMutableArray *result = [NSMutableArray new];
    for (NSDictionary *dic in self)
    {

        NSUInteger index = [result indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            NSMutableDictionary *d = obj;
            *stop = [d[key] isEqualToString:dic[key]];
            return *stop;
        }];
        
        NSMutableDictionary *resultDic;
        if (index == NSNotFound)
        {
            resultDic = [NSMutableDictionary new];
            resultDic[key] = dic[key];
            resultDic[@"grouped"] = [NSMutableArray new];
            [result addObject:resultDic];
        }
        else
        {
            resultDic = result[index];
        }
        [resultDic[@"grouped"] addObject:dic];
    }
    return result;
}

@end


@implementation NSMutableArray(Helper)

- (void)filterMatchingFormat:(NSString *)format, ...
{
    va_list alist;
    va_start(alist, format);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:format arguments:alist];
    va_end(alist);
    
    [self filterUsingPredicate:predicate];
}

- (void) sortByKey:(NSString*)key ascending:(BOOL)ascending
{
    NSSortDescriptor *sortDesc = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    [self sortUsingDescriptors:@[sortDesc]];
}


- (void) sortArrayByIntegerKey:(NSString*)key
{
    [self sortUsingFunction:sortDicsByInt context:(__bridge void *)(key)];
}

- (void) sortArrayByStringKey:(NSString*)key
{
    [self sortUsingFunction:sortDicsByString context:(__bridge void *)(key)];
}


@end