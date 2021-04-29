//
//  AppDelegate.swift
//  Sample-AppleTv
//
//  Created by ubook on 28/04/21.
//  Copyright © 2021 PRSoluções. All rights reserved.
//

import UIKit
import SwiftUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initializeSdk()
        
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func initializeSdk() {
        // logger
        EZRLogger.shared()?.setPlatformService(EZRLoggerPlatformServiceImpl())

        #if DEBUG
            EZRLogger.shared()?.setLevel(EZRLoggerLevel.verbose)
        #else
            EZRLogger.shared()?.setLevel(EZRLoggerLevel.error)
        #endif

        // shared data
        EZRSharedData.shared()?.setPlatformService(EZRSharedDataPlatformServiceImpl())

        // http client (uncomment to use platform http client)
        EZRHttpClient.shared()?.setPlatformService(EZRHttpClientPlatformServiceImpl())

        // file helper
        EZRFileHelper.shared()?.setPlatformService(EZRFileHelperPlatformServiceImpl())

        // core
        let basePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

        let screenBounds = UIScreen.main.bounds
        let screenScale = UIScreen.main.scale
        let language = EnvironmentUtil.getCurrentLanguageCode()
        let countryCode = EnvironmentUtil.getCurrentRegionCode()

        let initializationData = EZRDomainInitializationData(
            appId: Bundle.main.bundleIdentifier!,
            name: EnvironmentUtil.getAppName(),
            basePath: basePath,
            databaseMigrationMaxVersion: 0,
            debug: false
        )

        let deviceData = EZRDomainDeviceData(
            uniqueIdentifier: EnvironmentUtil.getDeviceId(),
            name: UIDevice.current.name,
            systemName: UIDevice.current.systemName,
            systemVersion: UIDevice.current.systemVersion,
            model: UIDevice.current.model,
            localizedModel: UIDevice.current.localizedModel,
            appVersion: EnvironmentUtil.getAppVersion(),
            appShortVersion: EnvironmentUtil.getAppShortVersion(),
            appName: EnvironmentUtil.getAppName(),
            screenWidth: Float(screenBounds.width),
            screenHeight: Float(screenBounds.height),
            screenScale: Float(screenScale),
            systemOsName: "ios",
            language: language,
            imei: "",
            region: countryCode
        )

        EZRCoreApplicationCore.shared()?.initialize(initializationData, deviceData: deviceData)
    }
}

