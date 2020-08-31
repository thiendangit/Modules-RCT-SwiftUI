#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_MODULE(SwiftReturnName, NSObject)
RCT_EXTERN_METHOD(getName)
RCT_EXTERN_METHOD(increase)
RCT_EXTERN_METHOD(getCount: (RCTResponseSenderBlock)callback)
@end
