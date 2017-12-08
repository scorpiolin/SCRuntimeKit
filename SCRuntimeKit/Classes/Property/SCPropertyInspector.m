//
// Created by linqin on 2017/11/11.
//
// Copyright (c) 2017  Didi.Inc. All rights reserved.
//

#import "SCPropertyInspector.h"
#import "SCClassProperty.h"
#import <objc/runtime.h>


@implementation SCPropertyInspector

static SCClassProperty *__propertyTypeWithKey(Class clazz, NSString *propertyKey)
{
    if(!clazz || !propertyKey) return nil;

    unsigned int propertyCount;
    NSScanner *scanner = nil;
    SCClassProperty *retProperty;
    NSString *propertyType = nil;
    objc_property_t *properties = class_copyPropertyList(clazz, &propertyCount);
    for(unsigned int i = 0; i < propertyCount; i++){
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        if([propertyKey isEqualToString:[NSString stringWithCString:propertyName]]){
            retProperty = [SCClassProperty new];
            const char *attrs = property_getAttributes(property);
            NSString *propertyAttributes = @(attrs);
            if([propertyAttributes hasPrefix:@"TB,"]){
                retProperty.structName = @"BOOL";
            }

            scanner = [NSScanner scannerWithString:propertyAttributes];
            [scanner scanUpToString:@"T" intoString:nil];
            [scanner scanString:@"T" intoString:nil];
            if([scanner scanString:@"@\"" intoString:&propertyType]){
                [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@"\"<"]
                                        intoString:&propertyType];
                retProperty.clazzName = propertyType;
            } else if([scanner scanString:@"^{" intoString:&propertyType]){
                [scanner scanCharactersFromSet:[NSCharacterSet alphanumericCharacterSet]
                                    intoString:&propertyType];

                retProperty.structName = propertyType;

            }
        }
    }
    return retProperty;
}

SCClassProperty *SCPropertyTypeWithKey(Class clazz, NSString *propertyKey)
{
    if(!clazz || !propertyKey) return nil;
    SCClassProperty *property = __propertyTypeWithKey(clazz, propertyKey);

    if(!property && class_getSuperclass(clazz) != NULL){
        property = SCPropertyTypeWithKey(class_getSuperclass(clazz), propertyKey);
    }

    return property;
}

SCClassProperty *SCPropertyTypeWithKeyPath(Class clazz, NSString *propertyKeyPath)
{
    if(!clazz || !propertyKeyPath) return nil;

    NSArray *propertyKeyArray = [propertyKeyPath componentsSeparatedByString:@"."];
    if(propertyKeyArray.count < 1){
        return nil;
    }
    if(propertyKeyArray.count == 1){
        return SCPropertyTypeWithKey(clazz, propertyKeyPath);
    } else {
        NSString *firstPart = propertyKeyArray[0];
        Class childClazz = NSClassFromString(SCPropertyTypeWithKey(clazz, firstPart).clazzName);
        if(childClazz != NULL){
            return SCPropertyTypeWithKeyPath(childClazz, [propertyKeyPath substringFromIndex:firstPart.length + 1]);
        } else {
            return nil;
        }
    }

}


@end