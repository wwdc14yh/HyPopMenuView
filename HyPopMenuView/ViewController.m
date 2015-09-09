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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *windows = [UIApplication sharedApplication].windows;
    NSLog(@"windows.count:%ld",windows.count);
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ShowMenu:(UIButton *)sender {
    
    NSArray *Objs = @[
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_idea" Title:@"文字"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_photo" Title:@"相册"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_camera" Title:@"拍摄"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_lbs" Title:@"签到"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_review" Title:@"点评"],
                      [MenuLabel CreatelabelIconName:@"tabbar_compose_more" Title:@"更多"],
                      ];
    UIImageView *topView = [[ImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 213/2, CGRectGetHeight([UIScreen mainScreen].bounds)/2 * 0.3f, 213, 57)];
    topView.image = [UIImage imageNamed:@"compose_slogan"];
    topView.contentMode = UIViewContentModeScaleAspectFit;
    
//    [HyPopMenuView CreatingPopMenuObjectItmes:Objs SuperView:self.view TopView:topView SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
//       
//        NSLog(@"index:%ld ItmeNmae:%@",index,menuLabel.title);
//        
//    }];
    
    NSMutableDictionary *AudioDictionary = [NSMutableDictionary dictionary];
    [AudioDictionary setObject:@"composer_open" forKey:kHyPopMenuViewOpenAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewOpenAudioTypeKey];
    
    [AudioDictionary setObject:@"composer_close" forKey:kHyPopMenuViewCloseAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewCloseAudioTypeKey];
    
    [AudioDictionary setObject:@"composer_select" forKey:kHyPopMenuViewSelectAudioNameKey];
    [AudioDictionary setObject:@"wav" forKey:kHyPopMenuViewSelectAudioTypeKey];
    
    [HyPopMenuView CreatingPopMenuObjectItmes:Objs SuperView:self.view TopView:topView OpenOrCloseAudioDictionary:AudioDictionary SelectdCompletionBlock:^(MenuLabel *menuLabel, NSInteger index) {
        NSLog(@"index:%ld ItmeNmae:%@",index,menuLabel.title);
    }];
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    NSLog(@"HyPopMenuView.count:%ld",windows.count);
}

- (BOOL)prefersStatusBarHidden
{
    return FALSE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
