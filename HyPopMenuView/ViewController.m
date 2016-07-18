//
//  ViewController.m
//  HyPopMenuView
//
//  Created by  H y on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import "HyPopMenuView.h"
#import "ViewController.h"
#import "popMenvTopView.h"

@interface ViewController () <HyPopMenuViewDelegate>

@property (nonatomic, strong) HyPopMenuView* menu;

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
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
    _menu.animationType = HyPopMenuViewAnimationTypeViscous;
    
    popMenvTopView* topView = [popMenvTopView popMenvTopView];
    topView.frame = CGRectMake(0, 44, CGRectGetWidth(self.view.frame), 92);
    _menu.topView = topView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _menu = [HyPopMenuView sharedPopMenuManager];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ShowMenu:(UIButton*)sender
{
    _menu.backgroundType = HyPopMenuViewBackgroundTypeLightBlur;
    [_menu openMenu];
}

- (void)popMenuView:(HyPopMenuView*)popMenuView
    didSelectItemAtIndex:(NSUInteger)index
{
    UIViewController* t =
        [self.storyboard instantiateViewControllerWithIdentifier:@"two"];
    [self.navigationController pushViewController:t animated:false];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
