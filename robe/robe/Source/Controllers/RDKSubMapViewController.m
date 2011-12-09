//
//  RDKSubMapViewController.m
//  robe
//
//  Created by Trung Dang on 12/6/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKSubMapViewController.h"

#import "RDKCustomAnnotation.h"

@implementation RDKSubMapViewController
@synthesize mapView = _mapView;

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
    NSLog(@"DEALLOC %@",NSStringFromClass([self class]));
    [_mapView release];
    [_annotationArray release];
    [super dealloc];
}

#pragma mark - Map view delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"annotation";  
    
    if ([annotation isKindOfClass:[RDKCustomAnnotation class]]) 
    {
//        RDKCustomAnnotation *customAnnotation = (RDKCustomAnnotation *) annotation;
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [_mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
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
    [_mapView removeAnnotations:_annotationArray];
    [_mapView addAnnotations:_annotationArray];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _annotationArray = [[NSMutableArray alloc] init];
    
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
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 10.791036;
    zoomLocation.longitude = 106.631327;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 15*METERS_PER_MILE, 15*METERS_PER_MILE);
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];                
    
    [_mapView setRegion:adjustedRegion animated:YES];        

    CLLocationCoordinate2D coordinate_1;
    coordinate_1.latitude = 10.791036;
    coordinate_1.longitude = 106.631327; 
    
    RDKCustomAnnotation *customAnnotation_1 = [[[RDKCustomAnnotation alloc] initWithName:@"HCM City" 
                                                                                 address:@"Plus Factory" 
                                                                              coordinate:coordinate_1] autorelease];
    
    CLLocationCoordinate2D coordinate_2;
    coordinate_2.latitude = 10.743817;
    coordinate_2.longitude = 106.568156; 
    
    RDKCustomAnnotation *customAnnotation_2 = [[[RDKCustomAnnotation alloc] initWithName:@"HCM City" 
                                                                                 address:@"My House" 
                                                                              coordinate:coordinate_2] autorelease];
    [_annotationArray addObject:customAnnotation_1];
    [_annotationArray addObject:customAnnotation_2];
    
//    [_mapView addAnnotations:_annotationArray];

}

- (void)backButtonPress:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    _mapView =  nil;
    _annotationArray = nil;
    
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
