//
//  STDebugLogFile.m
//
//  Created by Tom Whipple on 1/29/12.
//  Copyright (c) 2012 Smartovation Technologies, LLC. All rights reserved.
//

#import "STDebugLogFile.h"
#import "STDebug.h"

@implementation STDebugLogFile

static NSString* logFilePath = nil;

+(void)setLogFile:(NSString*) filename {
  NSString* directoryPath = NSTemporaryDirectory();
  if (!directoryPath) directoryPath = @"/tmp";
  logFilePath = [[directoryPath stringByAppendingPathComponent:filename] retain];
}

+(NSString*) logPath {
  return [[logFilePath copy] autorelease];
}

#ifdef DEBUG
static BOOL loggingEnabled = YES;
#else
static BOOL loggingEnabled = NO;
#endif

+(void) setLoggingEnabled:(BOOL) shouldEnable {
  loggingEnabled = shouldEnable;
}

+(BOOL) isLoggingEnabled {
  return loggingEnabled;
}

+(void)logToFile:(NSString*) message {
  if (logFilePath) {
    NSString* timestampedMessage = [NSString stringWithFormat:@"%@\t%@\n",[NSDate date], message];
    NSData* messageData = [timestampedMessage dataUsingEncoding:NSUTF8StringEncoding];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:logFilePath]) {
      [[NSFileManager defaultManager] createFileAtPath:logFilePath contents:messageData attributes:nil];
    }
    else {
      NSFileHandle *output = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
      [output seekToEndOfFile];
      [output writeData:messageData];
      [output closeFile];
    }
  }
  // log all messages to the console, in addition to the error log
  NSLog(@"%@",message); // format to silance warning
}

@end
