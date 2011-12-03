STUtilites
==========

A collection of miscellaneous scripts, headers and classes that have proven to be useful.

### Debug logging

It is invariably useful to have log statements that print only for debug builds.

Simply:
1. Set up DEBUG to be defined for your project's debug configuration.
2. #include STDebug.h
3. Use debugLog() just as you would NSLog(). The only difference is that if DEBUG is not defined, the logging won't be used.

### Other string support

Convenience macros are provided to aid in printing NSIndexPath and BOOLs to the log.