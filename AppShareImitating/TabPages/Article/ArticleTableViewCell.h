//
//  ArticleTableViewCell.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArticleTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *shareLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *viewButton;
@property (nonatomic, strong) UIButton *shareButton;

@end

NS_ASSUME_NONNULL_END
