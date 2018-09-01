//
//  PGCategoryMenuController.m
//  分级菜单
//
//  Created by Apple on 2018/7/28.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "PGCategoryMenuController.h"
#import "PGCategoryView.h"
#import "PGCategoryRightTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UITableView+Loading.h"

#define MARGIN_TOP  140
#define BOOTOMBAR_HEIGHT 50

@interface PGCategoryMenuController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *rightTable;

@property(nonatomic,strong) UITableView *leftTable;

@property(nonatomic,strong) UIView *contentView;

@property (strong,nonatomic) PGCategoryView *categoryView;

@property(nonatomic,strong) NSArray *rightDataSource;

@property(nonatomic,strong)  UILabel *headerLabel;

@property(nonatomic,strong) UIView *bottomBar;

@property(nonatomic,strong) NSIndexPath *preIndexPath;

@end

@implementation PGCategoryMenuController

static NSString *rightTableCellId = @"rightTableCell";

static NSString *leftTableCellId = @"leftTableCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInit];
    
}

-(void)setupInit
{
    [self.view addSubview:self.headerLabel];
    [self.view addSubview:self.bottomBar];
    self.view.backgroundColor = [UIColor grayColor];
    self.alertView = self.contentView;
    [self.view addSubview:self.contentView];
    [self.view insertSubview:self.leftTable belowSubview:self.contentView];
    [self.contentView addSubview:self.rightTable];
    [self.view addSubview:self.categoryView];
    
    //注册rightcell
    [self.rightTable registerNib:[UINib nibWithNibName:@"PGCategoryRightTableViewCell" bundle:nil] forCellReuseIdentifier:rightTableCellId];
    
    [self.leftTable registerNib:[UINib nibWithNibName:@"PGCategoryRightTableViewCell" bundle:nil] forCellReuseIdentifier:leftTableCellId];
}


#pragma mark - Lazy

-(UIView *)contentView
{
    if (!_contentView)
    {
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake(self.view.bounds.size.width, CGRectGetMaxY(self.headerLabel.frame),self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.headerLabel.frame) - self.bottomBar.frame.size.height);
        _contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    }
    return _contentView;
}

-(UILabel *)headerLabel
{
    if (!_headerLabel)
    {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.textAlignment = NSTextAlignmentCenter;
        _headerLabel.backgroundColor = [UIColor greenColor];
        _headerLabel.textColor = [UIColor whiteColor];
        _headerLabel.frame = CGRectMake(0, MARGIN_TOP, UIScreen.mainScreen.bounds.size.width, BOOTOMBAR_HEIGHT);
        _headerLabel.text = @"请选择你所需要选择的数据(可多选)";
    }
    return _headerLabel;
}

-(UITableView *)leftTable
{
    if (!_leftTable)
    {
        _leftTable = [[UITableView alloc] init];
        _leftTable.frame = CGRectMake(0, CGRectGetMaxY(self.headerLabel.frame), self.view.bounds.size.width, self.view.bounds.size.height - CGRectGetMaxY(self.headerLabel.frame) - self.bottomBar.frame.size.height);
        _leftTable.dataSource = self;
        _leftTable.delegate = self;
        _leftTable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _leftTable.showsVerticalScrollIndicator = NO;
        _leftTable.tableFooterView = [[UIView alloc] init];
    }
    return _leftTable;
}

-(UITableView *)rightTable
{
    if (!_rightTable)
    {
        _rightTable = [[UITableView alloc] init];
        _rightTable.frame = CGRectMake(0, 0, _contentView.bounds.size.width, _contentView.bounds.size.height);
        _rightTable.dataSource = self;
        _rightTable.delegate = self;
        _rightTable.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _rightTable.showsVerticalScrollIndicator = NO;
        _rightTable.tableFooterView = [[UIView alloc] init];
    }
    return _rightTable;
}

-(PGCategoryView *)categoryView
{
    if (!_categoryView)
    {
        CGRect frame = _contentView.frame;
        frame.origin.x -= 30;
        frame.size.width = 30;
        _categoryView = [PGCategoryView categoryRightView:self.contentView];
        _categoryView.frame = frame;
    }
    return _categoryView;
}

-(NSArray<MenuItemModel *> *)dataSource
{
    if (!_dataSource)
    {
        if (self.dataSouceHandler)
        {
            _dataSource = self.dataSouceHandler(self);
        }
    }
    return _dataSource;
}

-(NSArray *)rightDataSource
{
    if (!_rightDataSource)
    {
        _rightDataSource = self.dataSource.firstObject.list;
    }
    return _rightDataSource;
}

