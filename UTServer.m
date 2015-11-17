//
//  UTServer.m
//
//  Created by Carlos on 11.03.15.
//  Copyright (c) 2015 iOS Developer. All rights reserved.
//

#import "UTServer.h"

@implementation UTServer

- (NSData *)getURL:(NSString *)url parameters:(NSDictionary *)parameters error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    NSLog(@"GET: %@", url);
    
    [self initializeRequest:url];
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)doPOSTURL:(NSString *)url parameters:(NSString *)parameters error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    if(parameters == nil) {
        [self initializeRequest:url];
    } else {
        [self initializeRequest:[NSString stringWithFormat:@"%@?%@", url, parameters]];
    }
    
    _request.HTTPMethod = @"POST";
    
    NSLog(@"POST: %@", url);
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)doPOSTURL:(NSString *)url body:(NSData *)body error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    if(body == nil) {
        [self initializeRequest:url];
    } else {
        [self initializeRequest:url body:body];
    }
    
    _request.HTTPMethod = @"POST";
    
    NSLog(@"POST: %@", url);
    NSLog(@"%@", [[NSString alloc] initWithData:[_request HTTPBody] encoding:NSUTF8StringEncoding]);
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)doPUTURL:(NSString *)url body:(NSData *)body error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    if(body == nil) {
        [self initializeRequest:url];
    } else {
        [self initializeRequest:url body:body];
    }
    
    _request.HTTPMethod = @"PUT";
    
    NSLog(@"PUT: %@", url);
    NSLog(@"%@", [[NSString alloc] initWithData:[_request HTTPBody] encoding:NSUTF8StringEncoding]);
    
    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)doDELETEURL:(NSString *)url error:(NSError *__autoreleasing *)error response:(NSURLResponse *__autoreleasing *)response {
    
    [self initializeRequest:url];
    
    _request.HTTPMethod = @"DELETE";
    
    NSLog(@"DELETE: %@", url);

    return [self sendSynchronousRequest:_request returningResponse:response error:error];
}

- (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *__autoreleasing *)response error:(NSError *__autoreleasing *)error {
    return [NSURLConnection sendSynchronousRequest:_request returningResponse:response error:error];
}

- (void)initializeRequest:(NSString *)url {
    
    _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    if(_cachePolicy) {
        _request.cachePolicy = _cachePolicy;
    }
}

- (void)initializeRequest:(NSString *)url body:(NSData *)body {
    _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[body length]] forHTTPHeaderField:@"Content-Length"];
    [_request setHTTPBody:body];
}

@end

