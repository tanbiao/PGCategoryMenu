
//
//  RepairCauseModel.m
//  分级菜单
//
//  Created by Apple on 2018/7/29.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "RepairCauseModel.h"

@implementation Cause

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.name = dict[@"name"];
        self.selected = [dict[@"selected"] boolValue];
        self.msg = dict[@"msg"];
    }
    return self;
}

@end

@implementation RepairCauseModel

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.name = dict[@"name"];
        self.selected = [dict[@"selected"]  boolValue];
        self.subMsg = dict[@"subMsg"];
        NSArray *list = dict[@"list"];
        NSMutableArray *newList = [NSMutableArray array];
        for (NSDictionary *item in list)
        {
            Cause *cause = [[Cause alloc] initWithDictionary:item];
            [newList addObject:cause];
        }
        self.list = [newList copy];
        
        return self;
    }
    return self;
}

@end
