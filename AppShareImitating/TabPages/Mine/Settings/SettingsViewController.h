//
//  SettingsViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>
#import "InformationViewController.h"
#import "PasswordChangingViewController.h"
#import "MessageSettingsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) InformationViewController *informationPage;

@property (nonatomic, strong) MessageSettingsViewController *messageSettingPage;

@property (nonatomic, strong) PasswordChangingViewController *passwordChanggingPage;
@end

NS_ASSUME_NONNULL_END
