//
//  ActivityTableViewCell.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/26.
//

#import "ActivityTableViewCell.h"

#define selfWidth [UIScreen mainScreen].bounds.size.width
#define selfHeight [UIScreen mainScreen].bounds.size.height

@implementation ActivityTableViewCell

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _activityLabel = [[UILabel alloc] init];
    _activityImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_activityLabel];
    [self.contentView addSubview:_activityImageView];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

- (void) layoutSubviews {
    _activityLabel.frame = CGRectMake(10, selfWidth / 2, selfWidth - 10, 30);
    _activityLabel.font = [UIFont systemFontOfSize:18];
    _activityLabel.textColor = [UIColor blackColor];
    _activityImageView.frame = CGRectMake(5, 5, selfWidth - 10, selfWidth / 2 - 5);
}

@end
