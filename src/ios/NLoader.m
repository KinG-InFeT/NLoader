//
//  NLoader.m
//
//  Created by Guido Sabatini in 2012
//  Modified by @bormansquirrel 28/11/2013
//  Modified by @KinG-InFeT 10/02/2014
//

#import "NLoader.h"

@interface WaitingDialog () {
    UIAlertView *waitingDialog;
}

@property (nonatomic, retain) UIAlertView *waitingDialog;
-(void)showWaitingDialogWithText:(NSString*)text;
-(void)hideWaitingDialog;

@end

@implementation WaitingDialog

@synthesize waitingDialog = _waitingDialog;

-(UIAlertView *)waitingDialog {
    if (!_waitingDialog) {
        _waitingDialog = [[UIAlertView alloc] initWithTitle:@"" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil];
    }
    return _waitingDialog;
}

#pragma mark - PRIVATE METHODS

-(void)showWaitingDialogWithText:(NSString *)text {
    [self.waitingDialog setTitle:text];
    [self.waitingDialog show];
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    indicator.center = CGPointMake(self.waitingDialog.bounds.size.width / 2, self.waitingDialog.bounds.size.height - 50);
    [indicator startAnimating];
    [self.waitingDialog addSubview:indicator];
}

-(void)hideWaitingDialog {
    if (_waitingDialog) {
        [self.waitingDialog dismissWithClickedButtonIndex:0 animated:YES];
        _waitingDialog = nil;
    }
}

@end

