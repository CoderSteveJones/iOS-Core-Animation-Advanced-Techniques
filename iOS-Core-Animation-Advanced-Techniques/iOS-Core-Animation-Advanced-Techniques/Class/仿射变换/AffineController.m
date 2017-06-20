//
//  AffineController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/6/20.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "AffineController.h"

@interface AffineController ()
@property (weak, nonatomic) IBOutlet UIView *orangeView;

@end

@implementation AffineController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.0 animations:^{
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        transform = CGAffineTransformScale(transform, 0.5, 0.5);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        transform = CGAffineTransformTranslate(transform, 0, 200);
        self.orangeView.layer.affineTransform = transform;
    }];
}

@end
