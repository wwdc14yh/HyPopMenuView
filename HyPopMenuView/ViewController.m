//
//  ViewController.m
//  HyPopMenuView
//
//  Created by  H y on 15/9/8.
//  Copyright (c) 2015年 ouy.Aberi. All rights reserved.
//

#import "ViewController.h"
#import "MenuLabel.h"
#import "HyPopMenuView.h"
#import <POP.h>

#define Objs @[[MenuLabel CreatelabelIconName:@"tabbar_compose_idea" Title:@"文字"],[MenuLabel CreatelabelIconName:@"tabbar_compose_photo" Title:@"相册"],[MenuLabel CreatelabelIconName:@"tabbar_compose_camera" Title:@"拍摄"],[MenuLabel CreatelabelIconName:@"tabbar_compose_lbs" Title:@"签到"],[MenuLabel CreatelabelIconName:@"tabbar_compose_review" Title:@"点评"],[MenuLabel CreatelabelIconName:@"tabbar_compose_more" Title:@"更多"],]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ShowMenu:(UIButton *)sender
{
    CGFloat x,y,w,h;
    x = CGRectGetWidth(self.view.bounds)/2 - 213/2;
    y = CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.3f;
    w = 213;
    h = 57;
    //自定义的头部视图
    UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    topView.image = [UIImage imageNamed:@"compose_slogan"];
    topView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    
    //添加弹出菜单音效
    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    //添加取消菜单音效
    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    //添加选中按钮音效
    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    
    [HyPopMenuView CreatingPopMenuObjectItmes:Objs TopView:topView /*nil*/OpenOrCloseAudioDictionary:AudioDictionary /*nil*/ SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
        NSLog(@"index:%ld ItmeNmae:%@",index,menuLabel.title);
    }];
}

- (BOOL)prefersStatusBarHidden

{
    
    return YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
