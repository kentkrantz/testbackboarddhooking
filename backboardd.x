#import <Foundation/Foundation.h>
#import "Log.h"

%ctor
{
	logToFile(@"------------------------ctor begin");
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    logToFile(@">>>>>>>>> Logging from backboardd.x, meet identifier: %@", identifier);
    if ([identifier isEqualToString:@"com.apple.backboardd"]) {
    	alert(@">>>>>>>>>>>>>>>>> Logging from backboardd.x, got in backboardd <<<<<<<<<<<<<<<<<<<<");
    } else if ([identifier isEqualToString:@"com.apple.springboard"]) {
        alert(@">>>>>>>>>>>>>>>>> Logging from backboardd.x, got in springboard <<<<<<<<<<<<<<<<<<<<");
    }
    logToFile(@"------------------------ctor end");
}