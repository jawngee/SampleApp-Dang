//
//  RDKClothesDetailViewController.m
//  robe
//
//  Created by Trung Dang on 12/1/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKClothesDetailViewController.h"

@implementation RDKClothesDetailViewController
@synthesize itemImageView = _itemImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [super dealloc];
    [_itemImageView release];
}

#pragma mark -
#pragma mark - private function

- (void)silverButtonPress:(id)sender
{
    [self.itemImageView setImage:[UIImage imageNamed:@"clothes-silver-bag-image.png"]];
}

- (void)orangeButtonPress:(id)sender
{
    [self.itemImageView setImage:[UIImage imageNamed:@"clothes-orange-bag-image.png"]];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *refreshImage = [UIImage imageNamed:@"global-back-button.png"];
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [refreshButton setImage:refreshImage forState:UIControlStateNormal];
    [refreshButton setFrame:CGRectMake(0.0, 0.0, refreshImage.size.width, refreshImage.size.height)];
    [refreshButton addTarget:self action:@selector(backButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [refreshButton setContentEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];//  UIEdgeInsetsMake(0, -8, 0, 8)];
    
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithCustomView:refreshButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = refreshBarButton;
    [refreshBarButton release];
    
    // Do any additional setup after loading the view from its nib.
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, 320, 105)];
//    [bottomView setBackgroundColor:[UIColor blackColor]];
    
    UIImageView *bottomBackgroundImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 105)] autorelease];
    [bottomBackgroundImageView setImage:[UIImage imageNamed:@"clothes-bottom-background-image.png"]];
    
    UILabel *titleLable = [[[UILabel alloc] initWithFrame:CGRectMake(5, 10, 150, 20)] autorelease];
    [titleLable setBackgroundColor:[UIColor clearColor]];
    [titleLable setFont:[UIFont boldSystemFontOfSize:13]];
    [titleLable setLineBreakMode:UILineBreakModeWordWrap];
    [titleLable setTextColor:[UIColor whiteColor]];
    [titleLable setText:@"多层次小手提包"];
    
    UILabel *descriptionLable = [[[UILabel alloc] initWithFrame:CGRectMake(5, 32, 150, 20)] autorelease];
    [descriptionLable setBackgroundColor:[UIColor clearColor]];
    [descriptionLable setFont:[UIFont systemFontOfSize:10]];
    [descriptionLable setLineBreakMode:UILineBreakModeWordWrap];
    [descriptionLable setTextColor:[UIColor colorWithRed:209.0/255.0 green:209.0/255.0 blue:209.0/255.0 alpha:1.0]];
    [descriptionLable setText:@"面料：锦纶,人造革,100% 涤"];
    
    UILabel *colorLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 50, 35, 20)];
    [colorLable setBackgroundColor:[UIColor clearColor]];
    [colorLable setFont:[UIFont systemFontOfSize:10]];
    [colorLable setLineBreakMode:UILineBreakModeWordWrap];
    [colorLable setTextColor:[UIColor colorWithRed:209.0/255.0 green:209.0/255.0 blue:209.0/255.0 alpha:1.0]];
    [colorLable setText:@"颜色："];
    
    UIImage *silverImage = [UIImage imageNamed:@"clothes-silver-bag-color.png"];
    UIButton *silverColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [silverColor setImage:silverImage forState:UIControlStateNormal];
    [silverColor setFrame:CGRectMake(40, 55, silverImage.size.width, silverImage.size.height)];
    [silverColor addTarget:self action:@selector(silverButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *orangeImage = [UIImage imageNamed:@"clothes-orange-bag-color.png"];
    UIButton *orangeColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [orangeColor setImage:orangeImage forState:UIControlStateNormal];
    [orangeColor setFrame:CGRectMake(70, 55, orangeImage.size.width, orangeImage.size.height)];
    [orangeColor addTarget:self action:@selector(orangeButtonPress:) forControlEvents:UIControlEventTouchUpInside];

//    UIImageView *silverColor = [[UIImageView alloc] initWithFrame:CGRectMake(40, 55, 25, 25)];
//    [silverColor setImage:[UIImage imageNamed:@"clothes-silver-bag-color.png"]];
//    
//    UIImageView *orangeColor = [[UIImageView alloc] initWithFrame:CGRectMake(70, 55, 25, 25)];
//    [orangeColor setImage:[UIImage imageNamed:@"clothes-orange-bag-color.png"]];
    
    UIImageView *thumbBackgroundImage_1 = [[UIImageView alloc] initWithFrame:CGRectMake(170, 35, 44, 44)];
    [thumbBackgroundImage_1 setImage:[UIImage imageNamed:@"clothes-bag-background-image.png"]];
    
    UIImageView *thumbBackgroundImage_2 = [[UIImageView alloc] initWithFrame:CGRectMake(220, 35, 44, 44)];
    [thumbBackgroundImage_2 setImage:[UIImage imageNamed:@"clothes-bag-background-image.png"]];

    UIImageView *thumbBackgroundImage_3 = [[UIImageView alloc] initWithFrame:CGRectMake(270, 35, 44, 44)];
    [thumbBackgroundImage_3 setImage:[UIImage imageNamed:@"clothes-bag-background-image.png"]];
    
    UIImageView *thumbImageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(170, 35, 44, 44)];
    [thumbImageView_1 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_1 setContentMode:UIViewContentModeCenter];
    [thumbImageView_1 setImage:[UIImage imageNamed:@"clothes-small-silver-bag-image.png"]];
    
    UIImageView *thumbImageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(220, 35, 44, 44)];
    [thumbImageView_2 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_2 setContentMode:UIViewContentModeCenter];
    [thumbImageView_2 setImage:[UIImage imageNamed:@"clothes-small-silver-bag-image.png"]];
    
    UIImageView *thumbImageView_3 = [[UIImageView alloc] initWithFrame:CGRectMake(270, 35, 44, 44)];
    [thumbImageView_3 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_3 setContentMode:UIViewContentModeCenter];
    [thumbImageView_3 setImage:[UIImage imageNamed:@"clothes-small-silver-bag-image.png"]];
    
    self.itemImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)] autorelease];
    [self.itemImageView setBackgroundColor:[UIColor clearColor]];
    [self.itemImageView setContentMode:UIViewContentModeCenter];
    [self.itemImageView setImage:[UIImage imageNamed:@"clothes-silver-bag-image.png"]];
    
    UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, 320, 50)];
    [shadowImageView setBackgroundColor:[UIColor clearColor]];
    [shadowImageView setContentMode:UIViewContentModeCenter];
    [shadowImageView setImage:[UIImage imageNamed:@"clothes-bag-shadow-image"]];

    [bottomView addSubview:bottomBackgroundImageView];
    [bottomView addSubview:titleLable];
    [bottomView addSubview:descriptionLable];
    [bottomView addSubview:colorLable];
    [bottomView addSubview:silverColor];
    [bottomView addSubview:orangeColor];
    [bottomView addSubview:thumbBackgroundImage_1];
    [bottomView addSubview:thumbBackgroundImage_2];
    [bottomView addSubview:thumbBackgroundImage_3];
    [bottomView addSubview:thumbImageView_1];
    [bottomView addSubview:thumbImageView_2];
    [bottomView addSubview:thumbImageView_3];
    
    [self.view addSubview:bottomView];
    [self.view addSubview:self.itemImageView];
    [self.view addSubview:shadowImageView];
    
    [colorLable release];
    [shadowImageView release];
    [bottomView release];
    
    [thumbBackgroundImage_1 release];
    [thumbBackgroundImage_2 release];
    [thumbBackgroundImage_3 release];
    
    [thumbImageView_1 release];
    [thumbImageView_2 release];
    [thumbImageView_3 release];
}

- (void)viewDidUnload
{
    _itemImageView = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)backButtonPress:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
