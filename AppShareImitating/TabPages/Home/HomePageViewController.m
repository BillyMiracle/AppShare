//
//  HomePageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "HomePageViewController.h"
#import "VacationViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface HomePageViewController ()
<UIScrollViewDelegate>
@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated {
    [_firstSubScrollView setContentOffset:CGPointMake(self.view.bounds.size.width * 4, 0) animated:NO];
    _firstPageControl.currentPage = 0;
    [self initTimerFunction];
}

-(void)viewWillDisappear:(BOOL)animated {
    [timerFirst invalidate];
}

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
    titleLabel.text = @"SHARE";
    self.navigationItem.titleView = titleLabel;
    
    _titleArray = [NSArray arrayWithObjects:@"假日",@"国外画册欣赏",@"collection扁平设计",@"板式整理术:高效解决多风格要求",@"夏日清新",@"给你的一封信", nil];
    _shareArray = [NSArray arrayWithObjects:@"share 小王",@"share 小张",@"share Billy",@"share 小顶",@"share 小梁",@"share 小柱子", nil];
    _classificationArray = [NSArray arrayWithObjects:@"原创——插画——练习",@"平面设计——画册设计",@"平面设计——画册设计",@"平面设计——海报设计",@"原创——练习",@"原创——平面设计", nil];
    
    _likeNumberMutableDictionary = [[NSMutableDictionary alloc] init];
    _visitButtonMutableDictionary = [[NSMutableDictionary alloc] init];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,selfWidth, selfHeight - tabBarHeight - navigationBarHeight - statusBarHeight)];
    _firstSubScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfWidth / 2)];
    _mainScrollView.contentSize = CGSizeMake(selfWidth, selfWidth / 2 + (selfWidth - 10) * 2 + 70);
    _firstSubScrollView.contentSize = CGSizeMake(selfWidth * 6, selfWidth / 2);
    _firstSubScrollView.backgroundColor = [UIColor whiteColor];
    _mainScrollView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    _firstSubScrollView.showsHorizontalScrollIndicator = NO;
    _firstSubScrollView.pagingEnabled = YES;
    _firstSubScrollView.delegate = self;
    _firstPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((_firstSubScrollView.frame.size.width - 200) / 2, _firstSubScrollView.frame.size.height - 40, 200, 40)];
    _firstPageControl.numberOfPages = 4;
    _firstPageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _firstPageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [_firstPageControl addTarget:self action:@selector(valueChangedFirst) forControlEvents:UIControlEventValueChanged];
    for (int i = 0; i < 6; ++i) {
        UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [imageButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"main_img%d.jpg", i % 4 + 1]] forState:UIControlStateNormal];
        imageButton.frame = CGRectMake(self.view.bounds.size.width * i, 0, selfWidth, selfWidth / 2);
        [imageButton addTarget:self action:@selector(pressMainImage:) forControlEvents:UIControlEventTouchUpInside];
        imageButton.tag = i;
        [imageButton.layer setMasksToBounds:YES];
        [imageButton.layer setCornerRadius:10];
        [imageButton.layer setBorderWidth:3];
        [imageButton.layer setBorderColor:[UIColor colorWithWhite:0.95 alpha:1].CGColor];
        [_firstSubScrollView addSubview:imageButton];
    }
    
    for (int i = 0; i < 6; ++i) {
        UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        bigButton.frame = CGRectMake(5, selfWidth / 2 + 10 * (i + 1) + (selfWidth - 10) * i / 3, selfWidth - 10, (selfWidth - 10) * 1 / 3);
        bigButton.backgroundColor = [UIColor whiteColor];

        UIImageView *imageViewForButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"list_img%d.png",i % 4 + 1]]];
        imageViewForButton.frame = CGRectMake(0, 0, bigButton.bounds.size.height * 3 / 2, bigButton.bounds.size.height);
        [bigButton addSubview:imageViewForButton];

        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(bigButton.bounds.size.height * 3 / 2 + 10, 4, bigButton.frame.size.width - bigButton.bounds.size.height * 3 / 2 - 20, 40)];
        titleLabel.text = [_titleArray objectAtIndex:i];
        titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        titleLabel.numberOfLines = 1;
        titleLabel.font = [UIFont systemFontOfSize:20];
        [bigButton addSubview:titleLabel];


        UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(bigButton.bounds.size.height * 3 / 2 + 10, 42, bigButton.frame.size.width - bigButton.bounds.size.height * 3 / 2 - 20, 20)];
        shareLabel.text = [_shareArray objectAtIndex:i];
        shareLabel.textColor = [UIColor lightGrayColor];
        [bigButton addSubview:shareLabel];


        UILabel *classificationLabel = [[UILabel alloc] initWithFrame:CGRectMake(bigButton.bounds.size.height * 3 / 2 + 10, 63, bigButton.frame.size.width - bigButton.bounds.size.height * 3 / 2 - 20, 16)];
        classificationLabel.font = [UIFont systemFontOfSize:14];
        classificationLabel.textColor = [UIColor lightGrayColor];
        classificationLabel.text = [_classificationArray objectAtIndex:i];
        [bigButton addSubview:classificationLabel];


        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(bigButton.bounds.size.height * 3 / 2 + 10, 79, bigButton.frame.size.width - bigButton.bounds.size.height * 3 / 2 - 20, 16)];
        timeLabel.font = [UIFont systemFontOfSize:14];
        timeLabel.textColor = [UIColor lightGrayColor];
        timeLabel.text = [NSString stringWithFormat:@"%d分钟前", 17 + i * 2];
        [bigButton addSubview:timeLabel];


