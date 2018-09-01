//
//  UITableView+Loading.h
//  分级菜单
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Loading)

-(NSInteger)tableViewShowLoading:(NSString *)msg ifNecessaryForRowCount:(NSUInteger)rowCount;

@end
