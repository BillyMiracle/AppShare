//
//  ArticlePageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticlePageViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *middleButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *middleTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, copy) NSArray *imageArrayLeft;
@property (nonatomic, copy) NSArray *imageArrayMiddle;
@property (nonatomic, copy) NSArray *imageArrayRight;
@property (nonatomic, copy) NSArray *titleArrayLeft;
@property (nonatomic, copy) NSArray *titleArrayMiddle;
@property (nonatomic, copy) NSArray *titleArrayRight;
@property (nonatomic, copy) NSArray *shareTextArrayLeft;
@property (nonatomic, copy) NSArray *shareTextArrayMiddle;
@property (nonatomic, copy) NSArray *shareTextArrayRight;
@property (nonatomic, copy) NSArray *timeArrayLeft;
@property (nonatomic, copy) NSArray *timeArrayMiddle;
@property (nonatomic, copy) NSArray *timeArrayRight;

@property (nonatomic, strong) NSMutableDictionary *likeNumberMutableDictionary;

@end

NS_ASSUME_NONNULL_END
