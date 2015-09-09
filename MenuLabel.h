//
//  MenuLabel.h
//  HyPopMenuView
//
//  Created by  H y on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuLabel : NSObject

@property (nonatomic, retain) NSString *iconName;

@property (nonatomic, retain) NSString *title;

-(instancetype) initWithIconName:(NSString *)iconName
                           Title:(NSString *)title;

+(instancetype) CreatelabelIconName:(NSString *)iconName
                              Title:(NSString *)title;

@end
