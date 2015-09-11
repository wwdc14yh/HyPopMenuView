# HyPopMenuView
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-ObjC-brightgreen.svg?style=flat)](https://developer.apple.com/Objective-C)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)

# Effect Diagram GIF
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/Untitled.gif)

### Manually Import【手动导入】
【将`HyPopMenuView`,`UIColor+ImageGetColor`,`MenuLabel`所有源代码拽入项目中】
【导入主头文件：`#import "HyPopMenuView.h"`】
```objc
HyPopMenuView.h         HyPopMenuView.m
UIColor+ImageGetColor.h UIColor+ImageGetColor.m
MenuLabel.h             MenuLabel.m
```
### Example【示例】

```objc
NSArray *Objs = @[
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_idea" Title:@"文字"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_photo" Title:@"相册"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_camera" Title:@"拍摄"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_lbs" Title:@"签到"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_review" Title:@"点评"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_more" Title:@"更多"],
                      ];
    CGFloat x,y,w,h;
    x = CGRectGetWidth(self.view.bounds)/2 - 213/2;
    y = CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.3f;
    w = 213;
    h = 57;
    //自定义的头部视图
    UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    topView.image = [UIImage imageNamed:@"compose_slogan"];
    topView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    
    //添加弹出菜单音效
    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    //添加取消菜单音效
    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    //添加选中按钮音效
    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    
    
    [HyPopMenuView CreatingPopMenuObjectItmes:Objs TopView:topView OpenOrCloseAudioDictionary:AudioDictionary SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
        NSLog(@"index:%ld ItmeNmae:%@",index,menuLabel.title);
    }];
```

## 期待

* 如果在使用过程中遇到BUG，希望你能Issues我
* 将模仿进行到底,让更多新手开发者了解比较酷的界面实现思路... 
* 如果觉得好用请Star!
* 谢谢!
