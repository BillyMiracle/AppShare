//
//  PasswordChangingViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PasswordChangingViewController : UIViewController

@property (nonatomic, strong) UITextField *oldTextField;
@property (nonatomic, strong) UITextField *secondTextField;
@property (nonatomic, strong) UITextField *confirmTextField;

@end

NS_ASSUME_NONNULL_END
