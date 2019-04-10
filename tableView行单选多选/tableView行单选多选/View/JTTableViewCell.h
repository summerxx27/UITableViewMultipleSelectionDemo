//
//  JTTableViewCell.h
//  tableView行单选多选
//
//  Created by 景天 on 2019/4/10.
//  Copyright © 2019年 summerxx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JTTableViewCell : UITableViewCell
/// 选中图片
@property (nonatomic, strong) UIImageView *selectedImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
