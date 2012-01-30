//
//  STDataExport.m
//
//  Created by Tom Whipple on 1/8/12.
//  Copyright (c) 2012 Smartovation Technologies, LLC. All rights reserved.
//

#import "STDataExport.h"

@implementation STDataExport

+(BOOL)exportData:(NSArray*) arrayOfDicts toCSV:(NSString*) csvPath {
  
  if (!arrayOfDicts.count) return NO;
  
  NSAssert(csvPath != nil, @"csvPath must be defined");

  NSMutableString* outstring = [[NSMutableString alloc] initWithCapacity:100000];
  
  NSArray* keys = [[arrayOfDicts objectAtIndex:0] allKeys];
  
  for (int i=0; i<keys.count; i++) {
    [outstring appendFormat:@"\"%@\"",[keys objectAtIndex:i]];
    [outstring appendString:(i<keys.count-1 ? @",":@"\n")];
  }
  	
  for (NSDictionary* d in arrayOfDicts) {
    for (int i=0; i<keys.count; i++) {
      NSObject* obj = [d valueForKey:[keys objectAtIndex:i]];
      if ([obj isKindOfClass:[NSNumber class]]) {
        // TODO: We should probably use an NSNumberFormatter here, but the default will do for now.
        [outstring appendString:[(NSNumber*)obj stringValue]];
      }
      else {
        [outstring appendFormat:@"\"%@\"",[obj description]];
      }
      [outstring appendString:(i<keys.count-1 ? @",":@"\n")];
    } 
  }

  NSError* error = nil;
	[outstring writeToFile:csvPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
	[outstring release];

  if (error) {
    NSLog(@"ERROR writing to %@: %@\n%@",csvPath,[error localizedDescription],[error userInfo]);
    return NO;
  }
  else return YES;
}

@end
