//
// Created by linqin on 2017/12/8.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import "SCMethodUtils.h"


@implementation SCMethodUtils

void *SCInvokeGetter(id target, SEL getter)
{
    if(!target || !getter) return nil;
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:getter];
    if(!methodSignature){
        NSLog(@"method signature of getter [%@] can not be null!", NSStringFromSelector(getter));
        return nil;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    NSMutableData *retValue = [[NSMutableData alloc] initWithLength:methodSignature.methodReturnLength];
    [invocation setTarget:target];
    [invocation setSelector:getter];
    [invocation invoke];
    [invocation getReturnValue:retValue.mutableBytes];
    return retValue.mutableBytes;
}


void SCInvokeSetter(id target, SEL setter, void *__nonnull value)
{
    if(!target || !setter || !value) return;
    NSMethodSignature *methodSignature = [target methodSignatureForSelector:setter];
    if(!methodSignature){
        NSLog(@"method signature of setter [%@] can not be null!", NSStringFromSelector(setter));
        return;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:target];
    [invocation setSelector:setter];
    [invocation setArgument:value atIndex:2];
    [invocation invoke];
}

@end