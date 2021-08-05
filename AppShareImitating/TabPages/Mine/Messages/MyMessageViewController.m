//
//  MyMessageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "MyMessageViewController.h"


#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height


@interface MyMessageViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation MyMessageViewController

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
    titleLabel.text = @"我的信息";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"个人信息" forState:UIControlStateNormal];
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
    _titleArray = [NSArray arrayWithObjects:@"评论",@"推荐我的",@"新关注的",@"私信",@"活动通知", nil];
    _detailTextArray = [NSArray arrayWithObjects:@"0",@"0",@"6",@"0",@"0", nil];
    [self.view addSubview:_mainTableView];
    
    _followedPage = [[FollowedViewController alloc] init];
    _peoplePage = [[PeopleViewController alloc] init];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_detailTextArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:nil message:@"无最新消息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    } else if (indexPath.row == 1) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:nil message:@"无最新消息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    } else if (indexPath.row == 2) {
        [self.navigationController pushViewController:_followedPage animated:YES];
    } else if (indexPath.row == 3) {
        [self.navigationController pushViewController:_peoplePage animated:YES];
    } else if (indexPath.row == 4) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:nil message:@"无最新消息" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController:firstAlertController animated:YES completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
