#import <Cordova/CDVPlugin.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cordova/NSDictionary+Extensions.h>
#import "LoadingView.h"

@interface NLoader : CDVPlugin {
	NLoaderView* loadingView;
}

@property (nonatomic, retain) NLoaderView* loadingView;

- (void)loadingStart: (CDVInvokedUrlCommand*) command;
- (void)loadingStop: (CDVInvokedUrlCommand*) command;

- (void)activityStart: (CDVInvokedUrlCommand*) command;
- (void)activityStop: (CDVInvokedUrlCommand*) command;

@end
