//
//  CATransactionController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/7/25.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "CATransactionController.h"

@interface CATransactionController ()
@property (nonatomic, strong)  CALayer *colorLayer;
@property (weak, nonatomic) IBOutlet UIView *layerView;
@end

@implementation CATransactionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (IBAction)btnClick:(id)sender {
    // 没有使用事务
//    CGFloat red = arc4random() / (CGFloat)INT_MAX;
//    CGFloat green = arc4random() / (CGFloat)INT_MAX;
//    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
//    self.colorLayer.backgroundColor  =[UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
    // 使用事务
    [self changeColorWithCATransaction];
}

- (void)changeColorWithCATransaction
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    [CATransaction commit];
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
