//
//  ViewController.m
//  AnimationDemo
//
//  Created by 沈文涛 on 15/11/22.
//  Copyright © 2015年 RyanShen. All rights reserved.
//

#import "ViewController.h"
#import "NVActivityIndicatorView.h"
@interface ViewController ()

@property (nonatomic, strong) NSArray *typeArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0 green:85/255.0 blue:101/255.0 alpha:1.0];
    
    NSInteger cols = 4;
    NSInteger rows = 7;
    CGFloat cellWidth = self.view.frame.size.width / cols;
    CGFloat cellHeigh = self.view.frame.size.height / rows;
    
    for (NSInteger index = 0; index < self.typeArray.count; index++) {
        
        NVActivityIndicatorView *indicatorView = [[NVActivityIndicatorView alloc] init];

        indicatorView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                                        green:arc4random_uniform(255)/255.0
                                                         blue:arc4random_uniform(255)/255.0
                                                        alpha:1.0];
        CGFloat x = index % cols * cellWidth;
        CGFloat y = index / rows * cellHeigh;
        indicatorView.frame = CGRectMake(x, y, cellWidth, cellHeigh);
        indicatorView.type = [self.typeArray[index] integerValue];
        [indicatorView startAnimation];
        [self.view addSubview:indicatorView];

//        2s后停止动画并且移除动画
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [indicatorView stopAnimation];
//            [indicatorView removeFromSuperview];
//        });
    }
}
/**
 *  存放动画的类型数组
 */
- (NSArray *)typeArray
{
    if (!_typeArray)
    {
        _typeArray = @[@(NVActivityIndicatorTypeBallPulse),
                       @(NVActivityIndicatorTypeBallScaleMultiple),
                       @(NVActivityIndicatorTypeBallSpinFadeLoader)];
    }
    return _typeArray;
}

@end
