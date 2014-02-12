#import "NLoader.h"
#import "UIColor-Expanded.h"


@implementation NLoader

@synthesize loadingView;

- (void)startloader:(CDVInvokedUrlCommand*) command

{
	NSLog(@"Loading START");
	
	NSString *text = @"Please wait...";
	
    @try {
        text = [command.arguments objectAtIndex:0];
    }
    @catch (NSException *exception) {
        DLog(@"Cannot read text argument");
    }

	if (self.loadingView != nil) {
		return;
	}
	

	CGFloat strokeOpacity, backgroundOpacity;
	CGFloat boxLength = [NLoaderView defaultBoxLength];
	BOOL fullScreen = YES;
	BOOL bounceAnimation = NO;
	
	NSString* colorCSSString;
	NSString* labelText;

	strokeOpacity = 0.00;
	backgroundOpacity = 0.00;
	
	
	id fullScreenValue = NULL;
	
	fullScreen = [fullScreenValue boolValue];
	boxLength = fmax(boxLength, 1.00);
	
	
	id bounceAnimationValue = NULL;
	bounceAnimation = [bounceAnimationValue boolValue];
	
	
	colorCSSString = @"";
	
	//Da passare il parametro
	// @var text
	labelText = @"Loading...";

	if (!labelText) {
		labelText = [NLoaderView defaultLabelText];
	}
	
	UIColor* strokeColor = [NLoaderView defaultStrokeColor];
	
	if (strokeOpacity <= 0) {
		strokeOpacity = [NLoaderView defaultStrokeOpacity];
	}
	
	if (backgroundOpacity <= 0) {
		backgroundOpacity = [NLoaderView defaultBackgroundOpacity];
	}
	
	if (colorCSSString) {
		UIColor* tmp = [UIColor colorWithName:colorCSSString];
		if (tmp) {
			strokeColor = tmp;
		} else {
			tmp = [UIColor colorWithHexString:colorCSSString];
			if (tmp) {
				strokeColor = tmp;
			}
		}
	}
	
	self.loadingView = [NLoaderView loadingViewInView:[super viewController].view strokeOpacity:strokeOpacity
									   backgroundOpacity:backgroundOpacity
											 strokeColor:strokeColor fullScreen:fullScreen labelText:labelText
										 bounceAnimation:bounceAnimation boxLength:boxLength];
}

- (void)stoploader: (CDVInvokedUrlCommand*) command
{
	if (self.loadingView != nil) 
	{
		NSLog(@"Loading STOP");
		NSTimeInterval diff = [[NSDate date] timeIntervalSinceDate:self.loadingView.timestamp] - self.loadingView.minDuration;
		
		if (diff >= 0) {
			[self.loadingView removeView]; // the superview will release (see removeView doc), so no worries for below
			self.loadingView = nil;
		} else {
			[self performSelector:@selector(stoploader:) withObject:nil afterDelay:-1*diff];
		}
	}
}

- (void)activityStart: (CDVInvokedUrlCommand*) command
{
    NSLog(@"Activity START");
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}

- (void)activityStop: (CDVInvokedUrlCommand*) command
{
    NSLog(@"Activitiy STOP");
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = NO;
}


@end
