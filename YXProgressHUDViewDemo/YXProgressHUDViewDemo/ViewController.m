//
//  ViewController.m
//  YXProgressHUDViewDemo
//
//  Created by 曹云霄 on 2017/1/24.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "ViewController.h"
#import "YXTableViewCell.h"
#import "YXProgressHUDView.h"

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
    [self showYXProgressHUDView:indexPath];
    
}

#pragma mark -YXProgressHUDView
- (void)showYXProgressHUDView:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ShowMessage(self.menuArray[indexPath.row]);
        }
            break;
        case 1:
        {
            ShowDefaultLoadingView(self.menuArray[indexPath.row]);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                DismissDefaultHud();
            });
        }
            break;
        case 2:
        {
            ShowDefaultSuccessView(self.menuArray[indexPath.row], ^{
                
            });
        }
            break;
        case 3:
        {
            ShowDefaultErrorView(self.menuArray[indexPath.row], ^{
                
            });
        }
            break;
        case 4:
        {
            MBProgressHUD *hud = ShowDefaultProgressView(self.menuArray[indexPath.row], MBProgressHUDModeAnnularDeterminate);
            hud.progress = 100;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                DismissDefaultHud();
            });
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
