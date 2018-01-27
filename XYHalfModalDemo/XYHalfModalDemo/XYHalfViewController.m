//
//  XYHalfViewController.m
//  XYHalfModalDemo
//
//  Created by ocrgroup on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import "XYHalfViewController.h"
#import "XYAnimator.h"

@interface XYHalfViewController ()

@end

@implementation XYHalfViewController {
    XYAnimator * _myAnimator;
}

//重写自定义init方法，给个默认值。防止外部不调用自定义init方法导致弹出控制器后黑屏
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        _myAnimator = [[XYAnimator alloc] initWithCHeight:500 andDimALpha:0.5];
        
        self.transitioningDelegate = _myAnimator;
        
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

//自定义init方法
- (instancetype)initWithCHeight:(CGFloat)cHeight andDimAlpha:(CGFloat)dimAlpha
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        _myAnimator = [[XYAnimator alloc] initWithCHeight:cHeight andDimALpha:dimAlpha];
        
        self.transitioningDelegate = _myAnimator;
        
        self.view.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
