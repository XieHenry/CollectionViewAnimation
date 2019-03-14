//
//  ContentListViewController.m
//  CollectionViewAnimation
//
//  Created by XieHenry on 2019/3/13.
//  Copyright © 2019 XieHenry. All rights reserved.
//

#import "ContentListViewController.h"
#import "CollectionViewAnimation.h"
#import "ContentListCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ContentListViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray *dataArray;

//动画相关
@property (nonatomic,assign) float ani;
@property (nonatomic,strong) CollectionViewAnimation *Nani;
@end

@implementation ContentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[ContentListCell class] forCellWithReuseIdentifier:@"ContentListCell"];
    [self.view addSubview:self.collectionView];
    self.Nani = [[CollectionViewAnimation alloc]init];
    self.ani = 0.0;
}

-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor grayColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}


#pragma mark -- UICollectionView代理
//返回分区个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"ContentListCell";
    ContentListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    self.ani = self.ani + 0.1;
    
    if (self.type == TypeLeftToRight) {
        
        [self.Nani left_right:cell view_width:self.view.frame.size.width animation:self.ani];
        
    } else if (self.type == TypeRightToLeft) {
        
        [self.Nani right_left:cell view_width:self.view.frame.size.width animation:self.ani];
        
    } else if (self.type == TypeTopToBottom) {
        
        [self.Nani top_bottom:cell view_height:self.view.frame.size.height animation:self.ani];
        
    } else if (self.type == TypeBottomToTop) {
        
        [self.Nani bottom_top:cell view_height:self.view.frame.size.height animation:self.ani];
    }

    
    return cell;
}


//设置每个 UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100,100);
}



//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}


//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


//定义每个UICollectionView 的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

//选中
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
