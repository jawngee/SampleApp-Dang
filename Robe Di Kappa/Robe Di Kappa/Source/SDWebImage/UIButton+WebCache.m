/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIButton+WebCache.h"
#import "SDWebImageManager.h"

@implementation UIButton (WebCache)

- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{    
    CGRect viewframe = [self bounds];
    
    UIActivityIndicatorView *activity = (UIActivityIndicatorView *)[self viewWithTag:9999];
    
    if (activity == nil) 
    {
        /** declare activity indicator */ 
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [indicator setCenter:CGPointMake(viewframe.size.width/2, viewframe.size.height/2)];
        [indicator setHidesWhenStopped:YES];
        [indicator startAnimating];
        [indicator setTag:9999];
        
        /** add activity indicator into view */
        [self addSubview:indicator];
        
        /** release activity indicator */
        [indicator release];
    }

    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];

    [self setImage:placeholder forState:UIControlStateNormal];

    if (url)
    {
        [manager downloadWithURL:url delegate:self];
    }
}

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    /** remove activity view from super view */
    UIActivityIndicatorView *activity = (UIActivityIndicatorView *)[self viewWithTag:9999];
    
    if (activity != nil) 
    {
        [activity stopAnimating];
        [activity removeFromSuperview];
    }

    /** set image when finish loading */
    [self setImage:image forState:UIControlStateNormal];
}

@end
