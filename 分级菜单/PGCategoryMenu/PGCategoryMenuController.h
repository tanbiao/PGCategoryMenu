//
//  PGCategoryMenuController.h
//  分级菜单
//
//  Created by Apple on 2018/7/28.
//  Copyright © 2018年 guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShadeViewController.h"
#import "MenuItemModel.h"


typedef enum : NSUInteger
{
    //单选
    singleSelectionStyle = 0,

    //多选
    multipleSelectionStyle = 1,
    
} SectionStyle;

@interface PGCategoryMenuController : ShadeViewController

/**
 主菜单的多选与单选设置
 */
@property(nonatomic,assign) SectionStyle mainTypeSectionStyle;

/**
 子菜单的多选与单选设置
 */
@property(nonatomic,assign) SectionStyle subTypeSectionStyle;

/**
 展示以及菜单的列表
 */
@property(nonatomic,strong,readonly) UITableView *mainTableView;

/**
 展示二级菜单的列表
 */
@property(nonatomic,strong,readonly) UITableView *subTableView;

/**
 数据源, 数据不需要网络请求的情况
 */
@property(nonatomic,strong) NSArray <__kindof MenuItemModel *>*dataSource;

/**
 网络请求数据时,数据已经准备好时都可以用此block 处理
 */
@property(nonatomic,strong) NSArray <__kindof MenuItemModel *>*(^dataSouceHandler)(PGCategoryMenuController *categoryMenuController);

/**
 item 选中一级菜单的模型, selectSubItems 选中一级菜单下的二级菜单模型
 */
@property(nonatomic,strong) void(^selectBlock)(__kindof MenuItemModel *item,NSArray <__kindof MenuItemModel *>*selectSubItems);

/**
 刷新数据
 */
-(void)reloadData;

@end
