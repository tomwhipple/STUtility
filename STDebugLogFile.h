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

#ifdef DEBUG
#define debugLog(x, ...) [STDebugLogFile logToFile: [NSString stringWithFormat:x, ##__VA_ARGS__]]
#else
#define debugLog(x, ...)
#endif

#define errorLog(x, ...) [STDebugLogFile logToFile: [NSString stringWithFormat:x, ##__VA_ARGS__]]