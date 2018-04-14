//
//  ViewController.m
//  ShareMorePicToWX
//
//  Created by Dylan on 2016/12/5.
//  Copyright © 2016年 Dylan. All rights reserved.
//

#define CellReuseIDE @"CellReuseIDE"

#import "ViewController.h"

#import "TSShareHelper.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView * tableView;

@property (strong, nonatomic)NSMutableArray * dataArray;

@end

@implementation ViewController

#pragma mark - 生命周期

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configSubViews];
    [self layoutSubviews];
}

- (void)configSubViews{
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.navigationItem.title = @"原生分享Demo";
    [self.view addSubview:self.tableView];
}

- (void)layoutSubviews{
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDelegate/UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * titleArray = self.dataArray [section];
    return titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell  = [self.tableView dequeueReusableCellWithIdentifier:CellReuseIDE];
    NSArray * titleArray = self.dataArray[indexPath.section];
    NSString * title = titleArray[indexPath.row];
    cell.textLabel.text = title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:{
            //多图分享
            UIImage *img = [UIImage imageNamed:@"99687078.jpg"];
            UIImage *img1 = [UIImage imageNamed:@"2222.jpg"];
            [TSShareHelper shareWithType:indexPath.row
                           andController:self
                                andItems:@[img,img,img1,img,img1]
                           andCompletion:^(TSShareHelper *shareHelper, BOOL success) {
                
                               if (success) {
                                   NSLog(@"成功的回调");
                               }else{
                                   NSLog(@"失败的回调");
                               }
                           }];
        }
            break;
        case 1:{
            //单个文件分享
            NSString * path = [[NSBundle mainBundle]pathForResource:@"Dylan 2017-07-07 09.33.12" ofType:@"mp4"];
            [TSShareHelper shareWithType:indexPath.row
                           andController:self
                             andFilePath:path
                           andCompletion:^(TSShareHelper *shareHelper, BOOL success) {
                
                               if (success) {
                                   NSLog(@"成功的回调");
                               }else{
                                   NSLog(@"失败的回调");
                               }
                           }];
        }
            break;
        case 2:{
            //多个文件分享
            NSString * path = [[NSBundle mainBundle]pathForResource:@"Dylan 2017-07-07 09.33.12" ofType:@"mp4"];
            NSURL * url = [NSURL URLWithString:path];
            [TSShareHelper shareWithType:indexPath.row
                           andController:self
                                andItems:@[url,url,url]
                           andCompletion:^(TSShareHelper *shareHelper, BOOL success) {
                
                               if (success) {
                                   NSLog(@"成功的回调");
                               }else{
                                   NSLog(@"失败的回调");
                               }
                           }];
        }
            break;
            
        default:
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:{
            return @"多图分享";
        }
            break;
        case 1:{
            return @"单文件分享";
        }
            break;
        case 2:{
            return @"多文件分享";
        }
            break;
        default:
            break;
    }
    return @"";
}

#pragma mark - Lazy

-(UITableView *)tableView{
    if (_tableView == nil){
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIDE];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"ShareList" ofType:@"plist"];
        _dataArray = [[NSMutableArray alloc]initWithContentsOfFile:path];
    }
    return _dataArray;
}
#pragma mark - dealloc

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
