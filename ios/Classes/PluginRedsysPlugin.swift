import Flutter
import UIKit

public class PluginRedsysPlugin: NSObject, FlutterPlugin {
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

      resultLocal = result

      let viewController: UIViewController


      if call.method == "webPayment" {

          let myArgs = call.arguments as? [String: Any]

          TPVVConfiguration.shared.appLicense = myArgs!["license"] as! String
          TPVVConfiguration.shared.appFuc = myArgs!["fuc"] as! String
          TPVVConfiguration.shared.appTerminal = myArgs!["terminal"] as! String
          TPVVConfiguration.shared.appMerchantURL = myArgs!["merchantUrl"] as! String
          TPVVConfiguration.shared.appCurrency = myArgs!["currency"] as! String

          let paymentMethods =  myArgs!["paymentMethods"] as! String


          TPVVConfiguration.shared.appMerchantPayMethods = PaymentMethod.card


          let env = myArgs!["environment"] as! String

          if env == "2" {
            TPVVConfiguration.shared.appEnviroment = EnviromentType.Real
          }else{
            TPVVConfiguration.shared.appEnviroment = EnviromentType.Test
          }
          TPVVConfiguration.shared.appMerchantData = myArgs!["merchantData"] as! String

          let order = myArgs!["order"] as! String
          let amount = Double(myArgs!["amount"] as! String) as! Double
          let reference:String = myArgs!["reference"] as! String

          let dpView = WebViewPaymentController(orderNumber: order, amount: amount,
                                                   productDescription: "COMPRA", transactionType: TransactionType.normal, identifier: reference,extraParams:[:])

          dpView.delegate = self

          UIApplication.shared.delegate?.window??.rootViewController?.present(dpView, animated: true, completion: nil)




      }

  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
