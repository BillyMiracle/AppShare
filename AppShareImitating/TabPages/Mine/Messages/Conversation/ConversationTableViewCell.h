//
//  ConversationTableViewCell.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConversationTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView * rightImageView;
@property (nonatomic, strong) UIImageView * leftImageView;

@property (nonatomic, strong) UILabel * rightTextLabel;
@property (nonatomic, strong) UILabel * leftTextLabel;
@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) UIView * leftView;
@property (nonatomic, strong) UIView * rightView;

@end

NS_ASSUME_NONNULL_END
