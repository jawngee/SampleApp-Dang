//
//  CalendarViewController.h
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RDKCustomImage.h"
#import "RDKImageController.h"
#import "RDKStyledPageControl.h"
#import "RDKCustomScrollView.h"

/** calendar view controller */
@interface RDKCalendarViewController : UIViewController <UIScrollViewDelegate> {
  
    /** page index using for page controller */
    int pageIndex;
    /** the total of pages */
	int	maxPages;
	
    /** zoom mode select */
	Boolean zoomMode;
	
    /** the list of images */
	NSMutableArray *imagesArray;
    /**  the list of contant */
	NSMutableArray *contArray;
    
    /** custom scroll view */
	RDKCustomScrollView *scrollView;
    /** page view controller */
	RDKStyledPageControl *pageControl;
    
    /** to be used when scrolls originate from the UIPageControl */
    BOOL pageControlUsed;

}

-(RDKCustomImage *)getCurrentImage;
-(RDKImageController *)getCurrentController;
-(void)addImageFromName:(NSString *)imagename;
-(void)changePage:(id)sender;
-(void)setCurrentPage:(NSUInteger)page;
-(void)setZoomMode:(Boolean)status;


@end
