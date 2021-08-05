//
//  FollowedViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FollowedViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *imageArray;

@end

NS_ASSUME_NONNULL_END
