//
//  NSObject+Property.h
//  UITextView
//
//  Created by 李阳 on 23/7/2017.
//  Copyright © 2017 qms. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - TypeEnsure
@interface NSObject (TypeEnsure)

+ (void)typeList;
+ (NSString *)getPropertyType:(NSString *)property;

@end
