#import <Foundation/Foundation.h>
#import "Log.h"

%ctor
{
	logToFile(@"------------------------ctor begin");
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    logToFile(@">>>>>>>>> Logging from backboardd.x, meet identifier: %@", identifier);
    if ([identifier isEqualToString:@"com.apple.backboardd"]) {
    	logToFile(@">>>>>>>>>>>>>>>>> Logging from backboardd.x, got in backboardd <<<<<<<<<<<<<<<<<<<<");
    }
    logToFile(@"------------------------ctor end");
}