//
//  UTServer.h
//
//  Created by Carlos on 11.03.15.
//  Copyright (c) 2015 iOS Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTServer : NSObject

@property (nonatomic, strong) NSMutableURLRequest* request;

- (NSData*) getURL:(NSString*)url parameters:(NSDictionary*)parameters error:(NSError**)error response:(NSURLResponse**)response;
- (NSData*) sendSynchronousRequest:(NSURLRequest*)request returningResponse:(NSURLResponse**)response error:(NSError**)error;
- (NSData*) doPOSTURL:(NSString*)url parameters:(NSString*)parameters error:(NSError**)error response:(NSURLResponse**)response;
- (void) initializeRequest:(NSString*)url;

@end
