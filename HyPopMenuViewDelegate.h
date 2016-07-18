//
//  HyPopMenuViewDelegate.h
//  HyPopMenuView
//
//  Created by Hy_Mac on 16/7/12.
//  Copyright © 2016年 ouy.Aberi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HyPopMenuView, PopMenuModel, PopMenuButton;

@protocol HyPopMenuViewDelegate <NSObject>

- (void)popMenuView:(HyPopMenuView*)popMenuView didSelectItemAtIndex:(NSUInteger)index;

//....
@end
