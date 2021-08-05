//
//  BayMaxViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import "BayMaxViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface BayMaxViewController ()<UITextFieldDelegate>

@end

@implementation BayMaxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressleftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70,selfWidth, selfHeight - tabBarHeight - navigationBarHeight - statusBarHeight - 70)];
    _mainScrollView.contentSize = CGSizeMake(selfWidth, (selfWidth - 10) * 5 / 3 + 60);
    _mainScrollView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview: _mainScrollView];
    
    _searchTextField.frame = CGRectMake(10, 20, selfWidth - 20, 30);
    _searchTextField.borderStyle = UITextBorderStyleRoundedRect;
    _searchTextField.leftViewMode = UITextFieldViewModeAlways;
    UIView *searchTextFieldLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *searchTextFieldLeftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 3, 24, 24)];
    searchTextFieldLeftImageView.image = [UIImage imageNamed:@"fangdajing.png"];
    searchTextFieldLeftImageView.tintColor = [UIColor grayColor];
    [searchTextFieldLeftView addSubview:searchTextFieldLeftImageView];
    _searchTextField.leftView = searchTextFieldLeftView;
    _searchTextField.placeholder = @"搜索 用户名 作品分类 文章";
    _searchTextField.returnKeyType = UIReturnKeySearch;
    _searchTextField.delegate = self;
    
    _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, 70)];
    _searchView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [_searchView addSubview: _searchTextField];
    [self.view addSubview:_searchView];
    
    _titleArray = [NSArray arrayWithObjects:@"icon of BayMax",@"每个人都需要一个大白",@"大白的哲学",@"images of BAYMAX",@"我和大白", nil];
    _shareArray = [NSArray arrayWithObjects:@"share 小张",@"share Billy",@"share 小顶",@"share 小梁",@"share 小柱子", nil];
    _classificationArray = [NSArray arrayWithObjects:@"原创——UI——icon",@"原创——影视",@"原创——影视",@"摄影——影视——海报设计",@"原创——插画", nil];
    _likeNumberMutableDictionary = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < 5; ++i) {
        UIButton *bigButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        bigButton.frame = CGRectMake(5, 10 * (i + 1) + (selfWidth - 10) * i / 3, selfWidth - 10, (selfWidth - 10) * 1 / 3);
        bigButton.backgroundColor = [UIColor whiteColor];
        UIImageView *imageViewForButton = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"BayMax%d.jpeg",i]]];
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
        //likeButton.selected = NO;
        likeButton.accessibilityIdentifier = [NSString stringWithFormat:@"likeButton%d",i];
        [likeButton setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
        likeButton.tag = 0;
        [_likeNumberMutableDictionary setObject:[NSNumber numberWithInt:129 + i * (-3)] forKey:likeButton.accessibilityIdentifier];
        [likeButton setTitle:[NSString stringWithFormat:@"%@", [_likeNumberMutableDictionary objectForKey:likeButton.accessibilityIdentifier]] forState:UIControlStateNormal];
        [likeButton addTarget:self action:@selector(pressLikeButton:) forControlEvents:UIControlEventTouchUpInside];
        [bigButton addSubview:likeButton];
        
        
        UIButton *viewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        viewButton.frame = CGRectMake(bigButton.bounds.size.height * 3 / 2 + (bigButton.bounds.size.width - bigButton.bounds.size.height * 3 / 2 - 150) / 4 * 2 + 50, bigButton.frame.size.height - 25, 50, 20);
        [viewButton setImage:[UIImage imageNamed:@"view.png"] forState:UIControlStateNormal];
        [viewButton setTitle:[NSString stringWithFormat:@"%d",190 + i * (-7)] forState:UIControlStateNormal];
        [bigButton addSubview:viewButton];
        
        
        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        shareButton.frame = CGRectMake(bigButton.bounds.size.height * 3 / 2 + (bigButton.bounds.size.width - bigButton.bounds.size.height * 3 / 2 - 150) / 4 * 3 + 50 * 2, bigButton.frame.size.height - 25, 50, 20);
        [shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
        [shareButton setTitle:[NSString stringWithFormat:@"%d",117 + i * (-11)] forState:UIControlStateNormal];
        [bigButton addSubview:shareButton];
        
        
        [_mainScrollView addSubview: bigButton];
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

- (void) pressleftButton {
    [self.navigationController popViewControllerAnimated:NO];
}

@end
