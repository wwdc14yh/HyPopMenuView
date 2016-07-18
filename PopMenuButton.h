//
//  PopMenuButton.h
//  HyPopMenuView
//
//  Created by Hy_Mac on 16/7/8.
//  Copyright © 2016年 ouy.Aberi. All rights reserved.
//

#import "HyPopMenuView.h"
#import <UIKit/UIKit.h>

typedef void (^completionAnimation)();

@interface PopMenuButton : UIButton

@property (nonatomic, nonnull, strong) PopMenuModel* model;

@property (nonatomic, nonnull, strong) completionAnimation block;

- (instancetype __nonnull)init;
- (void)selectdAnimation;
- (void)cancelAnimation;

@end
