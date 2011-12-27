//
//  RDKClothesItemTableViewCell.m
//  robe
//
//  Created by Trung Dang on 11/27/11.
//  Copyright (c) 2011 Natural of Sience University. All rights reserved.
//

#import "RDKCollectionTableViewCell.h"

#import "RDKProductsItem.h"
#import "RDKProductView.h"

@interface RDKCollectionTableViewCell (Private)

- (void)buildCell;

@end

@implementation RDKCollectionTableViewCell
@synthesize previousProductView = _previousProductView;
@synthesize productsArray = _productsArray;
@synthesize delegate = _delegate;

- (void)dealloc
{
    [_delegate release];
    [_productsArray release];
    [_previousProductView release];
    [super dealloc];
}

- (id)initWithStyle:(UITableViewCellStyle)style productsArray:(NSMutableArray *)productsArray reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** Initialization code */
        [self setProductsArray:productsArray];
        [self buildCell];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:animated];
    /** Configure the view for the selected state */
}

- (void)buildCell
{
    [self setBackgroundColor:[UIColor clearColor]];
    [self setAccessoryType:UITableViewCellAccessoryNone];

    /** declare background button for cell */
    UIButton *backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backgroundButton setFrame:CGRectMake(0, 0, 320, 123)];
    [backgroundButton setBackgroundColor:[UIColor clearColor]];
    
    /** add background view for cell */
    [self addSubview:backgroundButton];
    
    for (int i=0; i<[self.productsArray count]; i++) 
    {
        RDKProductsItem *productItem = [self.productsArray objectAtIndex:i];
        
        if (i == 0)
        {
            RDKProductView *productView = [[RDKProductView alloc] initWithFrame:CGRectMake(0, 0, 107, 123) productsItem:productItem];
            [productView setDelegate:self];
            
            [self addSubview:productView];
            
            [productView release];
        }
        
        if (i == 1) {
            RDKProductView *productView = [[RDKProductView alloc] initWithFrame:CGRectMake(107, 0, 107, 123) productsItem:productItem];
            [productView setDelegate:self];
            
            [self addSubview:productView];
            
            [productView release];
        }
        
        if (i == 2) {
            RDKProductView *productView = [[RDKProductView alloc] initWithFrame:CGRectMake(214, 0, 107, 123) productsItem:productItem];
            [productView setDelegate:self];
            
            [self addSubview:productView];
            
            [productView release];
        }
    }
    
}

#pragma mark - RDKProduct delegate

-(void)selectProduct:(id)sender
{
    if (self.previousProductView) {
        [self.previousProductView setBackgroundColor:[UIColor clearColor]];
    }
    
    self.previousProductView = (RDKProductView *)sender;
    [self.delegate selectProduct:self];
}

@end
