//
// Created by linqin on 2017/11/10.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import "SCClassProperty.h"


@implementation SCClassProperty


- (NSString *)typeName
{
    return self.clazzName.length > 0 ? self.clazzName : self.structName;
}


@end