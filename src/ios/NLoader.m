#import "NLoader.h"
#import "UIColor-Expanded.h"


@implementation NLoader

@synthesize loadingView;

- (void)loadingStart:(CDVInvokedUrlCommand*) command

{
   NSLog(@"dentro loadingStart");
    if([command.arguments count] > 0){
        NSDictionary* optionsdic = [command.arguments objectAtIndex:0];
    
        if (self.loadingView != nil) {
            return;
        }
        
        NSLog(@"dentro if arguments");
	
        CGFloat strokeOpacity, backgroundOpacity;
        CGFloat boxLength = [NLoaderView defaultBoxLength];
        BOOL fullScreen = YES;
        BOOL bounceAnimation = NO;
        
         NSLog(@"AZZ 1");
        
        NSString* colorCSSString;
        NSString* labelText;

        NSLog(@"AZZ 1A");

        strokeOpacity = 0.00;//[[optionsdic objectForKey: @"strokeOpacity"] floatValue];
        backgroundOpacity = 0.00;//[[optionsdic objectForKey: @"backgroundOpacity"] floatValue];
        
        NSLog(@"AZZ 2");
        
        id fullScreenValue = NULL;//[optionsdic objectForKey: @"fullScreen"];
        
        NSLog(@"AZZ 2A");
        fullScreen = [fullScreenValue boolValue];
        boxLength = fmax(boxLength, 1.00/*[[optionsdic objectForKey: @"boxLength"] floatValue]*/);
        /*
        if (fullScreenValue != nil)
        {
            fullScreen = [fullScreenValue boolValue];
            if (!fullScreen) { // here we take into account rectSquareLength, if any
                boxLength = fmax(boxLength, [[optionsdic objectForKey: @"boxLength"] floatValue]);
            }
        }
        */
        NSLog(@"AZZ 3");
        
        id bounceAnimationValue = NULL;//[optionsdic objectForKey:@"bounceAnimation"];
        bounceAnimation = [bounceAnimationValue boolValue];
        /*
        if (bounceAnimationValue != nil)
        {
            bounceAnimation = [bounceAnimationValue boolValue];
        }
        */
        NSLog(@"AZZ 3A");
        colorCSSString = @"";//@"#333";//[optionsdic objectForKey:@"strokeColor"];
        labelText = @"Loader test azz";//[optionsdic objectForKey:@"labelText"];

        if (!labelText) {
            labelText = [NLoaderView defaultLabelText];
        }
        
        NSLog(@"AZZ 4");
        
        UIColor* strokeColor = [NLoaderView defaultStrokeColor];
        
        if (strokeOpacity <= 0) {
            strokeOpacity = [NLoaderView defaultStrokeOpacity];
        }
        
        if (backgroundOpacity <= 0) {
            backgroundOpacity = [NLoaderView defaultBackgroundOpacity];
        }
        
        NSLog(@"AZZ 5");
        
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
        
        NSLog(@"AZZ 6");
        
        self.loadingView = [NLoaderView loadingViewInView:[super viewController].view strokeOpacity:strokeOpacity
                                           backgroundOpacity:backgroundOpacity
                                                 strokeColor:strokeColor fullScreen:fullScreen labelText:labelText
                                             bounceAnimation:bounceAnimation boxLength:boxLength];

        NSLog(@"AZZ 7");

        NSRange minMaxDuration = NSMakeRange(2, 3600);// 1 hour max? :)

        NSString* durationKey = @"duration";
        //NSInteger durationKey = 10;

        NSLog(@"AZZ 8");

        // the view will be shown for a minimum of this value if durationKey is not set
        //self.loadingView.minDuration = [optionsdic integerValueForKey:@"minDuration" defaultValue:minMaxDuration.location withRange:minMaxDuration];

        NSLog(@"AZZ 8");

        // if there's a duration set, we set a timer to close the view
        //if ([optionsdic valueForKey:durationKey]) {
            //NSTimeInterval duration = [optionsdic integerValueForKey:durationKey defaultValue:minMaxDuration.location withRange:minMaxDuration];
            //[self performSelector:@selector(loadingStop:) withObject:nil afterDelay:duration];
        //}
        NSLog(@"AZZ 9");
    }
    
    NSLog(@"AZZ 10");
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
