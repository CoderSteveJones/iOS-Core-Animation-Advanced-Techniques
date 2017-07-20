//
//  CAGradientLayerController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/7/20.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "CAGradientLayerController.h"

@interface CAGradientLayerController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@end

@implementation CAGradientLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // e.g1
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.layerView.bounds;
    [self.layerView.layer addSublayer:layer];
    
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    
    // e.g 2
    CAGradientLayer *layer1 = [CAGradientLayer layer];
    layer1.frame = self.layerView1.bounds;
    [self.layerView1.layer addSublayer:layer];
    
    layer1.colors = @[(__bridge id)[UIColor yellowColor].CGColor,(__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    [self.layerView1.layer addSublayer:layer1];
    
    // loaction 属性设置位置
    layer1.locations = @[@0,@0.25,@0.5];
    layer1.startPoint = CGPointMake(0, 0);
    layer1.endPoint = CGPointMake(1, 1);
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
