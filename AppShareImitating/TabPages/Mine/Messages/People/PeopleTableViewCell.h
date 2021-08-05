//
//  PeopleTableViewCell.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/8/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PeopleTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *image;

@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *time;
@property (nonatomic, strong) UILabel *messageLabel;

@end

NS_ASSUME_NONNULL_END
