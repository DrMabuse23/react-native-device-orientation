#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"
@import UIKit;
@interface BrewingDeviceOrientation : NSObject <RCTBridgeModule>;
@property(nonatomic, readonly) UIDeviceOrientation orientation;
@property(nonatomic, readonly, getter=isGeneratingDeviceOrientationNotifications) BOOL generatesDeviceOrientationNotifications;
- (NSString *) getOrientationDevice;
@end

