//
//  XYHalfViewController.h
//  XYHalfModalDemo
//
//  Created by ocrgroup on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 此控制器为只弹出一部分的控制器。所有的UI布局在这个控制器内实现
 */
@interface XYHalfViewController : UIViewController


/**
 自定义init方法

 @param cHeight 要弹出的控制器的高度(设置为0或负数则默认为500)
 @param dimAlpha 顶部留空处黑色蒙版的透明度 0-透明 1-不透明(全黑)(设置为负数则默认为0.5,>1则默认为1)
 @return 对象实例
 */
- (instancetype)initWithCHeight:(CGFloat)cHeight andDimAlpha:(CGFloat)dimAlpha;

@end
