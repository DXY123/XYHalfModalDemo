//
//  XYPresentationController.h
//  XYHalfModalDemo
//
//  Created by ocrgroup on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPresentationController : UIPresentationController


/**
 自定义initWithPresentedViewController: presentingViewController:方法

 @param presentedViewController 原本的控制器
 @param presentingViewController 要弹出的控制器
 @param cHeight 要弹出的控制器的高度
 @return 对象实例
 */
- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController andControllerHeight:(CGFloat)cHeight andDimAlpha:(CGFloat)dimAlpha;

@end
