#import <Foundation/Foundation.h>

%ctor
{
    NSLog(@"------------------------ctor begin");
    NSString *identifier = [[NSBundle mainBundle] bundleIdentifier];
    NSLog(@">>>>>>>>> Logging from backboardd.x, meet identifier: %@", identifier);
    if ([identifier isEqualToString:@"com.apple.backboardd"]) {
    	NSLog(@">>>>>>>>>>>>>>>>> Logging from backboardd.x, got in backboardd <<<<<<<<<<<<<<<<<<<<");
    } else if ([identifier isEqualToString:@"com.apple.springboard"]) {
        NSLog(@">>>>>>>>>>>>>>>>> Logging from backboardd.x, got in springboard <<<<<<<<<<<<<<<<<<<<");
    }
    NSLog(@"------------------------ctor end");
}