//
//  MessageSettingsViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "MessageSettingsViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height


@interface MessageSettingsViewController ()
<UITableViewDelegate,UITableViewDataSource>
@end

@implementation MessageSettingsViewController

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
    titleLabel.text = @"消息设置";
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
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - navigationBarHeight - statusBarHeight - tabBarHeight)style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.sectionHeaderHeight = 0.01;
    _titleArray = [NSArray arrayWithObjects:@"接受所有新消息通知",@"通知显示栏",@"声音",@"震动",@"关注更新", nil];
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
    UIButton *tickButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tickButton.frame = CGRectMake(selfWidth - 50, 10, 30, 30);
    [tickButton setImage:[UIImage imageNamed:@"button_normal.png"] forState:UIControlStateNormal];
    [tickButton setTintColor:[UIColor lightGrayColor]];
    tickButton.tag = 0;
    [cell.contentView addSubview:tickButton];
    [tickButton addTarget:self action:@selector(pressTickButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
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
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)pressTickButton: (UIButton*) tickButton {
    if (tickButton.tag == 0) {
        tickButton.tag =1;
        [tickButton setTintColor:[UIColor systemBlueColor]];
    } else {
        tickButton.tag = 0;
        [tickButton setTintColor:[UIColor lightGrayColor]];
    }
}

@end
