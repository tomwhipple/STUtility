/*
 *  Debug.h
 *
 *  Created by Tom Whipple on 6/28/10.
 *  Copyright 2010 Smartovation Technologies, LLC. All rights reserved.
 *
 */

#ifdef DEBUG
#define debugLog(x,...)	NSLog(x,##__VA_ARGS__)
#else
#define debugLog( x, ... )
#endif

#define boolString(x) ((x)?@"YES":@"NO")
#define stringFromBool(x) boolString(x)

#define stringFromIndexPath(ip) [NSString stringWithFormat:@"%i.%i",ip.section,ip.row]