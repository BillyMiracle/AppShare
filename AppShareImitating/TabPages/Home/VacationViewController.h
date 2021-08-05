//
//  VacationViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VacationViewController : UIViewController

@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, strong) UIButton *headImageButton;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *visitButton;
@property (nonatomic, strong) UIButton *shareButton;

@property (nonatomic, strong) UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
