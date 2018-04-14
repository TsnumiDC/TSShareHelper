## TSShareHelper  提醒一下各位,由于iOS11不支持,所以跳过选择页面不行了(目前判断了版本先用原生分享界面,让用户手动选微信吧)

功能 :iOS系统分享功能实现不经过选择,直接进入或者选择.
新增视频,文件的分享
判断了版本,做了回调处理.

- 微信(前三个ios11之前支持直接弹出页面)
- qq
- 新浪
- 原生选择界面 (ios11自动选择该type,请注意代码)

`注意` : 其中传入的items包含UIImage或者NSURL的数组

```Objective-C

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

```


>效果图

<center>
    <img src="1.png" width='150' class="third" >
    <img src="2.png" width='150'  class="third">
    <img src="3.jpg" width='150'  class="third">
    <img src="4.png" width='150'  class="third">
</center>

>具体实现

- 调用系统的分享选择界面其实就是UIActivityViewController 

  其中第一个参数穿入分享的对象(图片,url,string啥的)
  
  第二个参数是可以穿入自定义UIActivity的,也就是选择界面的视图模型.
  
```
        UIActivityViewController * activityCtl = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
        [controller presentViewController:activityCtl animated:YES completion:nil];
```

- 跳过选择直接进入系统的分享主要是下面的代码,如果有其他类型分享,可以使用官方给的类型,也可以根据最下面的注释里的类型进行选择.

```
    SLComposeViewController *composeVC = [SLComposeViewController composeViewControllerForServiceType:serviceType];
    [composeVC addImage:(UIImage *)obj];
    [controller presentViewController:composeVC animated:YES completion:nil];
```

