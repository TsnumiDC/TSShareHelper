//
//  TSShareHelper.h
//  ShareMorePicToWX
//
//  Created by Dylan Chen on 2017/5/26.
//  Copyright © 2017年 ZFJ. All rights reserved.
//  TS分享助手类
//  用于实现系统分享


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TSShareHelperShareType)
{
    TSShareHelperShareTypeOthers,//其他
    TSShareHelperShareTypeWeChat,//微信
    TSShareHelperShareTypeQQ,//腾讯QQ
    TSShareHelperShareTypeSina,//新浪微博
    
};
@interface TSShareHelper : NSObject

/**
 单例

 @return 返回单例的 TSShareHelper
 */
+ (instancetype)shareHelper;
/**
 分享方法

 @param type 分享类型
 @param controller 展示的控制器
 @return 返回分享结果 如果是No表示没有安装,请自行处理.
 */
+ (BOOL)shareWithType:(TSShareHelperShareType)type andController:(UIViewController *)controller andItems:(NSArray *)items;
- (BOOL)shareWithType:(TSShareHelperShareType)type andController:(UIViewController *)controller andItems:(NSArray *)items;


@end
