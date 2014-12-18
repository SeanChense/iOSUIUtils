//
//  Utils.m
//  zhichun
//
//  Created by seanchense on 14/12/18.
//  Copyright (c) 2014年 zhichun. All rights reserved.
//

#import "Utils.h"
#import "MBProgressHUD.h"


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

+ (void) showIndicator:(UIViewController *)viewController indicator:(UIActivityIndicatorView *)indicator{
    
    indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    UIBarButtonItem* btn_indicator = [[UIBarButtonItem alloc] initWithCustomView:indicator];
    viewController.navigationItem.rightBarButtonItem = btn_indicator;
    [indicator startAnimating];
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

@end
