//
//  InformationViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/28.
//

#import "InformationViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height


@interface InformationViewController ()
<UITableViewDelegate,UITableViewDataSource>
@end

@implementation InformationViewController

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
    titleLabel.text = @"基本资料";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [backButton setImage:[UIImage imageNamed:@"iconfont-left.png"] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [backButton setTintColor:[UIColor whiteColor]];
    [backButton addTarget:self action:@selector(pressBarLeftButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    _mainTableView.sectionHeaderHeight = 0.01;
    _titleArray = [NSArray arrayWithObjects:@"头像",@"昵称",@"签名",@"性别",@"邮箱", nil];
    [self.view addSubview:_mainTableView];
}

- (void) pressBarLeftButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellOne"];
        }
        UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(80, 10, 80, 80)];
        headImage.image = [UIImage imageNamed:@"works_head.png"];
        cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
        [cell.contentView addSubview:headImage];
        return cell;
    } else if (indexPath.row == 3) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTwo"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellTwo"];
        }
        _maleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _femaleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _maleButton.frame = CGRectMake(80, 10, 40, 30);
        _femaleButton.frame = CGRectMake(120, 10, 40, 30);
        [_maleButton setTitle:@"男" forState:UIControlStateNormal];
        [_femaleButton setTitle:@"女" forState:UIControlStateNormal];
        _maleButton.tag = 1;
        _femaleButton.tag = 0;
        [_maleButton setTintColor:[UIColor systemBlueColor]];
        [_femaleButton setTintColor:[UIColor grayColor]];
        [_maleButton addTarget:self action:@selector(pressGenderButton) forControlEvents:UIControlEventTouchUpInside];
        [_femaleButton addTarget:self action:@selector(pressGenderButton) forControlEvents:UIControlEventTouchUpInside];
        [_maleButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
        [_femaleButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        
        [cell.contentView addSubview:_maleButton];
        [cell.contentView addSubview:_femaleButton];
        cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellThree"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellThree"];
        }
        cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, selfWidth - 90, 30)];
        if (indexPath.row == 1) {
            textLabel.text = @"小王";
        } else if (indexPath.row == 2) {
            textLabel.text = @"开心了就笑，不开心了就不笑";
        } else if (indexPath.row == 4) {
            textLabel.text = @"510######@qq.com";
        }
        [cell.contentView addSubview:textLabel];
        return cell;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)pressGenderButton {
    if(_maleButton.tag == 0) {
        _maleButton.tag = 1;
        _femaleButton.tag = 0;
        [_maleButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
        [_femaleButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        [_maleButton setTintColor:[UIColor systemBlueColor]];
        [_femaleButton setTintColor:[UIColor grayColor]];
    } else {
        _maleButton.tag = 0;
        _femaleButton.tag = 1;
        [_femaleButton setImage:[UIImage imageNamed:@"boy_button.png"] forState:UIControlStateNormal];
        [_maleButton setImage:[UIImage imageNamed:@"girl_button.png"] forState:UIControlStateNormal];
        [_femaleButton setTintColor:[UIColor systemBlueColor]];
        [_maleButton setTintColor:[UIColor grayColor]];
    }
}

@end
