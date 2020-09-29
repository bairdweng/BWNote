//
//  AppDelegate.swift
//  RxDesignExample
//
//  Created by bairdweng on 2020/8/21.
//  Copyright © 2020 apple. All rights reserved.
//

import SVProgressHUD
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SVProgressHUD.setMaximumDismissTimeInterval(1.2)
        SVProgressHUD.setDefaultStyle(.dark)
        // Override point for customization after application launch.
        return true
    }
}
