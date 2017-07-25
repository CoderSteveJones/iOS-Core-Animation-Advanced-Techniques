//
//  CABasicAnimationController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/7/25.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "CABasicAnimationController.h"

@interface CABasicAnimationController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation CABasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 50, 50);
    layer.backgroundColor = [UIColor colorWithRed:241.0/255 green:158.0/255 blue:195.0/255 alpha:1.0].CGColor;
    layer.cornerRadius = 25;
    layer.masksToBounds = YES;
    [self.layerView.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:1.0];
    animation.toValue = [NSNumber numberWithFloat:1.3];
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = 0.5;
    animation.repeatCount = MAXFLOAT;
    
    [layer addAnimation:animation forKey:@"scaleAnimation"];
    
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
