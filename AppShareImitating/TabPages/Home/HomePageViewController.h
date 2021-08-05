//
//  HomePageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewController : UIViewController {
    NSTimer *timerFirst;
}

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UIScrollView *firstSubScrollView;

@property (nonatomic, strong) UIPageControl *firstPageControl;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *shareArray;
@property (nonatomic, copy) NSArray *classificationArray;

@property (nonatomic, strong) NSMutableDictionary *likeNumberMutableDictionary;
@property (nonatomic, strong) NSMutableDictionary *visitButtonMutableDictionary;

@end

NS_ASSUME_NONNULL_END
