//
//  AppDelegate.swift
//  DH-HelloWorld
//
//  Created by Dave Hylands on 11/27/19.
//  Copyright © 2019 Dave Hylands. All rights reserved.
//

import UIKit
import FullStory
import Pods_DH_HelloWorld

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FSDelegate {

    func fullstoryDidStartSession(_ sessionUrl: String) {
        print("fullstoryDidStartSession: ", sessionUrl)
        FS.log(with: FSLOG_INFO, message: "fullstoryDidStartSession")
    }

    func fullstoryDidStopSession() {
        print("fullstoryDidStopSession")
        FS.log(with: FSLOG_INFO, message: "fullstoryDidStopSession")
    }

    func fullstoryDidTerminateWithError(_ error: Error) {
        print("fullstoryDidTerminateWithError")
        FS.log(with: FSLOG_INFO, message: "fullstoryDidTerminateWithError")
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FS.delegate = self

        FS.log(with: FSLOG_INFO, message: "didFinishLaunchingWithOptions")

        let userId = "davehylands@fullstory.com"
        let info = ["email": "davehylands@fullstory.com", "displayName": "Dave H"]
        FS.identify(userId, userVars: info)

        DDLog.add(DDOSLogger.sharedInstance)
        DDLog.add(FSLumberJackLogger.sharedInstance)
        
        FS.log(with: FSLOG_ASSERT, message: "FS.log startup FSLOG_ASSERT")
        FS.log(with: FSLOG_INFO, message: "FS.log startup FSLOG_INFO")
        FS.log(with: FSLOG_WARNING, message: "FS.log startup FSLOG_WARNING")
        FS.log(with: FSLOG_ERROR, message: "FS.log startup FSLOG_ERROR")
        FS.log(with: FSLOG_DEBUG, message: "FS.log startup FSLOG_DEBUG")
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

