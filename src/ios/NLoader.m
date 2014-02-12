#import "NLoader.h"
#import "UIColor-Expanded.h"


@implementation NLoader

@synthesize loadingView;

- (void)loadingStart:(CDVInvokedUrlCommand*) command

{
    if([command.arguments count] > 0){
        NSDictionary* optionsdic = [command.arguments objectAtIndex:0];
    
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

        NSRange minMaxDuration = NSMakeRange(2, 3600);

    }
}

- (void)loadingStop: (CDVInvokedUrlCommand*) command
{
	if (self.loadingView != nil) 
	{
		NSLog(@"Loading stop");
		NSTimeInterval diff = [[NSDate date] timeIntervalSinceDate:self.loadingView.timestamp] - self.loadingView.minDuration;
		
		if (diff >= 0) {
			[self.loadingView removeView]; // the superview will release (see removeView doc), so no worries for below
			self.loadingView = nil;
		} else {
			[self performSelector:@selector(loadingStop:) withObject:nil afterDelay:-1*diff];
		}
	}
}

- (void)activityStart: (CDVInvokedUrlCommand*) command
{
    NSLog(@"Activity starting");
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}

- (void)activityStop: (CDVInvokedUrlCommand*) command
{
    NSLog(@"Activitiy stopping ");
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = NO;
}


@end
