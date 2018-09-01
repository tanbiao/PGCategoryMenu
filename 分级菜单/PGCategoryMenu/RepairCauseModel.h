//
//  RepairCauseModel.h
//  分级菜单
//
//  Created by Apple on 2018/7/29.
//  Copyright © 2018年 guang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuItemModel.h"

@interface Cause :MenuItemModel

@property(nonatomic,strong) NSString *msg;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end

@interface RepairCauseModel : MenuItemModel

@property(nonatomic,strong) NSString *subMsg;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

@end



