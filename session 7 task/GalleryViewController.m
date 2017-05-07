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
    
    //ImageArry Contained the cells identifiers in row 0 and images identifiers in row 1 .
    
    ImageArray = [[NSArray alloc]init];
    ImageArray = @[
                   @[@"image1",@"1"],
                   @[@"image2",@"2"],
                   @[@"image3",@"3"],
                   @[@"image4",@"4"],
                   @[@"image5",@"5"],
                   @[@"image6",@"6"],
                   @[@"image7",@"7"],
                   @[@"image8",@"8"],
                   @[@"image9",@"9"],
                   ];
    
    
    [_ImagesCollectionView setDelegate:self];
    [_ImagesCollectionView setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [_popupContainerView setHidden:YES];
    
    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    [navigationBar customSetup:_sideBarButton :self];
    
    UIColor *navigationBarColorGreen = [UIColor colorWithRed:76.0/255 green:219.0/255 blue:125.0/255 alpha:1.0];
    
    [navigationBar customizeNavigation:_sideBarButton :self :navigationBarColorGreen];
    
    _popupImageView.layer.cornerRadius = 20;
    
    OffsetImages=0; //its for ontimer method to move images
    
    
    
    [self SlideImageView];
    
}
//------slid image-----
-(void) SlideImageView{
    
    
    for (NSInteger i = 0; i < [ImageArray count]; i++) {
        
        _bigImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:ImageArray[i][1]]];
        
        _bigImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        CGFloat xPostion =self.view.frame.size.width * (CGFloat)i;
        
        self.bigImageView.frame = CGRectMake(xPostion, 0, self.BigScrollView.frame.size.width, self.BigScrollView.frame.size.height);
        
        [_BigScrollView setContentSize:CGSizeMake(_BigScrollView.frame.size.width * (CGFloat)i+1, _BigScrollView.frame.size.height)];
        
        [_BigScrollView addSubview:_bigImageView];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}

//----------the timer----------
-(void) onTimer{
    
    
    if (OffsetImages == (_BigScrollView.frame.size.width*([ImageArray count]-1))){
        OffsetImages = 0;
        [_BigScrollView setContentOffset:CGPointMake(OffsetImages, 0) animated:NO];
    }else{
        OffsetImages+=_BigScrollView.frame.size.width;
        [_BigScrollView setContentOffset:CGPointMake(OffsetImages, 0) animated:YES];
    }
    
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

    NSString *cellIdeintifier = ImageArray[indexPath.row][0];
    
    UIImageView *imageForCell = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ImageArray[indexPath.row][1]]];
    
    imageForCell.contentMode = UIViewContentModeScaleAspectFit;
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdeintifier forIndexPath:indexPath];
    
    
    
    imageForCell.frame = CGRectMake(0, 0,cell.frame.size.width,cell.frame.size.height);
    
    [cell addSubview:imageForCell];
    
    [self collectionView:collectionView didSelectItemAtIndexPath:indexPath];

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [_popupContainerView setHidden:NO];
    
    
    _popupImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:ImageArray[indexPath.item][1]]];
    
    _popupImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    _popupImageView.frame = CGRectMake(0, 0, _popupContainerView.frame.size.width, _popupContainerView.frame.size.height);
    
    [_popupContainerView addSubview:_popupImageView];
    [_popupContainerView addSubview:_CloseButton];
    
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [ImageArray count];
}


- (IBAction)CloseImage:(id)sender {
    
    [_popupContainerView setHidden:YES];
}

@end
