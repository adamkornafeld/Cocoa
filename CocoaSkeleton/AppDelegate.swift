//
//  AppDelegate.swift
//  Skeleton-macOS
//
//  Created by Adam Kornafeld on 6/13/16.
//  Copyright © 2016 Adam Kornafeld. All rights reserved.
//

import Cocoa
import CocoaCore
import CocoaLumberjackSwift

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        DDTTYLogger.sharedInstance().logFormatter = LogFormatter()
        DDLog.addLogger(DDTTYLogger.sharedInstance(), withLevel: .Verbose)
        
        let app = App.instance
        
        if let context = app.contextCoordinator.mainQueueContext {
            context.performBlock {
                let attr = "Anna"
                let predicate = NSPredicate(format: "attribute = '\(attr)'")
                
                let ent = context.managedObjectOfClass(Entity.self, predicate: predicate)
                if let unwrappedEnt = ent as? Entity {
                    DDLogVerbose("\(unwrappedEnt.attribute)")
                }
                else {
                    let ent = NSEntityDescription.insertNewObjectForEntityForName(NSStringFromClass(Entity), inManagedObjectContext: context) as! Entity
                    ent.attribute = attr
                    try! context.save()
                }
            }
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

