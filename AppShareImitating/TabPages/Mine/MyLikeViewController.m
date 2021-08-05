//
//  MyLikeViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "MyLikeViewController.h"
#import "ArticleTableViewCell.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height


@interface MyLikeViewController ()
<UITableViewDelegate,UITableViewDataSource>
@end

@implementation MyLikeViewController

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
    titleLabel.text = @"我喜欢的";
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
    _mainTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_mainTableView];
    
    
    _imageArray = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"uploadImage00.jpg"],
                       [UIImage imageNamed:@"works_img1.png"],
                       [UIImage imageNamed:@"uploadImage43.jpg"],
                       [UIImage imageNamed:@"uploadImage50.jpg"],
                       [UIImage imageNamed:@"uploadImage32.jpg"],
                       [UIImage imageNamed:@"note4.png"], nil];
    _titleArray = [NSArray arrayWithObjects:
                       @"夏日清新图片分享",
                       @"小柱子的日常",
                       @"图片剪辑那些事",
                       @"视频剪辑那些事",
                       @"卡通图像",
                       @"排版精通：布局的哲学",nil];
    _shareTextArray = [NSArray arrayWithObjects:
                       @"share Siri",
                       @"share 小易",
                       @"share Bixby",
                       @"share 小王",
                       @"share 菠菠",
                       @"share 小罗",nil];
   
    _timeArray = [NSArray arrayWithObjects:
                       @"1小时前",
                       @"12天前",
                       @"13天前",
                       @"1天前",
                       @"1天前",
                       @"3月前",nil];
    
    [_mainTableView registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"articalCell"];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return selfWidth / 3;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"articalCell"forIndexPath:indexPath];
    cell.leftImageView.image = [_imageArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [_titleArray objectAtIndex:indexPath.row];
    cell.shareLabel.text = [_shareTextArray objectAtIndex:indexPath.row];
    cell.timeLabel.text = [_timeArray objectAtIndex:indexPath.row];
    cell.likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton0%ld",indexPath.row];
    [cell.likeButton setTitle:[NSString stringWithFormat:@"%ld",131 - indexPath.row * 3] forState:UIControlStateNormal];
    [cell.viewButton setTitle:[NSString stringWithFormat:@"%ld",198 - indexPath.row * 11] forState:UIControlStateNormal];
    [cell.shareButton setTitle:[NSString stringWithFormat:@"%ld",97 + indexPath.row * 6] forState:UIControlStateNormal];
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

@end
