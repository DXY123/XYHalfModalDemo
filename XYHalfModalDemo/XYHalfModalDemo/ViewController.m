//
//  ViewController.m
//  XYHalfModalDemo
//
//  Created by Accepted_ on 2018/1/8.
//  Copyright © 2018年 Accepted_. All rights reserved.
//

#import "ViewController.h"
#import "XYHalfViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //此Label仅做提示用，所以我没使用懒加载
    UILabel * tipLabel = [[UILabel alloc] init];
    tipLabel.text = @"点击屏幕任意处弹出控制器";
    [self.view addSubview:tipLabel];
    
    tipLabel.frame = CGRectMake(40, 100, 250, 30);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //想要自定义高度和蒙版透明度使用自定义init方法创建，使用原生init将使用默认参数弹出控制器
//    XYHalfViewController * halfVC = [[XYHalfViewController alloc] init];
    XYHalfViewController * halfVC = [[XYHalfViewController alloc] initWithCHeight:510 andDimAlpha:0.4];
    [self presentViewController:halfVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
