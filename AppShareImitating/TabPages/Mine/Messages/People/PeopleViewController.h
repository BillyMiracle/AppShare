//
//  PeopleViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import <UIKit/UIKit.h>
#import "ConversationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PeopleViewController : UIViewController

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, copy) NSArray *imageArray;
@property (nonatomic, copy) NSArray *timeArray;
@property (nonatomic, copy) NSMutableArray *messageArray;

@property (nonatomic, strong) UILabel *messageLabel;

@property (nonatomic, strong) UINavigationController *conversationNavigationController;

@property (nonatomic, strong) ConversationViewController *conversationPage;

@end

NS_ASSUME_NONNULL_END
