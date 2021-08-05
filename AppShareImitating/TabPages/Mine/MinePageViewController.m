//
//  MinePageViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/25.
//

#import "MinePageViewController.h"



#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface MinePageViewController ()

@end

@implementation MinePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 40)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"个人信息";
    self.navigationItem.titleView = titleLabel;
    
    _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - tabBarHeight - navigationBarHeight - statusBarHeight) style: UITableViewStyleGrouped];
    _mineTableView.delegate = self;
    _mineTableView.dataSource = self;
    _mineTableView.sectionHeaderHeight = 0.01;
    
    
    _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"img2.png"],
                   [UIImage imageNamed:@"img4.png"],
                   [UIImage imageNamed:@"button_zan.png.png"],
                   [UIImage imageNamed:@"img5.png"],
                   [UIImage imageNamed:@"img6.png"],
                   [UIImage imageNamed:@"img7.png"], nil];
    
    
    _titleArray = [NSArray arrayWithObjects:@"我上传的",
                   @"我的信息",
                   @"我喜欢的",
                   @"院系通知",
                   @"设置",
                   @"退出",nil];
    
    
    _headButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _headButton.frame = CGRectMake(20, 20, 110, 110);
    [_headButton setBackgroundImage:[UIImage imageNamed:@"works_head.png"] forState:UIControlStateNormal];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, selfWidth - 160, 40)];
    _nameLabel.text = @"小王";
    _nameLabel.font = [UIFont systemFontOfSize:24];
    
    _tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 60, selfWidth - 160, 20)];
    _tagLabel.text = @"数媒/设计爱好者";
    _tagLabel.font = [UIFont systemFontOfSize:14];
    
    _signLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 90, selfWidth - 160, 20)];
    _signLabel.text = @"开心了就笑，不开心了就不笑";
    _signLabel.font = [UIFont systemFontOfSize:14];
    
    _messageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _messageButton.frame = CGRectMake(140, 110, 60, 20);
    [_messageButton setImage:[UIImage imageNamed:@"message.png"] forState:UIControlStateNormal];
    [_messageButton setTitle:@"15" forState:UIControlStateNormal];
    [_messageButton setTintColor:[UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
    
    _likeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_likeButton setImage:[UIImage imageNamed:@"like.png"] forState:UIControlStateNormal];
    [_likeButton setTitle:@"125" forState:UIControlStateNormal];
    _likeButton.frame = CGRectMake(200, 110, 60, 20);
    [_likeButton setTintColor:[UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
    
    _viewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_viewButton setImage:[UIImage imageNamed:@"view.png"] forState:UIControlStateNormal];
    [_viewButton setTitle:@"1024" forState:UIControlStateNormal];
    _viewButton.frame = CGRectMake(260, 110, 60, 20);
    [_viewButton setTintColor:[UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
    
    [self.view addSubview:_mineTableView];
    
    
    _settingPage = [[SettingsViewController alloc] init];
    _settingPage.informationPage = [[InformationViewController alloc] init];
    
    _messagePage = [[MyMessageViewController alloc] init];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 6;
    } else {
        return 1;
    }
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellOne"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellOne"];
        }
        [cell.contentView addSubview:_messageButton];
        [cell.contentView addSubview:_likeButton];
        [cell.contentView addSubview:_viewButton];
        [cell.contentView addSubview:_signLabel];
        [cell.contentView addSubview:_tagLabel];
        [cell.contentView addSubview:_nameLabel];
        [cell.contentView addSubview:_headButton];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTwo"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellTwo"];
        }
        [cell.imageView setTintColor:[UIColor colorWithRed:0.35 green:0.56 blue:0.78 alpha:1]];
        cell.imageView.image = [_imageArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
        return cell;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 150;
    } else {
        return 60;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.001;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 10;
    }
    return 0.001;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        UploadedPageViewController *uploadedPage = [[UploadedPageViewController alloc] init];
        [self.navigationController pushViewController:uploadedPage animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        
        [self.navigationController pushViewController:_messagePage animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 2) {
        MyLikeViewController *myLikePage = [[MyLikeViewController alloc] init];
        [self.navigationController pushViewController:myLikePage animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 3) {
        UIAlertController *firstAlertController = [UIAlertController alertControllerWithTitle:nil message:@"您目前未收到通知" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
        }];
        [firstAlertController addAction:confirm];
        [self presentViewController: firstAlertController animated:YES completion:nil];
    } else if (indexPath.section == 1 && indexPath.row == 4) {
        
        [self.navigationController pushViewController:_settingPage animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 5) {
        
    } else if (indexPath.section == 0) {
        [self.navigationController pushViewController:_settingPage.informationPage animated:YES];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
