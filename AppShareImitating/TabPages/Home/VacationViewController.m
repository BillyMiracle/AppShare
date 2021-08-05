//
//  VacationViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "VacationViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface VacationViewController ()

@end

@implementation VacationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *TitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    TitleLabel.backgroundColor = [UIColor clearColor];
    TitleLabel.font = [UIFont boldSystemFontOfSize:20];
    TitleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    TitleLabel.text = @"SHARE";
    self.navigationItem.titleView = TitleLabel;
    
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - tabBarHeight - navigationBarHeight - statusBarHeight)];
    _mainScrollView.contentSize = CGSizeMake(selfWidth, 180 + (selfWidth - 20) / 102 * 59 * 3 + (selfWidth - 100) / 593 *840 * 2 + 20);
    [self.view addSubview:_mainScrollView];
    
    
    _headImageButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 60, 60)];
    [_headImageButton setBackgroundImage:[UIImage imageNamed:@"works_head.png"] forState:UIControlStateNormal];
    [_mainScrollView addSubview:_headImageButton];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, selfWidth - 170, 40)];
    titleLabel.text = @"假日";
    titleLabel.font = [UIFont systemFontOfSize:24];
    [_mainScrollView addSubview:titleLabel];
    
    
    UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 60, 100, 20)];
    shareLabel.text = @"share 小王";
    shareLabel.font = [UIFont systemFontOfSize:17];
    [_mainScrollView addSubview:shareLabel];
    
    
    _timeLabel.textColor = [UIColor grayColor];
    _timeLabel.font = [UIFont systemFontOfSize:16];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [_mainScrollView addSubview:_timeLabel];
    
    
    _shareButton.frame = CGRectMake(selfWidth - 60, 60, 50, 20);
    [_shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [_mainScrollView addSubview:_shareButton];
    
    _visitButton.frame = CGRectMake(selfWidth - 110, 60, 50, 20);
    [_visitButton setImage:[UIImage imageNamed:@"view.png"] forState:UIControlStateNormal];
    [_mainScrollView addSubview:_visitButton];
    
    _likeButton.frame = CGRectMake(selfWidth - 160, 60, 50, 20);
    [_likeButton setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
    [_mainScrollView addSubview:_likeButton];
    
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, selfWidth, 2)];
    lineImageView.image = [self createImageWithColor:[UIColor colorWithWhite:0.9 alpha:1]];
    [_mainScrollView addSubview: lineImageView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, selfWidth - 20, 20)];
    textLabel.text = @"多希望列车能把我带到有你的城市";
    
    UIImageView *firstImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 140, selfWidth - 20, (selfWidth - 20) / 102 * 59)];
    firstImage.image = [UIImage imageNamed:@"works_img1.png"];
    [_mainScrollView addSubview:firstImage];
    
    UIImageView *secondImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 150 + (selfWidth - 20) / 102 * 59, selfWidth - 20, (selfWidth - 20) / 102 * 59)];
    secondImage.image = [UIImage imageNamed:@"works_img2.png"];
    [_mainScrollView addSubview:secondImage];
    
    UIImageView *thirdImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 160 + (selfWidth - 20) / 102 * 59 * 2, selfWidth - 20, (selfWidth - 20) / 102 * 59)];
    thirdImage.image = [UIImage imageNamed:@"works_img4.png"];
    [_mainScrollView addSubview:thirdImage];
    
    UIImageView *fourthImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 170 + (selfWidth - 20) / 102 * 59 * 3, selfWidth - 100, (selfWidth - 100) / 593 *840)];
    fourthImage.image = [UIImage imageNamed:@"works_img3.png"];
    [_mainScrollView addSubview:fourthImage];
    
    UIImageView *fifthImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 180 + (selfWidth - 20) / 102 * 59 * 3 + (selfWidth - 100) / 593 *840, selfWidth - 100, (selfWidth - 100) / 593 *840)];
    fifthImage.image = [UIImage imageNamed:@"works_img5.png"];
    [_mainScrollView addSubview:fifthImage];
    
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

- (void)pressLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
