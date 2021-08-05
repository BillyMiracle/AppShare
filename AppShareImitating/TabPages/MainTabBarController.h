//
//  MainTabBarController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>
#import "HomePageViewController.h"
#import "SearchPageViewController.h"
#import "ArticlePageViewController.h"
#import "ActivityPageViewController.h"
#import "MinePageViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface MainTabBarController : UITabBarController

@property (nonatomic, copy) NSArray *arrayViewControllers;

@end

NS_ASSUME_NONNULL_END
