//
//  XYPresentationController.m
//  XYHalfModalDemo
//
//  Created by ocrgroup on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import "XYPresentationController.h"

//要弹出的控制器的高度
#define XYHALFMODALHEIGHT 500


@interface XYPresentationController ()

//黑色半透明蒙版

@property(nonatomic,strong)UIView * dimView;

//点击手势,点击dismiss控制器

@property(nonatomic,strong)UITapGestureRecognizer * tap;

@property (nonatomic, assign) CGFloat controllerHeight;

@property (nonatomic, assign) CGFloat dimAlpha;

@end

@implementation XYPresentationController

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController andControllerHeight:(CGFloat)cHeight andDimAlpha:(CGFloat)dimAlpha {
    self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    if (self) {
        _controllerHeight = cHeight;
        _dimAlpha = dimAlpha;
    }
    return self;
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    
    //presentedView即我们主要内容显示的区域
    UIView * mainView =self.presentedView;
    
    [self.containerView addSubview:mainView];
    
    //弹出Controller之后,上面空白的部分加个蒙版,点击后可以dismiss掉控制器
    [self.containerView insertSubview:self.dimView atIndex:0];
    
    [self.dimView addGestureRecognizer:self.tap];
    
    //透明度容错处理
    if (self.dimAlpha >=1) {
        self.dimAlpha = 1;
    }else if (self.dimAlpha <0) {
        self.dimAlpha = 0.5;
    }
    //动画改变透蒙版明度
    [UIView animateWithDuration:0.25 animations:^{
        self.dimView.alpha = self.dimAlpha;
    }];
    
    
    [self frameSetup];
}

- (void)dismissalTransitionWillBegin {
    NSLog(@"");
    [UIView animateWithDuration:0.25 animations:^{
        self.dimView.alpha = 0;
    }];
}


- (void)frameSetup {
    
    CGFloat x,y,w,h,cHeight;
    
    //避免高度为0或者为负数的情况
    cHeight = self.controllerHeight <= 0 ? XYHALFMODALHEIGHT:self.controllerHeight;
    
    x = 0;
    //屏幕高度 - 要弹出的控制器的高度
    y = [UIScreen mainScreen].bounds.size.height - cHeight;
    
    w = [UIScreen mainScreen].bounds.size.width;
    
    //要弹出的控制器的高度,为方便修改，定义一个宏，日后需求有变可直接修改宏。
    h = cHeight;
    
    self.presentedView.frame = CGRectMake(x, y, w, h);
    
    y = 0;
    
    h = [UIScreen mainScreen].bounds.size.height;
    
    self.dimView.frame = CGRectMake(x,  y,  w,  h);
    
}

#pragma mark - 点击手势处理事件

- (void)tapClick {

    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Lazy load

- (UIView *)dimView {
    if (!_dimView) {
        _dimView = [[UIView alloc] init];
        _dimView.backgroundColor = [UIColor blackColor];
        _dimView.alpha = 0;
    }
    return _dimView;
}

- (UITapGestureRecognizer *)tap {
    if (!_tap) {
        _tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    }
    return _tap;
}

@end
