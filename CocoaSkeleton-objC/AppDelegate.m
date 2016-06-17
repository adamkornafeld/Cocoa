//
//  AppDelegate.m
//  CocoaSkeleton-objC
//
//  Created by Adam Kornafeld on 6/14/16.
//  Copyright © 2016 Adam Kornafeld. All rights reserved.
//

#import "AppDelegate.h"
@import CocoaSkeletonCore;
@import CocoaLumberjack;

static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface AppDelegate ()

@end

@implementation AppDelegate

+(AppDelegate *)instance {
    return (AppDelegate *)[[NSApplication sharedApplication] delegate];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSManagedObjectContext *context = App.instance.contextCoordinator.mainQueueContext;
    [context performBlock:^{
        NSString *attr = @"Anna";
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"attribute = %@", attr];
        
        Entity *ent = [context managedObjectOfClass:[Entity class] predicate:predicate];
        if (!ent) {
            ent = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Entity class]) inManagedObjectContext:context];
            ent.attribute = attr;
            [context save:nil];
        }
        else {
            DDLogVerbose(@"%@", ent.attribute);
        }
    }];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
