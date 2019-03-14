//
//  ContentListViewController.h
//  CollectionViewAnimation
//
//  Created by XieHenry on 2019/3/13.
//  Copyright © 2019 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,DirectionType) {
    TypeLeftToRight,
    TypeRightToLeft,
    TypeTopToBottom,
    TypeBottomToTop
};

NS_ASSUME_NONNULL_BEGIN

@interface ContentListViewController : UIViewController
@property (nonatomic,assign) DirectionType type;
@end

NS_ASSUME_NONNULL_END
