//
//  UploadPageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import "UploadPageViewController.h"
#import "PhotoWallViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface UploadPageViewController ()<SelectPhotosDelegate,UITableViewDelegate,UITableViewDataSource>

@end

@implementation UploadPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"上传";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"文章" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(pressleftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    locationButton.frame = CGRectMake(selfWidth / 2 + 20, 30, 140, 30);
    [locationButton setImage:[UIImage imageNamed:@"location.png"] forState:UIControlStateNormal];
    [locationButton setTitle:@"陕西省 西安市" forState:UIControlStateNormal];
    [locationButton.layer setMasksToBounds:YES];
    [locationButton.layer setCornerRadius:15];
    [locationButton.layer setBorderWidth:1];
    [locationButton setTintColor:[UIColor systemBlueColor]];
    [locationButton.layer setBorderColor:[UIColor systemBlueColor].CGColor];
    [locationButton addTarget:self action:@selector(pressLocationButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:locationButton];
    
    
    _imageButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, (selfWidth - 20) / 2, (selfWidth - 20) / 3)];
    [_imageButton setBackgroundImage:[UIImage imageNamed:@"unselected.png"] forState:UIControlStateNormal];
    [_imageButton addTarget:self action:@selector(pressImageButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _imageButton];
    
    
    _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake((selfWidth - 20) / 2 - 20, 0, 20, 20)];
    _numberLabel.textColor = [UIColor whiteColor];
    _numberLabel.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    
    float wid = (selfWidth - 50) / 4;
    _classificationTitleArray = [NSArray arrayWithObjects:@"平面设计",@"网页设计",@"UI/icon",@"插画/手绘",@"虚拟与设计",@"影视",@"摄影",@"其他", nil];
    for (int i = 0; i < 2; ++i) {
        for (int j = 0; j < 4; ++j) {
            UIButton *classificationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            classificationButton.frame = CGRectMake(10 * (j + 1) + wid * j, (selfWidth - 20) / 3 + 40 + 40 * i, wid, 30);
            [classificationButton setTitle:[_classificationTitleArray objectAtIndex:i*4 + j] forState:UIControlStateNormal];
            classificationButton.backgroundColor = [UIColor whiteColor];
            classificationButton.tintColor = [UIColor blackColor];
            [classificationButton addTarget:self action:@selector(pressTypeButton:) forControlEvents:UIControlEventTouchUpInside];
            classificationButton.tag = 0;
            [classificationButton.layer setMasksToBounds:YES];
            [classificationButton.layer setCornerRadius:5];
            [classificationButton.layer setBorderWidth:0];
            [self.view addSubview:classificationButton];
        }
    }
    
    
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, (selfWidth - 20) / 3 + 130, selfWidth - 20, 30)];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.backgroundColor = [UIColor whiteColor];
    _nameTextField.placeholder = @"作品名称";
    [self.view addSubview:_nameTextField];
    
    _descriptionTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, (selfWidth - 20) / 3 + 170, selfWidth - 20, selfHeight / 7)];
    _descriptionTextField.borderStyle = UITextBorderStyleRoundedRect;
    _descriptionTextField.backgroundColor = [UIColor whiteColor];
    _descriptionTextField.placeholder = @"作品描述";
    _descriptionTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    [self.view addSubview:_descriptionTextField];
    
    
    _uploadButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _uploadButton.frame = CGRectMake(10, (selfWidth - 20) / 3 + 190 + selfHeight / 7, selfWidth - 20, 50);
    [_uploadButton setTitle:@"发布" forState:UIControlStateNormal];
    [_uploadButton setBackgroundColor: [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
    _uploadButton.tintColor = [UIColor whiteColor];
    _uploadButton.titleLabel.font = [UIFont systemFontOfSize:24];
    [_uploadButton addTarget:self action:@selector(pressUploadButton) forControlEvents:UIControlEventTouchUpInside];
    [_uploadButton.layer setMasksToBounds:YES];
    [_uploadButton.layer setCornerRadius:5];
    [_uploadButton.layer setBorderWidth:0];
    [self.view addSubview:_uploadButton];
    
    
    _forbidButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _forbidButton.frame = CGRectMake(10, (selfWidth - 20) / 3 + 260 + selfHeight / 7, 100, 20);
    _checkImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"checkbox0.png"]];
    _checkImage.frame = CGRectMake(0, 0, 20, 20);
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 20)];
    text.text = @"禁止下载";
    _forbidButton.tag = 0;
    [_forbidButton addTarget:self action:@selector(pressForbid) forControlEvents:UIControlEventTouchUpInside];
    [_forbidButton addSubview:text];
    [_forbidButton addSubview:_checkImage];
    [self.view addSubview:_forbidButton];
    
    
