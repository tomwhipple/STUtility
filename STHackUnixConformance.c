//
//  STHackUnixConformance.c
//  STUtils
//
//  Created by Whipple. Tom on 10/27/13.
//  Copyright (c) 2013 Whipple. Tom. All rights reserved.
//

// Hack around runtime errors of the form:
// > Detected an attempt to call a symbol in system libraries that is not present on the iPhone:
// > strerror$UNIX2003 called from function gpg_strerror in image GPGWrapper.

// See https://developer.apple.com/library/mac/releasenotes/Darwin/SymbolVariantsRelNotes/index.html for background.

// THIS IS VERY MUCH A HACK SOLUTION! Probably the best thing to do is figure out how to adjust the library compile settings to not try to conform to the UNIX2003 standard. But, until then...

// inspired by http://stackoverflow.com/questions/12152416/attempt-to-call-symbol-that-is-not-present-in-system-libraries-llvm-gcda-start

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

FILE *fopen$UNIX2003( const char *filename, const char *mode )
{
  return fopen(filename, mode);
}

size_t fwrite$UNIX2003( const void *a, size_t b, size_t c, FILE *d )
{
  return fwrite(a, b, c, d);
}

const char *strerror$UNIX2003(int errnum) {
  return strerror(errnum);
}