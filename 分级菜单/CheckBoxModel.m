//
//  CheckBoxModel.m
//  分级菜单
//
//  Created by Apple on 2018/7/29.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "CheckBoxModel.h"

@implementation CheckBoxModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.name = dict[@"name"];
        self.selected = [dict[@"selected"] boolValue];
        self.subTile = dict[@"subTitle"];
        //TODO:其他属性的赋值
    }
    return self;
}

@end
