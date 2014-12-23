//
//  Utils.h
//  zhichun
//
//  Created by seanchense on 14/12/18.
//  Copyright (c) 2014年 zhichun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^ZcBlock) (NSUInteger ret, id data);
@interface Utils : NSObject

//弹出提示
+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg;
+ (void) warningUser:(UIViewController *) viewController msg:(NSString *) msg time:(NSInteger)time;
+ (void) warningUserAfterJump:(UIViewController *) viewController msg:(NSString *) msg time:(NSInteger)time;

//在导航栏右边显示菊花
+ (UIActivityIndicatorView *) showIndicator:(UIViewController *) viewControllerindicator;
+ (UIActivityIndicatorView *) showIndicatorWithUINavigtationItem:(UINavigationItem *)navigationItem;

//在导航栏右边隐藏菊花
+ (void) hideIndicator:(UIViewController *) viewControllerindicator indicator:(UIActivityIndicatorView *)indicator;
+ (void) hideIndicator:(UIViewController *) viewControllerindicator indicator:(UIActivityIndicatorView *)indicator insteadOf:(UIBarButtonItem *)btn;

//在导航栏右边隐藏菊花 segue 为 modal 的形式
+ (void) hideIndicatorWithUINavigationItem:(UINavigationItem *)navigationItem indicator:(UIActivityIndicatorView *)indicator;
+ (void) hideIndicatorWithUINavigationItem:(UINavigationItem *)navigationItem indicator:(UIActivityIndicatorView *)indicator insteadOf:(UIBarButtonItem *)btn;
+ (void) getPosition:(UIViewController *) viewController block:(ZcBlock)block;
@end

