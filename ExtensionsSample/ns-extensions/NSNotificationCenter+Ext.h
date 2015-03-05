//
//  NSNotificationCenter+Ext.h
//  MdmStory
//
//  Created by Kresimir Prcela on 16/12/13.
//  Copyright (c) 2013 100kas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter(Ext)

- (void)addObserver:(id)observer selector:(SEL)aSelector names:(NSArray *)names object:(id)anObject;

@end
