//
//  ViewController.m
//  Example
//
//  Created by sparrow on 30/07/2017.
//  Copyright © 2017 tencent. All rights reserved.
//

#import "ViewController.h"
#import "TestCoverSubController.h"
#import "FKPageViewController.h"

#define CoverHeight 245

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.minYPullUp = 64;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.navigationBarHidden=NO;
//    self.navigationItem.title = self.navTitle?:@"SPPage";
//    if (!self.navTitle)
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    self.navigationController.navigationBarHidden = YES;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i ++) {
        TestCoverSubController *coverController = [[TestCoverSubController alloc] init];
        if (i % 2) {
            
            coverController.title = [NSString stringWithFormat:@"标题%d",i];
        }else {
            coverController.title = [NSString stringWithFormat:@"标题标题%d",i];
        }
        coverController.view.backgroundColor = [UIColor colorWithRed:(i * 25)/255.0 green:(i * 25)/255.0 blue:(i * 25)/255.0 alpha:1];
        
        [array addObject:coverController];
    }
    
    FKPageViewController *vc = [[FKPageViewController alloc] init];
    vc.controllers = array;
//    vc.selectedFont = 13;
//    vc.titleNormalColor = [UIColor greenColor];
//    vc.titleSelectedColor = [UIColor redColor];
//    vc.markViewY = 5;
    vc.markViewType = FKPageViewControllerMarkViewTypeAdjustWidthLine;
    vc.preferTiltleY = 20;
    vc.needTitleBottomLine = YES;
//    vc.titleBottomLineColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
}
- (NSString *)titleForIndex:(NSInteger)index
{
    return [NSString stringWithFormat:@"TAB%zd", index];
}

- (BOOL)needMarkView
{
    return YES;
}

- (UIView *)preferCoverView
{
    UIView *view = [[UIView alloc] initWithFrame:[self preferCoverFrame]];
    view.backgroundColor = [UIColor blackColor];

    return view;
}

- (CGFloat)preferTabY
{
    return CoverHeight;
}

- (CGRect)preferCoverFrame
{
    
    return CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CoverHeight);
}

- (UIViewController *)controllerAtIndex:(NSInteger)index
{
    TestCoverSubController *coverController = [[TestCoverSubController alloc] init];
//    coverController.view.frame = [self preferPageFrame];

    if (index == 0) {
        coverController.view.backgroundColor = [UIColor greenColor];
    } else if (index == 1) {
        coverController.view.backgroundColor = [UIColor orangeColor];
    } else {
        coverController.view.backgroundColor = [UIColor redColor];
    }

    return coverController;

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
}

- (NSInteger)numberOfControllers
{
    return 8;
}

-(BOOL)isPreLoad {
    return YES;
}



@end
