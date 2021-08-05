//
//  ConversationViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConversationViewController : UIViewController

@property (nonatomic, strong) UITextField *inputTextField;

@property (nonatomic, strong) NSMutableArray *leftSizeWidthArray;
@property (nonatomic, strong) NSMutableArray *leftSizeHeightArray;
@property (nonatomic, strong) NSMutableArray *rightSizeWidthArray;
@property (nonatomic, strong) NSMutableArray *rightSizeHeightArray;

@property (nonatomic, strong) NSMutableArray *arrayRight;
@property (nonatomic, strong) NSMutableArray *arrayLeft;

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) UIView *bottomView;

//@property (nonatomic, copy) NSNumber *height;

@property (nonatomic, assign) int i;

@end

NS_ASSUME_NONNULL_END
