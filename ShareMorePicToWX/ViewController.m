//
//  ViewController.m
//  ShareMorePicToWX
//
//  Created by ZFJ on 2016/12/5.
//  Copyright © 2016年 ZFJ. All rights reserved.
//

#import "ViewController.h"

#import "TSShareHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (IBAction)weChatAction:(id)sender{
    UIImage *img = [UIImage imageNamed:@"99687078.jpg"];
    UIImage *img1 = [UIImage imageNamed:@"2222.jpg"];

    [TSShareHelper shareWithType:1 andController:self andItems:@[img,img,img1,img,img1]];
}

- (IBAction)qqAction:(id)sender{
    UIImage *img = [UIImage imageNamed:@"99687078.jpg"];
    [TSShareHelper shareWithType:2 andController:self andItems:@[img,img,img]];
}

- (IBAction)sinaAction:(id)sender{
    UIImage *img = [UIImage imageNamed:@"99687078.jpg"];
    [TSShareHelper shareWithType:3 andController:self andItems:@[img,img,img]];
}

- (IBAction)otherAction:(id)sender{
    UIImage *img = [UIImage imageNamed:@"99687078.jpg"];
    [TSShareHelper shareWithType:0 andController:self andItems:@[img,img,img]];
}

@end
