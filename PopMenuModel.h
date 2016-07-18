//
//  PopMenuModel.h
//  HyPopMenuView
//
//  Created by Hy_Mac on 16/7/8.
//  Copyright © 2016年 ouy.Aberi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PopMenuTransitionTypeSystemApi,
    PopMenuTransitionTypeCustomizeApi,
} PopMenuTransitionType;

@interface PopMenuModel : NSObject

@property (nonatomic, assign) BOOL automaticIdentificationColor;

@property (nonatomic, copy, nonnull) NSString* imageNameString;

@property (nonatomic, copy, nonnull) NSString* titleString;

@property (nonatomic, weak, nullable) UIColor* transitionRenderingColor;

@property (nonatomic, weak, nullable) UIColor* textColor;

@property (nonatomic, assign) PopMenuTransitionType transitionType;

@property (nonatomic, readonly, retain, nonnull) UIView* customView;

+ (instancetype __nonnull)allocPopMenuModelWithImageNameString:(NSString* __nonnull)imageNameString

                                                 AtTitleString:(NSString* __nonnull)titleString

                                                   AtTextColor:(UIColor* __nonnull)textColor

                                              AtTransitionType:(PopMenuTransitionType)transitionType

                                    AtTransitionRenderingColor:(UIColor* __nullable)transitionRenderingColor;

@end
