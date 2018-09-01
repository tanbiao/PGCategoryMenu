
//
//  CheckBoxMenuViewController.m
//  分级菜单
//
//  Created by Apple on 2018/7/29.
//  Copyright © 2018年 guang. All rights reserved.
//

#import "CheckBoxMenuViewController.h"
#import "CheckBoxItem.h"
#import "MenuItemModel.h"

@interface CheckBoxMenuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end

@implementation CheckBoxMenuViewController

static  NSString *CheckBoxCellId= @"CheckBoxItem";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInit];
}

-(void)setupInit
{
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.001, 0.001)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.alertView = self.contentView;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CheckBoxItem class]) bundle:nil]forCellReuseIdentifier:CheckBoxCellId];
    self.contentView.layer.cornerRadius = 5;
    self.contentView.layer.masksToBounds = YES;
    
    self.tableView.layer.cornerRadius = 5;
    self.tableView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (IBAction)confirm:(UIButton *)sender
{
    [self beforeDismissViewController];
}

- (IBAction)cancel:(UIButton *)sender
{
    [self beforeDismissViewController];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckBoxItem *item = [tableView dequeueReusableCellWithIdentifier:CheckBoxCellId];
    MenuItemModel *model = self.dataSource[indexPath.row];
    item.valueLabel.text = model.name;
    
    if (model.selected)
    {
        item.selectImageView.image = [UIImage imageNamed:@"checkbox_selected"];
    }
    else
    {
        item.selectImageView.image = [UIImage imageNamed:@"checkbox_normal"];
    }
    
    return item;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuItemModel *model = self.dataSource[indexPath.row];
    model.selected = !model.selected;
    [tableView reloadData];
}

@end
