//
//  LYMasTableViewCell.h
//  LY_MasTableView
//
//  Created by ly on 16/3/4.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LYMasModel;
// 使用block传值，完成回调
typedef void(^cellBlock)(NSIndexPath *indexPath);

@interface LYMasTableViewCell : UITableViewCell

/** block */
@property (nonatomic, copy) cellBlock block;

/** 模型 */
@property (nonatomic, strong) LYMasModel *model;

/** 模型在数组中的位置 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/** 为控件赋值 */
- (void)configWithModel:(LYMasModel *)model;

/** 返回高度 */
+ (CGFloat)masCellHeightWithModel:(LYMasModel *)model;
@end
