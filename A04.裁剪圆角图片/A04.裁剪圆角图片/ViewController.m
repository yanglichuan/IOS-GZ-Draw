//
//  ViewController.m
//  A04.裁剪圆角图片
//
//  Created by Apple on 15/1/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CircleImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.自定义一个CircleImageView控件，在drawRect中，获取上下文，往上下文中添加一个圆的路径
    // 2.自定义的控制中，添加一个imageName属性，
    
    // 3.把自定的view添加到控制器View
    CircleImageView *imageView = [[CircleImageView alloc] initWithFrame:CGRectMake(10, 40, 100, 100)];
    
    // 设置图片
    imageView.imageName = @"papa";
    
    // 设置边框颜色和边框宽度
    imageView.borderColor = [UIColor blueColor];
    imageView.borderWidth =10;
    
    imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView];
    
    
    // 4.然后回到drawrect方法画图 调用CGContextClip的方法，裁剪路径之外多余的部分

    // 5.画圆的边框，使用CGContextAddEllipseInRect添加圆的路径，并使用CGContextStrokePath画空心圆;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
