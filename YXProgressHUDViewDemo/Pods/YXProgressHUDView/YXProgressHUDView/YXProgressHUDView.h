//
//  YXProgressHUDView.h
//  Framework
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUD_Configuration.h"
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"



@interface YXProgressHUDView : NSObject


/**
 文本提示框
 
 @param message message
 */
extern void ShowMessage(NSString *message);

/**
 加载框
 默认主窗口

 @param message 提示信息
 */
extern void ShowDefaultLoadingView(NSString *message);

/**
 加载框
 自定义窗口

 @param view    自定义View
 @param message 提示信息
 */
extern void ShowLoadingView(UIView *view,NSString *message);

/**
 加载成功
 默认主窗口

 @param message    提示信息
 @param completed  完成回调
 */
extern void ShowDefaultSuccessView(NSString *message,void(^completed)());

/**
 加载成功
 自定义窗口

 @param view       自定义View
 @param message    提示信息
 @param completed  完成回调
 */
extern void ShowSuccessView(UIView *view,NSString *message,void(^completed)());

/**
 加载失败
 默认主窗口

 @param message    提示信息
 @param completed  完成回调
 */
extern void ShowDefaultErrorView(NSString *message,void(^completed)());

/**
 加载失败
 自定义窗口

 @param view       自定义View
 @param message    提示信息
 @param completed  完成回调
 */
extern void ShowErrorView(UIView *view,NSString *message,void(^completed)());

/**
 加载进度
 默认主窗口

 @param message   提示信息
 @param mode      MBProgressHUDMode
 @return          MBProgressHUD
 */
extern MBProgressHUD* ShowDefaultProgressView(NSString *message,MBProgressHUDMode mode);

/**
 加载进度
 自定义窗口

 @param view      自定义View
 @param message   提示信息
 @param mode      MBProgressHUDMode
 @return          MBProgressHUD
 */
extern MBProgressHUD* ShowProgressView(UIView *view,NSString *message,MBProgressHUDMode mode);

/**
 销毁默认主窗口所有HUD
 */
extern void DismissDefaultHud(void);


/**
 销毁指定View所有HUD

 @param view View
 */
extern void DismissHud(UIView *view);

@end
