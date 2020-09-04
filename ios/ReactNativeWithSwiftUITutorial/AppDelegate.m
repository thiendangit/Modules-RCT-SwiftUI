/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "BraintreeCore.h"
#import "BraintreePayPal.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [BTAppSwitch setReturnURLScheme:@"org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments"];
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"ReactNativeWithSwiftUITutorial"
                                            initialProperties:nil];

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

//- (BOOL)application:(UIApplication *)application
//    openURL:(NSURL *)url
//    sourceApplication:(NSString *)sourceApplication
//    annotation:(id)annotation
//{
//    if ([url.scheme localizedCaseInsensitiveCompare:@"org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments"] == NSOrderedSame) {
//        return [BTAppSwitch handleOpenURL:url sourceApplication:sourceApplication];
//    }
//    return NO;
//}
//
//- (BOOL)application:(UIApplication *)application
//    openURL:(NSURL *)url
//    options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
//{
//    if ([url.scheme localizedCaseInsensitiveCompare:@"org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments"] == NSOrderedSame) {
//        return [BTAppSwitch handleOpenURL:url options:options];
//    }
//    return NO;
//}
//
//- (void)configure {
//    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
//    [BTAppSwitch setReturnURLScheme:@"org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments"];
//}

@end