-(UIView *)bottomBar
{
    if (!_bottomBar)
    {
        _bottomBar = [[UIView alloc] init];
        _bottomBar.frame = CGRectMake(0,UIScreen.mainScreen.bounds.size.height - 50, UIScreen.mainScreen.bounds.size.width, BOOTOMBAR_HEIGHT);
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancelBtn.backgroundColor = [UIColor greenColor];
        [cancelBtn sizeToFit];
        cancelBtn.frame = CGRectMake(0, 0, _bottomBar.frame.size.width * 0.5,_bottomBar.frame.size.height);
        [cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchDown];
        [_bottomBar addSubview:cancelBtn];
        
        UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [confirmBtn sizeToFit];
        confirmBtn.backgroundColor = [UIColor greenColor];
        confirmBtn.frame = CGRectMake(_bottomBar.frame.size.width * 0.5, 0, _bottomBar.frame.size.width * 0.5,_bottomBar.frame.size.height);
        [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [confirmBtn addTarget:self action:@selector(confirm) forControlEvents:UIControlEventTouchDown];
        [_bottomBar addSubview:confirmBtn];
        
    }
    return _bottomBar;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //得到任意的触摸对象
    UITouch *touch = [touches anyObject];
    //得到触摸点
    CGPoint location = [touch locationInView:self.view];
    //对AlertView进行坐标转换
    CGRect rect = CGRectMake(0, MARGIN_TOP, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height - MARGIN_TOP - self.bottomBar.bounds.size.height);
    //判断点是否在AlertView外
    if(!CGRectContainsPoint(rect, location))
    {
        //点击在AlertView外就消失
        [self beforeDismissViewController];
    }
}

-(void)cancel
{
    [self beforeDismissViewController];
}

-(void)confirm
{
    NSArray *sunItems = [self getSubTypeModel];
    
    if (sunItems.count == 0)
    {
        NSLog(@"请选择....");
        return;
    }
    
    if (self.selectBlock)
    {
        self.selectBlock([self getTpyeModel], [self getSubTypeModel]);
    }
}

-(MenuItemModel *)getTpyeModel
{
    MenuItemModel *result;
    for (MenuItemModel *model in self.dataSource)
    {
        if (model.selected == YES)
        {
            result = model;
            break;
        }
    }
    return result;
}

-(NSArray <MenuItemModel *>*)getSubTypeModel
{
    NSMutableArray *typeModels = [NSMutableArray array];
    
    if (![self getTpyeModel])
    {
        return typeModels;
    }
    else
    {
        for (MenuItemModel *subItem in [self getTpyeModel].list)
        {
            if (subItem.selected == YES)
            {
                [typeModels addObject:subItem];
            }
        }
    }
    return typeModels;
}

#pragma mark - 提供给外部的接口

-(void)reloadData
{
    [self.rightTable reloadData];
    [self.leftTable reloadData];
}

-(UITableView *)mainTableView
{
    return self.rightTable;
}

-(UITableView *)subTableView
{
    return self.leftTable;
}

#pragma mark - UITableViewDataSource  && UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.leftTable)
    {
        return [tableView tableViewShowLoading:@"" ifNecessaryForRowCount:self.dataSource.count];
    }
    else
    {
        return [tableView tableViewShowLoading:@"" ifNecessaryForRowCount:self.rightDataSource.count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTable)
    {
        PGCategoryRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftTableCellId];
        MenuItemModel *model = self.dataSource[indexPath.row];
        cell.model = model;
        return cell;
    }
    else
    {
        PGCategoryRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightTableCellId];
        MenuItemModel *cause = self.rightDataSource[indexPath.row];
        cell.valueLabel.text = cause.name;
        if (cause.selected)
        {
            cell.selectImageView.image = [UIImage imageNamed:@"checkbox_selected"];
        }
        else
        {
            cell.selectImageView.image = [UIImage imageNamed:@"checkbox_normal"];
        }

        return cell;
    }
}

#pragma mark - tableView 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == _leftTable)
    {
        if (self.preIndexPath.row == indexPath.row)
        {
            [self clearSubType];
        }
        else
        {
            [self clear];
        }
        
        MenuItemModel *model = self.dataSource[indexPath.row];
        model.selected = !model.selected;
        self.rightDataSource = model.list;
        [_categoryView show];
        [self.leftTable reloadData];
        [self.rightTable reloadData];
        self.preIndexPath = indexPath;
    }
    else
    {
        NSLog(@"tap right tableview index:%ld",(long)indexPath.row);
    }
    
    if (tableView == _rightTable)
    {
        MenuItemModel *subItem = self.rightDataSource[indexPath.row];
        subItem.selected = !subItem.selected;
        [self.rightTable reloadData];
    }
}

-(void)clear
{
    for (MenuItemModel *model in self.dataSource)
    {
        model.selected = NO;
        for (MenuItemModel *subItem in model.list)
        {
            subItem.selected = NO;
        }
    }
}

-(void)clearSubType
{
    MenuItemModel *model = self.dataSource[self.preIndexPath.row];
    
    for (MenuItemModel *subItem in model.list)
    {
        subItem.selected = false;
    }
}


@end
