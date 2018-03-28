//
// Created by linqin on 2017/12/8.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SCClassCreator : NSObject

/**
 * create class
 * @param className  the name of class
 * @param superclass super's class
 * @return the created class
 */
Class SCCreateClass(const char *className, Class superclass);


@end