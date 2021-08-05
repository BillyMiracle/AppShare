//
//  ConversationViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/29.
//

#import "ConversationViewController.h"
#import "ConversationTableViewCell.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height
#define toolBarHeight self.navigationController.toolbar.bounds.size.height

@interface ConversationViewController ()
<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@end

@implementation ConversationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"小易";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"私信" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(pressBarLeftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 5, selfWidth - 120, 40)];
    _inputTextField.borderStyle = UITextBorderStyleRoundedRect;

    
    _leftSizeWidthArray = [[NSMutableArray alloc] init];
    _leftSizeHeightArray = [[NSMutableArray alloc] init];
    _rightSizeWidthArray = [[NSMutableArray alloc] init];
    _rightSizeHeightArray = [[NSMutableArray alloc] init];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - 70)style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.sectionHeaderHeight = 0.01;
    _mainTableView.sectionFooterHeight = 0.01;
    _mainTableView.bounces = NO;
    _mainTableView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    [self.view addSubview:_mainTableView];
    
    _arrayLeft = [[NSMutableArray alloc] initWithObjects:
                  @"你拍的真不错",
                  @"好专业的照片，非常喜欢这种风格，希望你能完成更多高质量的作品", nil];
    _arrayRight = [[NSMutableArray alloc] initWithObjects:
                   @"谢谢，已关注你",
                   @"好的，谢谢",nil];
    
    for (NSString * str in _arrayLeft) {
        
        CGSize sizeLeft = [self size:str font:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(selfWidth / 2, MAXFLOAT)];
        
        NSNumber *num = [NSNumber numberWithFloat:sizeLeft.width];
        NSNumber *num2 = [NSNumber numberWithFloat:sizeLeft.height];
        [_leftSizeWidthArray addObject:num];
        [_leftSizeHeightArray addObject:num2];
    }
    for (NSString * str in _arrayRight) {
        
        CGSize sizeRight = [self size:str font:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(selfWidth / 2, MAXFLOAT)];
        
        NSNumber *num = [NSNumber numberWithFloat:sizeRight.width];
        NSNumber *num2 = [NSNumber numberWithFloat:sizeRight.height];
        [_rightSizeWidthArray addObject:num];
        [_rightSizeHeightArray addObject:num2];
        
        _i = 0;
    }
    
    
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sendButton.frame = CGRectMake(selfWidth - 60, 5, 50, 40);
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    
    
    _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, selfHeight - navigationBarHeight - statusBarHeight - 70, selfWidth, 70)];
    [self.view addSubview:_bottomView];
    _bottomView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [_bottomView addSubview:_inputTextField];
    [_bottomView addSubview:sendButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];//键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];//键盘的消失
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到view上
    [_mainTableView addGestureRecognizer:tapGestureRecognizer];
    _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

