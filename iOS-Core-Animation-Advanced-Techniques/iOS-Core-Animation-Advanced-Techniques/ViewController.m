//
//  ViewController.m
//  iOS-Core-Animation-Advanced-Techniques
//
//  Created by 江奔 on 2017/6/19.
//  Copyright © 2017年 江奔. All rights reserved.
//

#import "ViewController.h"
#import "TitleCell.h"
#import "CoordinateSystemController.h"
#import "HitTestingController.h"
#import "ShadowController.h"
#import "AffineController.h"
#import "ThreeDController.h"
#import "CAShapeLayerController.h"
#import "CATransformLayerController.h"
#import "CAGradientLayerController.h"
#import "CAEmitterLayerController.h"
#import "CATransactionController.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *titles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    self.tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark - datasource delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCellId"];
    cell.titleLab.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
             [self performSegueWithIdentifier:@"coorVC" sender:self];
        }
            
            break;
        case 1:
        {
            [self performSegueWithIdentifier:@"hitVC" sender:self];
        }
            
            break;
        case 2:
        {
            [self performSegueWithIdentifier:@"shadowVC" sender:self];
        }
            
            break;
        case 3:
        {
            [self performSegueWithIdentifier:@"affineVC" sender:self];
        }
            
            break;
        case 4:
        {
            [self performSegueWithIdentifier:@"threeDVC" sender:self];
        }
            
            break;
        case 5:
        {
            [self performSegueWithIdentifier:@"shapeLayer" sender:self];
        }
            
            break;
        case 6:
        {
            [self performSegueWithIdentifier:@"CATransformLayer" sender:self];
        }
            
            break;
        case 7:
        {
            [self performSegueWithIdentifier:@"CAGradientLayer" sender:self];
        }
            
            break;
        case 8:
        {
            [self performSegueWithIdentifier:@"CAEmitterLayer" sender:self];
        }
            
            break;
        case 9:
        {
            [self performSegueWithIdentifier:@"CATransaction" sender:self];
        }
            
            break;
            
        default:
            break;
    }
}
#pragma mark - prepareForSegue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"coorVC"]) {
        CoordinateSystemController *vc = [segue destinationViewController];
        vc.title = @"坐标系";
    }else if ([segue.identifier isEqualToString:@"hitVC"]){
        HitTestingController *vc = [segue destinationViewController];
        vc.title = @"Hit testing";
    }else if ([segue.identifier isEqualToString:@"shadowVC"]){
        ShadowController *vc = [segue destinationViewController];
        vc.title = @"阴影";
    }else if ([segue.identifier isEqualToString:@"affineVC"]){
        AffineController *vc = [segue destinationViewController];
        vc.title = @"仿射变换";
    }else if ([segue.identifier isEqualToString:@"threeDVC"]){
        ThreeDController *vc = [segue destinationViewController];
        vc.title = @"3D变化";
    }else if ([segue.identifier isEqualToString:@"shapeLayer"]){
        CAShapeLayerController *vc = [segue destinationViewController];
        vc.title = @"CAShapeLayer";
    }else if ([segue.identifier isEqualToString:@"CATransformLayer"]){
        CATransformLayerController *vc = [segue destinationViewController];
        vc.title = @"CATransformLayer";
    }else if ([segue.identifier isEqualToString:@"CAGradientLayer"]) {
        CAGradientLayerController *vc =[segue destinationViewController];
        vc.title = @"CAGradientLayer";
    }else if ([segue.identifier isEqualToString:@"CAEmitterLayer"]){
        CAEmitterLayerController *vc = [segue destinationViewController];
        vc.title = @"CAEmitterLayer";
    }else if ([segue.identifier isEqualToString:@"CATransaction"]){
        CATransactionController *vc = [segue destinationViewController];
        vc.title = @"CATransaction";
    }
}

#pragma mark - lazyload
- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"坐标系",@"Hit Testing",@"阴影",@"仿射变换",@"3D变化",@"CAShapeLayer",@"CATransformLayer",@"CAGradientLayer",@"CAEmitterLayer",@"CATransaction"];
    }
    return _titles;
}




@end
