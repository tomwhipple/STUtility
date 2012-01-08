//
//  STDataExport.h
//  TourPlayer
//
//  Created by Tom Whipple on 1/8/12.
//  Copyright (c) 2012 Smartovation Technologies, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDataExport : NSObject

/**
 * Exports a uniform array of dictionaries to a CSV file. 
 * Assumptions: 
 *  The keys of the first dictionary define the columns.
 *  The CSV file will be overwritten
 */
+(BOOL)exportData:(NSArray*) arrayOfDicts toCSV:(NSString*) csvPath;

@end
