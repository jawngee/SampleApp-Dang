//
//  RDKSubMapViewController.h
//  robe
//
//  Created by Trung Dang on 12/6/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface RDKSubMapViewController : UIViewController <MKMapViewDelegate> {
    
    MKMapView *_mapView;
    NSMutableArray *_annotationArray;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end
