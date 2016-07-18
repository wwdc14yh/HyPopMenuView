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

@property (weak, nonatomic) IBOutlet UIButton *dismissButton;

@property (weak, nonatomic) IBOutlet UIButton *openMenuButton;

@end

@implementation twoViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    PopMenuModel *model3 = [PopMenuModel allocPopMenuModelWithImageNameString:@"tabbar_compose_lbs" AtTitleString:@"签到" AtTextColor:[UIColor grayColor] AtTransitionType:PopMenuTransitionTypeSystemApi AtTransitionRenderingColor:nil];
    
    PopMenuModel *model4 = [PopMenuModel allocPopMenuModelWithImageNameString:@"tabbar_compose_review" AtTitleString:@"点评" AtTextColor:[UIColor grayColor] AtTransitionType:PopMenuTransitionTypeCustomizeApi AtTransitionRenderingColor:nil];
    
    PopMenuModel *model5 = [PopMenuModel allocPopMenuModelWithImageNameString:@"tabbar_compose_more" AtTitleString:@"更多" AtTextColor:[UIColor grayColor] AtTransitionType:PopMenuTransitionTypeSystemApi AtTransitionRenderingColor:nil];
    HyPopMenuView *pop = [HyPopMenuView sharedPopMenuManager];
    pop.dataSource = @[model3,model4,model5];
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
    
    HyPopMenuView *pop = [HyPopMenuView sharedPopMenuManager];
    pop.delegate = self;
}

- (IBAction)dismiss:(id)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)openMenu:(id)sender {
    HyPopMenuView *pop = [HyPopMenuView sharedPopMenuManager];
    pop.backgroundType = HyPopMenuViewBackgroundTypeDarkBlur;
    [pop openMenu];
}

- (void)popMenuView:(HyPopMenuView *)popMenuView didSelectItemAtIndex:(NSUInteger)index
{
    [self.navigationController popViewControllerAnimated:false];
}

@end
