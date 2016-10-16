//
//  twoViewController.m
//  HyPopMenuView
//
//  Created by Hy_Mac on 16/5/13.
//  Copyright © 2016年 ouy.Aberi. All rights reserved.
//

#import "twoViewController.h"
#import "HyPopMenuView.h"
#import "popMenvTopView.h"

@interface twoViewController ()<HyPopMenuViewDelegate>

@property (nonatomic, strong) HyPopMenuView* menu;

@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@property (weak, nonatomic) IBOutlet UIButton *openMenuButton;

@end

@implementation twoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dismissButton.layer.cornerRadius = 5;
    _dismissButton.layer.shadowOffset =  CGSizeMake(1, 1);
    _dismissButton.layer.shadowOpacity = 0.9;
    _dismissButton.layer.shadowColor =  [UIColor grayColor].CGColor;
    
    _openMenuButton.layer.cornerRadius = 5;
    _openMenuButton.layer.shadowOffset =  CGSizeMake(1, 1);
    _openMenuButton.layer.shadowOpacity = 0.9;
    _openMenuButton.layer.shadowColor =  [UIColor grayColor].CGColor;
    
    _menu = [HyPopMenuView sharedPopMenuManager];
    PopMenuModel* model = [PopMenuModel
                           allocPopMenuModelWithImageNameString:@"tabbar_compose_idea"
                           AtTitleString:@"文字/头条"
                           AtTextColor:[UIColor grayColor]
                           AtTransitionType:PopMenuTransitionTypeCustomizeApi
                           AtTransitionRenderingColor:nil];
    
    PopMenuModel* model1 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_photo"
                            AtTitleString:@"相册/视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model2 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_camera"
                            AtTitleString:@"拍摄/短视频"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model3 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_lbs"
                            AtTitleString:@"签到"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model4 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_review"
                            AtTitleString:@"点评"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeCustomizeApi
                            AtTransitionRenderingColor:nil];
    
    PopMenuModel* model5 = [PopMenuModel
                            allocPopMenuModelWithImageNameString:@"tabbar_compose_more"
                            AtTitleString:@"更多"
                            AtTextColor:[UIColor grayColor]
                            AtTransitionType:PopMenuTransitionTypeSystemApi
                            AtTransitionRenderingColor:nil];
    
    _menu.dataSource = @[ model, model1, model2, model3, model4, model5 ];
    _menu.delegate = self;
    _menu.popMenuSpeed = 12.0f;
    _menu.automaticIdentificationColor = false;
    _menu.animationType = HyPopMenuViewAnimationTypeSina;
    _menu.backgroundType = HyPopMenuViewBackgroundTypeDarkBlur;
    
    popMenvTopView* topView = [popMenvTopView popMenvTopView];
    topView.frame = CGRectMake(0, 44, CGRectGetWidth(self.view.frame), 92);
    _menu.topView = topView;
}

- (IBAction)dismiss:(id)sender
{
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)openMenu:(id)sender
{
    [_menu openMenu];
}

- (void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index
{
    [self.navigationController popViewControllerAnimated:false];
}

@end
