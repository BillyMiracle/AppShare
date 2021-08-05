//
//  PhotoWallViewController.m
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import "PhotoWallViewController.h"

#define selfWidth self.view.bounds.size.width
#define selfHeight self.view.bounds.size.height
#define tabBarHeight self.tabBarController.tabBar.bounds.size.height
#define navigationBarHeight self.navigationController.navigationBar.bounds.size.height
#define statusBarHeight [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager.statusBarFrame.size.height

@interface PhotoWallViewController ()

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"iconfont-left.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(pressRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    
    
    _imagesArray = [[NSMutableArray alloc] init];
    
    
    _photoWall = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, selfWidth, selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight)];
    _photoWall.contentSize = CGSizeMake(selfWidth, (selfHeight - statusBarHeight - navigationBarHeight - tabBarHeight) * 1.5);
    
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 8; ++j) {
            float width2 = selfWidth / 4;
            UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            imageButton.frame = CGRectMake(5 + width2 * i, 5 + width2 * j, width2 - 10, width2 - 10);
            UIImage* head = [UIImage imageNamed:[NSString stringWithFormat:@"uploadImage%d%d.jpg", j, i]];
//获取图片名称
            [head setAccessibilityIdentifier:[NSString stringWithFormat:@"uploadImage%d%d.jpg", j, i]];
            [imageButton setBackgroundImage:head forState:UIControlStateNormal];
            [imageButton addTarget:self action:@selector(pressImage:) forControlEvents:UIControlEventTouchUpInside];
            
            [_photoWall addSubview: imageButton];
        }
    }
    [self.view addSubview:_photoWall];
}

- (void)pressImage:(UIButton*) imageButton {
    if (imageButton.currentBackgroundImage) {
        _Tick = [[UIImageView alloc] init];
        _Tick.frame = CGRectMake(imageButton.frame.size.width - 20, 0, 20, 20);
        _Tick.image = [UIImage imageNamed:@"duihao.png"];
        NSLog(@"%@",imageButton.currentBackgroundImage.accessibilityIdentifier);
        if([self.imagesArray containsObject:imageButton.currentBackgroundImage]) {
            //NSLog(@"重复");
            [self.imagesArray removeObject:imageButton.currentBackgroundImage];
            [imageButton.subviews[1] removeFromSuperview];
        } else {
            [self.imagesArray addObject:imageButton.currentBackgroundImage];
            [imageButton addSubview: _Tick];
        }
    }
}

//点按“确定”按钮
- (void)pressRightButton {
    //创建警报控制器
    UIAlertController* confirmAlertController = [UIAlertController alertControllerWithTitle:@"选择图片" message:@"是否确认" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.imagesArray.count != 0) {
            UIImage* headImage = self.imagesArray.firstObject;
            [self.delegate selectedPhoto:headImage number:self.imagesArray.count];
            [[NSUserDefaults standardUserDefaults] setObject: headImage.accessibilityIdentifier forKey:@"headImage"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } else {
            [self.delegate selectedPhoto:nil number:0];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //NSLog(@"点击了取消按钮");
    }];
    [confirmAlertController addAction: cancel];
    [confirmAlertController addAction: confirm];
    [self presentViewController:confirmAlertController animated:YES completion:nil];
}

- (void)pressLeftButton {
    if (self.imagesArray.count == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        UIAlertController* confirmAlertController2 = [UIAlertController alertControllerWithTitle:@"是否取消" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //NSLog(@"点击了取消按钮");
        }];
        [confirmAlertController2 addAction: cancel];
        [confirmAlertController2 addAction: confirm];
        [self presentViewController:confirmAlertController2 animated:YES completion:nil];
    }
}


@end
