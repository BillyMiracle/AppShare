//
//  PhotoWallViewController.h
//  AppShareImitating
//
//  Created by 张博添 on 2021/7/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SelectPhotosDelegate <NSObject>

- (void) selectedPhoto: (UIImage*) firstImage number: (NSInteger) numberOfPhotos;

@end

@interface PhotoWallViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *imagesArray;

@property (nonatomic, strong) UIScrollView *photoWall;

@property (nonatomic, assign) id<SelectPhotosDelegate> delegate;

@property (nonatomic, strong) UIImageView *Tick;


@end

NS_ASSUME_NONNULL_END
