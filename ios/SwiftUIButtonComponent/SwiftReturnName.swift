//
//  SwiftReturnName.swift
//  ReactNativeWithSwiftUITutorial
//
//  Created by Thiện Đăng on 8/21/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

@objc(SwiftReturnName)
class SwiftReturnName: NSObject {
  var count : Int = 0
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  @objc
  func getName() -> Any {
    print("Thien Dang");
  }
  @objc
   func getCount(_ callback: RCTResponseSenderBlock) {
     callback([count])
   }
  
  @objc
  func increase() -> Void{
    self.count += 1
  }
  
}
