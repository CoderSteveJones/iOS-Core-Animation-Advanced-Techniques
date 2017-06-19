//
//  HitTestingController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/6/19.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "HitTestingController.h"

@interface HitTestingController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;
@property (strong, nonatomic) CALayer *blueLayer;
@end

@implementation HitTestingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.blueLayer = [CALayer layer];
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    self.blueLayer.frame = CGRectMake(50, 50, 100, 100);
    [self.layerView.layer addSublayer:self.blueLayer];
    
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
