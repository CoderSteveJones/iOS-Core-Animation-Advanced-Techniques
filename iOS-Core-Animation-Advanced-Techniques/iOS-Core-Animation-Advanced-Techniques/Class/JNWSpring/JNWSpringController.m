//
//  JNWSpringController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/8/8.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "JNWSpringController.h"
#import "JNWSpringAnimation.h"
@interface JNWSpringController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation JNWSpringController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.layerView.layer.cornerRadius = 50;
    self.layerView.layer.masksToBounds = YES;
    
    JNWSpringAnimation *ani = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
    ani.damping = 6; // 阻尼系数
    ani.stiffness = 100; // 弹性系数
    ani.mass = 2; // 质量
    ani.fromValue = @1;
    ani.toValue = @2;
    [self.layerView.layer addAnimation:ani forKey:ani.keyPath];
    
    // 结束默认回到初始值  所以设置为结束值  让其保持结束状态
    self.layerView.transform = CGAffineTransformMakeScale(2, 2);

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
