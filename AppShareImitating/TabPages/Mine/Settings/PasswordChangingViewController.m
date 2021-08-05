//
//  PasswordChangingViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "PasswordChangingViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface PasswordChangingViewController ()

@end

@implementation PasswordChangingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"修改密码";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"设置" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(pressBarLeftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    UILabel *oldLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 80, 30)];
    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 80, 30)];
    UILabel *confirmLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 120, 80, 30)];
    
    oldLabel.text = @"旧密码";
    secondLabel.text = @"新密码";
    confirmLabel.text = @"确认密码";
    
    _oldTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 20, selfWidth - 120, 30)];
    _secondTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 70, selfWidth - 120, 30)];
    _confirmTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 120, selfWidth - 120, 30)];
    
    _oldTextField.borderStyle = UITextBorderStyleRoundedRect;
    _secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    _confirmTextField.borderStyle = UITextBorderStyleRoundedRect;
    
    _oldTextField.placeholder = @"请输入旧密码";
    _secondTextField.placeholder = @"请输入新密码";
    _confirmTextField.placeholder = @"请确认新密码";
    
    [self.view addSubview:oldLabel];
    [self.view addSubview:secondLabel];
    [self.view addSubview:confirmLabel];
    [self.view addSubview:_oldTextField];
    [self.view addSubview:_secondTextField];
    [self.view addSubview:_confirmTextField];
    
    
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    confirmButton.frame = CGRectMake(30, 170, selfWidth - 60, 40);
    [confirmButton setTitle:@"确认修改" forState:UIControlStateNormal];
    [confirmButton setBackgroundColor: [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
    confirmButton.tintColor = [UIColor whiteColor];
    confirmButton.titleLabel.font = [UIFont systemFontOfSize:24];
    [confirmButton addTarget:self action:@selector(pressConfirmButton) forControlEvents:UIControlEventTouchUpInside];
    [confirmButton.layer setMasksToBounds:YES];
    [confirmButton.layer setCornerRadius:5];
    [confirmButton.layer setBorderWidth:0];
    [self.view addSubview:confirmButton];
    
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_oldTextField resignFirstResponder];
    [_secondTextField resignFirstResponder];
    [_confirmTextField resignFirstResponder];
}

- (void) pressConfirmButton {
    if([_oldTextField.text isEqualToString: @""] || [_secondTextField.text isEqualToString: @""] || [_confirmTextField.text isEqualToString: @""]) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    } else if (![_secondTextField.text isEqualToString:_confirmTextField.text]) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    } else {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    }
}

@end
