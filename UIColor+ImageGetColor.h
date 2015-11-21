//
//  UIColor+ImageGetColor.h
//  HyPopMenuView
//
//  Created by  H y  on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenGLES/ES1/glext.h>

@interface UIView (GetImgae)

-(UIImage *)imageRepresentation;

@end

@interface UIColor (ImageGetColor)

+ (UIColor*) getPixelColorAtLocation:(CGPoint)point inImage:(UIImage *)image;

@end


@interface UIImage (Tint)

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

@end