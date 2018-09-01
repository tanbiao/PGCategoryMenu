//
//  UITableView+Loading.m
//  分级菜单
//
//  Created by Apple on 2018/9/1.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "UITableView+Loading.h"
#import <UIKit/UIKit.h>

@implementation UITableView (Loading)

UIActivityIndicatorView * _indicatorView;

-(NSInteger)tableViewShowLoading:(NSString *)msg ifNecessaryForRowCount:(NSUInteger)rowCount
{
    if (rowCount == 0)
    {
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        indicatorView.hidesWhenStopped = YES;
        indicatorView.frame = self.bounds;
        [indicatorView startAnimating];
        self.backgroundView = indicatorView;
    }
    else
    {
        self.backgroundView = nil;
    }
    return rowCount;
}

- (NSInteger)tableViewDisplayMessageImage:(UIImage *)msgImage ifNecessaryForRowCount:(NSUInteger)rowCount
{
    if(!rowCount)
    {
        NSAssert(msgImage, @"异常:图片不能为空!");
        //背景视图
        UIView *bgView = [UIView new];
        bgView.frame = self.backgroundView.bounds;
        bgView.backgroundColor = [UIColor clearColor];
        self.backgroundView = bgView;
        //图片
        UIImageView *msgImageView = [[UIImageView alloc] initWithImage:msgImage];
        msgImageView.bounds = CGRectMake(0, 0, self.bounds.size.width * 0.5, self.bounds.size.width * 0.5);
        msgImageView.center = bgView.center;
        msgImageView.contentMode = UIViewContentModeScaleAspectFit;
        [bgView addSubview:msgImageView];
        
    }
    else
    {
        self.backgroundView = nil;
    }
    
    return rowCount;
}

@end
