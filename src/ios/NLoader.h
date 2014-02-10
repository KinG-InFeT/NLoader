//
//  NLoader.h
//
//
//  Created by Guido Sabatini in 2012
//  Modified by @KinG-InFeT 10/02/2014
//

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>

@interface NLoader : CDVPlugin

- (void)show:(CDVInvokedUrlCommand*)command;
- (void)hide:(CDVInvokedUrlCommand*)command;

@end
