//
//  CZCustomView.m
//  A03-矩阵操作
//
//  Created by Apple on 15/1/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "CZCustomView.h"

@implementation CZCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //矩阵操作 平移、绽放，旋转
    
    // 画个三角形 + 画一条线
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
#warning qurtz2d的平移，要在绘制之前
    //平移
    //CGContextTranslateCTM(ctx, 0,50);
    
    //缩放
    //CGContextScaleCTM(ctx, 1.5, 1.5);
    
    //旋转
    // 负数 逆时针/ 正数 顺时针
    // 围绕左上角(0,0) 旋转
    CGContextRotateCTM(ctx, - M_PI * 0.25);
    
    
    // 定义三个点
    CGPoint points[3] = {{50,20},{100,80},{10,80}};
    CGContextAddLines(ctx, points, 3);
    
    // 合并三个点的路径
    CGContextClosePath(ctx);
    
    
    // 画线
    CGPoint linePoints[2] = {{10,20},{80,80}};
    CGContextAddLines(ctx, linePoints, 2);
    CGContextStrokePath(ctx);
    

    
    // 渲染
    CGContextStrokePath(ctx);
}


@end
