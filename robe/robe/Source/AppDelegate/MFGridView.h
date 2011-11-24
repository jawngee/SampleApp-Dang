//
//  MFGridView.h
//  SQLToolkit
//
//  Created by Robert Chipperfield on 20/01/2011.
//  Copyright 2011 MobileFoo / Red Gate Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MFGridViewCell

@property (nonatomic, retain) NSString *cellType;

@end

/*
 The MFGridViewDelegate protocol allows callbacks regarding events
 on the grid.
 */
@protocol MFGridViewDelegate

@end

/*
 The MFGridViewDataSource protocol is responsible for providing the data
 required to populate the content of the grid, both the actual controls
 (via the viewForCellAtRow:Column: method) and some layout information
 (via widthForColumn: and heightForRow:).
 
 It is assumed that columns will be the same width on all rows - that is,
 it's a table rather than a collection of independent rows.
 */
@protocol MFGridViewDataSource

@required
@property (nonatomic, readonly) NSInteger rowCount;
@property (nonatomic, readonly) NSInteger columnCount;
- (UIView *)viewForCellAtRow:(NSInteger)row Column:(NSInteger)col;
- (CGFloat)widthForColumn:(NSInteger)col;
- (CGFloat)heightForRow:(NSInteger)row;

@end

/*
 The basic MFGridView class is a subclass of UIScrollView, allowing
 an arbitrary grid of information to be displayed.
 
 It must have its dataSource property set, and may also have a
 gridDelegate specified, allowing notification of various events.
 */
@interface MFGridView : UIScrollView<UIScrollViewDelegate> {}

@property (nonatomic, retain) IBOutlet id<MFGridViewDataSource> dataSource;
@property (nonatomic, retain) IBOutlet id<MFGridViewDelegate> gridDelegate;

- (void)redrawContent;
- (id<MFGridViewCell>)getFreeCell:(NSString *)cellType;
@end
