//
//  MenuItemModel.m
//  分级菜单
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "MenuItemModel.h"

@implementation MenuItemModel

-(instancetype)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        self.name = name;
    }
    return self;
}

@end
