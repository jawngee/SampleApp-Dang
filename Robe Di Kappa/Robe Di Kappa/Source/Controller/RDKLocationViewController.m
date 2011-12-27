//
//  RDKSubMapViewController.m
//  robe
//
//  Created by Trung Dang on 12/6/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKLocationViewController.h"

#import "RDKCustomAnnotation.h"
#import "RDKLocationsItem.h"

@implementation RDKLocationViewController
@synthesize mapView = _mapView;
@synthesize annotationArray = _annotationArray;
@synthesize locationsItem = _locationsItem;

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
    /** Releases the view if it doesn't have a superview. */
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_mapView release];
    [_annotationArray release];
    [_locationsItem release];
    [super dealloc];
}

#pragma mark - Map view delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"annotation";  
    
    if ([annotation isKindOfClass:[RDKCustomAnnotation class]]) 
    {
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView == nil) 
        {
            annotationView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
        } 
        else 
        {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.animatesDrop = YES;
        annotationView.canShowCallout = YES;
        annotationView.pinColor = MKPinAnnotationColorGreen;

        return annotationView;
    }
    
    return nil;    
}


#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = self.locationsItem.latitude;
    zoomLocation.longitude = self.locationsItem.longtitude;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 15*METERS_PER_MILE, 15*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];                
    [self.mapView setRegion:adjustedRegion animated:YES];        
    
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = self.locationsItem.latitude;
    coordinate.longitude = self.locationsItem.longtitude; 
    
    RDKCustomAnnotation *customAnnotation = [[[RDKCustomAnnotation alloc] initWithName:self.locationsItem.title 
                                                                                 address:self.locationsItem.subtitle 
                                                                              coordinate:coordinate] autorelease];
    
    [self.mapView removeAnnotations:self.annotationArray];
    
    [self.annotationArray removeAllObjects];
    [self.annotationArray addObject:customAnnotation];

    [self.mapView addAnnotations:self.annotationArray];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.annotationArray = [[[NSMutableArray alloc] init] autorelease];
    
    UIImage *backImage = [UIImage imageNamed:@"global-back-button.png"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0.0, 0.0, backImage.size.width, backImage.size.height)];
    [backButton addTarget:self action:@selector(backButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setContentEdgeInsets:UIEdgeInsetsMake(0, 8, 0, -8)];
    
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.hidesBackButton = YES;
    self.navigationItem.leftBarButtonItem = backBarButton;
    [backBarButton release];
    
}

- (void)backButtonPress:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
