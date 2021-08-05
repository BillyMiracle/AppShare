//
//  LoginPageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginPageViewController : UIViewController


@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImageView *backGroundImageView;

@property (nonatomic, strong) UILabel *logoLabel;

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, strong) RegisterViewController *registerPage;

@property (nonatomic, strong) NSMutableDictionary *namesAndPasswords;

@property (nonatomic, strong) UIAlertController* firstAlertController;

@end

NS_ASSUME_NONNULL_END
