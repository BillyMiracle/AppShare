//
//  ConversationTableViewCell.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/29.
//

#import "ConversationTableViewCell.h"

@implementation ConversationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([reuseIdentifier isEqualToString:@"left"]) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            _leftImageView = [[UIImageView alloc]init];
            _leftTextLabel = [[UILabel alloc]init];
            _leftView = [[UIView alloc] init];
            _leftView.backgroundColor = [UIColor whiteColor];
            _leftTextLabel.backgroundColor = [UIColor clearColor];
            self.backgroundColor = [UIColor clearColor];
            [_leftView addSubview:_leftTextLabel];
            [self.contentView addSubview:_leftView];
            [self.contentView addSubview:_leftImageView];
        }
        return self;
    } else {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            _rightImageView = [[UIImageView alloc]init];
            _rightTextLabel = [[UILabel alloc]init];
            _rightView = [[UIView alloc] init];
            _rightView.backgroundColor = [UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:1];
            _rightTextLabel.backgroundColor = [UIColor clearColor];
            self.backgroundColor = [UIColor clearColor];
            [_rightView addSubview:_rightTextLabel];
            [self.contentView addSubview:_rightView];
            [self.contentView addSubview:_rightImageView];
        }
        return self;
    }
}

@end
