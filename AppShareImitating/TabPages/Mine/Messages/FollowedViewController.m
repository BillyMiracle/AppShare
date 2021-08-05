//
//  FollowedViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "FollowedViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface FollowedViewController ()
<UITableViewDelegate,UITableViewDataSource>
@end

@implementation FollowedViewController

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
    titleLabel.text = @"新关注的";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"我的信息" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(pressBarLeftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - navigationBarHeight - statusBarHeight - tabBarHeight)style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.sectionHeaderHeight = 0.01;
    _titleArray = [NSArray arrayWithObjects:@"小格",@"小兰",@"小明",@"小柱子",@"小顶",@"Bixby", nil];
    _imageArray = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"headImage23.jpg"],
                   [UIImage imageNamed:@"headImage01.jpg"],
                   [UIImage imageNamed:@"headImage02.jpg"],
                   [UIImage imageNamed:@"headImage03.jpg"],
                   [UIImage imageNamed:@"headImage10.jpg"],
                   [UIImage imageNamed:@"headImage11.jpg"], nil];
    [self.view addSubview:_mainTableView];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    image.image = [_imageArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:image];
    
    UIButton *followButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    followButton.frame = CGRectMake(selfWidth - 100, 40, 60, 30);
    [followButton setTitle:@"+关注" forState:UIControlStateNormal];
    [followButton.layer setMasksToBounds:YES];
    [followButton.layer setCornerRadius:15];
    [followButton.layer setBorderWidth:2];
    [followButton.layer setBorderColor:[UIColor systemBlueColor].CGColor];
    followButton.tag = 0;
    followButton.titleLabel.font = [UIFont systemFontOfSize:16];
    followButton.tintColor = [UIColor systemBlueColor];
    [followButton addTarget:self action:@selector(pressFollowButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview: followButton];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, selfWidth - 200, 40)];
    name.text = [_titleArray objectAtIndex:indexPath.row];
    [cell.contentView addSubview:name];
    return cell;
}

- (void)pressFollowButton:(UIButton*)followButton {
    if (followButton.tag == 0) {
        [followButton setTitle:@"已关注" forState:UIControlStateNormal];
        [followButton setTintColor:[UIColor lightGrayColor]];
        [followButton.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        followButton.tag = 1;
    } else {
        [followButton setTitle:@"+关注" forState:UIControlStateNormal];
        [followButton setTintColor:[UIColor systemBlueColor]];
        [followButton.layer setBorderColor:[UIColor systemBlueColor].CGColor];
        followButton.tag = 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}


@end
