//
//  GalleryViewController.m
//  session 7 task
//
//  Created by GreenRoot on 5/5/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import "GalleryViewController.h"
#import "SWRevealViewController.h"
#import "navigationBarViewController.h"


@interface GalleryViewController ()

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ImageArray = [[NSMutableArray alloc]init];
    
    ImageArray = [NSMutableArray arrayWithObjects:@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"1", nil];
    
    _collectionGallery.delegate = self;
    _collectionGallery.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    [navigationBar customSetup:_sideBarButton :self];
    
    [navigationBar customizeNavigation:_sideBarButton :self];
    
    
    OffsetImages=0; //its for ontimer method to move images
    
    
    
    [self SlideImageView];
    
}

-(void) SlideImageView{
    
    
    for (NSInteger i = 0; i < [ImageArray count]; i++) {
        
        _bigImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[ImageArray objectAtIndex:i]]];
        _bigImageView.contentMode = UIViewContentModeScaleAspectFit;
        CGFloat xPostion =self.view.frame.size.width * (CGFloat)i;
        self.bigImageView.frame = CGRectMake(xPostion, 0, self.BigScrollView.frame.size.width, self.BigScrollView.frame.size.height);
        
        [_BigScrollView setContentSize:CGSizeMake(_BigScrollView.frame.size.width * (CGFloat)i+1, _BigScrollView.frame.size.height)];
        [_BigScrollView addSubview:_bigImageView];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}

-(void) onTimer{
    
    
    if (OffsetImages == (_BigScrollView.frame.size.width*([ImageArray count]-1))){
        OffsetImages = 0;
    }else{
        OffsetImages+=_BigScrollView.frame.size.width;
    }
    
    [_BigScrollView setContentOffset:CGPointMake(OffsetImages, 0) animated:YES];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    NSString *cellIdeintifier = [ImageArray objectAtIndex:indexPath.item];
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdeintifier forIndexPath:indexPath];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [ImageArray count];
}

@end
