//
//  MinePageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>
#import "UploadedPageViewController.h"
#import "MyMessageViewController.h"
#import "MyLikeViewController.h"
#import "SettingsViewController.h"
#import "InformationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MinePageViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  UITableView *mineTableView;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, strong) UIButton *headButton;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *tagLabel;
@property (nonatomic, strong) UILabel *signLabel;

@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *viewButton;

@property (nonatomic, strong) SettingsViewController *settingPage;
@property (nonatomic, strong) MyMessageViewController *messagePage;

@end

NS_ASSUME_NONNULL_END
