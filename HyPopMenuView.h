//
//  HyPopMenuView.h
//  HyPopMenuView
//
//  Created by  H y on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import "HyPopMenuViewDelegate.h"
#import "PopMenuButton.h"
#import "PopMenuModel.h"
#import <UIKit/UIKit.h>

/**
 *  弹出动画类型
 *  animation Type
 */
typedef NS_ENUM(NSUInteger, HyPopMenuViewAnimationType) {
    /**
     *  仿新浪App弹出菜单。
     *  Sina App fake pop-up menu
     */
    HyPopMenuViewAnimationTypeSina,
    /**
     *  带有粘性的动画
     *  Animation with viscous
     */
    HyPopMenuViewAnimationTypeViscous,
    /**
     *  底部中心点弹出动画
     *  The bottom of the pop-up animation center
     */
    HyPopMenuViewAnimationTypeCenter,
    
    /**
     *  左和右弹出动画
     *  Left and right pop Anime
     */
    HyPopMenuViewAnimationTypeLeftAndRight,
};

typedef enum : NSUInteger {
    /**
     *  light模糊背景类型。
     *  light blurred background type.
     */
    HyPopMenuViewBackgroundTypeLightBlur,

    /**
     *  dark模糊背景类型。
     *  dark blurred background type.
     */
    HyPopMenuViewBackgroundTypeDarkBlur,

    /**
     *  偏白半透明背景类型。
     *  Partial white translucent background type.
     */
    HyPopMenuViewBackgroundTypeLightTranslucent,

    /**
     *  偏黑半透明背景类型。
     *  Partial translucent black background type.
     */
    HyPopMenuViewBackgroundTypeDarkTranslucent,

    /**
     *  白~黑渐变色。
     *  Gradient color.
     */
    HyPopMenuViewBackgroundTypeGradient,

} HyPopMenuViewBackgroundType; //背景类型
//Background type

@interface HyPopMenuView : UIView

/*=====================================================================================*/

@property (nonatomic, retain) NSArray<PopMenuModel*>* dataSource;

/**
 *  背景类型默认为 'HyPopMenuViewBackgroundTypeLightBlur'
 *  The default is 'HyPopMenuViewBackgroundTypeLightBlur'
*/
@property (nonatomic, assign) HyPopMenuViewBackgroundType backgroundType;

/**
 *  动画类型
 *  animation Type
 */
@property (nonatomic, assign) HyPopMenuViewAnimationType animationType;

/**
 *  自动识别颜色主题，默认为关闭。
 *  The default is false.
 */
@property (nonatomic, assign) BOOL automaticIdentificationColor;

/**
 *  HyPopMenuViewDelegate
 */
@property (nonatomic, assign) id<HyPopMenuViewDelegate> delegate;

/**
 *  默认为 10.0f         取值范围: 0.0f ~ 20.0f
 *  default is 10.0f    Range: 0 ~ 20
 */
@property (nonatomic, assign) CGFloat popMenuSpeed;

/**
 *  顶部自定义View
 */
@property (nonatomic, strong) UIView* topView;

+ (instancetype)sharedPopMenuManager;

- (void)openMenu;

- (void)closeMenu;

- (BOOL)isOpenMenu;

@end

UIKIT_EXTERN NSString* const HyPopMenuViewWillShowNotification;
UIKIT_EXTERN NSString* const HyPopMenuViewDidShowNotification;
UIKIT_EXTERN NSString* const HyPopMenuViewWillHideNotification;
UIKIT_EXTERN NSString* const HyPopMenuViewDidHideNotification;
