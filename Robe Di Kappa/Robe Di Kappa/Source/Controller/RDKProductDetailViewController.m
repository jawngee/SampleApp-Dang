//
//  RDKClothesDetailViewController.m
//  robe
//
//  Created by Trung Dang on 12/1/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKProductDetailViewController.h"

@implementation RDKProductDetailViewController
@synthesize productImageView = _productImageView;

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
    [_productImageView release];
    [super dealloc];
}

#pragma mark -
#pragma mark - private function

- (void)silverButtonPress:(id)sender
{
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-silver-bag.png"]];
}

- (void)orangeButtonPress:(id)sender
{
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-orange-bag.png"]];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIImage *backImage = [UIImage imageNamed:@"global-back-button.png"];
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setImage:backImage forState:UIControlStateNormal];
//    [backButton setFrame:CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height)];
//    [backButton addTarget:self action:@selector(backButtonPress:) forControlEvents:UIControlEventTouchUpInside];
//    [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
//    
//    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    self.navigationItem.hidesBackButton = YES;
//    self.navigationItem.leftBarButtonItem = backBarButton;
//    [backBarButton release];
//    
    // Do any additional setup after loading the view from its nib.
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 280, 320, 105)];
    
    UIImageView *bottomBackgroundImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 105)] autorelease];
    [bottomBackgroundImageView setImage:[UIImage imageNamed:@"clothes-footer-background.png"]];
    
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
    
    UIImage *silverImage = [UIImage imageNamed:@"clothes-silver-color.png"];
    UIButton *silverColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [silverColor setImage:silverImage forState:UIControlStateNormal];
    [silverColor setFrame:CGRectMake(40, 55, silverImage.size.width, silverImage.size.height)];
    [silverColor addTarget:self action:@selector(silverButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *orangeImage = [UIImage imageNamed:@"clothes-orange-color.png"];
    UIButton *orangeColor = [UIButton buttonWithType:UIButtonTypeCustom];
    [orangeColor setImage:orangeImage forState:UIControlStateNormal];
    [orangeColor setFrame:CGRectMake(70, 55, orangeImage.size.width, orangeImage.size.height)];
    [orangeColor addTarget:self action:@selector(orangeButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *thumbBackgroundImage_1 = [[UIImageView alloc] initWithFrame:CGRectMake(170, 35, 44, 44)];
    [thumbBackgroundImage_1 setImage:[UIImage imageNamed:@"clothes-view-background.png"]];
    
    UIImageView *thumbBackgroundImage_2 = [[UIImageView alloc] initWithFrame:CGRectMake(220, 35, 44, 44)];
    [thumbBackgroundImage_2 setImage:[UIImage imageNamed:@"clothes-view-background.png"]];

    UIImageView *thumbBackgroundImage_3 = [[UIImageView alloc] initWithFrame:CGRectMake(270, 35, 44, 44)];
    [thumbBackgroundImage_3 setImage:[UIImage imageNamed:@"clothes-view-background.png"]];
    
    UIImageView *thumbImageView_1 = [[UIImageView alloc] initWithFrame:CGRectMake(170, 35, 44, 44)];
    [thumbImageView_1 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_1 setContentMode:UIViewContentModeCenter];
    [thumbImageView_1 setImage:[UIImage imageNamed:@"clothes-small-silver-bag.png"]];
    
    UIImageView *thumbImageView_2 = [[UIImageView alloc] initWithFrame:CGRectMake(220, 35, 44, 44)];
    [thumbImageView_2 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_2 setContentMode:UIViewContentModeCenter];
    [thumbImageView_2 setImage:[UIImage imageNamed:@"clothes-small-silver-bag.png"]];
    
    UIImageView *thumbImageView_3 = [[UIImageView alloc] initWithFrame:CGRectMake(270, 35, 44, 44)];
    [thumbImageView_3 setBackgroundColor:[UIColor clearColor]];
    [thumbImageView_3 setContentMode:UIViewContentModeCenter];
    [thumbImageView_3 setImage:[UIImage imageNamed:@"clothes-small-silver-bag.png"]];
    
    self.productImageView = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)] autorelease];
    [self.productImageView setBackgroundColor:[UIColor clearColor]];
    [self.productImageView setContentMode:UIViewContentModeCenter];
    [self.productImageView setImage:[UIImage imageNamed:@"clothes-silver-bag.png"]];
    
    UIImageView *shadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 210, 320, 50)];
    [shadowImageView setBackgroundColor:[UIColor clearColor]];
    [shadowImageView setContentMode:UIViewContentModeCenter];
    [shadowImageView setImage:[UIImage imageNamed:@"clothes-bag-shadow.png"]];

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
    [self.view addSubview:self.productImageView];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

//- (void)backButtonPress:(id)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