//设置点赞按钮
        UIButton *likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        likeButton.frame = CGRectMake(bigButton.bounds.size.height * 3 / 2 + (bigButton.bounds.size.width - bigButton.bounds.size.height * 3 / 2 - 150) / 4, bigButton.frame.size.height - 25, 50, 20);
        likeButton.backgroundColor = [UIColor clearColor];
        likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton%d",i];
        [likeButton setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
        likeButton.tag = 0;
        [_likeNumberMutableDictionary setObject:[NSNumber numberWithInt:111 + i * (-3)] forKey:likeButton.accessibilityIdentifier];
        [likeButton setTitle:[NSString stringWithFormat:@"%@", [_likeNumberMutableDictionary objectForKey:likeButton.accessibilityIdentifier]] forState:UIControlStateNormal];
        [likeButton addTarget:self action:@selector(pressLikeButton:) forControlEvents:UIControlEventTouchUpInside];
        [bigButton addSubview:likeButton];


        UIButton *viewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        viewButton.frame = CGRectMake(bigButton.bounds.size.height * 3 / 2 + (bigButton.bounds.size.width - bigButton.bounds.size.height * 3 / 2 - 150) / 4 * 2 + 50, bigButton.frame.size.height - 25, 50, 20);
        viewButton.accessibilityIdentifier = [NSString stringWithFormat:@"viewButton%d",i];
        [viewButton setImage:[UIImage imageNamed:@"view.png"] forState:UIControlStateNormal];
        [_visitButtonMutableDictionary setObject:[NSNumber numberWithInt:190 + i * (-7)] forKey:viewButton.accessibilityIdentifier];
        [viewButton setTitle:[NSString stringWithFormat:@"%@",[_visitButtonMutableDictionary objectForKey:viewButton.accessibilityIdentifier]] forState:UIControlStateNormal];
        [bigButton addSubview:viewButton];


        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shareButton.frame = CGRectMake(bigButton.bounds.size.height * 3 / 2 + (bigButton.bounds.size.width - bigButton.bounds.size.height * 3 / 2 - 150) / 4 * 3 + 50 * 2, bigButton.frame.size.height - 25, 50, 20);
        [shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [shareButton setTitle:[NSString stringWithFormat:@"%d",117 + i * (-11)] forState:UIControlStateNormal];
        [bigButton addSubview:shareButton];


        bigButton.tag = 200 + i;
        [bigButton addTarget:self action:@selector(pressMainPageButton:) forControlEvents:UIControlEventTouchUpInside];
        [_mainScrollView addSubview: bigButton];
    }
    
    
    [_mainScrollView addSubview:_firstSubScrollView];
    [_mainScrollView addSubview:_firstPageControl];
    [self.view addSubview:_mainScrollView];
}

