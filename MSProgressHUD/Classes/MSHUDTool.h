//
//  MSHUDTool.h
//  MSProgressHUD
//
//  Created by Myshao on 2020/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MSHUDTool : NSObject
//  加载菊花,
+ (void)show;

//  加载菊花,带文字
+ (void)showProgress:(NSString *) msg;

//  显示文字(默认底部)
+ (void)showMessage:(NSString *) msg;

//  显示文字(中间显示)
+ (void)showMessageCenter:(NSString *) msg;

//  显示成功提示
+ (void)showSuccess:(NSString *) msg;

//  显示失败提示
+ (void)showError:(NSString *) msg;
+ (void)showError:(NSString *)msg hideDelay:(NSTimeInterval)delay;

//  隐藏
+ (void)hide;

//  隐藏(可设置时间)
+ (void)hideDelayTime:(NSInteger)delay;



#pragma showInCustomView -显示在指定视图上

// 加载菊花,,指定显示视图
+ (void)showInView:(UIView *)view;

//  加载菊花,带文字,指定显示视图
+ (void)showProgress:(NSString *)msg inView:(UIView *)view;

//  显示文字底部,指定显示视图
+ (void)showMessage:(NSString *)msg inView:(UIView *)view;

//  显示文字(中间显示),指定显示视图
+ (void)showMessageCenter:(NSString *) msg inView:(UIView *)view;

//  显示成功提示,指定显示视图
+ (void)showSuccess:(NSString *)msg inview:(UIView *)view;

//  显示失败提示,指定显示视图
+ (void)showError:(NSString *)msg inview:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
