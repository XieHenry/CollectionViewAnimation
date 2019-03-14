//
//  CollectionViewAnimation.h
//  CollectionViewAnimation
//
//  Created by XieHenry on 2019/3/13.
//  Copyright © 2019 XieHenry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewAnimation : NSObject
-(void)left_right:(UICollectionViewCell *)cell view_width:(float)view_width animation:(float)ani;
-(void)right_left:(UICollectionViewCell *)cell view_width:(float)view_width animation:(float)ani;
-(void)top_bottom:(UICollectionViewCell *)cell view_height:(float)view_height animation:(float)ani;
-(void)bottom_top:(UICollectionViewCell *)cell view_height:(float)view_height animation:(float)ani;

@end

NS_ASSUME_NONNULL_END
