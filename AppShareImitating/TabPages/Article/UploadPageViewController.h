//
//  UploadPageViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UploadPageViewController : UIViewController

@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UIButton *uploadButton;
@property (nonatomic, strong) UIButton *forbidButton;

@property (nonatomic, strong) UILabel *numberLabel;

@property (nonatomic, copy) NSArray *classificationTitleArray;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *descriptionTextField;

@property (nonatomic, strong) UIImageView *checkImage;

//折叠cell实验
@property (nonatomic, strong) UITableView *classTableView;
@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, strong) NSMutableArray *textArray;
@property (nonatomic) BOOL selected;

@end

NS_ASSUME_NONNULL_END
