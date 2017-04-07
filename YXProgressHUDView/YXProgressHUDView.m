//
//  YXProgressHUDView.m
//  Framework
//
//  Created by 曹云霄 on 2017/1/22.
//  Copyright © 2017年 曹云霄. All rights reserved.
//

#import "YXProgressHUDView.h"

@implementation YXProgressHUDView



/**
 初始化
 */
MBProgressHUD* baseHUDView(UIView *view){
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.contentColor = HUDContentColor;
    hud.bezelView.backgroundColor = HUDBezelViewColor;
    hud.bezelView.layer.cornerRadius = HUDBezelViewCornerRadius;
    hud.margin = HUDContentMargin;
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}


/**
 文本提示框
 
 @param message message
 */
void ShowMessage(NSString *message) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            hud.label.text = message;
            hud.mode = MBProgressHUDModeText;
            [hud hideAnimated:YES afterDelay:HUDShowTime];
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.mode = MBProgressHUDModeText;
        [hud hideAnimated:YES afterDelay:HUDShowTime];
    }
}


/**
 持续加载框
 默认窗口
 
 @param message 提示信息
 */
void ShowDefaultLoadingView(NSString *message) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            hud.label.text = message;
            hud.mode = MBProgressHUDModeIndeterminate;
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}


/**
 持续加载框
 自定义窗口
 
 @param message 提示信息
 @param view    自定义View
 */
void ShowLoadingView(UIView *view,NSString *message) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            hud.label.text = message;
            hud.mode = MBProgressHUDModeIndeterminate;
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        hud.label.text = message;
        hud.mode = MBProgressHUDModeIndeterminate;
    }
}


/**
 加载成功
 默认窗口
 
 @param message   提示信息
 @param completed 完成回调
 */
void ShowDefaultSuccessView(NSString *message,void(^completed)()) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            PerformCustomHUDMethod(hud,message,@"success",completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        PerformCustomHUDMethod(hud,message,@"success",completed);
    }
}

/**
 加载成功
 自定义窗口
 
 @param view      自定义View
 @param message   提示信息
 @param completed 完成回调
 */
void ShowSuccessView(UIView *view,NSString *message,void(^completed)()) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            PerformCustomHUDMethod(hud,message,@"success",completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        PerformCustomHUDMethod(hud,message,@"success",completed);
    }
}


/**
 加载失败
 默认窗口
 
 @param message   提示信息
 @param completed 完成回调
 */
void ShowDefaultErrorView(NSString *message,void(^completed)()) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(DefalutWindow());
            PerformCustomHUDMethod(hud,message,@"error",completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(DefalutWindow());
        PerformCustomHUDMethod(hud,message,@"error",completed);
    }
}

/**
 加载失败
 自定义窗口
 
 @param view      自定义View
 @param message   提示信息
 @param completed 完成回调
 */
void ShowErrorView(UIView *view,NSString *message,void(^completed)()) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            MBProgressHUD *hud = baseHUDView(view);
            PerformCustomHUDMethod(hud,message,@"error",completed);
        });
    }else{
        MBProgressHUD *hud = baseHUDView(view);
        PerformCustomHUDMethod(hud,message,@"error",completed);
    }
}


/**
 执行自定义 HUD
 
 @param hud        MBProgressHUD
 @param message    提示信息
 @param imageName 自定义图片名称
 @param completed  完成回调
 */
void PerformCustomHUDMethod(MBProgressHUD *hud,NSString *message,NSString *imageName,void(^completed)()) {
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    UIImage *image = [getBundleImageName(imageName) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.bezelView.backgroundColor = HUDBezelViewColor
    [hud hideAnimated:YES afterDelay:HUDShowTime];
    if (completed) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(HUDShowTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            completed();
        });
    }
}


/**
 进度条
 默认窗口
 
 @param message    提示信息
 @param mode       MBProgressHUDMode
 */
MBProgressHUD* ShowDefaultProgressView(NSString *message,MBProgressHUDMode mode) {
    
    __block MBProgressHUD *hud;
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud = baseHUDView(DefalutWindow());
            hud.label.text = message;
            hud.mode = mode;
        });
    }else{
        hud = baseHUDView(DefalutWindow());
        hud.label.text = message;
        hud.mode = mode;
    }
    return hud;
}


/**
 进度条
 自定义窗口
 
 @param view       自定义View
 @param message    提示信息
 @param mode       GomoreMBProgressHUDMode
 */
MBProgressHUD* ShowProgressView(UIView *view,NSString *message,MBProgressHUDMode mode) {
    
    __block MBProgressHUD *hud;
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud = baseHUDView(view);
            hud.label.text = message;
            hud.mode = mode;
        });
    }else{
        hud = baseHUDView(view);
        hud.label.text = message;
        hud.mode = mode;
    }
    return hud;
}

/**
 销毁指定View 所有HUD
 */
void DismissHud(UIView *view) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            HideMBProgressHUDForView(view);
        });
    }else{
        HideMBProgressHUDForView(view);
    }
}


/**
 销毁默认窗口 所有HUD
 */
void DismissDefaultHud(void) {
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            HideMBProgressHUDForView(DefalutWindow());
        });
    }else{
        HideMBProgressHUDForView(DefalutWindow());
    }
}


/**
 执行销毁
 
 @param view UIView
 */
void HideMBProgressHUDForView(UIView *view) {
    
    NSArray *hudArray = AllIndicatorViewForView(view);
    for (MBProgressHUD *hudView in hudArray) {
        [hudView hideAnimated:YES];
    }
}


/**
 获取指定view的所有 HUD
 
 @param view UIView
 @return NSArray
 */
NSArray* AllIndicatorViewForView(UIView *view) {
    
    NSMutableArray *hudArray = [NSMutableArray array];
    NSArray *subviews = view.subviews;
    for (UIView *aView in subviews) {
        if ([aView isKindOfClass:[MBProgressHUD class]]) {
            [hudArray addObject:aView];
        }
    }
    return [NSArray arrayWithArray:hudArray];
}

/**
 默认窗口
 
 @return UIWindow
 */
UIView *DefalutWindow(void) {
    return  [[UIApplication sharedApplication].delegate window];
}

/**
 获取资源包图片
 
 @param imageName 图片名称
 */
UIImage* getBundleImageName(NSString *imageName) {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"YXProgressHUDView" ofType:@"bundle"];
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imagePath];
}













@end
