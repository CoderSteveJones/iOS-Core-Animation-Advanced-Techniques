//
//  CAEmitterLayerController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/7/20.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "CAEmitterLayerController.h"

@interface CAEmitterLayerController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation CAEmitterLayerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.layerView.bounds;
    emitter.preservesDepth = YES;
    [self.layerView.layer addSublayer:emitter];
    
    //configure emitter
    emitter.renderMode = kCAEmitterLayerOldestFirst;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    
    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"wujiaoxing.png"].CGImage;
    cell.birthRate = 10;
    cell.lifetime = 5.0;
//    cell.color = [UIColor yellowColor].CGColor;
    cell.alphaSpeed = -0.6;
    cell.velocity = 50;
    cell.velocityRange = 30;
    cell.emissionRange = M_PI * 2.0;
    
    //add particle template to emitter
    emitter.emitterCells = @[cell];
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
