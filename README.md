# XooReality iOS

An iOS framework for XOO Reality.

## Requirements

XooReality iOS SDK is built for iOS 10.0+.  
AR Quick Look feature requires iPadOS or iOS 12.0+.  

## Installation

### CocoaPods

```
pod 'XooReality', '~> 0.0.3'
```

### Carthage

```
binary "https://xootopia.com/libs/xoo-reality-ios/carthage/XooReality.json"
```

### Swift Package Manager

Swift Package Manager will be supported soon.

## Examples

![example.gif](./Images/example.gif)

### Present a XOO Reailty View

```objc
// Create XooRealityViewController instance
XooRealityViewController* xooReality = [XooRealityViewController new];
// Assuming delegate methods are implemented on self
xooReality.delegate = self;
// Setup XooReality with token (A jwt aquired from XOO Topia API).
[xooReality setup:@{ @"token": items[indexPath.item].token }];
// Present XooRealityViewController
[self presentViewController:xooReality animated:true completion:nil];
```

### Delegate Methods

```objc
// Called when XooRealityViewController finished setup.
// If setup done successfully, `error` will be `nil`, otherwise a `NSError` with error code.
// ErrorCode:
//    1000: Invalid token.
//    2000: Network error, cannot connect to XOO server.
//    2001: Internal error when connecting to XOO server.
//    3000: Cache file IO error.
//    9000: Internal SDK error.
//
- (void)viewControllerSetupFinished:(XooRealityViewController *)viewController error:(NSError *)error {
    if (error != nil) {
        NSLog(@"Setup error: %ld", (long)error.code);
    }
}
```

```objc
// Called when user tapped close button and XooRealityViewController will dismiss.
//
- (void)viewControllerWillDismiss:(XooRealityViewController *)viewController {
    [self dismissViewControllerAnimated:true completion: nil];
}

```

### More Example Projects

* [CocoaPods + Obj-C](./Pod-ObjC)
