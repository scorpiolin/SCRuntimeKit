//
// Created by linqin on 2017/11/11.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SCClassProperty;

@interface SCPropertyInspector : NSObject

/**
 *
 * @param clazz
 * @param propertyName
 * @return
 */
SCClassProperty *SCPropertyTypeWithKey(Class clazz, NSString *propertyKey);

/**
 *
 * @param clazz
 * @param propertyKeyPath
 * @return
 */
SCClassProperty *SCPropertyTypeWithKeyPath(Class clazz, NSString *propertyKeyPath);


@end