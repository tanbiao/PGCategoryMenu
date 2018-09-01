//
//  PGCategoryRightTableViewCell.m
//  KillKing
//
//  Created by 江秋朋 on 2018/6/5.
//  Copyright © 2018年 叶尹. All rights reserved.
//

#import "CheckBoxItem.h"

@implementation CheckBoxItem

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}
@end
