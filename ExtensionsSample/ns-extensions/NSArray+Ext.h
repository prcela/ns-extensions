//
//  NSArray.h
//  SuperSport
//
//  Created by Kresimir Prcela on 17/04/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Ext)

- (NSUInteger) indexOfObjectByClass:(Class)aClass;
- (id) findObjectByClass:(Class)aClass;
- (NSArray*)filteredArrayMatchingFormat:(NSString *)format, ...;
- (id) findFirstMatchingFormat:(NSString*)format,...;
- (id) findByKey:(NSString*)key unsignedIntegerValue:(NSUInteger)value;
- (id) findByKey:(NSString*)key integerValue:(NSUInteger)value;
- (id) findByKey:(NSString*)key stringValue:(NSString*)value;
- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key integerValue:(NSUInteger)value;
- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key stringValue:(NSString*)value;
- (NSUInteger) indexOfFirstMatchingKey:(NSString*)key numberValue:(NSNumber*)value;
- (NSUInteger)indexOfFirstMatchingFormat:(NSString *)format, ...;
- (NSArray*) sortedArrayByKey:(NSString*)key ascending:(BOOL)ascending;
- (NSArray*) sortedArrayByIntegerKey:(NSString*)key;
- (NSArray*) sortedArrayByStringKey:(NSString*)key;
- (NSArray*) inGroupsOf:(NSInteger)ctPerGroup;
- (NSMutableArray*)groupByKey:(NSString*)key;
@end

@interface NSMutableArray(Helper)

- (void) filterMatchingFormat:(NSString *)format, ...;
- (void) sortByKey:(NSString*)key ascending:(BOOL)ascending;
- (void) sortArrayByIntegerKey:(NSString*)key;
- (void) sortArrayByStringKey:(NSString*)key;

@end