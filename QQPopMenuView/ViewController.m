//
//  ViewController.m
//  QQPopMenuView
//
//  Created by ec on 2016/11/15.
//  Copyright © 2016年 Code Geass. All rights reserved.
//

#import "ViewController.h"
#import "QQPopMenuView.h"
#import "PopTableViewCell.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *titleArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initUI];
}
#pragma mark - UI
-(void)initUI
{
    titleArray = @[NSLocalizedString(@"普通推送", nil),
                   NSLocalizedString(@"普通推送,自定义提示音", nil),
                   NSLocalizedString(@"图像推送", nil),
                   NSLocalizedString(@"图像推送,自定义提示音", nil),
                   NSLocalizedString(@"图像推送,下载方式", nil),
                   NSLocalizedString(@"图像推送,下载方式,自定义提示音", nil),
                   NSLocalizedString(@"视频推送", nil),
                   NSLocalizedString(@"视频推送,自定义提示音", nil),
                   NSLocalizedString(@"视频推送,下载方式", nil),
                   NSLocalizedString(@"视频推送,下载方式,自定义提示音", nil),
                   NSLocalizedString(@"定时推送", nil),
                   NSLocalizedString(@"定时推送,自定义提示音", nil),
                   NSLocalizedString(@"指定时间", nil),
                   NSLocalizedString(@"指定时间,自定义提示音",nil),
                   NSLocalizedString(@"定时推送,字典方式", nil),
                   NSLocalizedString(@"定时推送,字典方式,自定义提示音", nil),
                   NSLocalizedString(@"交互推送", nil),
                   NSLocalizedString(@"交互推送,自定义提示音", nil),
                   NSLocalizedString(@"定点推送", nil),
                   NSLocalizedString(@"定点推送,自定义提示音", nil),
                   ];
    
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.scrollEnabled = YES;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height));
        make.left.equalTo(self.view).with.offset(0);
        make.top.equalTo(self.view).with.offset(64);
    }];
}

#pragma mark - <UITableViewDataSource,UITableViewDelegate>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 4;
    }else if (section == 2){
        return 4;
    }else if (section == 3){
        return 6;
    }else if (section == 4){
        return 2;
    }else if (section == 5){
        return 2;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.textColor = [UIColor grayColor];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return NSLocalizedString(@"普通类型", nil);
    }else if (section == 1){
        return NSLocalizedString(@"图像类型", nil);
    }else if (section == 2){
        return NSLocalizedString(@"视频类型", nil);
    }else if (section == 3){
        return NSLocalizedString(@"定时类型", nil);
    }else if (section == 4){
        return NSLocalizedString(@"交互类型", nil);
    }else if (section == 5){
        return NSLocalizedString(@"定点类型", nil);
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const identifier = @"identifier";
    PopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(0, 2)][indexPath.row]];
    }else if (indexPath.section == 1){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(2, 4)][indexPath.row]];
    }else if (indexPath.section == 2){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(6, 4)][indexPath.row]];
    }else if (indexPath.section == 3){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(10, 6)][indexPath.row]];
    }else if (indexPath.section == 4){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(16, 2)][indexPath.row]];
    }else if (indexPath.section == 5){
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[titleArray subarrayWithRange:NSMakeRange(18, 2)][indexPath.row]];
    }
    cell.textLabel.textAlignment = 0;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:12];
    [cell.textLabel setTextColor:[UIColor grayColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popMenu:(UIButton *)sender {
    [QQPopMenuView showWithItems:@[@{@"title":@"发起讨论",@"imageName":@"popMenu_createChat"},
                                   @{@"title":@"扫描名片",@"imageName":@"popMenu_scanCard"},
                                   @{@"title":@"写日报",@"imageName":@"popMenu_writeReport"},
                                   @{@"title":@"外勤签到",@"imageName":@"popMenu_signIn"}]
                           width:130
                triangleLocation:CGPointMake([UIScreen mainScreen].bounds.size.width-30, 64+5)
                          action:^(NSInteger index) {
                              NSLog(@"点击了第%ld行",index);
    }];
}

@end
