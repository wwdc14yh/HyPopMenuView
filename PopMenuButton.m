//
//  PopMenuButton.m
//  HyPopMenuView
//
//  Created by Hy_Mac on 16/7/8.
//  Copyright © 2016年 ouy.Aberi. All rights reserved.
//

#import "PopMenuButton.h"
#import "UIColor+ImageGetColor.h"
@implementation PopMenuButton

static NSString* animationKey = @"transform.scale";

+ (instancetype __nonnull)buttonWithType:(UIButtonType)buttonType
{
    PopMenuButton* button = [super buttonWithType:buttonType];

    return button;
}

- (instancetype __nonnull)init
{
    self = [super initWithFrame:CGRectNull];
    if (self) {
        self.titleLabel.alpha = 0.0f;
        //1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        //3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imageView.clipsToBounds = true;
        //4.取消高亮
        self.adjustsImageWhenHighlighted = false;

        [self addTarget:self action:@selector(scaleToSmall)
            forControlEvents:UIControlEventTouchDown | UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(scaleToDefault)
            forControlEvents:UIControlEventTouchDragExit];
    }
    return self;
}

- (void)setTextLabelWithShadowColor:(UIColor*)color
{
    UILabel* textLabel = [self viewWithTag:21];
    if (!textLabel) {
        textLabel = [UILabel new];
        textLabel.tag = 21;
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:textLabel];
    }
    [textLabel setFrame:CGRectMake(0, CGRectGetHeight(self.bounds) - 20, CGRectGetWidth(self.bounds), 20)];
    [textLabel setTextColor:color];
    [textLabel setText:_model.titleString];
    textLabel.shadowColor = [UIColor whiteColor];
    textLabel.shadowOffset = CGSizeMake(0.3f, 0.3f);
}

- (void)scaleToSmall
{
    CABasicAnimation* theAnimation;
    theAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
    theAnimation.delegate = self;
    theAnimation.duration = 0.1;
    theAnimation.repeatCount = 0;
    theAnimation.removedOnCompletion = FALSE;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.autoreverses = NO;
    theAnimation.fromValue = [NSNumber numberWithFloat:1];
    theAnimation.toValue = [NSNumber numberWithFloat:1.2f];
    [self.imageView.layer addAnimation:theAnimation forKey:theAnimation.keyPath];
}

- (void)scaleToDefault
{
    CABasicAnimation* theAnimation;
    theAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
    theAnimation.delegate = self;
    theAnimation.duration = 0.1;
    theAnimation.repeatCount = 0;
    theAnimation.removedOnCompletion = FALSE;
    theAnimation.fillMode = kCAFillModeForwards;
    theAnimation.autoreverses = NO;
    theAnimation.fromValue = [NSNumber numberWithFloat:1.2f];
    theAnimation.toValue = [NSNumber numberWithFloat:1];
    [self.imageView.layer addAnimation:theAnimation forKey:theAnimation.keyPath];
}

- (void)selectdAnimation
{
    if (_model.transitionType == PopMenuTransitionTypeSystemApi) {
        CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
        scaleAnimation.delegate = self;
        scaleAnimation.duration = 0.2;
        scaleAnimation.repeatCount = 0;
        scaleAnimation.removedOnCompletion = FALSE;
        scaleAnimation.fillMode = kCAFillModeForwards;
        scaleAnimation.autoreverses = NO;
        scaleAnimation.fromValue = @1;
        scaleAnimation.toValue = @1.4;

        CABasicAnimation* opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.delegate = self;
        opacityAnimation.duration = 0.2;
        opacityAnimation.repeatCount = 0;
        opacityAnimation.removedOnCompletion = FALSE;
        opacityAnimation.fillMode = kCAFillModeForwards;
        opacityAnimation.autoreverses = NO;
        opacityAnimation.fromValue = @1;
        opacityAnimation.toValue = @0;

        [self.layer addAnimation:scaleAnimation forKey:scaleAnimation.keyPath];
        [self.layer addAnimation:opacityAnimation forKey:opacityAnimation.keyPath];
    }
    else {
        self.userInteractionEnabled = false;
        self.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
        UIImage* image = self.imageView.image;
        UIColor* color = [UIColor getPixelColorAtLocation:CGPointMake(50, 20) inImage:image];
        [self setBackgroundColor:color];
        if (_model.transitionRenderingColor) {
            [self setBackgroundColor:_model.transitionRenderingColor];
        }
        UILabel* textLabel = [self viewWithTag:21];
        textLabel.text = @"";
        [self setTitle:@"" forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];

        CABasicAnimation* expandAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        expandAnim.fromValue = @(1.0);
        expandAnim.toValue = @(33.0);
        expandAnim.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.95:0.02:1:0.05];
        expandAnim.duration = 0.3;
        expandAnim.delegate = self;
        expandAnim.fillMode = kCAFillModeForwards;
        expandAnim.removedOnCompletion = false;
        expandAnim.autoreverses = NO;
        [self.layer addAnimation:expandAnim forKey:expandAnim.keyPath];
    }
}

