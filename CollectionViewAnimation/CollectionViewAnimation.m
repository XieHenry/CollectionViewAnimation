//
//  CollectionViewAnimation.m
//  CollectionViewAnimation
//
//  Created by XieHenry on 2019/3/13.
//  Copyright © 2019 XieHenry. All rights reserved.
//

#import "CollectionViewAnimation.h"

@implementation CollectionViewAnimation

-(void)left_right:(UICollectionViewCell *)cell view_width:(float)view_width animation:(float)ani {
    [UIView animateWithDuration:0.0 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(-view_width, 0.0);
    }];
    
    [self delayBy:ani+0.1 code:^{
        [UIView animateWithDuration:ani+0.1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
        
    }];
}

-(void)right_left:(UICollectionViewCell *)cell view_width:(float)view_width animation:(float)ani {
    [UIView animateWithDuration:0.0 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(view_width, 0.0);
    }];
    
    [self delayBy:ani code:^{
        [UIView animateWithDuration:ani+0.1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }];
}

-(void)top_bottom:(UICollectionViewCell *)cell view_height:(float)view_height animation:(float)ani {
    [UIView animateWithDuration:0.0 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(0.0, -view_height);
    }];
    
    [self delayBy:ani+0.1 code:^{
        [UIView animateWithDuration:ani+0.1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }];
}

-(void)bottom_top:(UICollectionViewCell *)cell view_height:(float)view_height animation:(float)ani {
    [UIView animateWithDuration:0.0 animations:^{
        cell.transform = CGAffineTransformMakeTranslation(0.0 ,view_height);
    }];
    
    [self delayBy:ani code:^{
        [UIView animateWithDuration:ani+0.1 animations:^{
            cell.transform = CGAffineTransformIdentity;
        }];
    }];
}

- (void)delayBy:(NSTimeInterval)delay code:(dispatch_block_t) block {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(),
                   block);
}

@end
