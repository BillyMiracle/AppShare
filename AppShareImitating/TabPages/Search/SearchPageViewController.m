//
//  SearchPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "SearchPageViewController.h"
#import "BayMaxViewController.h"


#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface SearchPageViewController () <UITextFieldDelegate>

@end

@implementation SearchPageViewController

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
    titleLabel.text = @"搜索";
    self.navigationItem.titleView = titleLabel;
    
    
//搜索框
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, selfWidth - 20, 30)];
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
    
    
//分类
    _classificationView = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 70, 30)];
    UILabel *classificationLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 40, 30)];
    classificationLabel.text = @"分类";
    classificationLabel.textAlignment = NSTextAlignmentCenter;
    classificationLabel.textColor = [UIColor whiteColor];
    UIImageView *classificationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 24, 24)];
    classificationImageView.image = [UIImage imageNamed:@"search_button.png"];
    _classificationView.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    [_classificationView addSubview:classificationLabel];
    [_classificationView addSubview:classificationImageView];
    [self.view addSubview: _classificationView];
    UIImageView *lineOne = [[UIImageView alloc] initWithFrame:CGRectMake(80, 108, selfWidth - 90, 2)];
    lineOne.image = [self createImageWithColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [self.view addSubview:lineOne];
    float wid = (selfWidth - 50) / 4;
    _classificationTitleArray = [NSArray arrayWithObjects:@"平面设计",@"网页设计",@"UI/icon",@"插画/手绘",@"虚拟与设计",@"影视",@"摄影",@"其他", nil];
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < 4; ++j) {
            UIButton *classificationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            classificationButton.frame = CGRectMake(10 * (j + 1) + wid * j, 130 + 40 * i, wid, 30);
            [classificationButton setTitle:[_classificationTitleArray objectAtIndex:i*4 + j] forState:UIControlStateNormal];
            classificationButton.backgroundColor = [UIColor whiteColor];
            classificationButton.tintColor = [UIColor blackColor];
            [classificationButton addTarget:self action:@selector(pressTypeButton:) forControlEvents:UIControlEventTouchUpInside];
            classificationButton.tag = 0;
            [classificationButton.layer setMasksToBounds:YES];
            [classificationButton.layer setCornerRadius:5];
            [classificationButton.layer setBorderWidth:0];
            [self.view addSubview:classificationButton];
        }
    }
    
    
//推荐
    _recommendationView = [[UIView alloc] initWithFrame:CGRectMake(10, 220, 70, 30)];
    UILabel *recommendationLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 40, 30)];
    recommendationLabel.text = @"推荐";
    recommendationLabel.textAlignment = NSTextAlignmentCenter;
    recommendationLabel.textColor = [UIColor whiteColor];
    UIImageView *recommendationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 24, 24)];
    recommendationImageView.image = [UIImage imageNamed:@"search_button.png"];
    _recommendationView.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    [_recommendationView addSubview:recommendationLabel];
    [_recommendationView addSubview:recommendationImageView];
    [self.view addSubview: _recommendationView];
    UIImageView *lineTwo = [[UIImageView alloc] initWithFrame:CGRectMake(80, 248, selfWidth - 90, 2)];
    lineTwo.image = [self createImageWithColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [self.view addSubview:lineTwo];
    _recommendationTitleArray = [NSArray arrayWithObjects:@"人气最高",@"收藏最多",@"评论最多",@"编辑精选", nil];
    for (int i = 0; i < 4; ++i) {
        UIButton *recommendationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        recommendationButton.frame = CGRectMake(10 * (i + 1) + wid * i, 270, wid, 30);
        [recommendationButton setTitle:[_recommendationTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        recommendationButton.backgroundColor = [UIColor whiteColor];
        recommendationButton.tintColor = [UIColor blackColor];
        [recommendationButton addTarget:self action:@selector(pressTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        recommendationButton.tag = 0;
        [recommendationButton.layer setMasksToBounds:YES];
        [recommendationButton.layer setCornerRadius:5];
        [recommendationButton.layer setBorderWidth:0];
        [self.view addSubview:recommendationButton];
        
    }
    
    
//时间
    _timeView = [[UIView alloc] initWithFrame:CGRectMake(10, 320, 70, 30)];
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, 40, 30)];
    timeLabel.text = @"时间";
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textAlignment = NSTextAlignmentCenter;
    timeLabel.textColor = [UIColor whiteColor];
    UIImageView *timeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 24, 24)];
    timeImageView.image = [UIImage imageNamed:@"search_button.png"];
    _timeView.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    [_timeView addSubview:timeLabel];
    [_timeView addSubview:timeImageView];
    [self.view addSubview: _timeView];
    UIImageView *lineThree = [[UIImageView alloc] initWithFrame:CGRectMake(80, 348, selfWidth - 90, 2)];
    lineThree.image = [self createImageWithColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [self.view addSubview:lineThree];
    _timeTitleArray = [NSArray arrayWithObjects:@"30分钟前",@"1小时前",@"1月前",@"1年前", nil];
    for (int i = 0; i < 4; ++i) {
        UIButton *timeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        timeButton.frame = CGRectMake(10 * (i + 1) + wid * i, 370, wid, 30);
        [timeButton setTitle:[_timeTitleArray objectAtIndex:i] forState:UIControlStateNormal];
        timeButton.backgroundColor = [UIColor whiteColor];
        timeButton.tintColor = [UIColor blackColor];
        [timeButton addTarget:self action:@selector(pressTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        timeButton.tag = 0;
        [timeButton.layer setMasksToBounds:YES];
        [timeButton.layer setCornerRadius:5];
        [timeButton.layer setBorderWidth:0];
        [self.view addSubview:timeButton];
    }
    
    
    
    [self.view addSubview:_searchTextField];
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_searchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_searchTextField resignFirstResponder];
    if ([_searchTextField.text isEqualToString:@"大白"]) {
        NSLog(@"搜索大白");
        BayMaxViewController *bayMaxPage = [[BayMaxViewController alloc] init];
        bayMaxPage.searchTextField = [[UITextField alloc] init];
        bayMaxPage.searchTextField.text = _searchTextField.text;
        [self.navigationController pushViewController:bayMaxPage animated:NO];
    } else {
        
    }
    return YES;
}

-(UIImage*) createImageWithColor:(UIColor*) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (void) pressTypeButton:(UIButton*) button {
    if (button.tag == 0) {
        button.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
        button.tintColor = [UIColor whiteColor];
        button.tag = 1;
    } else {
        button.backgroundColor = [UIColor whiteColor];
        button.tintColor = [UIColor blackColor];
        button.tag = 0;
    }
}

@end
