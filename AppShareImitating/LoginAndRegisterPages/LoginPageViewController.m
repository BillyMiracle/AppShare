//
//  LoginPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "LoginPageViewController.h"
#import "MainTabBarController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height

@interface LoginPageViewController ()<RegisterViewControllerDelegate>

@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backGroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    _backGroundImageView.image = [UIImage imageNamed:@"kaiji1.png"];
    [self.view addSubview:_backGroundImageView];
    
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(selfWidth/8, selfHeight / 6 + selfWidth / 4 + 70, selfWidth*3/4, 40)];
    _userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _userNameTextField.backgroundColor = [UIColor whiteColor];
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    UIView *userNameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    UIImageView *userNameLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [userNameLeftImageView setImage:[UIImage imageNamed:@"user_img.png"]];
    UIImageView *userNameLine = [[UIImageView alloc] initWithFrame:CGRectMake(40, 2, 2, 34)];
    [userNameLine setImage:[UIImage imageNamed:@"line.png"]];
    [userNameLeftView addSubview:userNameLeftImageView];
    [userNameLeftView addSubview:userNameLine];
    _userNameTextField.leftView = userNameLeftView;
    [self.view addSubview: _userNameTextField];
    
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(selfWidth/8, selfHeight / 6 + selfWidth / 4 + 120, selfWidth*3/4, 40)];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.secureTextEntry = YES;
    UIView *passwordLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    UIImageView *passwordLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [passwordLeftImageView setImage:[UIImage imageNamed:@"pass_img.png"]];
    UIImageView *passwordLine = [[UIImageView alloc] initWithFrame:CGRectMake(40, 2, 2, 34)];
    [passwordLine setImage:[UIImage imageNamed:@"line.png"]];
    [passwordLeftView addSubview:passwordLeftImageView];
    [passwordLeftView addSubview:passwordLine];
    _passwordTextField.leftView = passwordLeftView;
    [self.view addSubview: _passwordTextField];
    
    
    _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    _logoImageView.frame = CGRectMake(selfWidth * 3 / 8, selfHeight / 6, selfWidth / 4, selfWidth / 4);
    [_logoImageView.layer setMasksToBounds:YES];
    [_logoImageView.layer setCornerRadius:selfWidth / 8];
    _logoImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: _logoImageView];
    
    
    _logoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, selfHeight / 6 + selfWidth / 4, selfWidth, 40)];
    _logoLabel.text = @"SHARE";
    _logoLabel.textAlignment = NSTextAlignmentCenter;
    _logoLabel.textColor = [UIColor whiteColor];
    _logoLabel.font = [UIFont systemFontOfSize:30];
    _logoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: _logoLabel];
    
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _loginButton.frame = CGRectMake(selfWidth / 8 + 40, selfHeight / 6 + selfWidth / 4 + 170, (selfWidth*3/4 - 120) / 2, 40);
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.tintColor = [UIColor whiteColor];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5];
    [_loginButton.layer setBorderWidth:2];
    [_loginButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_loginButton addTarget:self action:@selector(pressLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _registerButton.frame = CGRectMake(selfWidth / 2 + 20, selfHeight / 6 + selfWidth / 4 + 170, (selfWidth*3/4 - 120) / 2, 40);
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    _registerButton.tintColor = [UIColor whiteColor];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [_registerButton.layer setMasksToBounds:YES];
    [_registerButton.layer setCornerRadius:5];
    [_registerButton.layer setBorderWidth:2];
    [_registerButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];//键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];//键盘的消失
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}


//键盘显示的时候的处理
- (void) keyboardWasShown:(NSNotification*)aNotification {
    //获得键盘的大小
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, -keyboardSize.height / 4 , selfWidth, selfHeight)];
    }];
}

//键盘消失的时候的处理
- (void) keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, 0 , selfWidth, selfHeight)];
    }];
}

- (void) pressRegisterButton {
    _registerPage = [[RegisterViewController alloc] init];
    _registerPage.modalPresentationStyle = UIModalPresentationFullScreen;
    _registerPage.delegate = self;
    [self presentViewController:_registerPage animated:NO completion:nil];
}

- (void) pressLoginButton {
    MainTabBarController *mainTabBarController = [[MainTabBarController alloc] init];
    mainTabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:mainTabBarController animated:YES completion:nil];
//    if ([_namesAndPasswords objectForKey:_userNameTextField.text] != nil) {
//        if ([_passwordTextField.text isEqualToString:[_namesAndPasswords objectForKey:_userNameTextField.text]]) {
//            MainTabBarController *mainTabBarController = [[MainTabBarController alloc] init];
//            mainTabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
//            [self presentViewController:mainTabBarController animated:YES completion:nil];
//        } else {
//            _firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码错误" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//            }];
//            [_firstAlertController addAction:confirm];
//            [self presentViewController: _firstAlertController animated:YES completion:nil];
//        }
//    } else {
//        _firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"该账号未注册" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        }];
//        [_firstAlertController addAction:confirm];
//        [self presentViewController: _firstAlertController animated:YES completion:nil];
//    }
}

- (void) register: (NSMutableDictionary*) dictionary {
    _namesAndPasswords = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    _userNameTextField.text = dictionary.allKeys[0];
    _passwordTextField.text = dictionary.allValues[0];
}


@end
