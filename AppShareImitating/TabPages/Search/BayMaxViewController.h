//
//  BayMaxViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BayMaxViewController : UIViewController

@property (nonatomic, strong) UITextField *searchTextField;

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *shareArray;
@property (nonatomic, copy) NSArray *classificationArray;

@property (nonatomic, strong) NSMutableDictionary *likeNumberMutableDictionary;

@property (nonatomic, strong) UIView *searchView;
@end

NS_ASSUME_NONNULL_END
