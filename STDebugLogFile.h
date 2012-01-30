//
//  STDebugLogFile.h
//
//  Created by Tom Whipple on 1/29/12.
//  Copyright (c) 2012 Smartovation Technologies, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDebugLogFile : NSObject

+(void)setLogFile:(NSString*) filename;
+(void)logToFile:(NSString*) message;

@end


#define debugLog(x, ...) [NSString stringWithFormat:x, ##__VA_ARGS__]