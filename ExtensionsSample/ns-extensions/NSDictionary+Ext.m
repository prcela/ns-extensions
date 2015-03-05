//
//  NSDictionary+Helper.m
//  SuperSport
//
//  Created by Kresimir Prcela on 06/05/14.
//  Copyright (c) 2014 minus5. All rights reserved.
//

#import "NSDictionary+Ext.h"
#import <objc/runtime.h>

@implementation NSDictionary(Ext)

+(NSDictionary *) dictionaryWithPropertiesOfObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id value = [obj valueForKey:key];
        if (value)
        {
            [dict setObject:value forKey:key];
        }
        
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
