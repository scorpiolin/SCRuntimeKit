//
//  ViewController.m
//  Example
//
//  Created by scorpiolin on 2017/11/11.
//  Copyright © 2017年 scorpiolin. All rights reserved.
//

#import "ViewController.h"
#import "SCClassProperty.h"
#import "SCProperty.h"
#import "SCTestObject.h"
#import "SCPropertyInspector.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (void)methodFunctions
{

}


- (void)propertyFunctons
{
    // 1. get the type of specific propety
    SCClassProperty *p = SCPropertyTypeWithKey([SCTestObject class], @"testString");
    NSLog(@"Type of property of testString is %@", [p typeName]);


}

- (void)classFunctions
{

}


@end
