//
//  MainTabBarController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomePageViewController *homePage = [[HomePageViewController alloc] init];
    
    homePage.tabBarItem.image = [UIImage imageNamed:@"radio_button_home.png"];
    //homePage.title = @"首页";
    
    
    SearchPageViewController *searchPage = [[SearchPageViewController alloc] init];
    searchPage.tabBarItem.image = [UIImage imageNamed:@"radio_button_search.png"];
    //searchPage.title = @"搜索";
    
    
    ArticlePageViewController *articlePage = [[ArticlePageViewController alloc] init];
    articlePage.tabBarItem.image = [UIImage imageNamed:@"radio_button_note.png"];
    //articlePage.title = @"文章";
    
    
    ActivityPageViewController *activityPage = [[ActivityPageViewController alloc] init];
    activityPage.tabBarItem.image = [UIImage imageNamed:@"radio_button_cup.png"];
    //activityPage.title = @"活动";
    
    
    MinePageViewController *minePage = [[MinePageViewController alloc] init];
    minePage.tabBarItem.image = [UIImage imageNamed:@"radio_button_user.png"];
    //minePage.title = @"我的";
    
    UINavigationController *homePageNavigationController = [[UINavigationController alloc] initWithRootViewController:homePage];
    UINavigationController *searchPageNavigationController = [[UINavigationController alloc] initWithRootViewController:searchPage];
    UINavigationController *articlePageNavigationController = [[UINavigationController alloc] initWithRootViewController:articlePage];
    UINavigationController *activityPageNavigationController = [[UINavigationController alloc] initWithRootViewController:activityPage];
    UINavigationController *minePageNavigationController = [[UINavigationController alloc] initWithRootViewController:minePage];
    _arrayViewControllers = [NSArray arrayWithObjects:homePageNavigationController,searchPageNavigationController,articlePageNavigationController,activityPageNavigationController,minePageNavigationController, nil];
    self.viewControllers = _arrayViewControllers;
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor whiteColor]]];
    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
