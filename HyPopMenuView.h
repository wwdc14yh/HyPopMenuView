//
//  HyPopMenuView.h
//  HyPopMenuView
//
//  Created by  H y on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuLabel;

typedef void(^SelectdCompletionBlock)(MenuLabel *menuLabel,NSInteger index);

UIKIT_EXTERN NSString *const kHyPopMenuViewOpenAudioTypeKey NS_AVAILABLE_IOS(3_0);                //弹出菜单音频类型(后缀名)  Audio Type pop-up menu (extension)
UIKIT_EXTERN NSString *const kHyPopMenuViewOpenAudioNameKey NS_AVAILABLE_IOS(3_0);                //弹出菜单音频文件名       Audio file name pop-up menu
UIKIT_EXTERN NSString *const kHyPopMenuViewCloseAudioTypeKey NS_AVAILABLE_IOS(3_0);               //取消菜单音频类型(后缀名)   To cancel the menu audio type (extension)
UIKIT_EXTERN NSString *const kHyPopMenuViewCloseAudioNameKey NS_AVAILABLE_IOS(3_0);               //取消菜单音频文件名         To cancel the menu audio file name
UIKIT_EXTERN NSString *const kHyPopMenuViewSelectAudioNameKey
    NS_AVAILABLE_IOS(3_0);               //选择菜单音频文件名 默认是kHyPopMenuViewCloseAudioNameKey     Select the menu audio file name defaults kHyPopMenuViewCloseAudioNameKey
UIKIT_EXTERN NSString *const kHyPopMenuViewSelectAudioTypeKey
    NS_AVAILABLE_IOS(3_0);               //选择菜单音频类型(后缀名) 默认是kHyPopMenuViewCloseAudioTypeKey     Select the menu audio type (extension) The default is kHyPopMenuViewCloseAudioTypeKey

@interface HyPopMenuView : UIView
@property (nonatomic,assign,readonly) CGFloat MaxTopViewY; //顶部视图最大Y值   Top View maximum Y value
@property (nonatomic,weak) UIView            *TopView;     //自定义的顶部视图   Custom top view
@property (nonatomic,retain)NSDictionary     *OpenOrCloseAudioDictionary; //音频文件字典     Audio File Dictionary

/**
 *  类方法,一句代码弹出PopMenuView
 *
 *  @param Items                      传入MenuLabel的实例数组
 *  @param topView                    顶部View的自定义 (可为nil)
 *  @param openOrCloseAudioDictionary 音频 (可为nil)
 *  @param block                      回调block
 */
+(void)CreatingPopMenuObjectItmes:(NSArray<MenuLabel *> *)Items
                          TopView:(UIView *)topView
       OpenOrCloseAudioDictionary:(NSDictionary *)openOrCloseAudioDictionary
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

/**
 *  类方法,一句代码弹出PopMenuView
 *
 *  @param Items   传入MenuLabel的实例数组
 *  @param topView 顶部View的自定义 (可为nil)
 *  @param block   回调block
 */
+(void)CreatingPopMenuObjectItmes:(NSArray<MenuLabel *> *)Items
                          TopView:(UIView *)topView
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

/**
 *  类方法,一句代码弹出PopMenuView
 *
 *  @param Items 传入MenuLabel的实例数组
 *  @param block 回调block
 */
+(void)CreatingPopMenuObjectItmes:(NSArray<MenuLabel *> *)Items
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

/**
 *  block回调
 *
 *  @param block block
 */
-(void)SelectdCompletionBlock:(SelectdCompletionBlock)block;


/**
 *  对象方法
 *
 *  @param Itmes 传入MenuLabel的实例数组
 *
 *  @return 返回HyPopMenuView对象
 */
-(instancetype) initWithItmes:(NSArray<MenuLabel *> *)Itmes;

@end

@interface CustomButton : UIButton
@property (nonatomic, retain)MenuLabel *MenuData;

-(void)SelectdAnimation;
-(void)CancelAnimation;
@end

@interface  ImageView: UIImageView
@end