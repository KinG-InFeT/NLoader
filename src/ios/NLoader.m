//
//  NLoader.m
//
//  Created by Guido Sabatini in 2012
//  Modified by @bormansquirrel 28/11/2013
//  Modified by @KinG-InFeT 10/02/2014
//

#import "NLoader.h"
#import "QuartzCore/QuartzCore.h"

@interface NLoader () {
    UIAlertView *NLoader;
}

//@interface NLoader  : CDVPlugin {
//    UIActivityIndicatorView *activityView;
//    UIView *loadingView;
//    UILabel *loadingLabel;
//	  UIAlertView *NLoader;
//}


@property (nonatomic, retain) UIAlertView *NLoader;
-(void)showNLoaderWithText:(NSString*)text;
-(void)hideNLoader;

@end

@implementation NLoader

@synthesize NLoader = _NLoader;

-(UIAlertView *)NLoader {
    if (!_NLoader) {
        _NLoader = [[UIAlertView alloc] initWithTitle:@"" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    }
    return _NLoader;
}

// COMMENT THIS METHOD if you want to use the plugin with versions of cordova < 2.2.0
- (void) startloader:(CDVInvokedUrlCommand*)command {
    NSString *text = @"Please wait...";
    @try {
        text = [command.arguments objectAtIndex:0];
    }
    @catch (NSException *exception) {
        DLog(@"Cannot read text argument")
    }
    
    [self showNLoaderWithText:text];
}

// COMMENT THIS METHOD if you want to use the plugin with versions of cordova < 2.2.0
- (void) stoploader:(CDVInvokedUrlCommand*)command {
    [self hideNLoader];
}

#pragma mark - PRIVATE METHODS

-(void)showNLoaderWithText:(NSString *)text {
	
    //[self.NLoader setTitle:text];
    //[self.NLoader show];
    //UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    //indicator.center = CGPointMake(self.NLoader.bounds.size.width / 2, self.NLoader.bounds.size.height - 50);
    //[indicator startAnimating];
    //[self.NLoader addSubview:indicator];
	
	
	[super showNLoaderWithText];
 
     loadingView = [[UIView alloc] initWithFrame:CGRectMake(75, 155, 170, 170)];
     loadingView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
     loadingView.clipsToBounds = YES;
     loadingView.layer.cornerRadius = 10.0;
 
     activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     activityView.frame = CGRectMake(65, 40, activityView.bounds.size.width, activityView.bounds.size.height);
    [loadingView addSubview:activityView];
 
    loadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 115, 130, 22)];
    loadingLabel.backgroundColor = [UIColor clearColor];
    loadingLabel.textColor = [UIColor whiteColor];
    loadingLabel.adjustsFontSizeToFitWidth = YES;
    loadingLabel.textAlignment = UITextAlignmentCenter;
    loadingLabel.text = @"Loading...";
    [loadingView addSubview:loadingLabel];
 
    [self.NLoader addSubview:loadingView];
    [activityView startAnimating];
}

-(void)hideNLoader {
    //if (_NLoader) {
    //    [self.NLoader dismissWithClickedButtonIndex:0 animated:YES];
    //    _NLoader = nil;
    //}
	
	[activityView stopAnimating];
	[loadingView removeFromSuperview];
}

@end

