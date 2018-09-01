//
//  MenuItemModel.h
//  分级菜单
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 guang. All rights reserved.
//

#import <Foundation/Foundation.h>

//模型基类, 自定义模型继承它

@interface MenuItemModel : NSObject

/**
 标题
 */
@property(nonatomic,strong)  NSString *name;

/**
 标记是否被选择
 */
@property(nonatomic,assign)  BOOL selected;

/**
 二级菜单的数据列表
 */
@property(nonatomic,strong) NSArray <MenuItemModel *>*list;


-(instancetype)initWithName:(NSString *)name;


@end
