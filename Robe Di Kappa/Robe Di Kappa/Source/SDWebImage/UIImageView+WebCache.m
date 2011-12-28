/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+WebCache.h"

@implementation UIImageView (WebCache)

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
//        [indicator setCenter:[self center]];
        [indicator setHidesWhenStopped:YES];
        [indicator startAnimating];
        [indicator setTag:9999];
        
        /** add activity indicator into view */
        [self addSubview:indicator];
        
        /** release activity indicator */
        [indicator release];
    }
    
    [self setImageWithURL:url placeholderImage:placeholder options:0];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    SDWebImageManager *manager = [SDWebImageManager sharedManager];

    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];

    self.image = placeholder;

    if (url)
    {
        [manager downloadWithURL:url delegate:self options:options];
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
    self.image = image;
}

@end
