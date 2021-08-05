//
//  RegisterViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "RegisterViewController.h"


#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backGroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    _backGroundImageView.image = [UIImage imageNamed:@"kaiji1.png"];
    [self.view addSubview:_backGroundImageView];
    
    
    _mailTextField = [[UITextField alloc] initWithFrame:CGRectMake(selfWidth/8, selfHeight / 6 + selfWidth / 4 + 60, selfWidth*3/4, 40)];
    _mailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _mailTextField.backgroundColor = [UIColor whiteColor];
    _mailTextField.leftViewMode = UITextFieldViewModeAlways;
    UIView *mailLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 42, 40)];
    UIImageView *mailLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [mailLeftImageView setImage:[UIImage imageNamed:@"email_img.png"]];
    UIImageView *mailLine = [[UIImageView alloc] initWithFrame:CGRectMake(40, 2, 2, 34)];
    [mailLine setImage:[UIImage imageNamed:@"line.png"]];
    [mailLeftView addSubview:mailLeftImageView];
    [mailLeftView addSubview:mailLine];
    _mailTextField.leftView = mailLeftView;
    [self.view addSubview: _mailTextField];
    
    
    _userNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(selfWidth/8, selfHeight / 6 + selfWidth / 4 + 110, selfWidth*3/4, 40)];
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
    
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(selfWidth/8, selfHeight / 6 + selfWidth / 4 + 160, selfWidth*3/4, 40)];
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
    _logoLabel.textColor = [UIColor whiteColor];
    _logoLabel.font = [UIFont systemFontOfSize:30];
    _logoLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: _logoLabel];
    
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _registerButton.frame = CGRectMake(selfWidth / 2 - 70, selfHeight / 6 + selfWidth / 4 + 220, 140, 40);
    [_registerButton setTitle:@"一键注册" forState:UIControlStateNormal];
    _registerButton.tintColor = [UIColor whiteColor];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [_registerButton.layer setMasksToBounds:YES];
    [_registerButton.layer setCornerRadius:5];
    [_registerButton.layer setBorderWidth:2];
    [_registerButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_registerButton addTarget:self action:@selector(pressRegisterButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _backButton.frame = CGRectMake(selfWidth / 2 - 70, selfHeight / 6 + selfWidth / 4 + 280, 140, 40);
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    _backButton.tintColor = [UIColor whiteColor];
    _backButton.titleLabel.font = [UIFont systemFontOfSize:22];
    [_backButton.layer setMasksToBounds:YES];
    [_backButton.layer setCornerRadius:5];
    [_backButton.layer setBorderWidth:2];
    [_backButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    [_backButton addTarget:self action:@selector(pressBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_backButton];
    
    _namesAndPasswords = [[NSMutableDictionary alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];//键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];//键盘的消失
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_mailTextField resignFirstResponder];
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

//键盘显示的时候的处理
- (void)keyboardWasShown:(NSNotification*)aNotification {
    //获得键盘的大小
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, -keyboardSize.height / 4 , selfWidth, selfHeight)];
    }];
}

//键盘消失的时候的处理
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setFrame:CGRectMake(0, 0 , selfWidth, selfHeight)];
    }];
}

- (void) pressRegisterButton {
    if ([_mailTextField.text isEqualToString:@""]) {
        _firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"邮箱不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [_firstAlertController addAction:confirm];
        [self presentViewController: _firstAlertController animated:YES completion:nil];
    } else if ([_userNameTextField.text isEqualToString:@""]) {
        _firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [_firstAlertController addAction:confirm];
        [self presentViewController: _firstAlertController animated:YES completion:nil];
    } else if ([_passwordTextField.text isEqualToString:@""]) {
        _firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [_firstAlertController addAction:confirm];
        [self presentViewController: _firstAlertController animated:YES completion:nil];
    } else {
        NSString *userName = _userNameTextField.text;
        NSString *password = _passwordTextField.text;
        [_namesAndPasswords setValue:password forKey:userName];
        [self.delegate register:_namesAndPasswords];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void) pressBackButton {
    [self dismissViewControllerAnimated:NO completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
