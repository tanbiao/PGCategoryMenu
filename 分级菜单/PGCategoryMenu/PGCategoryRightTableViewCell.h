//
//  PGCategoryRightTableViewCell.h
//  KillKing
//
//  Created by 江秋朋 on 2018/6/5.
//  Copyright © 2018年 叶尹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItemModel.h"

@interface PGCategoryRightTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *selectImageView;

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@property(nonatomic,copy) void(^SelectBlock)(NSString *selectString);

@property(nonatomic , assign) BOOL selectBool;

@property(nonatomic,strong) MenuItemModel *model;

@end
