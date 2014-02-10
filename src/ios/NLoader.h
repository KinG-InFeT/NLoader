//
//  NLoader.h
//
//
//  Created by Guido Sabatini in 2012
//  Modified by @KinG-InFeT 10/02/2014
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

//@interface NLoader : CDVPlugin
//@interface NLoader 

@interface NLoader  : CDVPlugin {
	UIActivityIndicatorView *activityView;
    UIView *loadingView;
    UILabel *loadingLabel;
	UIAlertView *NLoader;
}

@property (nonatomic, retain) UIActivityIndicatorView *activityView;
@property (nonatomic, retain) UIView *loadingView;
@property (nonatomic, retain) UILabel *loadingLabel;

- (void)startloader:(CDVInvokedUrlCommand*)command;
- (void)stoploader:(CDVInvokedUrlCommand*)command;

@end