//折叠cell
    _classTableView = [[UITableView alloc] initWithFrame:CGRectMake(selfWidth / 2 + 20, 80, 140, 30)];
    _classTableView.delegate = self;
    _classTableView.dataSource = self;
    _classTableView.bounces = NO;
    [_classTableView.layer setMasksToBounds:YES];
    [_classTableView.layer setCornerRadius:6];
    [_classTableView.layer setBorderWidth:0];
    [self.view addSubview:_classTableView];
    
    _foldButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _foldButton.frame = CGRectMake(selfWidth / 2 + 130, 80, 30, 30);
    [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    [_foldButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_foldButton];
        
    _selected = NO;
        
    _textArray = [[NSMutableArray alloc] initWithObjects:@"原创作品",@"设计资料",@"授权转载",@"设计教程",@"设计师观点", nil];

//
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];//键盘的弹出
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillBeHidden:) name:UIKeyboardWillHideNotification object:nil];//键盘的消失
}

- (void)selectedPhoto:(UIImage *)firstImage number:(NSInteger)numberOfPhotos {
    if (firstImage) {
        [_imageButton setBackgroundImage:firstImage forState:UIControlStateNormal];
    }
    _numberLabel.text = [NSString stringWithFormat:@"%ld", numberOfPhotos];
    [_imageButton addSubview:_numberLabel];
}

- (void)pressImageButton {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    PhotoWallViewController *photoWallPage = [[PhotoWallViewController alloc] init];
    photoWallPage.delegate = self;
    [self.navigationController pushViewController:photoWallPage animated:YES];
}

- (void) pressleftButton {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pressTypeButton:(UIButton*) button {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    if (button.tag == 0) {
        button.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
        button.tintColor = [UIColor whiteColor];
        button.tag = 1;
    } else {
        button.backgroundColor = [UIColor whiteColor];
        button.tintColor = [UIColor blackColor];
        button.tag = 0;
    }
}

- (void) pressUploadButton {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    if ([_nameTextField.text isEqualToString:@""]) {
        UIAlertController* confirmAlertController = [UIAlertController alertControllerWithTitle:@"名称不能为空" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [confirmAlertController addAction: confirm];
        [self presentViewController:confirmAlertController animated:YES completion:nil];
    } else {
        UIAlertController* confirmAlertController = [UIAlertController alertControllerWithTitle:@"是否发布" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //NSLog(@"点击了取消按钮");
        }];
        [confirmAlertController addAction: cancel];
        [confirmAlertController addAction: confirm];
        [self presentViewController:confirmAlertController animated:YES completion:nil];
    }
}

- (void) pressForbid {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    if (_forbidButton.tag == 0) {
        _checkImage.image = [UIImage imageNamed:@"checkbox1.png"];
        _forbidButton.tag = 1;
    } else {
        _checkImage.image = [UIImage imageNamed:@"checkbox0.png"];
        _forbidButton.tag = 0;
    }
}

//键盘显示的时候的处理
- (void) keyboardWasShown:(NSNotification*)aNotification {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
    //获得键盘的大小
    NSDictionary* info = [aNotification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view setFrame:CGRectMake(0, -keyboardSize.height / 4 , selfWidth, selfHeight)];
    }];
}

//键盘消失的时候的处理
- (void) keyboardWillBeHidden:(NSNotification*)aNotification
{
    [UIView animateWithDuration:0.1 animations:^{
        [self.view setFrame:CGRectMake(0, navigationBarHeight + statusBarHeight , selfWidth, selfHeight)];
    }];
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameTextField resignFirstResponder];
    [_descriptionTextField resignFirstResponder];
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_selected) {
        return 5;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [_textArray objectAtIndex:indexPath.row];
    [cell.layer setMasksToBounds:YES];
    [cell.layer setCornerRadius:6];
    [cell.layer setBorderWidth:1];
    [cell.layer setBorderColor:[UIColor systemBlueColor].CGColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *currentText = [_textArray objectAtIndex:indexPath.row];
    [_textArray removeObjectAtIndex:indexPath.row];
    [_textArray insertObject:currentText atIndex:0];
    [_classTableView reloadData];
    [self press];
}

- (void) press {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    } else {
        _selected = YES;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height * 5);
        [_foldButton setImage:[UIImage imageNamed:@"extend.png"] forState:UIControlStateNormal];
    }
    [_classTableView reloadData];
}

- (void) pressLocationButton {
    if (_selected) {
        _selected = NO;
        _classTableView.frame = CGRectMake(_classTableView.frame.origin.x, _classTableView.frame.origin.y, _classTableView.frame.size.width, _classTableView.frame.size.height / 5);
        [_foldButton setImage:[UIImage imageNamed:@"fold.png"] forState:UIControlStateNormal];
    }
}

@end
