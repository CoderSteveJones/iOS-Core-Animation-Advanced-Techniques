//
//  ShadowController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/6/20.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "ShadowController.h"

@interface ShadowController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ShadowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.blueView.layer.shadowOpacity = 0.5;
    self.blueView.layer.shadowOffset = CGSizeMake(0, 3);
    self.blueView.layer.shadowRadius = 5;
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
