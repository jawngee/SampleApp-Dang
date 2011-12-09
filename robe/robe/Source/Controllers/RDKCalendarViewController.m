//
//  CalendarViewController.m
//  robe
//
//  Created by Trung Dang on 11/17/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCalendarViewController.h"

@implementation RDKCalendarViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [imagesArray release];
    [contArray release];
    [scrollView release];
    [pageControl release];
    [super dealloc];
}

#pragma mark - function class

- (void)refresh:(id)sender
{
}

#pragma mark - View lifecycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    /** Do any additional setup after loading the view from its nib. */
    UIImage *refreshImage = [UIImage imageNamed:@"refresh-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventTouchUpInside];    
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 8)];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.rightBarButtonItem = refreshBarButton;
    [refreshBarButton release];
    
    /** build user interface */
    pageIndex = 0;			
    zoomMode = NO;
    
    /** fill images */
    contArray = [[NSMutableArray alloc] init];
    imagesArray = [[NSMutableArray alloc] init];
    
    [self addImageFromName:@"calendar-image-1.jpg"];
    [self addImageFromName:@"calendar-image-2.jpg"];
    [self addImageFromName:@"calendar-image-3.jpg"];
    
    /** set total iamges of list */
    maxPages = [imagesArray count];
        
    /** a page is the width of the scroll view */
    scrollView = [[RDKCustomScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 367)];
    scrollView.maindelegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * maxPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.multipleTouchEnabled = YES;
    [self.view addSubview:scrollView];
    
    for(int i=0 ; i<[imagesArray count] ; i++) {
        RDKCustomImage * thumb = [imagesArray objectAtIndex:i];
        RDKImageController * imgCont = [[RDKImageController alloc] initWithThumb:thumb:CGRectMake(0, 0, 320, 367)];
        [imgCont setPageIndex:i];
        imgCont.view.userInteractionEnabled = NO; //
        [contArray addObject:imgCont];
        [imgCont release];
        
        /** add the controller's view to the scroll view */
        if (nil == imgCont.view.superview) {
            CGRect frame = scrollView.frame;
            frame.origin.x = frame.size.width * i;
            frame.origin.y = 0;
            imgCont.view.frame = frame;
            [scrollView addSubview:imgCont.view];
        }
    }		
    
    pageControl = [[RDKStyledPageControl alloc] init];
    pageControl.numberOfPages = maxPages;
    pageControl.currentPage = 0;
    pageControl.hidesForSinglePage = NO;
    pageControl.frame = CGRectMake(0, 340, 320, 20);
    pageControl.userInteractionEnabled = YES;
    [pageControl addTarget:self action:@selector(changePage:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
    
}

-(void)viewDidUnload
{
    imagesArray = nil;
    contArray = nil;
    scrollView = nil;
    pageControl = nil;

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)changePage:(id)sender
{
	int page = (int)pageControl.currentPage;
	[self setCurrentPage:page];
	
	CGRect frame = scrollView.frame;
	frame.origin.x = frame.size.width * page;
	frame.origin.y = 0;
	[scrollView scrollRectToVisible:frame animated:YES];
}

-(void)setCurrentPage:(NSUInteger)page 
{
	if (page == pageIndex) 
    {
		return;
    }
    
	pageIndex = page;
	pageControl.currentPage = page;
}

-(RDKCustomImage *)getCurrentImage
{
	return [imagesArray objectAtIndex:pageIndex];
}

- (RDKImageController *)getCurrentController
{
	return [contArray objectAtIndex:pageIndex];
}

-(void)addImageFromName:(NSString *)imagename
{
	RDKCustomImage *thumb = [[RDKCustomImage alloc] initWithName:imagename];
	[imagesArray addObject:thumb];	
    [thumb release];
}


/** -------- Touch Events from CustomScrollView delegate -------------------- */

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
	UITouch *aTouch = [touches anyObject];
    
    if (aTouch.tapCount == 2) {
		[NSObject cancelPreviousPerformRequestsWithTarget:self];
	}	
    
	if(zoomMode == YES) {
		RDKImageController * imagecont = [self getCurrentController];
		[imagecont touchesBegan:touches withEvent:event];
	}
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event 
{
	UITouch *theTouch = [touches anyObject];
	//CGPoint currentTouchPosition = [theTouch locationInView:self.view];
	NSDictionary *touchLoc = [NSDictionary dictionaryWithObject:[NSValue valueWithCGPoint:[theTouch locationInView:self.view]] 
                                                         forKey:@"location"];
	
    if (theTouch.tapCount == 1) 
    {
		[self performSelector:@selector(handleSingleTap:) withObject:touchLoc afterDelay:0.3];
	} 
	else
    { 
        if (theTouch.tapCount == 2) 
        {
//		[self performSelector:@selector(handleDoubleTap:) withObject:touchLoc afterDelay:0.01];
        }
	}	
	
	if(zoomMode == YES) 
    {
		RDKImageController *imagecont = [self getCurrentController];
		[imagecont touchesEnded:touches withEvent:event];
	}
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event 
{
	NSSet *allTouches = [event allTouches];
	NSArray *t = [allTouches allObjects];
	NSInteger numberOfTouches = [t count];
    
	switch(numberOfTouches)
	{					
		case 2:
		{	
//			[self setZoomMode:YES];
		}
            break;
	}
	
	if(zoomMode == YES) 
    {
		RDKImageController * imagecont = [self getCurrentController];
		[imagecont touchesMoved:touches withEvent:event];
	}
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event 
{
	//[self clearTouches];	
	//[scrollView touchesCancelled:touches withEvent:event];
	if(zoomMode == YES) {
		RDKImageController * imagecont = [self getCurrentController];
		[imagecont touchesCancelled:touches withEvent:event];
	}
}

-(void)handleSingleTap:(NSDictionary *)touches 
{
}

-(void)handleDoubleTap:(NSDictionary *)touches 
{
	RDKImageController *imagecont = [self getCurrentController];
	[imagecont handleDoubleTap:touches];
    
	zoomMode = [imagecont getZoomMode];
	[self setZoomMode:zoomMode];
}

-(void)setZoomMode:(Boolean)status
{
	zoomMode = status;
    
	if(zoomMode)
    {
		pageControl.hidden = YES;
		pageControl.userInteractionEnabled = NO;
		scrollView.pagingEnabled = NO;
		scrollView.showsVerticalScrollIndicator = scrollView.showsHorizontalScrollIndicator = YES;
		scrollView.bouncesZoom = YES;
		scrollView.scrollEnabled = NO;
	}
	else 
    {
		pageControl.hidden = NO;
		pageControl.userInteractionEnabled = YES;
		scrollView.pagingEnabled = YES;
		scrollView.showsVerticalScrollIndicator = scrollView.showsHorizontalScrollIndicator = NO;
		scrollView.scrollEnabled = YES;
	}
}

// -------- delegates UIScrollView  ---------

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
	if(zoomMode == NO) 
    {
		[self setZoomMode:YES];
	}
    
	RDKImageController *imagecont = [self getCurrentController];
	return imagecont.view;
}

-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view 
{ 
    /** __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_2); */
    /** called before the scroll view begins zooming its content */
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale 
{
}

-(void)scrollViewDidScroll:(UIScrollView *)sender 
{
    /** We don't want a "feedback loop" between the UIPageControl and the scroll delegate in */
    /** which a scroll event generated from the user hitting the page control triggers updates from */
    /** the delegate method. We use a boolean to disable the delegate logic when the page control is used. */
	if (pageControlUsed) 
    {
        /** do nothing - the scroll was initiated from the page control, not the user dragging */
        return;
    }
	
	if(zoomMode == NO) 
    {
		int p = roundf(scrollView.contentOffset.x / 320);
		[self setCurrentPage:p];		
	}
	
    /** Switch the indicator when more than 50% of the previous/next page is visible */
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

/** At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

/** At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl */
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}


@end
