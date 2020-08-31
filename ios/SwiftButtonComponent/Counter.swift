import Foundation
@objc(Counter)
class Counter: NSObject {
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  private var count = 1
  @objc
  func increment() {
    count += 1
    print("count is \(count)")
  }
  
  @objc
  func constantsToExport() -> Any {
    return ["initialCount": 0]
  }
  
  @objc
   func getCount(_ callback: RCTResponseSenderBlock) {
     callback([count])
   }
  
  @objc
   func decrement(
     _ resolve: RCTPromiseResolveBlock,
     rejecter reject: RCTPromiseRejectBlock
   ) -> Void {
     if (count == 0) {
       let error = NSError(domain: "", code: 200, userInfo: nil)
       reject("E_COUNT", "count cannot be negative", error)
     } else {
       count -= 1
       resolve("count was decremented")
     }
   }
  
}
