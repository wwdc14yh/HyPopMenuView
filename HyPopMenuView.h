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

+(void)CreatingPopMenuObjectItmes:(NSArray *)Items
                          TopView:(UIView *)topView
       OpenOrCloseAudioDictionary:(NSDictionary *)openOrCloseAudioDictionary
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

+(void)CreatingPopMenuObjectItmes:(NSArray *)Items
                          TopView:(UIView *)topView
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

+(void)CreatingPopMenuObjectItmes:(NSArray *)Items
           SelectdCompletionBlock:(SelectdCompletionBlock)block;

-(void)SelectdCompletionBlock:(SelectdCompletionBlock)block;

-(instancetype) initWithItmes:(NSArray *)Itmes;

@end

@interface CustomButton : UIButton
@property (nonatomic, retain)MenuLabel *MenuData;

-(void)SelectdAnimation;
-(void)CancelAnimation;
@end

@interface  ImageView: UIImageView
@end