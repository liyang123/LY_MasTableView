//
//  LYMasModel.h
//  LY_MasTableView
//
//  Created by ly on 16/3/4.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYMasModel : NSObject

/** 测试标题 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isExpanded;

- (instancetype)initWithDict:(NSDictionary *)dic;
+ (instancetype)masModelWithDict:(NSDictionary *)dict;
@end
