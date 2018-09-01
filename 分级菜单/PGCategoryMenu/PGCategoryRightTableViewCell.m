//
//  PGCategoryRightTableViewCell.m
//  KillKing
//
//  Created by 江秋朋 on 2018/6/5.
//  Copyright © 2018年 叶尹. All rights reserved.
//

#import "PGCategoryRightTableViewCell.h"

@implementation PGCategoryRightTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (IBAction)selectBtnClick:(UIButton *)sender
{

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setModel:(MenuItemModel *)model
{
    _model = model;
    
    self.valueLabel.text = model.name;
    if (model.selected)
    {
        self.selectImageView.image = [UIImage imageNamed:@"checkbox_selected"];
    }
    else
    {
        self.selectImageView.image = [UIImage imageNamed:@"checkbox_normal"];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}
@end
