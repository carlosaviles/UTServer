//
//  RA7Server.m
//  Rain Alarm 7
//
//  Created by Carlos on 11.03.15.
//  Copyright (c) 2015 iOS Developer. All rights reserved.
//

#import "CRServer.h"

@implementation CRServer

- (NSData *)getURL:(NSString *)url parameters:(NSDictionary *)parameters error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    [self initializeRequest:url];
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *__autoreleasing *)response error:(NSError *__autoreleasing *)error {
    return [NSURLConnection sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)doPOSTURL:(NSString *)url parameters:(NSString *)parameters error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    if(parameters == nil) {
        [self initializeRequest:url];
    } else {
        [self initializeRequest:[NSString stringWithFormat:@"%@?%@", url, parameters]];
    }
    
    _request.HTTPMethod = @"POST";
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (void)initializeRequest:(NSString *)url {
    
    _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
}

@end
