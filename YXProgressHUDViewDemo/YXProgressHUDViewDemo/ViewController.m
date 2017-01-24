//
//  ViewController.m
//  YXProgressHUDViewDemo
//
//  Created by 曹云霄 on 2017/1/24.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "ViewController.h"
#import "YXTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *YXTableView;
@property (nonatomic,strong) NSArray *menuArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YXTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.menuArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return self.menuArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark -YXProgressHUDView
- (void)showYXProgressHUDView:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
}
















#pragma mark -lazy
- (NSArray *)menuArray
{
    if (!_menuArray) {
        _menuArray = @[@"Display a text box",@"Continuous load box",@"Load the success",@"Load failed",@"The progress bar",@"Dismiss"];
    }
    return _menuArray;
}


@end
