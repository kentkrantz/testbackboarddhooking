#import "Log.h"
#import <UIKit/UIKit.h>

#define kLogFilePath @"/var/testbackboarddhooking.txt"

void logToFile(NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString *content = [[NSString alloc] initWithFormat:format arguments:args];  
    va_end(args);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
    NSString *currentTime = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *logContent = [NSString stringWithFormat:@"%@ %@\n", currentTime, content];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:kLogFilePath]) {
        if (![[NSFileManager defaultManager] createFileAtPath:kLogFilePath contents:nil attributes:nil]) {
            NSLog(@"Failed to create log file at: %@.", kLogFilePath);
            return;
        }
    }

    NSFileHandle* fileHandler = [NSFileHandle fileHandleForWritingAtPath:kLogFilePath];
    if (fileHandler) {
        [fileHandler seekToEndOfFile];
        [fileHandler writeData:[logContent dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandler closeFile];
    }
}

void alert(NSString *message)
{
    // 回到主线程
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    });
}