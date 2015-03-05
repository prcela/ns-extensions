//
//  NSNotificationCenter+Ext.m
//  MdmStory
//
//  Created by Kresimir Prcela on 16/12/13.
//  Copyright (c) 2013 100kas. All rights reserved.
//

#import "NSNotificationCenter+Ext.h"

@implementation NSNotificationCenter(Ext)

- (void)addObserver:(id)observer selector:(SEL)aSelector names:(NSArray *)names object:(id)anObject
{
    for (NSString *name in names)
    {
        [self addObserver:observer selector:aSelector name:name object:anObject];
    }
}

@end