- (void)pressMainPageButton:(UIButton*) mainPageButton {
    if(mainPageButton.tag == 200) {
        VacationViewController *vacationPage = [[VacationViewController alloc] init];
        vacationPage.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth - 85, 30, 75, 20)];
        vacationPage.timeLabel.text = @"17分钟前";
        vacationPage.likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        vacationPage.visitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        vacationPage.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [vacationPage.likeButton setTitle:[NSString stringWithFormat:@"%@", [_likeNumberMutableDictionary objectForKey:@"likeButton0"]] forState:UIControlStateNormal];
        [vacationPage.shareButton setTitle:@"117" forState:UIControlStateNormal];
        NSNumber * number = [_visitButtonMutableDictionary objectForKey:@"viewButton0"];
        [_visitButtonMutableDictionary setObject:[NSNumber numberWithLong: 1 + [number longValue]] forKey:@"viewButton0"];
        [vacationPage.visitButton setTitle:[NSString stringWithFormat:@"%@",[_visitButtonMutableDictionary objectForKey:@"viewButton0"]] forState:UIControlStateNormal];
        [self.navigationController pushViewController:vacationPage animated:YES];
        for (int i = 0; i < mainPageButton.subviews.count; ++i) {
            if ([[mainPageButton.subviews objectAtIndex:i].accessibilityIdentifier isEqualToString:@"viewButton0"]) {
                UIButton *button = [mainPageButton.subviews objectAtIndex:i];
                [button setTitle:[NSString stringWithFormat:@"%@", [_visitButtonMutableDictionary objectForKey:@"viewButton0"]] forState:UIControlStateNormal];
            }
        }
    }
}

- (void) valueChangedFirst {
    [timerFirst invalidate];
    CGPoint offset = _firstSubScrollView.contentOffset;
    offset.x = self.view.bounds.size.width * _firstPageControl.currentPage;
    [_firstSubScrollView setContentOffset:offset animated:YES];
    [timerFirst fire];
    [self initTimerFunction];
}

-(void) initTimerFunction {
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(autoSelectPage) userInfo:nil repeats:YES];
    NSRunLoop* mainloop = [NSRunLoop mainRunLoop];
    [mainloop addTimer:timer forMode:NSRunLoopCommonModes];
    timerFirst = timer;
}

-(void) autoSelectPage {
    if (_firstSubScrollView.contentOffset.x == 0) {
        [_firstSubScrollView setContentOffset:CGPointMake(self.view.bounds.size.width * 4, 0) animated:NO];
    } else if (_firstSubScrollView.contentOffset.x / self.view.bounds.size.width == 5) {
        [_firstSubScrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
    }
    [_firstSubScrollView setContentOffset:CGPointMake(_firstSubScrollView.contentOffset.x + self.view.bounds.size.width, 0) animated:YES];
    _firstPageControl.currentPage = ((int)(_firstSubScrollView.contentOffset.x / self.view.bounds.size.width) + 1) % 4;
}

- (void) pressMainImage:(UIButton*) imageButton {
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == _firstSubScrollView) {
        [timerFirst fire];
        [self initTimerFunction];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == _firstSubScrollView) {
        [timerFirst invalidate];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _firstSubScrollView) {
        CGFloat offset = _firstSubScrollView.contentOffset.x;
        CGFloat pagewi = self.view.bounds.size.width;
        _firstPageControl.currentPage = (int)(offset / pagewi) % 4;
        if(offset == 0) {
            [_firstSubScrollView setContentOffset:CGPointMake(self.view.bounds.size.width * 4, 0) animated:NO];
        }
        if(offset / pagewi == 5) {
            [_firstSubScrollView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:NO];
        }
    }
}

- (void) pressLikeButton: (UIButton*) likeButton {
    if (likeButton.tag == 0) {
        NSNumber * number = [_likeNumberMutableDictionary objectForKey:likeButton.accessibilityIdentifier];
        [likeButton setTitle:[NSString stringWithFormat:@"%ld",1 + [number longValue]] forState:UIControlStateNormal];
        [likeButton setTintColor:[UIColor redColor]];
        [_likeNumberMutableDictionary setObject:[NSNumber numberWithLong: 1 + [number longValue]] forKey:likeButton.accessibilityIdentifier];
        likeButton.tag = 1;
    } else {
        NSNumber * number = [_likeNumberMutableDictionary objectForKey:likeButton.accessibilityIdentifier];
        [likeButton setTitle:[NSString stringWithFormat:@"%ld", -1 + [number longValue]] forState:UIControlStateNormal];
        [likeButton setTintColor:[UIColor systemBlueColor]];
        [_likeNumberMutableDictionary setObject:[NSNumber numberWithLong: -1 + [number longValue]] forKey:likeButton.accessibilityIdentifier];
        likeButton.tag = 0;
    }
}

@end
