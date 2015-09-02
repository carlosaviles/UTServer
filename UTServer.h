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
- (NSData*) doPOSTURL:(NSString*)url parameters:(NSString*)parameters error:(NSError**)error response:(NSURLResponse**)response;
- (NSData*) doPOSTURL:(NSString*)url body:(NSData*)body error:(NSError**)error response:(NSURLResponse**)response;
- (NSData*) doPUTURL:(NSString*)url body:(NSData*)body error:(NSError**)error response:(NSURLResponse**)response;
- (NSData*) sendSynchronousRequest:(NSURLRequest*)request returningResponse:(NSURLResponse**)response error:(NSError**)error;
- (void) initializeRequest:(NSString*)url;
- (void) initializeRequest:(NSString *)url body:(NSData*)body;

@end
