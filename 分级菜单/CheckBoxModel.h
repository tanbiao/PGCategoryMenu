//
//  CheckBoxModel.h
//  分级菜单
//
//  Created by Apple on 2018/7/29.
//  Copyright © 2018年 guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItemModel.h"

@interface CheckBoxModel : MenuItemModel

@property(nonatomic,strong) NSString *subTile;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
