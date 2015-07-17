#import "BrewingDeviceOrientation.h"

@implementation BrewingDeviceOrientation
@synthesize bridge = _bridge;
RCT_EXPORT_MODULE();

- (NSString *) getOrientationDevice{
  // grab the device orientation so we can pass it back to the js side.
  NSString *orientation;
  NSString* orientationIn;
  
  switch ([[UIDevice currentDevice] orientation]) {
    case UIDeviceOrientationLandscapeLeft:
      orientationIn = @"landscape-secondary";
      break;
    case UIDeviceOrientationLandscapeRight:
      orientationIn = @"landscape-primary";
      break;
    case UIDeviceOrientationPortrait:
      orientationIn = @"portrait-primary";
      break;
    case UIDeviceOrientationPortraitUpsideDown:
      orientationIn = @"portrait-secondary";
      break;
    default:
      orientationIn = @"portait";
      break;
  }
  
  if ([orientationIn isEqual: @"unlocked"]) {
    orientationIn = orientation;
  }
  
  return orientationIn;
}

RCT_EXPORT_METHOD(getOrientation:(RCTResponseSenderBlock)callback)
{
  [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
  [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(orientationChanged:) name: UIDeviceOrientationDidChangeNotification object: nil];
  callback(@[[self getOrientationDevice]]);
}

- (void)orientationChanged:(NSNotification *)notification
{
  NSString* orientation = [self getOrientationDevice];
//  NSLog(orientation);
  [self.bridge.eventDispatcher sendAppEventWithName:@"orientationOnChange"
                                               body:@{@"orientation": orientation}];
}
@end
