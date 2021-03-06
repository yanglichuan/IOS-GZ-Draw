//
//  ViewController.m
//  B06.图片水印
//
//  Created by Apple on 15/1/2.
//  Copyright (c) 2015年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CZ.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageView.image = [UIImage waterImageWithBgImageName:@"scene" waterImageName:@"logo" scale:2];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    // 生成一张有水印的图片，一定要获取UIImage对象 然后显示在imageView上
    
    //创建一背景图片
    UIImage *bgImage = [UIImage imageNamed:@"scene"];
    NSLog(@"bgImage Size: %@",NSStringFromCGSize(bgImage.size));
    // 1.创建一个位图【图片】，开启位图上下文
    // size:位图大小
    // opaque: alpha通道 YES:不透明/ NO透明 使用NO,生成的更清析
    // scale 比例 设置0.0为屏幕的比例
    // scale 是用于获取生成图片大小 比如位图大小：20X20 / 生成一张图片：（20 *scale X 20 *scale)
    NSLog(@"当前屏幕的比例 %f",[UIScreen mainScreen].scale);
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 4);
    
    // 2.画背景图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画水印
    // 算水印的位置和大小
    // 一般会通过一个比例来缩小水印图片
    UIImage *waterImage = [UIImage imageNamed:@"logo"];
    
    CGFloat waterScale = 0.4;
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 4.从位图上下文获取 当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    // 5.结束当前位置编辑
    UIGraphicsEndImageContext();
    
    
    // 6.显示在UImageView上
    self.imageView.image = newImage;
    
    // 7.将Image保存成一张png
    // 7.1将UIImage转成NSData对象，NSData有个write方法可以保存图片
    
    // 保存png
  //  NSData *imgData = UIImagePNGRepresentation(newImage);
    //[imgData writeToFile:@"/Users/apple/Desktop/new.png" atomically:YES];
    
    
    // 保存jpg
    //compressionQuality 压缩质量 值的范围(0-1)
    // 100KB * 0.7 = 70KB
    NSData *imgData = UIImageJPEGRepresentation(newImage, 0.7);
    [imgData writeToFile:@"/Users/apple/Desktop/new.jpg" atomically:YES];
    
    
}

@end
