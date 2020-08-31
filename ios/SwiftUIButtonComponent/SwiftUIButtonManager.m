//
//  SwiftUIButtonManager.m
//  ReactNativeWithSwiftUITutorial
//
//  Created by Alexey Kureev on 01/02/2020.
//

#import <Foundation/Foundation.h>
#import "React/RCTViewManager.h"
#import "React/RCTComponentEvent.h"
#import "React/RCTBridgeModule.h"
#import "ReactNativeWithSwiftUITutorial-Swift.h"

@interface SwiftUIButtonManager : RCTViewManager
@end

@implementation SwiftUIButtonManager

RCT_EXPORT_MODULE()

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

// MARK: Count property
RCT_EXPORT_SWIFTUI_PROPERTY(count, int, SwiftUIButtonProxy);


RCT_CUSTOM_SWIFTUI_PROPERTY(color, UIColor, SwiftUIButtonProxy) {
  return [RCTConvert UIColor:json] ?: UIColor.clearColor;
}

// MARK: onCountChange property
RCT_EXPORT_SWIFTUI_CALLBACK(onCountChange, RCTDirectEventBlock, SwiftUIButtonProxy);

- (UIView *)view {
  SwiftUIButtonProxy *proxy = [[SwiftUIButtonProxy alloc] init];
  UIView *view = [proxy view];
  NSMutableDictionary *storage = [SwiftUIButtonProxy storage];
  storage[[NSValue valueWithNonretainedObject:view]] = proxy;
  return view;
}

@end

