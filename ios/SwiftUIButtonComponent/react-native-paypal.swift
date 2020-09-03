//
//  react-native-paypal.swift
//  react_native_paytest
//
//  Created by Thiện Đăng on 9/3/20.
//  Copyright © 2020 Ray Deck. All rights reserved.
//

import Foundation
import Braintree

@objc(RNPaypal)
public class RNPaypal : NSObject, BTViewControllerPresentingDelegate, BTAppSwitchDelegate {
  
  public func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
    viewController.present(viewController, animated: true, completion: nil)
  }
  
  public func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
    viewController.dismiss(animated: true, completion: nil)
  }
  
  public func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
    showLoadingUI()
    
    NotificationCenter.default.addObserver(self, selector: #selector(hideLoadingUI), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
  }
  
  public func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget) {
  }
  
  public func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
    hideLoadingUI()
  }
  
  func showLoadingUI() {
    
  }
  
  @objc func hideLoadingUI() {
    NotificationCenter
      .default
      .removeObserver(self, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    
  }
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if url.scheme?.localizedCaseInsensitiveCompare("org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments") == .orderedSame {
      return BTAppSwitch.handleOpen(url, options: options)
    }
    return false
  }
  
  var braintreeClient: BTAPIClient!
  @objc(requestOneTimePayment:options:resolver:rejecter:)
  func requestOneTimePayment(clientToken: String, options : [Any], _ resolve: @escaping RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock ) {
    BTAppSwitch.setReturnURLScheme("org.reactjs.native.example.ReactNativeWithSwiftUITutorial.payments")
    self.braintreeClient = BTAPIClient(authorization: "sandbox_v29bk2j6_7t2b5cz5s3m5gj8v")
    let payPalDriver = BTPayPalDriver(apiClient: self.braintreeClient)
    payPalDriver.viewControllerPresentingDelegate = self
    payPalDriver.appSwitchDelegate = self
    
    let request = BTPayPalRequest(amount: "1.00")
    
    payPalDriver.requestOneTimePayment(request) { (tokenizedPayPalAccount, error) -> Void in
      guard let tokenizedPayPalAccount = tokenizedPayPalAccount else {
        if error != nil {
          resolve(NSNull())
        } else {
          resolve(NSNull())
        }
        return
      }
      if tokenizedPayPalAccount != nil {
        let result : [String : Any] = [
               "nonce": (tokenizedPayPalAccount.nonce ?? NSNull()),
               "payerId": (tokenizedPayPalAccount.payerId ?? NSNull()),
               "email": (tokenizedPayPalAccount.email ?? NSNull()),
               "firstName": (tokenizedPayPalAccount.firstName ?? NSNull()),
               "lastName": (tokenizedPayPalAccount.lastName ?? NSNull()),
               "phone": (tokenizedPayPalAccount.phone ?? NSNull())
             ]
             resolve(result)
      }
    }
  }
}


