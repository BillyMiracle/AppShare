//
//  MyMessageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>
#import "FollowedViewController.h"
#import "PeopleViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMessageViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *detailTextArray;

@property (nonatomic, strong) FollowedViewController *followedPage;
@property (nonatomic, strong) PeopleViewController *peoplePage;

@end

NS_ASSUME_NONNULL_END
