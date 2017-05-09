//
//  GalleryViewController.h
//  session 7 task
//
//  Created by GreenRoot on 5/5/17.
//  Copyright © 2017 GreenRoot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    NSInteger OffsetImages;

    NSArray *ImageArray;
    
   
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sideBarButton;
@property (strong, nonatomic) IBOutlet UIImageView *bigImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *BigScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *ImagesCollectionView;

@property (strong, nonatomic) IBOutlet UIView *popupContainerView;

@property (strong, nonatomic) IBOutlet UIImageView *popupImageView;
@property (strong, nonatomic) IBOutlet UIButton *CloseButton;



-(void)onTimer;

- (IBAction)CloseImage:(id)sender;
@end