- (void)cancelAnimation
{

    CABasicAnimation* scaleAnimation = [CABasicAnimation animationWithKeyPath:animationKey];
    scaleAnimation.delegate = self;
    scaleAnimation.duration = 0.2;
    scaleAnimation.repeatCount = 0;
    scaleAnimation.removedOnCompletion = FALSE;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fromValue = @1;
    scaleAnimation.toValue = @0.3;

    CABasicAnimation* opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.delegate = self;
    opacityAnimation.duration = 0.2;
    opacityAnimation.repeatCount = 0;
    opacityAnimation.removedOnCompletion = FALSE;
    opacityAnimation.fillMode = kCAFillModeForwards;
    opacityAnimation.autoreverses = NO;
    opacityAnimation.fromValue = @1;
    opacityAnimation.toValue = @0;
    //CGAffineTransformIdentity
    [self.layer addAnimation:scaleAnimation forKey:[NSString stringWithFormat:@"cancel%@", scaleAnimation.keyPath]];
    [self.layer addAnimation:opacityAnimation forKey:opacityAnimation.keyPath];
}

- (void)animationDidStop:(CAAnimation*)anim finished:(BOOL)flag
{

    CABasicAnimation* cab = (CABasicAnimation*)anim;
    if ([cab.toValue floatValue] == 33.0f || [cab.toValue floatValue] == 1.4f) {
        [self setUserInteractionEnabled:true];
        __weak PopMenuButton* weakButton = self;
        if (weakButton.block) {
            weakButton.block();
        }

        [NSTimer scheduledTimerWithTimeInterval:0.6f target:self selector:@selector(DidStopAnimation) userInfo:nil repeats:nil];
    }
}

- (void)DidStopAnimation
{

    [self.layer removeAllAnimations];
}

#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageWidth = contentRect.size.width / 1.7;
    CGFloat imageX = CGRectGetWidth(contentRect) / 2 - imageWidth / 2;
    CGFloat imageHeight = imageWidth;
    CGFloat imageY = CGRectGetHeight(self.bounds) - (imageHeight + 30);
    return CGRectMake(imageX, imageY, imageWidth, imageHeight);
}

#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleHeight = 20;
    CGFloat titleY = contentRect.size.height - titleHeight;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

- (void)setModel:(PopMenuModel*)model
{
    _model = model;
    UIImage* image = [UIImage imageNamed:model.imageNameString];
    [self setImage:image forState:UIControlStateNormal];
    [self setTitle:model.titleString forState:UIControlStateNormal];

    UIColor* tempColor = nil;
    UIColor* color = [UIColor getPixelColorAtLocation:CGPointMake(image.size.width / 2, image.size.height / 2) inImage:image];
    // [self setTitleColor:color forState:UIControlStateNormal];
    tempColor = color;
    if (!_model.automaticIdentificationColor) {
        if (_model.textColor) {
            //[self setTitleColor:model.textColor forState:UIControlStateNormal];
            tempColor = model.textColor;
        }
    }
    [self setTextLabelWithShadowColor:tempColor];
}

@end
