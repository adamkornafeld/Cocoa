//
//  AppDelegate.swift
//  CocoaTouch
//
//  Created by Adam Kornafeld on 6/12/16.
//  Copyright © 2016 Adam Kornafeld. All rights reserved.
//

import UIKit
import CocoaSkeletonCore
import CoreData
import CocoaLumberjackSwift

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    public var window: UIWindow?

    public static let instance = UIApplication.sharedApplication().delegate as! AppDelegate
    
    public let app = App.instance
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
        splitViewController.delegate = self
        
        let app = App.instance
        if let context = app.contextCoordinator.mainQueueContext {
            context.performBlock {
                let predicate = NSPredicate(format: "attribute = %@", "Adam")
                
                let ent = context.managedObjectOfClass(Entity.self, predicate: predicate)
                if let unwrappedEnt = ent as? Entity {
                    DDLogVerbose("\(unwrappedEnt.attribute)")
                }
                else {
                    let ent = NSEntityDescription.insertNewObjectForEntityForName(NSStringFromClass(Entity), inManagedObjectContext: context) as! Entity
                    ent.attribute = "Adam"
                    try! context.save()
                }
            }
        }
        
        return true
    }

    public func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    public func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    public func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    public func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    public func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // MARK: - Split view

    public func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

}

