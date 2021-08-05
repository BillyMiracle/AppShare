//
//  StartPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "StartPageViewController.h"

@interface StartPageViewController ()

@end

@implementation StartPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    float selfwidth = self.view.bounds.size.width;
    float selfheight = self.view.bounds.size.height;
    // Do any additional setup after loading the view.
    
    _startBackGroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    _startBackGroundImageView.image = [UIImage imageNamed:@"kaiji1.png"];
    
    _startImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"startPage.jpg"]];
    _startImageView.frame = CGRectMake(0, (selfheight - (selfwidth/9*16))/2, selfwidth, selfwidth/9*16);
    [_startBackGroundImageView addSubview:_startImageView];
    [self.view addSubview:_startBackGroundImageView];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:0.23 green:0.56 blue:0.78 alpha:1];
    
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
