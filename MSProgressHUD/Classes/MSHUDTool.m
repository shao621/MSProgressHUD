//
//  MSHUDTool.m
//  MSProgressHUD
//
//  Created by Myshao on 2020/4/3.
//

#import "MSHUDTool.h"
#import <MBProgressHUD/MBProgressHUD.h>
//  提示类型
typedef NS_ENUM(NSInteger, JYDProgressHUDType){
    JYDProgressHUDTypeJHLoading,                 //菊花
    JYDProgressHUDTypeOnlyText,                  //文字底部显示
    JYDProgressHUDTypeOnlyTextCenter,            //文字中间显示
    JYDProgressHUDTypeSuccess,                   //成功
    JYDProgressHUDTypeError,                     //失败
    JYDProgressHUDTypeCustomAnimation,           //自定义加载动画（序列帧实现）
};


@interface MSHUDTool ()
@property (nonatomic,strong) MBProgressHUD  *HUD;
@end
@implementation MSHUDTool
+ (instancetype)shareInstance{
    
    static MSHUDTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MSHUDTool alloc] init];
    });
    return instance;
}


+ (void)show:(NSString *)msg inView:(UIView *)view type:(JYDProgressHUDType) mytype{
    
    [self show:msg inView:view type:mytype customImgView:nil];
}


+ (void)show:(NSString *)msg inView:(UIView *)view type:(JYDProgressHUDType)mytype customImgView:(UIImageView *)customImgView{
    
    if ([MSHUDTool shareInstance].HUD != nil) {
        [[MSHUDTool shareInstance].HUD hideAnimated:NO];
        [MSHUDTool shareInstance].HUD = nil;
    }
    
    if ([UIScreen mainScreen].bounds.size.height == 480) {
        [view endEditing:YES];
    }
    
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [MSHUDTool shareInstance].HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [MSHUDTool shareInstance].HUD.backgroundColor = [UIColor clearColor];
    
    //  是否设置黑色背景
    [MSHUDTool shareInstance].HUD.bezelView.backgroundColor = [UIColor blackColor];
    [MSHUDTool shareInstance].HUD.contentColor = [UIColor whiteColor];
    
    [[MSHUDTool shareInstance].HUD setRemoveFromSuperViewOnHide:YES];
    if(msg)[MSHUDTool shareInstance].HUD.detailsLabel.text = msg;
    [MSHUDTool shareInstance].HUD.detailsLabel.font = [UIFont systemFontOfSize:16];
    
    switch (mytype) {
            
        case JYDProgressHUDTypeOnlyText:
            [MSHUDTool shareInstance].HUD.mode = MBProgressHUDModeText;
            [[MSHUDTool shareInstance].HUD setMargin:15];
            [MSHUDTool shareInstance].HUD.offset = CGPointMake(0.f, MBProgressMaxOffset);
            break;
            
        case JYDProgressHUDTypeJHLoading:
            [MSHUDTool shareInstance].HUD.mode = MBProgressHUDModeIndeterminate;
            break;
            
        case JYDProgressHUDTypeSuccess:
            [MSHUDTool shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            [MSHUDTool shareInstance].HUD.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"success"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            break;
            
        case JYDProgressHUDTypeError:
            [MSHUDTool shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            [MSHUDTool shareInstance].HUD.customView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
            break;
            
        case JYDProgressHUDTypeOnlyTextCenter:
            [MSHUDTool shareInstance].HUD.mode = MBProgressHUDModeCustomView;
            break;
            
        default:
            break;
    }
}




+ (void)show{
    [self show:nil inView:nil type:JYDProgressHUDTypeJHLoading];
}


+ (void)showInView:(UIView *)view{
    [self show:nil inView:view type:JYDProgressHUDTypeJHLoading];
}


+ (void)showProgress:(NSString *)msg{
    [self show:msg inView:nil type:JYDProgressHUDTypeJHLoading];
}


+ (void)showMessage:(NSString *) msg{
    [self show:msg inView:nil type:JYDProgressHUDTypeOnlyText];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1];
}


+ (void)showMessageCenter:(NSString *) msg{
    [self show:msg inView:nil type:JYDProgressHUDTypeOnlyTextCenter];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1];
}


+ (void)showProgress:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view type:JYDProgressHUDTypeJHLoading];
}


+ (void)hide{
    if ([MSHUDTool shareInstance].HUD != nil) {
        [[MSHUDTool shareInstance].HUD hideAnimated:YES];
    }
}


+ (void)hideDelayTime:(NSInteger)delay{
    if ([MSHUDTool shareInstance].HUD != nil) {
        [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:delay];
    }
}


+ (void)showMessage:(NSString *)msg inView:(UIView *)view{
    [self show:msg inView:view type:JYDProgressHUDTypeOnlyText];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1];
}


+ (void)showMessageCenter:(NSString *) msg inView:(UIView *)view{
    [self show:msg inView:view type:JYDProgressHUDTypeOnlyTextCenter];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1];
}

+ (void)showSuccess:(NSString *)msg{
    [self show:msg inView:nil type:JYDProgressHUDTypeSuccess];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1.0];
}


+ (void)showSuccess:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view type:JYDProgressHUDTypeSuccess];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1.0];
}


+ (void)showError:(NSString *)msg{
    [self show:msg inView:nil type:JYDProgressHUDTypeError];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1.0];
}

+ (void)showError:(NSString *)msg hideDelay:(NSTimeInterval)delay{
    [self show:msg inView:nil type:JYDProgressHUDTypeError];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:delay];
}


+ (void)showError:(NSString *)msg inview:(UIView *)view{
    [self show:msg inView:view type:JYDProgressHUDTypeError];
    [[MSHUDTool shareInstance].HUD hideAnimated:YES afterDelay:1.0];
}
@end