//键盘显示的时候的处理
- (void) keyboardWasShown:(NSNotification*)aNotification {
    //获得键盘的大小
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.1 animations:^{
        [self->_mainTableView setFrame:CGRectMake(0, 0, selfWidth, selfHeight - 50 - keyboardSize.height)];
        [self->_bottomView setFrame:CGRectMake(0, selfHeight - 50 - keyboardSize.height, selfWidth, 50)];
        NSInteger s = [self->_mainTableView numberOfSections]; //有多少组
        NSInteger r = [self->_mainTableView numberOfRowsInSection:s - 1]; //最后一组有多少行
        NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1]; //取最后一行数据
        [self->_mainTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
}

//键盘消失的时候的处理
- (void) keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.1 animations:^{
        [self->_mainTableView setFrame:CGRectMake(0, 0, selfWidth, selfHeight - 70)];
        [self->_bottomView setFrame:CGRectMake(0, selfHeight - 70, selfWidth, 70)];
        NSInteger s = [self->_mainTableView numberOfSections]; //有多少组
        NSInteger r = [self->_mainTableView numberOfRowsInSection:s - 1]; //最后一组有多少行
        NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1]; //取最后一行数据
        [self->_mainTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
}

- (void) pressBarLeftButton {
    NSString *message = [[NSString alloc] init];
    if (_arrayRight.count > _arrayLeft.count) {
        message = _arrayRight.lastObject;
    } else {
        message = _arrayLeft.lastObject;
    }
    NSNotification * notification = [NSNotification notificationWithName:@"lastMessage" object:self userInfo:@{@"messageOne":message}];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(CGSize)size:(NSString*)text font:(UIFont*)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:font,NSFontAttributeName ,nil];
    return [text boundingRectWithSize:maxSize options: NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

-(void) send {
    if (![_inputTextField.text isEqualToString:@""]) {
        if (_i == 0) {
            
            [_arrayRight addObject:_inputTextField.text];
            
            CGSize sizeRight = [self size:_inputTextField.text font:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(selfWidth / 2, MAXFLOAT)];
            
            NSNumber *num3 = [NSNumber numberWithFloat:sizeRight.width];
            NSNumber *num4 = [NSNumber numberWithFloat:sizeRight.height];
            [_rightSizeWidthArray addObject:num3];
            [_rightSizeHeightArray addObject:num4];
            
            [_mainTableView reloadData];
            _inputTextField.text = @"";
            
            NSInteger s = [_mainTableView numberOfSections]; //有多少组
            NSInteger r = [_mainTableView numberOfRowsInSection:s - 1]; //最后一组有多少行
            NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1]; //取最后一行数据
            
            [_mainTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:YES]; //滚动到最后一行
            _i = 1;
        } else {
            
            [_arrayLeft addObject:_inputTextField.text];

            CGSize sizeLeft = [self size:_inputTextField.text font:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(selfWidth / 2, MAXFLOAT)];

            NSNumber *num = [NSNumber numberWithFloat:sizeLeft.width];
            NSNumber *num2 = [NSNumber numberWithFloat:sizeLeft.height];
            [_leftSizeWidthArray addObject:num];
            [_leftSizeHeightArray addObject:num2];

            [_mainTableView reloadData];
            _inputTextField.text = @"";

            NSInteger s = [_mainTableView numberOfSections]; //有多少组
            NSInteger r = [_mainTableView numberOfRowsInSection:s - 1]; //最后一组有多少行
            NSIndexPath *ip = [NSIndexPath indexPathForRow:r-1 inSection:s-1]; //取最后一行数据

            [_mainTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionBottom animated:YES]; //滚动到最后一行
            _i = 0;
        }
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _arrayRight.count + _arrayLeft.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        if ([_rightSizeHeightArray[indexPath.section / 2] floatValue] < 30) {
            return 60;
        } else {
            return [_rightSizeHeightArray[indexPath.section / 2] floatValue] + 30;
        }
    } else {
        if ([_leftSizeHeightArray[indexPath.section / 2] floatValue] < 30) {
            return 60;
        } else {
            return [_leftSizeHeightArray[indexPath.section / 2] floatValue] + 30;
        }
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section % 2 == 0) {
        
        ConversationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"right"];
        if (cell == nil) {
            cell = [[ConversationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"right"];
        }
        cell.rightImageView.image = [UIImage imageNamed:@"works_head.png"];
        cell.rightImageView.frame = CGRectMake(selfWidth - 50, 10, 40, 40);
        CGSize textSizeright;
        textSizeright.height =[_rightSizeHeightArray[indexPath.section / 2] floatValue];
        textSizeright.width = [_rightSizeWidthArray[indexPath.section / 2] floatValue];
        
        //cell.rightTextLabel.frame = CGRectMake(selfWidth  - 60 - textSizeright.width, 10, textSizeright.width, textSizeright.height);
        cell.rightTextLabel.frame = CGRectMake(5, 5, textSizeright.width, textSizeright.height);
        cell.rightView.frame = CGRectMake(selfWidth  - 60 - textSizeright.width - 10, 10, textSizeright.width + 10, textSizeright.height + 10);
        cell.rightTextLabel.text = _arrayRight[indexPath.section / 2];
        
        cell.rightTextLabel.numberOfLines = 0;
        cell.rightTextLabel.font = [UIFont systemFontOfSize:16];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else {

        ConversationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"left"];
        if (cell == nil) {
            cell = [[ConversationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"left"];
        }
        CGSize textSizeleft;
        textSizeleft.height =[_leftSizeHeightArray[indexPath.section / 2] floatValue];
        textSizeleft.width = [_leftSizeWidthArray[indexPath.section / 2] floatValue];
        
        cell.leftImageView.frame = CGRectMake(10, 10, 40, 40);
        cell.leftImageView.image = [UIImage imageNamed:@"headImage12.jpg"];
        cell.leftTextLabel.text =_arrayLeft[indexPath.section / 2];
        cell.leftView.frame = CGRectMake(60, 10, textSizeleft.width + 10, textSizeleft.height + 10);
        //cell.leftTextLabel.frame =CGRectMake(60, 10, textSizeleft.width, textSizeleft.height);
        cell.leftTextLabel.frame =CGRectMake(5, 5, textSizeleft.width, textSizeleft.height);
        cell.leftTextLabel.font = [UIFont systemFontOfSize:16];
        cell.leftTextLabel.numberOfLines = 0;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [_inputTextField resignFirstResponder];
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    [_inputTextField resignFirstResponder];
}


@end
