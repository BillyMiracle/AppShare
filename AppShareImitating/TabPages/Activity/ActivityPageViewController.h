//
//  ActivityPageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import <UIKit/UIKit.h>
#import "ActivityTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ActivityPageViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  UITableView *mainTableView;
@property (nonatomic, copy) NSArray *titleArray;

@end

NS_ASSUME_NONNULL_END
