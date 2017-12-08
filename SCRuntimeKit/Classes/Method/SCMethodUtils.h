//
// Created by linqin on 2017/12/8.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SCMethodUtils : NSObject

/**
 *
 * @param target
 * @param getter
 * @return value buffer
 */
void *SCInvokeGetter(id target, SEL getter);

/**
 *
 * @param target
 * @param setter
 * @param value
 * @return
 */
void SCInvokeSetter(id target, SEL setter, void *__nonnull value);

@end