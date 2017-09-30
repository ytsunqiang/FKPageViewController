//
//  FKPageViewController.m
//  Example
//
//  Created by 高飞林 on 2017/9/29.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "FKPageViewController.h"


@interface FKPageViewController ()

@end

@implementation FKPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (NSInteger)numberOfControllers {
    return self.controllers.count;
}

/**
 标题栏高度

 @return 高度
 */
- (CGFloat)preferTabY {

    if (self.preferTiltleY) {
        return self.preferTiltleY;
    }
    
    CGFloat top = 0;
    if (!self.prefersStatusBarHidden) {
        top += 20;
    }
    if (!self.navigationController.navigationBarHidden) {
        top += 44;
    }
    return top;
}

/**
 中间pageView的frame

 @return frame
 */
- (CGRect)preferPageFrame {
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat bottom = 0;
    if (self.tabBarController.tabBar && !self.tabBarController.tabBar.hidden) {
        bottom += 49;
    }
    CGFloat h = size.height - 44 - [self preferTabY] - bottom;
    return CGRectMake(0, [self preferTabY] + 44, size.width, h);
}

/**
 数据源方法  类似tableView

 @param index index
 @return 控制器
 */
- (UIViewController *)controllerAtIndex:(NSInteger)index {
    
    return self.controllers[index];
}

/**
 返回对应的标题

 @param index index
 @return 标题
 */
- (NSString *)titleForIndex:(NSInteger)index {
    
    return [self.controllers[index] title];
}

/**
 标题下面是否需要横线 原点  这里固定返回YES  不然会有问题 不需要设置类型为NONE即可

 @return 是否
 */
- (BOOL)needMarkView {
    return YES;
}

/**
 markView的颜色

 @param index index
 @return 颜色
 */
- (UIColor *)markViewColorForIndex:(NSInteger)index {

    if (self.markViewType == FKPageViewControllerMarkViewTypeNone) {
        return [UIColor clearColor];
    }else if (self.markViewColor){
        return self.markViewColor;
    }else {
        return [UIColor orangeColor];
    }
}

- (CGFloat)markViewHeight {
   
    if (self.markViewType == FKPageViewControllerMarkViewTypePoint) {
        return 5;
    }
    return 2;
}

- (CGFloat)markViewWidthForIndex:(NSInteger)index {
    
    switch (self.markViewType) {
        case FKPageViewControllerMarkViewTypeEquWidthLine:
            
            return 40;
            break;
        case FKPageViewControllerMarkViewTypeAdjustWidthLine:{
            
            UILabel *label = [[UILabel alloc] init];
            label.text = [self.controllers[index] title];
            label.font = [self titleFontForSelectedIndex:0];
            [label sizeToFit];
            return label.frame.size.width;
        }
            break;
        case FKPageViewControllerMarkViewTypePoint:
            
            return 5;
            break;
        default:
            break;
    }
    return 40;
}
- (CGFloat)preferTabHAtIndex:(NSInteger)index {
    
    return 44;
}

- (UIColor *)titleColorForIndex:(NSInteger)index {
    if (self.titleNormalColor) {
        return self.titleNormalColor;
    }else {
        return [UIColor blackColor];
    }
}

- (CGFloat)markViewBottom {
    
    if (self.markViewY) {
        return self.markViewY;
    }else {
        return 5;
    }
}

- (UIColor *)titleHighlightColorForIndex:(NSInteger)index {
    if (self.titleSelectedColor) {
        return self.titleSelectedColor;
    }else {
        return [UIColor orangeColor];
    }
}
- (UIFont *)titleFontForSelectedIndex:(NSInteger)index {
    if (self.selectedFont) {
        return [UIFont systemFontOfSize:self.selectedFont];
    }else if(self.normalFont){
        return [UIFont systemFontOfSize:self.normalFont];
    }else {
        return [UIFont systemFontOfSize:15];
    }
}


- (UIFont *)titleFontForIndex:(NSInteger)index {
    if (self.normalFont) {
        return [UIFont systemFontOfSize:self.normalFont];
    }else {
        return [UIFont systemFontOfSize:15];
    }
}
- (BOOL)isPreLoad {
    
    return YES;
}

- (BOOL)needLineView {
    
    return self.needTitleBottomLine;
}
- (UIColor *)bottomLineViewColor {

    if (self.titleBottomLineColor) {
        
        return self.titleBottomLineColor;
    }else {
        [super bottomLineViewColor];
    }
    return [UIColor blackColor];
}

@end
