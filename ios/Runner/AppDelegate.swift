import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {

 private var CHANNEL:String = "manga_mogi.app.channel"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    _initializeMethodChannel()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func _initializeMethodChannel() {
    guard let controller = window?.rootViewController as? FlutterViewController else {return}

    let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      self?.handleMethodCall(call: call, result: result)
    }
  }

  private func handleMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
    let methods: [String: () -> Void] = [
      "getPlatformVersion": { self.getPlatformVersion(result: result) }
      
    ]
    methods[call.method]?() ?? result(FlutterMethodNotImplemented)
  }

  private func getPlatformVersion(result: FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

}
