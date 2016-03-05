//
//  LYMasTableViewCell.m
//  LY_MasTableView
//
//  Created by ly on 16/3/4.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import "LYMasTableViewCell.h"
#import "LYMasModel.h"
#import "Masonry.h"
// c只需要给v传个m过来就可以，v内部怎么使用不需要让c知道
@interface LYMasTableViewCell ()
/** 图像 */
@property (nonatomic, strong) UIImageView *iconImg;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 线 */
@property (nonatomic, strong) UILabel *lineLabel;
@end

@implementation LYMasTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}
// 用懒加载的方法去初始化控件
- (UIImageView *)iconImg {
    if (!_iconImg) {
        UIImageView *img = [[UIImageView alloc] init];
        img.backgroundColor = [UIColor greenColor];
        img.layer.borderColor = [UIColor redColor].CGColor;
        img.layer.borderWidth = 1;
        img.layer.cornerRadius = 30;
        img.layer.masksToBounds = YES;
        [self.contentView addSubview:img];
        self.iconImg = img;
    }
    return _iconImg;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:15];
        label.userInteractionEnabled = YES;
        [self.contentView addSubview:label];
        label.backgroundColor = [UIColor lightGrayColor];
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [label addGestureRecognizer:tapGr];
        self.titleLabel = label;
    }
    return _titleLabel;
}
- (UILabel *)lineLabel {
    if (!_lineLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label];
        self.lineLabel = label;
    }
    return _lineLabel;
}
// 设置尺寸 （也可以在设置模型那里更新尺寸）
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(15);
//        make.top.mas_equalTo(10);
//        make.height.width.mas_equalTo(60);
//    }];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.iconImg.mas_top);
//        make.left.mas_equalTo(self.iconImg.mas_right).offset(5);
//        make.right.mas_equalTo(self.titleLabel.superview).offset(-15);
//    }];
//    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self.lineLabel.superview.mas_bottom).offset(-0.5);
//        make.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(0.5);
//    }];
//}
// 赋值
- (void)configWithModel:(LYMasModel *)model
{
    self.model = model;
    self.titleLabel.text = model.title;
    
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(10);
        make.height.width.mas_equalTo(60);
    }];
    [self.lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.lineLabel.superview.mas_bottom).offset(-0.5);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    if (model.isExpanded) {
        // 展开时候
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconImg.mas_top);
            make.left.mas_equalTo(self.iconImg.mas_right).offset(5);
            make.right.mas_equalTo(self.titleLabel.superview).offset(-15);
        }];
    }else{
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconImg.mas_top);
            make.left.mas_equalTo(self.iconImg.mas_right).offset(5);
            make.right.mas_equalTo(self.titleLabel.superview).offset(-15);
            make.height.mas_equalTo(60);
        }];
    }
}
// 返回高度
+ (CGFloat)masCellHeightWithModel:(LYMasModel *)model {
    LYMasTableViewCell *cell = [[LYMasTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    [cell configWithModel:model];
    
    [cell layoutIfNeeded];
    
    CGRect frame =  cell.titleLabel.frame;
    
    return frame.origin.y + frame.size.height + 5;
}
- (void)tapLabel:(UITapGestureRecognizer *)sender {
    self.model.isExpanded = !self.model.isExpanded;
    if (self.block) {
        self.block(self.indexPath);
    }
    // 更新模型
    [self configWithModel:self.model];
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.contentView layoutIfNeeded];
    }];
}

/*
 1、触发layoutSubviews的方法
 2、addSubview会触发layoutSubviews
 3、设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化
 4、滚动一个UIScrollView会触发layoutSubviews
 5、旋转Screen会触发父UIView上的layoutSubviews事件
 6、改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件
 */
@end
