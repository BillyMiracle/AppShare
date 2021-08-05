//
//  PeopleViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "PeopleViewController.h"
#import "PeopleTableViewCell.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface PeopleViewController ()
<UITableViewDelegate,UITableViewDataSource>
@end

@implementation PeopleViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageOne:) name:@"lastMessage" object:nil];
}

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
    titleLabel.text = @"私信";
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
    _titleArray = [NSArray arrayWithObjects:@"小易",@"小giegie",@"小姐姐",@"小柱子",@"小顶",@"Billy", nil];
    _imageArray = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"headImage12.jpg"],
                   [UIImage imageNamed:@"headImage13.jpg"],
                   [UIImage imageNamed:@"headImage20.jpg"],
                   [UIImage imageNamed:@"headImage03.jpg"],
                   [UIImage imageNamed:@"headImage10.jpg"],
                   [UIImage imageNamed:@"headImage00.jpg"], nil];
    _timeArray = [NSArray arrayWithObjects:
                  @"07-28 09:45",
                  @"07-27 22:11",
                  @"07-21 18:26",
                  @"07-20 12:10",
                  @"07-17 10:11",
                  @"06-12 12:56", nil];
    _messageArray = [NSMutableArray arrayWithObjects:
                     @"好专业的照片，非常喜欢这种风格，希望你能完成更多高质量的作品",
                     @"谢谢，已关注你",
                     @"为你点赞",
                     @"厉害啊",
                     @"大佬带带我",
                     @"你好，在吗？", nil];
    
    [self.view addSubview:_mainTableView];
    
    _conversationPage = [[ConversationViewController alloc] init];
    _conversationNavigationController = [[UINavigationController alloc] initWithRootViewController:_conversationPage];
    _conversationNavigationController.modalPresentationStyle = UIModalPresentationFullScreen;
    
    [_mainTableView registerClass:[PeopleTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
//    image.image = [_imageArray objectAtIndex:indexPath.row];
//    [cell.contentView addSubview:image];
//
//
//    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, selfWidth - 200, 40)];
//    name.font = [UIFont systemFontOfSize:20];
//    name.text = [_titleArray objectAtIndex:indexPath.row];
//    [cell.contentView addSubview:name];
//
//
//    UILabel *time = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth - 110, 10, 90, 24)];
//    time.text = [_timeArray objectAtIndex:indexPath.row];
//    time.font = [UIFont systemFontOfSize:14];
//    time.textColor = [UIColor lightGrayColor];
//    time.textAlignment = NSTextAlignmentRight;
//    [cell.contentView addSubview:time];
//
//    _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, selfWidth - 120, 40)];
//    _messageLabel.font = [UIFont systemFontOfSize:16];
//    _messageLabel.textColor = [UIColor grayColor];
//    _messageLabel.text = [_messageArray objectAtIndex:indexPath.row];
//    [cell.contentView addSubview:_messageLabel];
//
//    return cell;
    PeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.messageLabel.frame = CGRectMake(100, 50, selfWidth - 120, 40);
    cell.messageLabel.text = [_messageArray objectAtIndex:indexPath.row];
    cell.image.image = [_imageArray objectAtIndex:indexPath.row];
    cell.name.frame = CGRectMake(100, 10, selfWidth - 200, 40);
    cell.name.text = [_titleArray objectAtIndex:indexPath.row];
    cell.time.frame = CGRectMake(selfWidth - 110, 10, 90, 24);
    cell.time.text = [_timeArray objectAtIndex:indexPath.row];
    return  cell;
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
    if (indexPath.row == 0) {
        
        [self presentViewController:_conversationNavigationController animated:YES completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)messageOne: (NSNotification *)notification {
    NSDictionary *dict = notification.userInfo;
    [_messageArray removeObjectAtIndex:0];
    [_messageArray insertObject:dict[@"messageOne"] atIndex:0];
    [_mainTableView reloadData];
}

@end
