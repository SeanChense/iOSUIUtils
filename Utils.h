//
//  Utils.h
//  zhichun
//
//  Created by seanchense on 14/12/18.
//  Copyright (c) 2014年 zhichun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utils : NSObject

//弹出提示
+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg;
+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg time:(NSInteger)time;
+ (void) warningUserAfterJump:(UIViewController *) viewController msg:(NSString *) msg time:(NSInteger)time;
//在导航栏右边显示菊花
+ (UIActivityIndicatorView *) showIndicator:(UIViewController *) viewControllerindicator;
//在导航栏右边隐藏菊花
+ (void) hideIndicator:(UIViewController *) viewControllerindicator indicator:(UIActivityIndicatorView *)indicator;
+ (void) hideIndicator:(UIViewController *) viewControllerindicator indicator:(UIActivityIndicatorView *)indicator insteadOf:(UIBarButtonItem *)btn;
@end

