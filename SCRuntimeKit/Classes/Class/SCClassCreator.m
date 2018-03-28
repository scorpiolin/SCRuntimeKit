//
// Created by linqin on 2017/12/8.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import <objc/runtime.h>
#import "SCClassCreator.h"


@implementation SCClassCreator


Class SCCreateClass(const char *className, Class superclass) {
    return objc_allocateClassPair(superclass, className, 0);
}

@end