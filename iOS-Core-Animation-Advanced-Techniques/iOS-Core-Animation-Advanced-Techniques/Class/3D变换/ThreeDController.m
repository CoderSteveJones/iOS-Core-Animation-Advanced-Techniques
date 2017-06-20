//
//  ThreeDController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/6/20.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "ThreeDController.h"

@interface ThreeDController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end

@implementation ThreeDController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.iconImageView.layer.shadowOpacity = 0.5;
    self.iconImageView.layer.shadowOffset = CGSizeMake(0, 3);
    self.iconImageView.layer.shadowRadius = 5;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self rotationTest];
    
    [self perspectiveTest];
}

/**
 旋转测试
 */
- (void)rotationTest
 {
     [UIView animateWithDuration:2.5 animations:^{
         
         self.iconImageView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
         
     }];

}


/**
 透视投影
 */
- (void)perspectiveTest
{
    [UIView animateWithDuration:2.5 animations:^{
        
        CATransform3D transform = CATransform3DIdentity;
        //apply perspective
        transform.m34 = - 1.0 / 500.0;
        //rotate by 45 degrees along the Y axis
        transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
        //apply to layer
        self.iconImageView.layer.transform = transform;
    }];
    
    
}
@end
