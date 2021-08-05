//
//  InformationViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UIButton *maleButton;
@property (nonatomic, strong) UIButton *femaleButton;

@end

NS_ASSUME_NONNULL_END
