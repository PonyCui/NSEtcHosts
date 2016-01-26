//
//  NSEtcHosts.m
//  NSEtcHosts
//
//  Created by 崔 明辉 on 15/4/23.
//  Copyright (c) 2015年 PonyCui. All rights reserved.
//

#import <objc/runtime.h>
#import "NSEtcHosts.h"

static NSDictionary *ipTable;

@implementation NSURLRequest (NSEtcHosts)

- (instancetype)NEH_initWithURL:(NSURL *)URL cachePolicy:(NSURLRequestCachePolicy)cachePolicy timeoutInterval:(NSTimeInterval)timeoutInterval {
    if (URL.host != nil && URL.host.length && ipTable[URL.host] != nil) {
        NSString *myURLString = URL.absoluteString;
        myURLString = [myURLString
            stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"//%@", URL.host]
                                      withString:[NSString stringWithFormat:@"//%@", ipTable[URL.host]]];
        NSURL *myURL = [NSURL URLWithString:myURLString];
        URL = myURL;
    }
    return [self NEH_initWithURL:URL cachePolicy:cachePolicy timeoutInterval:timeoutInterval];
}

@end

@implementation NSEtcHosts

+ (void)load {
    {
        Method ori_Method = class_getInstanceMethod([NSURLRequest class], @selector(initWithURL:cachePolicy:timeoutInterval:));
        Method my_Method = class_getInstanceMethod([NSURLRequest class], @selector(NEH_initWithURL:cachePolicy:timeoutInterval:));
        method_exchangeImplementations(ori_Method, my_Method);
    }
}

+ (void)addHost:(NSString *)host ipAddress:(NSString *)ipAddress {
    NSMutableDictionary *mutableHostTable = ipTable == nil ? [NSMutableDictionary dictionary] : [ipTable mutableCopy];
    [mutableHostTable setObject:ipAddress forKey:host];
    ipTable = [mutableHostTable copy];
}

@end
