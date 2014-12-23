//
//  Utils.m
//  zhichun
//
//  Created by seanchense on 14/12/18.
//  Copyright (c) 2014年 zhichun. All rights reserved.
//

#import "Utils.h"
#import "MBProgressHUD.h"
#import "INTULocationManager.h"

@implementation Utils


+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    hud.detailsLabelText = msg;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:0.8];
    
    
}

+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg time:(NSInteger)time{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    hud.detailsLabelText = msg;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:time];
    
    
}

+ (void) warningUserAfterJump:(UIViewController *)viewController msg:(NSString *)msg time:(NSInteger)time {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:viewController.view.window animated:YES];
    hud.detailsLabelText = msg;
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:time];
}

+ (UIActivityIndicatorView *) showIndicator:(UIViewController *)viewController {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    UIBarButtonItem* btn_indicator = [[UIBarButtonItem alloc] initWithCustomView:indicator];
    viewController.navigationItem.rightBarButtonItem = btn_indicator;
    [indicator startAnimating];
    
    return indicator;
}

+ (UIActivityIndicatorView *) showIndicatorWithUINavigtationItem:(UINavigationItem *)navigationItem {
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    UIBarButtonItem* btn_indicator = [[UIBarButtonItem alloc] initWithCustomView:indicator];
    navigationItem.rightBarButtonItem = btn_indicator;
    [indicator startAnimating];
    
    return indicator;
}

+ (void) hideIndicator:(UIViewController *)viewController indicator:(UIActivityIndicatorView *)indicator{
    
    if (indicator) {
        [indicator stopAnimating];
        
    }
}

+ (void) hideIndicator:(UIViewController *)viewController indicator:(UIActivityIndicatorView *)indicator insteadOf:(UIBarButtonItem *)btn{
    
    if (indicator) {
        [indicator stopAnimating];
        viewController.navigationItem.rightBarButtonItem = btn;
    }
}


+ (void) hideIndicatorWithUINavigationItem:(UINavigationItem *)navigationItem indicator:(UIActivityIndicatorView *)indicator {
    
    if (indicator) {
        [indicator stopAnimating];
        
    }
}

+ (void) hideIndicatorWithUINavigationItem:(UINavigationItem *)navigationItem indicator:(UIActivityIndicatorView *)indicator insteadOf:(UIBarButtonItem *)btn {
    
    if (indicator) {
        [indicator stopAnimating];
        navigationItem.rightBarButtonItem = btn;
    }
}

// 获取经纬度
+ (void)getPosition:(UIViewController *)viewController block:(ZcBlock)block{
    INTULocationManager *locMgr = [INTULocationManager sharedInstance];
    __block NSString* position;
    [locMgr requestLocationWithDesiredAccuracy:INTULocationAccuracyHouse
                                       timeout:2.0
                          delayUntilAuthorized:YES  // This parameter is optional, defaults to NO if omitted
                                         block:^(CLLocation *currentLocation, INTULocationAccuracy achievedAccuracy, INTULocationStatus status) {
                                             if (status == INTULocationStatusSuccess) {
                                                 // Request succeeded, meaning achievedAccuracy is at least the requested accuracy, and
                                                 // currentLocation contains the device's current location.
                                                 position = [NSString stringWithFormat:@"%f-%f",currentLocation.coordinate.longitude, currentLocation.coordinate.latitude];
                                                 NSLog(@"获取经纬度成功 %@",position);
                                                 block(0, position);
                                                 
                                             }
                                             else if (status == INTULocationStatusTimedOut) {
                                                 // Wasn't able to locate the user with the requested accuracy within the timeout interval.
                                                 // However, currentLocation contains the best location available (if any) as of right now,
                                                 // and achievedAccuracy has info on the accuracy/recency of the location in currentLocation.
                                                 position = [NSString stringWithFormat:@"%f-%f",currentLocation.coordinate.longitude, currentLocation.coordinate.latitude];
                                                 NSLog(@"获取经纬度超时，使用上一次的数据 %@",position);
                                                 block(0, position);
                                             }
                                             else {
                                                 // An error occurred, more info is available by looking at the specific status returned.
                                                 [self warningUser:viewController msg:@"获取经纬度失败"];
                                                 
                                             }
                                             
                                         }];
    
    
}
@end
