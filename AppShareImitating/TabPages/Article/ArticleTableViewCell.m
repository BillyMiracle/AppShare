//
//  ArticleTableViewCell.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import "ArticleTableViewCell.h"

#define selfWidth [UIScreen mainScreen].bounds.size.width
#define selfHeight [UIScreen mainScreen].bounds.size.height

@implementation ArticleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(5, 5, selfWidth - 10, selfWidth / 3 - 10)];
    _backView.backgroundColor = [UIColor whiteColor];
    
    _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _backView.bounds.size.height * 3 / 2, _backView.bounds.size.height)];
    [_backView addSubview:_leftImageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_backView.bounds.size.height * 3 / 2 + 10, 4, _backView.bounds.size.width - _leftImageView.bounds.size.width - 20, 40)];
    _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    [_backView addSubview:_titleLabel];
    
    _shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(_backView.bounds.size.height * 3 / 2 + 10, 44, _backView.bounds.size.width - _leftImageView.bounds.size.width - 20, 20)];
    [_backView addSubview:_shareLabel];
    
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(_backView.bounds.size.height * 3 / 2 + 10, 64, _backView.bounds.size.width - _leftImageView.bounds.size.width - 20, 16)];
    [_backView addSubview:_timeLabel];
    
    _likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _likeButton.backgroundColor = [UIColor clearColor];
    _likeButton.frame = CGRectMake(_backView.bounds.size.height * 3 / 2 + (_backView.bounds.size.width - _backView.bounds.size.height * 3 / 2 - 150) / 4, _backView.bounds.size.height - 27, 50, 20);
    [_likeButton setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
    [_backView addSubview: _likeButton];
    
    _viewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _viewButton.backgroundColor = [UIColor clearColor];
    _viewButton.frame = CGRectMake(_backView.bounds.size.height * 3 / 2 + (_backView.bounds.size.width - _backView.bounds.size.height * 3 / 2 - 150) / 2 + 50, _backView.bounds.size.height - 27, 50, 20);
    [_viewButton setImage:[UIImage imageNamed:@"view.png"] forState:UIControlStateNormal];
    [_backView addSubview:_viewButton];
    
    _shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _shareButton.backgroundColor = [UIColor clearColor];
    _shareButton.frame = CGRectMake(_backView.bounds.size.height * 3 / 2 + (_backView.bounds.size.width - _backView.bounds.size.height * 3 / 2 - 150) / 4 * 3 + 50 * 2, _backView.bounds.size.height - 27, 50, 20);
    [_shareButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    [_backView addSubview:_shareButton];
    
    [self.contentView addSubview:_backView];
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}

- (void) layoutSubviews {
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _shareLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textColor = [UIColor lightGrayColor];
}

@end
