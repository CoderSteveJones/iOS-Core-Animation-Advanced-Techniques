//
//  CABasicAnimationController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/7/25.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "CABasicAnimationController.h"
#import "UIView+TC.h"
@interface CABasicAnimationController ()
@property (weak, nonatomic) IBOutlet UIImageView *layerImgView;

@end

@implementation CABasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 缩放动画
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(20, 80, 50, 50);
    layer.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    layer.cornerRadius = 25;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:1.3];
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.5;
    animation.repeatCount = MAXFLOAT;
    
    [layer addAnimation:animation forKey:@"scaleAnimation"];
    
    //Img点击 (缩放动画)
    self.layerImgView.layer.cornerRadius = 25;
    self.layerImgView.layer.masksToBounds = YES;
    self.layerImgView.layer.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    [self.layerImgView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        ani.fromValue = [NSNumber numberWithFloat:1.0];
        ani.toValue = [NSNumber numberWithFloat:1.3];
        ani.autoreverses = YES;
        ani.fillMode = kCAFillModeForwards;
        animation.removedOnCompletion = NO;
        animation.duration = 1;
        [self.layerImgView.layer addAnimation:ani forKey:@"tapAni"];
    }];
    
    // 平移动画
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(20, CGRectGetMaxY(layer.frame) + 30, 50, 50);
    layer1.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    layer1.cornerRadius = 25;
    layer1.masksToBounds = YES;
    [self.view.layer addSublayer:layer1];
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
    animation1.fromValue = [NSValue valueWithCGPoint:layer1.position];
    animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(300, CGRectGetMaxY(layer.frame) + 55)];
    animation1.autoreverses = YES;
    animation1.fillMode = kCAFillModeForwards;
    animation1.removedOnCompletion = NO;
    animation1.duration = 1;
    animation1.repeatCount = MAXFLOAT;
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer1 addAnimation:animation1 forKey:@"positionAnimation"];
    
    // 旋转动画
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(20, CGRectGetMaxY(self.layerImgView.frame)+ 20, 50, 50);
    layer2.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    layer2.cornerRadius = 25;
    layer2.masksToBounds = YES;
    [self.view.layer addSublayer:layer2];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    animation2.fromValue = [NSNumber numberWithFloat:0.0];
    animation2.toValue = [NSNumber numberWithFloat:2 * M_PI];
    animation2.autoreverses = YES;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.duration = 1;
    animation2.repeatCount = MAXFLOAT;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [layer2 addAnimation:animation2 forKey:@"roationAni"];
    
    
    
    // 动画组
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(20, CGRectGetMaxY(layer2.frame)+ 20, 50, 50);
    layer3.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    layer3.cornerRadius = 25;
    layer3.masksToBounds = YES;
    [self.view.layer addSublayer:layer3];
    
    
    CAAnimationGroup *groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[animation,animation2];
    groupAni.duration = 2;
    groupAni.repeatCount = MAXFLOAT;
    
    [layer3 addAnimation:groupAni forKey:@"groupAni"];
    
    
}

@end
