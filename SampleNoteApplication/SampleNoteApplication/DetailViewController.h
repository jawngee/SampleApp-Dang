//
//  DetailViewController.h
//  SampleNoteApplication
//
//  Created by Trung Dang on 11/10/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    
}

@property (strong, nonatomic) NSString *nameNote;
@property (strong, nonatomic) NSString *detailNote;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
