//
//  CalendarViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "jmImage.h"
#import "ImageController.h"
#import "StyledPageControl.h"
#import "CustomScrollView.h"


@interface CalendarViewController : UIViewController <UIScrollViewDelegate> {
  
    int						pageIndex;
	int						maxPages;
	
	Boolean					zoomMode;
	
	NSMutableArray		*	imagesArray;
	NSMutableArray		*	contArray;
	CustomScrollView	*	scrollView;
	StyledPageControl	*	pageControl;
    
    // To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;

}

- (jmImage*)			getCurrentImage;
- (ImageController*)	getCurrentController;
- (void)				addImageFromName:(NSString*)imagename;
- (void)				changePage:(id)sender;
- (void)				setCurrentPage:(NSUInteger)page;
- (void)				setZoomMode:(Boolean)status;


@end
