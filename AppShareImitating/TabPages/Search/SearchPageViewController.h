//
//  SearchPageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchPageViewController : UIViewController

@property (nonatomic, strong) UITextField *searchTextField;

@property (nonatomic, strong) UIView *classificationView;
@property (nonatomic, strong) UIView *recommendationView;
@property (nonatomic, strong) UIView *timeView;

@property (nonatomic, copy) NSArray *classificationTitleArray;
@property (nonatomic, copy) NSArray *recommendationTitleArray;
@property (nonatomic, copy) NSArray *timeTitleArray;

@end

NS_ASSUME_NONNULL_END
