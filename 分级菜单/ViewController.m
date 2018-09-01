//
//  ViewController.m
//  分级菜单
//
//  Created by chun on 15/2/28.
//  Copyright (c) 2015年 guang. All rights reserved.
//

#import "ViewController.h"

#import "PGCategoryView.h"
#import "PGCategoryMenuController.h"
#import "RepairCauseModel.h"
#import "CheckBoxMenuViewController.h"
#import "CheckBoxModel.h"
#import "RepairCauseModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_leftTbale;
    UITableView *_rightTbale;
    UIView *_contentView;
}
@property (strong, nonatomic) PGCategoryView *categoryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _contentView = [[UIView alloc] init];
//    _contentView.frame = CGRectMake(self.view.bounds.size.width, 0,self.view.bounds.size.width, self.view.bounds.size.height);
//    _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    _contentView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_contentView];
//
//    _leftTbale = [[UITableView alloc] init];
//    _leftTbale.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
//    _leftTbale.dataSource = self;
//    _leftTbale.delegate = self;
//    _leftTbale.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    _leftTbale.showsVerticalScrollIndicator = NO;
//    _leftTbale.tableFooterView = [[UIView alloc] init];
//    [self.view insertSubview:_leftTbale belowSubview:_contentView];
//
//    _rightTbale = [[UITableView alloc] init];
//    _rightTbale.frame = CGRectMake(0, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
//    _rightTbale.dataSource = self;
//    _rightTbale.delegate = self;
//    _rightTbale.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    _rightTbale.showsVerticalScrollIndicator = NO;
//    _rightTbale.tableFooterView = [[UIView alloc] init];
//    [_contentView addSubview:_rightTbale];
//
//
//    CGRect frame = _contentView.frame;
//    frame.origin.x -= 30;
//    frame.size.width = 30;
//    _categoryView = [PGCategoryView categoryRightView:_contentView];
//    _categoryView.frame = frame;
//    [self.view addSubview:_categoryView];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self alertVC];
}

-(NSArray *)getItems
{
    NSArray *list = @[@{@"name" :@"张三1",@"subTile":@"三娃子", @"selected":@0},@{@"name" :@"李四",@"subTile":@"四娃子",@"selected":@0}];
    NSMutableArray *models = [NSMutableArray array];
    for (NSDictionary *dict in list)
    {
        CheckBoxModel *model = [[CheckBoxModel alloc] initWithDictionary:dict];
        [models addObject:model];
    }
    return [models copy];
}

-(void)alertVC
{
    PGCategoryMenuController  *vc = [[PGCategoryMenuController alloc] init];
    
    vc.dataSouceHandler = ^NSArray<__kindof MenuItemModel *> *(PGCategoryMenuController *categoryMenuController) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            categoryMenuController.dataSource = [self getDataSource];
            [categoryMenuController reloadData];
        });
      
        return  nil;
    };
    
    vc.selectBlock = ^(RepairCauseModel *item, NSArray<Cause *> *selectSubItems) {
        NSLog(@"itemMsg============%@",item.subMsg);
    };
    [self presentViewController:vc animated:true completion:nil];
}

-(void)alertVc1
{
    CheckBoxMenuViewController *checkBox = [[CheckBoxMenuViewController  alloc] init];
    checkBox.dataSource = [self getItems];
    [self presentViewController:checkBox animated:true completion:nil];
}

-(NSArray *)getDataSource
{
    NSDictionary *dict1 = @{@"name":@"第1组",@"subMsg":@"第一组描述信息",@"selected":@0, @"list":@[@{@"name" :@"张三1",@"selected":@0,@"msg":@"张三1msg"},@{@"name" :@"李四",@"selected":@0,@"msg":@"李四msg"},@{@"name" :@"张四1",@"selected":@0,@"msg":@"张四1msg"}]};
    
    RepairCauseModel *model1 = [[RepairCauseModel alloc] initWithDictionary:dict1];
    
    NSDictionary *dict2 = @{@"name":@"第2组",@"subMsg":@"第二组描述信息",@"selected":@0,@"list":@[@{@"name" :@"张三2",@"selected":@0,@"msg":@"张四1msg"},@{@"name" :@"李四",@"selected":@0,@"msg":@"张四1msg"},@{@"name" :@"张四",@"selected":@0,@"msg":@"张四1msg"}]};
     RepairCauseModel *model2 = [[RepairCauseModel alloc] initWithDictionary:dict2];
    
    NSDictionary *dict3 = @{@"name":@"第3组",@"subMsg":@"第三组描述信息",@"selected":@0,@"list":@[@{@"name" :@"张三3",@"selected":@0,@"msg":@"张四1msg"},@{@"name" :@"李四",@"selected":@0,@"msg":@"张四1msg"},@{@"name" :@"张四",@"selected":@0,@"msg":@"张四1msg"}]};
    
     RepairCauseModel *model3 = [[RepairCauseModel alloc] initWithDictionary:dict3];
    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:model1];
    [array addObject:model2];
    [array addObject:model3];
    return [array copy];
}
//
//#pragma mark - 数据源方法
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    if (tableView == _leftTbale)
//    {
//        return 5;
//    }
//    else
//    {
//        return 10;
//    }
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (tableView == _leftTbale)
//    {
//        static NSString *CellIdentifier = @"Cell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//        if (cell == nil)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        }
//        cell.textLabel.text = @"left";
//        return cell;
//    }
//    else
//    {
//        static NSString *CellIdentifier2 = @"Cell2";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
//        if (cell == nil)
//        {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier2];
//        }
//        cell.textLabel.text = @"right";
//        return cell;
//    }
//}
//
//#pragma mark - tableView 代理方法
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    if (tableView == _leftTbale)
//    {
//        [_categoryView show];
//    }
//    else
//    {
//      NSLog(@"tap right tableview index:%ld",(long)indexPath.row);
//    }
//
//}

@end

