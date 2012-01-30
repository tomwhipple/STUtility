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
#ifdef DEBUG
  NSString* directoryPath = [[[[NSFileManager defaultManager] URLsForDirectory:NSDesktopDirectory inDomains:NSUserDomainMask] lastObject] path];
  logFilePath = [[directoryPath stringByAppendingPathComponent:filename] retain];
#endif
}

+(void)logToFile:(NSString*) message {
#ifdef DEBUG
  if (logFilePath) {
    NSString* timestampedMessage = [NSString stringWithFormat:@"%@\t%@",[NSDate date], message];
    
    NSFileHandle *output = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
    [output seekToEndOfFile];
    [output writeData:[timestampedMessage dataUsingEncoding:NSUTF8StringEncoding]];
    [output closeFile];
  }
  else {
    NSLog(@"%@",message); // format to silance warning
  }
#endif
}



@end
