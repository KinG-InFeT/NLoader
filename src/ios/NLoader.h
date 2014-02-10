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


- (void)startloader:(CDVInvokedUrlCommand*)command;
- (void)stoploader:(CDVInvokedUrlCommand*)command;

@end
