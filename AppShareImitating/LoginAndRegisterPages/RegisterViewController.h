//
//  RegisterViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewControllerDelegate <NSObject>

- (void) register: (NSMutableDictionary*) dictionary;

@end

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *mailTextField;

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImageView *backGroundImageView;

@property (nonatomic, strong) UILabel *logoLabel;

@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) NSMutableDictionary *namesAndPasswords;

@property (nonatomic, strong) id<RegisterViewControllerDelegate> delegate;

@property (nonatomic, strong) UIAlertController* firstAlertController;

@end

NS_ASSUME_NONNULL_END
