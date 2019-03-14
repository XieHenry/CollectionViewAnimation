//
//  ViewController.m
//  CollectionViewAnimation
//
//  Created by XieHenry on 2019/3/13.
//  Copyright © 2019 XieHenry. All rights reserved.
//

#import "ViewController.h"
#import "ContentListViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *listArray = @[@"Left-Right",@"Right-Left",@"Top-Bottom",@"Bottom-Top"];
    for (NSInteger i =0; i<listArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SCREEN_WIDTH/2-100, 200+70*i, 200, 40);
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor blackColor].CGColor;
        [button setTitle:listArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

}

-(void)buttonClick:(UIButton *)button {
    switch (button.tag) { 
        case 0:
        {
            ContentListViewController *vc = [[ContentListViewController alloc] init];
            vc.type = TypeLeftToRight;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            ContentListViewController *vc = [[ContentListViewController alloc] init];
            vc.type = TypeRightToLeft;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            ContentListViewController *vc = [[ContentListViewController alloc] init];
            vc.type = TypeTopToBottom;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            ContentListViewController *vc = [[ContentListViewController alloc] init];
            vc.type = TypeBottomToTop;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
  
}


@end
