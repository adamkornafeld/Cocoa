//
//  ExtensionDelegate.swift
//  CocoaWatchSkeleton Extension
//
//  Created by Adam Kornafeld on 6/17/16.
//  Copyright © 2016 Adam Kornafeld. All rights reserved.
//

import WatchKit
import CocoaSkeletonCore

class ExtensionDelegate: NSObject, WKExtensionDelegate {

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        let app = App.instance
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
