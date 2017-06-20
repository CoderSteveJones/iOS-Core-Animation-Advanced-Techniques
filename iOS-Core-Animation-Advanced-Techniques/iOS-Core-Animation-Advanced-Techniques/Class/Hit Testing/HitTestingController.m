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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    [self containsPointTestWithTouches:touches];
    
    [self hitTestWithTouches:touches];
}


/**
 containsPointTestWithTouches

 @param touches touches
 */
- (void)containsPointTestWithTouches:(NSSet<UITouch *> *)touches
{
    // get touch position relative to main view
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // conver point to the white layer`s coordinates
    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
    
    if ([self.layerView.layer containsPoint:point]) {
        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
        if ([self.blueLayer containsPoint:point]) {
            NSLog(@"Inside blue layer");
        }else{
            NSLog(@"Inside orange layer");
        }
    }

}


/**
 hitTestWithTouches

 @param touches touches
 */
- (void)hitTestWithTouches:(NSSet<UITouch *> *)touches
{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    
    if (layer == self.blueLayer) {
        NSLog(@"Inside blue layer");
    }else if (layer == self.layerView.layer){
        NSLog(@"Inside orange layer");
    }
}

@end
