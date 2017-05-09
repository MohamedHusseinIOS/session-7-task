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

#import "GalleryCellCollectionViewCell.h"
@interface GalleryViewController ()

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
//    
//    UIGraphicsBeginImageContext(_sideBarButton.image.size);
//    [_sideBarButton.image drawInRect:CGRectMake(0, 10, 30, 30)];
//    _sideBarButton.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    		
    //[self.navigationController.navigationBar addSubview:containerForMenu];
    
    [_popupContainerView setHidden:YES];
    self.popupContainerView.alpha = 0;
    // Do any additional setup after loading the view.
    
    //ImageArry Contained the cells identifiers in row 0 and images identifiers in row 1 .
    
    ImageArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    
    [_ImagesCollectionView setDelegate:self];
    [_ImagesCollectionView setDataSource:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
   // [self removeAnimated];
    
    
    navigationBarViewController *navigationBar = [navigationBarViewController new];
    
    [navigationBar customSetup:_sideBarButton :self];
    
    UIColor *navigationBarColorGreen = [UIColor colorWithRed:76.0/255 green:219.0/255 blue:125.0/255 alpha:1.0];
    
    [navigationBar customizeNavigation:_sideBarButton :self :navigationBarColorGreen : @"Gallery"];
    
    
    OffsetImages=0; //its for ontimer method to move images
    
    
    
    [self SlideImageView];
    
}
//------slid image-----
-(void) SlideImageView{
    
    
    for (NSInteger i = 0; i < [ImageArray count]; i++) {
        
        _bigImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:ImageArray[i]]];
        
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

    NSString *cellIdeintifier = @"cellImage";
    
    
    
    
    UIImageView *imageForCell = [[UIImageView alloc]initWithImage:[UIImage imageNamed:ImageArray[indexPath.row]]];

    imageForCell.contentMode = UIViewContentModeScaleAspectFit;
    
    
    GalleryCellCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdeintifier forIndexPath:indexPath];
    
    [cell.viewContainer addSubview:imageForCell];

    imageForCell.frame = CGRectMake(0, 0,cell.frame.size.width,cell.frame.size.height);

    cell.contentMode  = UIViewContentModeScaleToFill;
    
    cell.layer.cornerRadius = 65;
    
    [cell.viewContainer.layer setShadowOffset:CGSizeMake(0.0f,0.0f)];
    cell.viewContainer.layer.shadowOpacity=0.8;

    return cell;
}




-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    [self showAnimated];
    //[_popupContainerView setHidden:NO];
    
     NSString *cellIdeintifier =  @"cellImage";
    
    
    _popupImageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:ImageArray[indexPath.item]]];
    _popupImageView.contentMode = UIViewContentModeScaleAspectFit;
    _popupImageView.frame = CGRectMake(0, 0, _popupContainerView.frame.size.width, _popupContainerView.frame.size.height);
    
    _popupImageView.backgroundColor = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdeintifier forIndexPath:indexPath].backgroundColor;
    //shadow for view
    [_popupContainerView.layer setShadowOffset:CGSizeMake(0.0f,0.0f)];
    _popupContainerView.layer.shadowOpacity=0.8;
    
    [_popupContainerView addSubview:_popupImageView];
    [_popupContainerView addSubview:_CloseButton];
  
    _popupContainerView.layer.cornerRadius = 8.0f;
    _CloseButton.layer.cornerRadius=10;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [ImageArray count];
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
   
    CGFloat screenWidth = self.view.frame.size.width;
    
    CGFloat cellWidth = screenWidth / 3;
    
    
    return CGSizeMake(cellWidth, cellWidth);
}



-(void)showAnimated {
    [_popupContainerView setHidden:NO];
    self.popupContainerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    self.popupContainerView.alpha = 0 ;
    
    [UIView animateWithDuration:.25 animations:^{
        self.popupContainerView.alpha = 1;
        self.popupContainerView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
}

-(void)removeAnimated{
    
    [UIView animateWithDuration:.25 animations:^{
        self.popupContainerView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        self.popupContainerView.alpha = 0;
    }completion:^(BOOL finished){
        if(finished){
            //[_popupContainerView setHidden:YES];
        }
    }];
    
    
}

- (IBAction)CloseImage:(id)sender {
    
    [self removeAnimated];
    
    [_popupImageView removeFromSuperview];
    
}

@end
