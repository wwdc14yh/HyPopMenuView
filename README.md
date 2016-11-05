---
#HyPopMenuView
-------------
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
             )](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-ObjC-brightgreen.svg?style=flat)](https://developer.apple.com/Objective-C)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](http://mit-license.org)
> 关于**HyPopMenuView**灵感来自于[新浪微博App](http://www.weibo.com)

####示例:  
1.效果1
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled1.gif)

2.效果2
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled2.gif)

3.效果3
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled3.gif)

4.效果4
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled4.gif)

###特性（可选）
* 多种动画效果，参考示例。

* 转场效果
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled5.gif)
![image](https://github.com/wwdc14/HyPopMenuView/blob/master/HyPopMenuView/Untitled6.gif)

* 两种背景颜色 Light & Dark

###原理说明（可选）
1.本项目采用[Facebook](https://github.com/facebook)开源的动画框架-[Pop](https://github.com/facebook/pop),有兴趣的朋友可以去了解下。


### 下载安装
安装方法:  
将下载好的项目提取以下类托入项目中
`HyPopMenuViewDelegate.h`
`HyPopMenuView.h`
`PopMenuModel.h`
`PopMenuButton.h`
`UIColor+ImageGetColor.h`
将`HyPopMenuView.h`import

###使用方法
实例`HyPopMenuView`
```obj
@property (nonatomic, strong) HyPopMenuView* menu;
_menu = [HyPopMenuView sharedPopMenuManager];
```
###属性以及方法说明
数据源，支持类型`PopMenuModel`

```obj
@property (nonatomic, retain) NSArray<PopMenuModel*>* dataSource
```
背景类型默认为 `HyPopMenuViewBackgroundTypeLightBlur` 可以改变背景类型，详情看枚举说明。

```obj
@property (nonatomic, assign) HyPopMenuViewBackgroundType backgroundType
```
动画类型默认为 `HyPopMenuViewAnimationTypeSina` 可以改变弹出动画类型类型，详情看枚举说明。

```obj
@property (nonatomic, assign) HyPopMenuViewAnimationType animationType
```
自动识别icon背景颜色，默认关闭。

```obj
@property (nonatomic, assign) BOOL automaticIdentificationColor;
```
代理，回调相关属性

```obj
@property (nonatomic, assign) id<HyPopMenuViewDelegate> delegate;
```
弹出动画速度，取值范围： 0.0f ~ 20.0f，默认为 10.0f。

```obj
@property (nonatomic, assign) CGFloat popMenuSpeed;
```
顶部自定义View

```obj
@property (nonatomic, strong) UIView* topView;
```

##公有方法

初始化方法

```obj
+ (instancetype)sharedPopMenuManager;
```
打开菜单（dataSource属性必须赋值）

```obj
- (void)openMenu;
```
关闭菜单

```obj
- (void)closeMenu;
```
是否打开菜单 yes为打开，no为关闭

```obj
- (BOOL)isOpenMenu;
```

##通知相关

**相信我不用解释是什么意思了吧**

```
UIKIT_EXTERN NSString* const HyPopMenuViewWillShowNotification;
```
```
UIKIT_EXTERN NSString* const HyPopMenuViewDidShowNotification;
```
```
UIKIT_EXTERN NSString* const HyPopMenuViewWillHideNotification;
```
```
UIKIT_EXTERN NSString* const HyPopMenuViewDidHideNotification;
```

### 注意事项
开源库需要[Facebook](https://github.com/facebook)开源的动画框架-[Pop](https://github.com/facebook/pop)支持。

### 期待
* 如果在使用过程中遇到BUG，希望你能Issues我
* 如果觉得好用请Star!

