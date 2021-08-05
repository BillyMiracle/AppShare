//
//  PeopleTableViewCell.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/8/4.
//

#import "PeopleTableViewCell.h"

@implementation PeopleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
        [self.contentView addSubview:_image];
        
        
        _name = [[UILabel alloc] init];
        _name.font = [UIFont systemFontOfSize:20];
        
        [self.contentView addSubview:_name];
        
        
        _time = [[UILabel alloc] init];
        _time.font = [UIFont systemFontOfSize:14];
        _time.textColor = [UIColor lightGrayColor];
        _time.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_time];
        
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = [UIFont systemFontOfSize:16];
        _messageLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_messageLabel];
    }
    return self;
}
@end
