#import "React/RCTBridgeModule.h"
#import "BraintreeCore.h"
#import "BraintreePayPal.h"

@interface RCT_EXTERN_MODULE(SwiftReturnName, NSObject)
RCT_EXTERN_METHOD(getName)
RCT_EXTERN_METHOD(increase)
RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
@end

@interface RCT_EXTERN_MODULE(RNPaypal, NSObject)
+ (BOOL)requiresMainQueueSetup
{
    return NO;
}
RCT_EXTERN_METHOD(requestOneTimePayment:(NSString *)clientToken
options:(NSDictionary *)options
resolver:(RCTPromiseResolveBlock)resolve
rejecter:(RCTPromiseRejectBlock)reject);
@end

