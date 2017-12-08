//
// Created by linqin on 2017/11/10.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SCClassProperty : NSObject

@property(nonatomic, copy) NSString *clazzName;
@property(nonatomic, copy) NSString *structName;

/**
 *
 * @return class name or struct name of the property
 */
- (NSString *)typeName;

@end