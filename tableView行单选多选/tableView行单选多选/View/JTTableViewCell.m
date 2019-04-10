//
//  JTTableViewCell.m
//  tableView行单选多选
//
//  Created by 景天 on 2019/4/10.
//  Copyright © 2019年 summerxx. All rights reserved.
//

#import "JTTableViewCell.h"

@implementation JTTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.selectedImageView = [[UIImageView alloc] init];
        self.selectedImageView.frame = CGRectMake(16, 22, 16, 16);
        [self.contentView addSubview:self.selectedImageView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.frame = CGRectMake(79, 21, 100, 17);
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    if (selected) {
        _selectedImageView.image = [UIImage imageNamed:@"checkmark_round_blueBg"];
    }else {
        _selectedImageView.image = [UIImage imageNamed:@"checkmark_onlyCircle_gray"];
    }

    // Configure the view for the selected state
}


@end
