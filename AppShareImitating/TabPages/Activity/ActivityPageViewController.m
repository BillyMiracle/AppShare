//
//  ActivityPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "ActivityPageViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface ActivityPageViewController ()

@end

@implementation ActivityPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"活动";
    self.navigationItem.titleView = titleLabel;
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - tabBarHeight - navigationBarHeight - statusBarHeight) style: UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.sectionFooterHeight = 0.001;
    _mainTableView.sectionHeaderHeight = 0.001;
    _mainTableView.backgroundColor = [UIColor whiteColor];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_mainTableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activityCell"];
    [self.view addSubview:_mainTableView];
    
    
    _titleArray = [NSArray arrayWithObjects:@"下厨也要美美的，六月鲜围裙创意设计大赛",@"MIUI主题市场让你的创意改变世界！",@"华为花粉吉祥物设计大赛", nil];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return selfWidth / 2 + 32;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
    cell.activityImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"activity%ld.png",indexPath.row % 3]];
    cell.activityLabel.text = [_titleArray objectAtIndex:(indexPath.row % 3)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
