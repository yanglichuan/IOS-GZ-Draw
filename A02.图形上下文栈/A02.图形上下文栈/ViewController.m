//
//  ViewController.m
//  A02.图形上下文栈
//
//  Created by Apple on 15/1/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZCustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 添加自定义的view
    CZCustomView *customView = [[CZCustomView alloc] initWithFrame:CGRectMake(10, 40, 200, 200)];
    customView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
