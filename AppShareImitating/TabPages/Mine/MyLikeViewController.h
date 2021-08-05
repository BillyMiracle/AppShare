//
//  MyLikeViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyLikeViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, copy) NSArray *imageArray;

@property (nonatomic, copy) NSArray *titleArray;

@property (nonatomic, copy) NSArray *shareTextArray;

@property (nonatomic, copy) NSArray *timeArray;


@end

NS_ASSUME_NONNULL_END
