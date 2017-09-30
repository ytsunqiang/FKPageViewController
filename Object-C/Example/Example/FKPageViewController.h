//
//  FKPageViewController.h
//  Example
//
//  Created by 高飞林 on 2017/9/29.
//  Copyright © 2017年 tencent. All rights reserved.
//

#import "SPTabController.h"

typedef NS_ENUM(NSInteger, FKPageViewControllerMarkViewType) {
    FKPageViewControllerMarkViewTypeEquWidthLine = 0,//等宽
    FKPageViewControllerMarkViewTypeAdjustWidthLine,//根据标题调整宽度
    FKPageViewControllerMarkViewTypePoint ,//点
    FKPageViewControllerMarkViewTypeNone//没有
};

@interface FKPageViewController : SPTabController

/**
 必须要穿  要不然会崩溃
 */
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;

/**
 markView类型 默认等宽
 */
@property (nonatomic, assign) FKPageViewControllerMarkViewType markViewType;

/**
 markView 颜色 默认橘色
 */
@property (nonatomic, strong) UIColor *markViewColor;

/**
 标题正常颜色 默认黑色
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 标题选中颜色 默认橘色
 */
@property (nonatomic, strong) UIColor *titleSelectedColor;

/**
 未选中的时候的字体大小 默认15号字体
 */
@property (nonatomic, assign) NSInteger normalFont;

/**
 选中状态下大小 默认等于正常
 */
@property (nonatomic, assign) NSInteger selectedFont;

/**
 markView距离底部的距离 你只需要传一个正数
 */
@property (nonatomic, assign) CGFloat markViewY;

/**
 标题栏开始的位置
 */
@property (nonatomic, assign) CGFloat preferTiltleY;

/**
 是否需要在标题下面增加一条线
 */
@property (nonatomic, assign) BOOL needTitleBottomLine;

/**
 标题底部线的颜色
 */
@property (nonatomic, strong) UIColor *titleBottomLineColor;

@end
