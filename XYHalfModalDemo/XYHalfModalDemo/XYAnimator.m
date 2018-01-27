//
//  XYAnimator.m
//  XYHalfModalDemo
//
//  Created by Accepted_ on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import "XYAnimator.h"
#import "XYPresentationController.h"

@interface XYAnimator ()<UIViewControllerTransitioningDelegate>


/** 弹出的控制器的高度 */
@property (nonatomic, assign) CGFloat cHeight;

@property (nonatomic, assign) CGFloat dimAlpha;

@end

@implementation XYAnimator

- (instancetype)initWithCHeight:(CGFloat)cHeight andDimALpha:(CGFloat)dimAlpha
{
    self = [super init];
    if (self) {
        _cHeight = cHeight;
        _dimAlpha = dimAlpha;
    }
    return self;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    
    XYPresentationController * prensentVc = [[XYPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting andControllerHeight:self.cHeight andDimAlpha:_dimAlpha];
    
    
    return prensentVc;
}

@end
