//
//  ViewController.m
//  A01.画饼状
//
//  Created by Apple on 15/1/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZPieView.h"//饼状图

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //实现饼状图 - quartz2d 画不同比例的扇形
    
    //1.自定义view
    CZPieView *pieView =[[CZPieView alloc] init];
    pieView.frame = CGRectMake(10, 40, 200, 200);
    pieView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pieView];
    
    
    //2.在自定义的view给个数据属性[NSArray]，往sections添加数据
    pieView.sections = @[@20,@30,@40,@10];
    
    // 设置颜色
    pieView.sectionColors = @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor],[UIColor yellowColor]];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
