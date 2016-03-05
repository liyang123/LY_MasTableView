

//
//  LYMasModel.m
//  LY_MasTableView
//
//  Created by ly on 16/3/4.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYMasModel.h"

@implementation LYMasModel

+ (instancetype)masModelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.title = @"这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:这个测试用的需要很长很长...,eg:";
    }
    return self;
}
@end
