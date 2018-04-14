//
//  TSShareHelper.h
//  ShareMorePicToWX
//
//  Created by Dylan Chen on 2017/5/26.
//  Copyright © 2017年 Dylan. All rights reserved.
//  TS分享助手类
//  用于实现系统分享


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, TSShareHelperShareType){
    
    TSShareHelperShareTypeOthers,//其他  iOS11后 目前只能用这个方式,可以分享多图
    TSShareHelperShareTypeWeChat,//微信
    TSShareHelperShareTypeQQ,//腾讯QQ
    TSShareHelperShareTypeSina,//新浪微博
};
@interface TSShareHelper : NSObject

typedef void (^TSShareHelperCompleteHandler)(TSShareHelper * shareHelper, BOOL success);

/**
 单例

 @return 返回单例的 TSShareHelper
 */
+ (instancetype)shareHelper;


+ (BOOL)shareWithType:(TSShareHelperShareType)type
        andController:(UIViewController *)controller
          andFilePath:(NSString *)path
        andCompletion:(TSShareHelperCompleteHandler)completion;

+ (BOOL)shareWithType:(TSShareHelperShareType)type
        andController:(UIViewController *)controller
           andFileURL:(NSURL *)url
        andCompletion:(TSShareHelperCompleteHandler)completion;

/**
 分享方法

 @param type 分享类型
 @param controller 展示的控制器
 @param items 所有的分享对象 可以包括的类型是<UIimage NSURL>两种类型
 @param completion 分享的回调 YES:成功 NO:失败
 @return 返回分享结果 如果是No表示没有安装,请自行处理.
 */
+ (BOOL)shareWithType:(TSShareHelperShareType)type
        andController:(UIViewController *)controller
             andItems:(NSArray *)items
        andCompletion:(TSShareHelperCompleteHandler)completion;

- (BOOL)shareWithType:(TSShareHelperShareType)type
        andController:(UIViewController *)controller
             andItems:(NSArray *)items
        andCompletion:(TSShareHelperCompleteHandler)completion;


@end
