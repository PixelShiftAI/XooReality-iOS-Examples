//
//  AppDelegate.m
//  Example
//
//  Created by Zhiming Ma on 2021/12/16.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate () {
    UIWindow* window;
}
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MainViewController* vc = [[MainViewController alloc] init];
    UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController: vc];
    window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    window.rootViewController = nc;
    [window makeKeyAndVisible];
    return YES;
}

@end
