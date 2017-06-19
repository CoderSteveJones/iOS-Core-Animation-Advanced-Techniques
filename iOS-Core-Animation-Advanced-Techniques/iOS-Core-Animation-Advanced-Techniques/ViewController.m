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
    }
}

#pragma mark - lazyload
- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"坐标系",@"Hit Testing"];
    }
    return _titles;
}




@end
