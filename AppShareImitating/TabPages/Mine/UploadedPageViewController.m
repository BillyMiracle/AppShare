//
//  UploadedPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "UploadedPageViewController.h"
#import "ArticleTableViewCell.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface UploadedPageViewController ()

@end

@implementation UploadedPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我上传的";
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
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _leftButton.frame = CGRectMake(0, 0, selfWidth / 3 - 1, 35);
    [_leftButton setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    [_leftButton setTitle:@"上传时间" forState:UIControlStateNormal];
    _leftButton.tag = 1;
    [_leftButton setTintColor:[UIColor grayColor]];
    [_leftButton addTarget:self action:@selector(pressLeftButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_leftButton];
    
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _rightButton.frame = CGRectMake(selfWidth * 2 / 3 + 1, 0, selfWidth / 3 - 1, 35);
    [_rightButton setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    [_rightButton setTitle:@"推荐最多" forState:UIControlStateNormal];
    _rightButton.tag = 0;
    [_rightButton setTintColor:[UIColor whiteColor]];
    [_rightButton addTarget:self action:@selector(pressRightButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_rightButton];
    
    
    _middleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _middleButton.frame = CGRectMake(selfWidth / 3 + 1, 0, selfWidth / 3 - 2, 35);
    [_middleButton setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1]];
    [_middleButton setTitle:@"分享最多" forState:UIControlStateNormal];
    _middleButton.tag = 1;
    [_middleButton setTintColor:[UIColor whiteColor]];
    [_middleButton addTarget:self action:@selector(pressMiddleButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_middleButton];
    
    
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 35, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight - 35)];
    _mainScrollView.contentSize = CGSizeMake(selfWidth * 3, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight - 35);
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.pagingEnabled = YES;
    
    _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight - 35)style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    _leftTableView.backgroundColor = [UIColor clearColor];
    _leftTableView.showsVerticalScrollIndicator = NO;
    [_mainScrollView addSubview:_leftTableView];
    
    
    _middleTableView = [[UITableView alloc] initWithFrame:CGRectMake(selfWidth, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight - 35)style:UITableViewStylePlain];
    _middleTableView.delegate = self;
    _middleTableView.dataSource = self;
    _middleTableView.backgroundColor = [UIColor clearColor];
    _middleTableView.showsVerticalScrollIndicator = NO;
    [_mainScrollView addSubview:_middleTableView];
    
    
    _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(selfWidth * 2, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight - 35)style:UITableViewStylePlain];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    _rightTableView.backgroundColor = [UIColor clearColor];
    _rightTableView.showsVerticalScrollIndicator = NO;
    [_mainScrollView addSubview:_rightTableView];
    
    _imageArrayLeft = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"uploadImage00.jpg"],
                       [UIImage imageNamed:@"uploadImage31.jpg"],
                       [UIImage imageNamed:@"uploadImage43.jpg"],
                       [UIImage imageNamed:@"uploadImage50.jpg"],
                       [UIImage imageNamed:@"uploadImage32.jpg"],
                       [UIImage imageNamed:@"uploadImage33.jpg"], nil];
    _imageArrayMiddle = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"note3.png"],
                         [UIImage imageNamed:@"works_img1.png"],
                         [UIImage imageNamed:@"uploadImage32.jpg"],
                         [UIImage imageNamed:@"uploadImage30.jpg"],
                         [UIImage imageNamed:@"uploadImage42.jpg"],
                         [UIImage imageNamed:@"uploadImage33.jpg"], nil];
    _imageArrayRight = [NSArray arrayWithObjects:
                        [UIImage imageNamed:@"note4.png"],
                        [UIImage imageNamed:@"list_img3.png"],
                        [UIImage imageNamed:@"uploadImage23.jpg"],
                        [UIImage imageNamed:@"uploadImage33.jpg"],
                        [UIImage imageNamed:@"uploadImage40.jpg"],
                        [UIImage imageNamed:@"uploadImage50.jpg"], nil];
    _titleArrayLeft = [NSArray arrayWithObjects:
                       @"夏日清新图片分享",
                       @"小柱子的日常",
                       @"图片剪辑那些事",
                       @"视频剪辑那些事",
                       @"每个人心里都住着一个大白",
                       @"大白图片欣赏",nil];
    _titleArrayMiddle = [NSArray arrayWithObjects:
                         @"字体故事",
                       @"个人摄影作品集",
                       @"大白的哲学",
                       @"大白图标分享",
                       @"围裙设计大赛",
                       @"大白的关心",nil];
    _titleArrayRight = [NSArray arrayWithObjects:
                        @"板式整理术:高效解决多风格要求",
                       @"海报设计",
                       @"靓丽壁纸",
                       @"卡通图像",
                       @"可爱壁纸",
                       @"",nil];
    _shareTextArrayLeft = [NSArray arrayWithObjects:
                           @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",nil];
    _shareTextArrayMiddle = [NSArray arrayWithObjects:
                             @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",nil];
    _shareTextArrayRight = [NSArray arrayWithObjects:
                            @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",
                       @"share 小王",nil];
    _timeArrayLeft = [NSArray arrayWithObjects:
                      @"5分钟前",
                      @"25分钟前",
                      @"34分钟前",
                      @"1小时前",
                      @"1小时前",
                      @"3小时前",nil];
    _timeArrayMiddle = [NSArray arrayWithObjects:
                       @"1小时前",
                       @"12天前",
                       @"13天前",
                       @"1天前",
                       @"1天前",
                       @"3月前",nil];
    _timeArrayRight = [NSArray arrayWithObjects:
                       @"5天前",
                       @"4月前",
                       @"20小时前",
                       @"1月前",
                       @"1天前",
                       @"2月前",nil];
    [self.view addSubview:_mainScrollView];
    _mainScrollView.delegate = self;
    [_mainScrollView setBounces:NO];
    
    [_leftTableView registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"articalCell"];
    [_rightTableView registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"articalCell"];
    [_middleTableView registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"articalCell"];
}

- (void) pressLeftButton {
    [_mainScrollView setContentOffset:CGPointMake(0, 0)];
    [_leftButton setTintColor:[UIColor grayColor]];
    [_middleButton setTintColor:[UIColor whiteColor]];
    [_rightButton setTintColor:[UIColor whiteColor]];
}

- (void) pressRightButton {
    [_mainScrollView setContentOffset:CGPointMake(selfWidth * 2, 0)];
    [_leftButton setTintColor:[UIColor whiteColor]];
    [_middleButton setTintColor:[UIColor whiteColor]];
    [_rightButton setTintColor:[UIColor grayColor]];
}

- (void) pressMiddleButton {
    [_mainScrollView setContentOffset:CGPointMake(selfWidth, 0)];
    [_leftButton setTintColor:[UIColor whiteColor]];
    [_middleButton setTintColor:[UIColor grayColor]];
    [_rightButton setTintColor:[UIColor whiteColor]];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return selfWidth / 3;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        ArticleTableViewCell *cell = [self.leftTableView dequeueReusableCellWithIdentifier:@"articalCell"forIndexPath:indexPath];
        cell.leftImageView.image = [_imageArrayLeft objectAtIndex:indexPath.row];
        cell.titleLabel.text = [_titleArrayLeft objectAtIndex:indexPath.row];
        cell.shareLabel.text = [_shareTextArrayLeft objectAtIndex:indexPath.row];
        cell.timeLabel.text = [_timeArrayLeft objectAtIndex:indexPath.row];
        cell.likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton0%ld",indexPath.row];
        [cell.likeButton setTitle:[NSString stringWithFormat:@"%ld",131 - indexPath.row * 3] forState:UIControlStateNormal];
        cell.likeButton.tag = 0;
        [cell.viewButton setTitle:[NSString stringWithFormat:@"%ld",198 - indexPath.row * 11] forState:UIControlStateNormal];
        [cell.shareButton setTitle:[NSString stringWithFormat:@"%ld",97 + indexPath.row * 6] forState:UIControlStateNormal];
        return cell;
    } else if (tableView == _middleTableView) {
        ArticleTableViewCell *cell = [self.middleTableView dequeueReusableCellWithIdentifier:@"articalCell"forIndexPath:indexPath];
        cell.leftImageView.image = [_imageArrayMiddle objectAtIndex:indexPath.row];
        cell.titleLabel.text = [_titleArrayMiddle objectAtIndex:indexPath.row];
        cell.shareLabel.text = [_shareTextArrayMiddle objectAtIndex:indexPath.row];
        cell.timeLabel.text = [_timeArrayMiddle objectAtIndex:indexPath.row];
        cell.likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton1%ld",indexPath.row];
        [cell.likeButton setTitle:[NSString stringWithFormat:@"%ld",127 - indexPath.row * 9] forState:UIControlStateNormal];
        cell.likeButton.tag = 0;
        [cell.viewButton setTitle:[NSString stringWithFormat:@"%ld",345 - indexPath.row * 19] forState:UIControlStateNormal];
        [cell.shareButton setTitle:[NSString stringWithFormat:@"%ld",34 - indexPath.row * 3] forState:UIControlStateNormal];
        return cell;
    } else {
        ArticleTableViewCell *cell = [self.rightTableView dequeueReusableCellWithIdentifier:@"articalCell"forIndexPath:indexPath];
        cell.leftImageView.image = [_imageArrayRight objectAtIndex:indexPath.row];
        cell.titleLabel.text = [_titleArrayRight objectAtIndex:indexPath.row];
        cell.shareLabel.text = [_shareTextArrayRight objectAtIndex:indexPath.row];
        cell.timeLabel.text = [_timeArrayRight objectAtIndex:indexPath.row];
        cell.likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton2%ld",indexPath.row];
        [cell.likeButton setTitle:[NSString stringWithFormat:@"%ld",427 - indexPath.row * 13] forState:UIControlStateNormal];
        cell.likeButton.tag = 0;
        [cell.viewButton setTitle:[NSString stringWithFormat:@"%ld",534 - indexPath.row * 17] forState:UIControlStateNormal];
        [cell.shareButton setTitle:[NSString stringWithFormat:@"%ld",276 - indexPath.row * 7] forState:UIControlStateNormal];
        return cell;
    }
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

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(scrollView == _mainScrollView) {
        if(scrollView.contentOffset.x == 0) {
            [_leftButton setTintColor:[UIColor grayColor]];
            [_middleButton setTintColor:[UIColor whiteColor]];
            [_rightButton setTintColor:[UIColor whiteColor]];
            _leftButton.tag = 1;
            _middleButton.tag = 0;
            _rightButton.tag = 0;
        } else if (scrollView.contentOffset.x == selfWidth) {
            [_leftButton setTintColor:[UIColor whiteColor]];
            [_middleButton setTintColor:[UIColor grayColor]];
            [_rightButton setTintColor:[UIColor whiteColor]];
            _leftButton.tag = 0;
            _middleButton.tag = 1;
            _rightButton.tag = 0;
        } else if (scrollView.contentOffset.x == selfWidth*2) {
            [_leftButton setTintColor:[UIColor whiteColor]];
            [_middleButton setTintColor:[UIColor whiteColor]];
            [_rightButton setTintColor:[UIColor grayColor]];
            _leftButton.tag = 0;
            _middleButton.tag = 0;
            _rightButton.tag = 1;
        }
    }
}
- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(scrollView == _mainScrollView) {
        if(scrollView.contentOffset.x == 0) {
            [_leftButton setTintColor:[UIColor grayColor]];
            [_middleButton setTintColor:[UIColor whiteColor]];
            [_rightButton setTintColor:[UIColor whiteColor]];
            _leftButton.tag = 1;
            _middleButton.tag = 0;
            _rightButton.tag = 0;
        } else if (scrollView.contentOffset.x == selfWidth) {
            [_leftButton setTintColor:[UIColor whiteColor]];
            [_middleButton setTintColor:[UIColor grayColor]];
            [_rightButton setTintColor:[UIColor whiteColor]];
            _leftButton.tag = 0;
            _middleButton.tag = 1;
            _rightButton.tag = 0;
        } else if (scrollView.contentOffset.x == selfWidth*2) {
            [_leftButton setTintColor:[UIColor whiteColor]];
            [_middleButton setTintColor:[UIColor whiteColor]];
            [_rightButton setTintColor:[UIColor grayColor]];
            _leftButton.tag = 0;
            _middleButton.tag = 0;
            _rightButton.tag = 1;
        }
    }
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
